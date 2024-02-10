import { Component, ElementRef, OnDestroy, OnInit } from '@angular/core';
import { Subscription, finalize } from 'rxjs';

// INTERFACES
import { Faq } from 'src/app/interfaces/faq.interface';
import { AppError } from 'src/app/interfaces/app-error.interface';

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
    private errorHandlingService: ErrorHandlingService,
    private elementRef: ElementRef
  ) {}

  ngOnInit(): void {
    this.loadingService.setPageLoadingInit();
    this.getFaqs();

    // this.animateContent();
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

          this.animateContent();
        },
        error: (err: AppError) => {
          this.faqErrorMessage = this.errorHandlingService.errorMessage(
            err.error.message,
            err.status
          );
          console.log(err);
        },
      });
  }

  animateContent() {
    setTimeout(() => {
      const observer = new IntersectionObserver((entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            entry.target.classList.add('show-el');

            observer.unobserve(entry.target);
          }
        });
      });

      const hiddenEls =
        this.elementRef.nativeElement.querySelectorAll('.hidden-el');

      hiddenEls.forEach((el: HTMLElement) => observer.observe(el));
    }, 0);
  }

  ngOnDestroy(): void {
    this.faqSubscription.unsubscribe();
  }
}
