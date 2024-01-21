import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { Subscription, finalize, take } from 'rxjs';
import { AppError } from 'src/app/interfaces/app-error.interface';
import { Product } from 'src/app/interfaces/product.interface';
import { UserData } from 'src/app/interfaces/user-data.interface';
import { AuthService } from 'src/app/services/auth.service';
import { LoadingService } from 'src/app/services/loading.service';
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

  constructor(
    private authService: AuthService,
    private loadingService: LoadingService,
    private wishlistService: WishlistService,
    private productService: ProductService,
    private msgModalService: MessageModalService
  ) {}

  ngOnInit(): void {
    this.getUserStatus();
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

  ngOnDestroy(): void {
    this.subscriptions.forEach((subscription: Subscription) =>
      subscription.unsubscribe()
    );
  }
}
