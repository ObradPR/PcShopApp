import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { NavigationEnd, Router } from '@angular/router';
import { Subscription, finalize, take } from 'rxjs';
import { AppError } from 'src/app/common/interfaces/app-error.interface';
import { Product } from 'src/app/common/interfaces/product.interface';
import { UserData } from 'src/app/common/interfaces/user-data.interface';
import { AuthService } from 'src/app/services/auth.service';
import { CartService } from 'src/app/services/cart.service';
import { LoadingService } from 'src/app/services/loading.service';
import { LocalStorageService } from 'src/app/services/local-storage.service';
import { MessageModalService } from 'src/app/services/message-modal.service';
import { ProductService } from 'src/app/services/product.service';
import { WishlistService } from 'src/app/services/wishlist.service';

@Component({
  selector: 'app-product-info',
  templateUrl: './product-info.component.html',
  styleUrls: ['./product-info.component.css'],
})
export class ProductInfoComponent implements OnInit, OnDestroy {
  @Input() product: Product;
  isLogged: boolean = false;
  userId: number = 0;
  subscriptions: Subscription[] = [];
  warranty: any = null;

  constructor(
    private authService: AuthService,
    private loadingService: LoadingService,
    private wishlistService: WishlistService,
    private productService: ProductService,
    private msgModalService: MessageModalService,
    private localStorageService: LocalStorageService,
    private cartService: CartService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.getUserStatus();
    this.getProductWarranty();
    this.router.events.subscribe((event) => {
      if (event instanceof NavigationEnd) {
        setTimeout(() => {
          this.getProductWarranty();
        }, 200);
      }
    });
  }

  getUserStatus(): void {
    this.subscriptions.push(
      this.authService.getUserData().subscribe((user: UserData | null) => {
        if (user !== null) {
          this.isLogged = true;
          this.userId = user.idUser;
        } else {
          this.isLogged = false;
        }
      })
    );
  }

  getProductWarranty() {
    this.subscriptions.push(
      this.productService
        .getProductInfo(this.product.id_product, 'warranty')
        .pipe(take(1))
        .subscribe((data: any) => {
          this.warranty = data.warranty;
        })
    );
  }

  addProductToWishlist(productId: number, inWishlist: boolean) {
    if (!this.isLogged) {
      this.authService.setLoginVisibility(true);
    } else {
      this.loadingService.setPageLoading(true);
      if (!inWishlist) {
        const obj = { productId, userId: this.userId };
        this.subscriptions.push(
          this.wishlistService
            .addToWishlist(obj)
            .pipe(
              finalize(() => {
                this.loadingService.setPageLoading(false);
              })
            )
            .subscribe({
              next: (response: { message: string }) => {
                this.productService
                  .getSingleProduct(this.product.product_name, this.userId)
                  .subscribe((data: any) => {
                    this.product = data.product;
                  });

                this.msgModalService.setModal('success', response.message);

                this.wishlistService
                  .getWishlistItemsChangeStatus()
                  .pipe(take(1))
                  .subscribe((status: boolean) => {
                    this.wishlistService.setWishlistItemsChangeStatus(!status);
                  });
              },
              error: (err: AppError) => {
                this.msgModalService.setModal('error', err.error.message);
              },
            })
        );
      } else {
        this.subscriptions.push(
          this.wishlistService
            .removeItem(productId, this.userId)
            .pipe(
              finalize(() => {
                this.loadingService.setPageLoading(false);
              })
            )
            .subscribe({
              next: (response: { message: string }) => {
                this.productService
                  .getSingleProduct(this.product.product_name, this.userId)
                  .subscribe((data: any) => {
                    this.product = data.product;
                  });

                this.msgModalService.setModal('success', response.message);

                this.wishlistService
                  .getWishlistItemsChangeStatus()
                  .pipe(take(1))
                  .subscribe((status: boolean) => {
                    this.wishlistService.setWishlistItemsChangeStatus(!status);
                  });
              },
              error: (err: AppError) => {
                this.msgModalService.setModal('error', err.error.message);
              },
            })
        );
      }
    }
  }

  onAddToCart(productId: number) {
    if (this.userId === 0) {
      const cartId = this.localStorageService.getCartId();

      if (!cartId) {
        this.cartService.setProductInCart(productId).subscribe({
          next: (response: { message: string; cartId: number }) => {
            this.localStorageService.setCartId(response.cartId);

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
        });
      } else {
        this.cartService.setProductInCart(productId, 0, cartId).subscribe({
          next: (response: { message: string }) => {
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
        });
      }
    } else {
      this.cartService.setProductInCart(productId, this.userId).subscribe({
        next: (response: { message: string }) => {
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
      });
    }
  }

  ngOnDestroy(): void {
    this.subscriptions.forEach((subscription: Subscription) =>
      subscription.unsubscribe()
    );
  }
}
