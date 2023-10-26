import { Component, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';
import { Subscription, finalize, take } from 'rxjs';

// SERVICES
import { LoadingService } from '../services/loading.service';
import { WishlistService } from '../services/wishlist.service';
import { MessageModalService } from '../services/message-modal.service';

// INTERFACES
import { WishlistItem } from '../interfaces/wishlist-item.interface';
import { AppError } from '../interfaces/app-error.interface';

@Component({
  selector: 'app-wishlist',
  templateUrl: './wishlist.component.html',
  styleUrls: ['./wishlist.component.css'],
})
export class WishlistComponent implements OnInit, OnDestroy {
  wishlistProductsErrorMessage: string = '';
  products: WishlistItem[] = [];
  userId: number = 0;
  subscriptions: Subscription[] = [];

  constructor(
    private loadingService: LoadingService,
    private route: ActivatedRoute,
    private wishlistService: WishlistService,
    private msgModalService: MessageModalService
  ) {}

  ngOnInit(): void {
    this.loadingService.setPageLoadingInit();

    this.subscriptions.push(
      this.route.data.subscribe(
        (data: { wishlistProducts: WishlistItem[] }) => {
          this.products = data.wishlistProducts;
        }
      ),
      this.route.params.subscribe((params: Params) => {
        this.userId = +params.userId;
      })
    );
  }

  onRemoveItem(productId: number) {
    // Loading spinner
    this.loadingService.setPageLoading(true);

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
            this.wishlistService
              .getWishlistItems(this.userId)
              .subscribe((products: WishlistItem[]) => {
                this.products = products;
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

  ngOnDestroy(): void {
    this.subscriptions.forEach((subscription: Subscription) =>
      subscription.unsubscribe()
    );
  }
}
