import { Component, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Subscription, take } from 'rxjs';

// SERVICES
import { LoadingService } from '../services/loading.service';
import { CartService } from '../services/cart.service';
import { MessageModalService } from '../services/message-modal.service';
import { AuthService } from '../services/auth.service';
import { LocalStorageService } from '../services/local-storage.service';

// INTERFACES
import { AppError } from '../interfaces/app-error.interface';
import { UserData } from '../interfaces/user-data.interface';
import { CartItem } from '../interfaces/cart-item.interface';
import { CartStats } from '../interfaces/cart-stats.interface';

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

  constructor(
    private route: ActivatedRoute,
    private loadingService: LoadingService,
    private cartService: CartService,
    private msgModalService: MessageModalService,
    private authService: AuthService,
    private localStorageService: LocalStorageService
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

  ngOnDestroy(): void {
    this.subscriptions.forEach((subscription: Subscription) =>
      subscription.unsubscribe()
    );
  }
}
