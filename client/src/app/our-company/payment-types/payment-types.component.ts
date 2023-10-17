import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription, finalize } from 'rxjs';

// SERVICES
import { InfoService } from 'src/app/services/info.service';
import { LoadingService } from 'src/app/services/loading.service';
import { ErrorHandlingService } from 'src/app/services/error-handling.service';

// INTERFACES
import { PaymentType } from 'src/app/interfaces/payment-type.interface';

@Component({
  selector: 'app-payment-types',
  templateUrl: './payment-types.component.html',
  styleUrls: ['./payment-types.component.css'],
})
export class PaymentTypesComponent implements OnInit, OnDestroy {
  paymentTypes: PaymentType[] = [];
  paymentTypesErrorMessage: string = '';
  paymentTypesSubscription: Subscription = new Subscription();

  constructor(
    private loadingService: LoadingService,
    private infoService: InfoService,
    private errorHandlingService: ErrorHandlingService
  ) {}

  ngOnInit(): void {
    this.loadingService.setPageLoadingInit();
    this.getPaymentTypes();
  }

  getPaymentTypes(): void {
    this.loadingService.setPageLoading(true);

    this.paymentTypesSubscription = this.infoService
      .getPaymentTypes()
      .pipe(
        finalize(() => {
          this.loadingService.setPageLoading(false);
        })
      )
      .subscribe({
        next: (data: PaymentType[]) => {
          this.paymentTypes = data;
        },
        error: (err: any) => {
          this.paymentTypesErrorMessage =
            this.errorHandlingService.errorMessage(
              err.error.message,
              err.status
            );

          console.log(err);
        },
      });
  }

  ngOnDestroy(): void {
    this.paymentTypesSubscription.unsubscribe();
  }
}
