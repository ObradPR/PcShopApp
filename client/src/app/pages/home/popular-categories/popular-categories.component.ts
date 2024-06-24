import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';

// INTERFACES
import { AppError } from 'src/app/common/interfaces/app-error.interface';
import { Category } from 'src/app/common/interfaces/category.interface';

// SERVICES
import { ErrorHandlingService } from 'src/app/services/error-handling.service';
import { InfoService } from 'src/app/services/info.service';

@Component({
  selector: 'app-popular-categories',
  templateUrl: './popular-categories.component.html',
  styleUrls: ['./popular-categories.component.css'],
})
export class PopularCategoriesComponent implements OnInit, OnDestroy {
  popularCategories: Category[] = [];
  categorySubscription: Subscription = new Subscription();
  popularCategoriesErrorMessage: string = '';

  constructor(
    private infoService: InfoService,
    private errorHandlingService: ErrorHandlingService
  ) {}

  ngOnInit(): void {
    this.popularCategoriesInit();
  }

  popularCategoriesInit(): void {
    this.categorySubscription = this.infoService
      .getPopularCategories()
      .subscribe({
        next: (data: Category[]) => {
          this.popularCategories = data;
        },
        error: (err: AppError) => {
          this.popularCategoriesErrorMessage =
            this.errorHandlingService.errorMessage(
              err.error.message,
              err.status
            );
        },
      });
  }

  ngOnDestroy(): void {
    this.categorySubscription.unsubscribe();
  }
}
