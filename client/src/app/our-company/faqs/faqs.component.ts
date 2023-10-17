import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription, finalize } from 'rxjs';

// INTERFACES
import { Faq } from 'src/app/interfaces/faq.interface';

// SERVICES
import { LoadingService } from 'src/app/services/loading.service';
import { InfoService } from 'src/app/services/info.service';
import { ErrorHandlingService } from 'src/app/services/error-handling.service';

@Component({
  selector: 'app-faqs',
  templateUrl: './faqs.component.html',
  styleUrls: ['./faqs.component.css'],
})
export class FaqsComponent implements OnInit, OnDestroy {
  faqs: Faq[] = [];
  faqErrorMessage: string = '';
  faqSubscription: Subscription = new Subscription();

  constructor(
    private loadingService: LoadingService,
    private infoService: InfoService,
    private errorHandlingService: ErrorHandlingService
  ) {}

  ngOnInit(): void {
    this.loadingService.setPageLoadingInit();
    this.getFaqs();
  }

  getFaqs(): void {
    this.loadingService.setPageLoading(true);
    this.faqSubscription = this.infoService
      .getFAQs()
      .pipe(
        finalize(() => {
          this.loadingService.setPageLoading(false);
        })
      )
      .subscribe({
        next: (data: Faq[]) => {
          this.faqs = data;
        },
        error: (err: any) => {
          this.faqErrorMessage = this.errorHandlingService.errorMessage(
            err.error.message,
            err.status
          );
          console.log(err);
        },
      });
  }

  ngOnDestroy(): void {
    this.faqSubscription.unsubscribe();
  }
}
