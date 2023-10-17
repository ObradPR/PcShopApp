import {
  Component,
  OnDestroy,
  OnInit,
  ChangeDetectionStrategy,
} from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Subscription, finalize } from 'rxjs';

// INTERFACES
import { Category } from 'src/app/interfaces/category.interface';

// SERVICES
import { LoadingService } from 'src/app/services/loading.service';
import { ShopService } from 'src/app/services/shop.service';
import { ErrorHandlingService } from 'src/app/services/error-handling.service';

type SubscriptionData =
  | { products: boolean; subCategories: any[] }
  | { products: boolean };

@Component({
  selector: 'app-shop-categories',
  templateUrl: './shop-categories.component.html',
  styleUrls: ['./shop-categories.component.css'],
})
export class ShopCategoriesComponent implements OnInit, OnDestroy {
  changeDetection: ChangeDetectionStrategy.OnPush;
  categories: Category[] = [];
  subscriptions: Subscription[] = [];
  categoriesErrorMessage: string = '';

  constructor(
    private loadingService: LoadingService,
    private route: ActivatedRoute,
    private shopService: ShopService,
    private errorHandlingService: ErrorHandlingService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.loadingService.setPageLoadingInit();

    this.subscriptions.push(
      this.route.data.subscribe((data: { primaryCategories: Category[] }) => {
        this.categories = data.primaryCategories;
      })
    );
  }

  onCategorySelect(categoryId: number): void {
    this.subscriptions.push(
      this.shopService.getCategory(categoryId).subscribe({
        next: (data: SubscriptionData) => {
          if (!data.products) {
            if ('subCategories' in data) {
              this.categories = data.subCategories;
            }
          } else {
            this.router.navigate(['products', categoryId], {
              relativeTo: this.route.parent,
            });
          }
        },
        error: (err: any) => {
          console.log(err);
          this.categories = [];
          this.categoriesErrorMessage = this.errorHandlingService.errorMessage(
            err.error.message,
            err.status
          );
        },
      })
    );
  }

  onGetBackCategory(parentId: number): void {
    this.loadingService.setPageLoading(true);
    this.subscriptions.push(
      this.shopService
        .getCategories(parentId)
        .pipe(
          finalize(() => {
            this.loadingService.setPageLoading(false);
          })
        )
        .subscribe((data: Category[]) => {
          this.categories = data;
        })
    );
  }

  ngOnDestroy(): void {
    this.subscriptions.forEach((subscription: Subscription) =>
      subscription.unsubscribe()
    );
  }
}
