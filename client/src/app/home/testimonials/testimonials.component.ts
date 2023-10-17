import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription, finalize } from 'rxjs';

// SERVICES
import { InfoService } from 'src/app/services/info.service';
import { LoadingService } from 'src/app/services/loading.service';
import { ErrorHandlingService } from 'src/app/services/error-handling.service';

// INTERFACES
import { Testimonial } from 'src/app/interfaces/testimonial.interface';

@Component({
  selector: 'app-testimonials',
  templateUrl: './testimonials.component.html',
  styleUrls: ['./testimonials.component.css'],
})
export class TestimonialsComponent implements OnInit, OnDestroy {
  testimonials: Testimonial[] = [];
  testimonialErrorMessage: string = '';
  testimonialSubscription: Subscription;

  constructor(
    private infoService: InfoService,
    private loadingService: LoadingService,
    private errorHandlingService: ErrorHandlingService
  ) {}

  ngOnInit(): void {
    this.getTestimonials();
  }

  getTestimonials() {
    this.testimonialSubscription = this.infoService
      .getTestimonials()
      .pipe(
        finalize(() => {
          // Turning loadingSpinner off
          this.loadingService.setPageLoading(false);
        })
      )
      .subscribe({
        next: (data: Testimonial[]) => {
          this.testimonials = data;
        },
        error: (err: any) => {
          this.testimonialErrorMessage = this.errorHandlingService.errorMessage(
            err.error.message,
            err.status
          );
          console.log(err);
        },
      });
  }

  ngOnDestroy(): void {
    this.testimonialSubscription.unsubscribe();
  }
}
