import { Component, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Subscription, finalize, take } from 'rxjs';

// SERVICES
import { AuthService } from '../../services/auth.service';
import { CartService } from '../../services/cart.service';
import { LoadingService } from '../../services/loading.service';
import { LocalStorageService } from '../../services/local-storage.service';
import { MessageModalService } from '../../services/message-modal.service';

// INTERFACES
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { AppError } from '../../common/interfaces/app-error.interface';
import { CartItem } from '../../common/interfaces/cart-item.interface';
import { CartStats } from '../../common/interfaces/cart-stats.interface';
import { City } from '../../common/interfaces/city.interface';
import { PaymentType } from '../../common/interfaces/payment-type.interface';
import { UserData } from '../../common/interfaces/user-data.interface';
import { InfoService } from '../../services/info.service';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css'],
})
export class CartComponent implements OnInit, OnDestroy {
  subscriptions: Subscription[] = [];
  items: CartItem[] = [];
  cartItemsErrorMessage: string = '';
  userId: number = 0;
  cartId: number = 0;
  totalPrice: number = 0;
  cartStatus: string = '';
  totalSaved: number = 0;
  isPlacingOrderProcess: boolean = false;
  isLabelActive: { [key: string]: boolean } = {};
  placeOrderForm: FormGroup;
  cities: City[] = [];
  paymentTypes: PaymentType[] = [];

  constructor(
    private route: ActivatedRoute,
    private loadingService: LoadingService,
    private cartService: CartService,
    private msgModalService: MessageModalService,
    private authService: AuthService,
    private localStorageService: LocalStorageService,
    private infoService: InfoService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.loadingService.setPageLoadingInit();

    this.getClientStatus();

    this.subscriptions.push(
      this.route.data.subscribe(
        (data: {
          cartInfo: { cartItems: CartItem[]; cartStats: CartStats };
        }) => {
          this.refreshCartPage(
            data.cartInfo.cartItems,
            data.cartInfo.cartStats
          );

          this.loadingService.setPageLoading(false);
        }
      )
    );

    this.formInit();
  }

  formInit(): void {
    this.placeOrderForm = new FormGroup({
      fullName: new FormControl(null, [Validators.required]),
      address: new FormControl(null, [Validators.required]),
      city: new FormControl(0, [Validators.required]),
      paymentType: new FormControl(0, [Validators.required]),
    });
  }

  getClientStatus() {
    this.subscriptions.push(
      this.authService.getUserData().subscribe((user: UserData) => {
        if (user !== null) {
          this.userId = user.idUser;
        }
      })
    );

    this.cartId = this.localStorageService.getCartId();
  }

  onRemoveItem(itemId: number) {
    this.subscriptions.push(
      this.cartService.deleteCartItem(itemId).subscribe({
        next: (response: { message: string }) => {
          this.cartService
            .getCartItems(this.userId, this.cartId)
            .subscribe(
              (data: { cartItems: CartItem[]; cartStats: CartStats }) => {
                this.refreshCartPage(data.cartItems, data.cartStats);
              }
            );

          this.msgModalService.setModal('success', response.message);

          this.cartService
            .getCartItemsChangeStatus()
            .pipe(take(1))
            .subscribe((status: boolean) => {
              this.cartService.setCartItemsChangeStatus(!status);
            });
        },
        error: (err: AppError) => {
          this.msgModalService.setModal('error', err.error.message);
        },
      })
    );
  }

  onChangeItemAmount(how: string, itemId: number, itemAmount?: number) {
    if (itemAmount === 1) return;

    this.subscriptions.push(
      this.cartService
        .changeItemAmount(how === 'increment' ? 1 : -1, itemId)
        .subscribe({
          next: () => {
            this.cartService
              .getCartItems(this.userId, this.cartId)
              .subscribe(
                (data: { cartItems: CartItem[]; cartStats: CartStats }) => {
                  this.refreshCartPage(data.cartItems, data.cartStats);
                }
              );

            this.cartService
              .getCartItemsChangeStatus()
              .pipe(take(1))
              .subscribe((status: boolean) => {
                this.cartService.setCartItemsChangeStatus(!status);
              });
          },
        })
    );
  }

  refreshCartPage(items: CartItem[], cartStats: CartStats) {
    this.items = items;

    this.totalPrice = cartStats.cart_price;
    this.cartStatus = cartStats.cart_status;

    this.totalSaved = this.items.reduce((sum: number, item: CartItem) => {
      if (item.saved !== null) return sum + item.saved * item.amount;
      else return sum;
    }, 0);
  }

  onPlaceOrder() {
    if (this.items.length === 0) {
      this.msgModalService.setModal('error', 'Cart is empty.');

      return;
    }

    this.subscriptions.push(
      this.infoService.getPaymentTypes().subscribe({
        next: (data) => (this.paymentTypes = data),
        error: (err) => console.log(err),
      }),

      this.infoService.getCities().subscribe({
        next: (data) => (this.cities = data),
        error: (err) => console.log(err),
      })
    );

    this.isPlacingOrderProcess = true;
  }

  onPlaceOrderSubmit() {
    if (
      this.placeOrderForm.value.city === 0 ||
      this.placeOrderForm.value.paymentType === 0
    ) {
      return;
    }

    this.placeOrderForm.value.cart = this.items[0].id_cart;

    this.loadingService.setPageLoading(true);
    this.subscriptions.push(
      this.cartService
        .placeOrder(this.placeOrderForm.value)
        .pipe(
          finalize(() => {
            this.loadingService.setPageLoading(false);
          })
        )
        .subscribe({
          next: (res) => {
            this.msgModalService.setModal('success', res.message);
            this.placeOrderForm.reset();
            this.router.navigateByUrl('/');
          },
          error: (err: AppError) => {
            this.msgModalService.setModal('error', err.error.message);
          },
        })
    );
  }

  onInputKeyup(inputId: string, inputValue: string): void {
    this.isLabelActive[inputId] = inputValue.trim() !== '';
  }

  ngOnDestroy(): void {
    this.subscriptions.forEach((subscription: Subscription) =>
      subscription.unsubscribe()
    );
  }
}
