import { Component, ElementRef, OnInit } from '@angular/core';
import { Subscription, finalize } from 'rxjs';

// INTERFACES
import { RepairService } from 'src/app/common/interfaces/repair-service.interface';
import { ErrorHandlingService } from 'src/app/services/error-handling.service';
import { InfoService } from 'src/app/services/info.service';
import { AppError } from 'src/app/common/interfaces/app-error.interface';

// SERVICES
import { LoadingService } from 'src/app/services/loading.service';

@Component({
  selector: 'app-repair-service',
  templateUrl: './repair-service.component.html',
  styleUrls: ['./repair-service.component.css'],
})
export class RepairServiceComponent implements OnInit {
  repairServices: RepairService[] = [];
  repairErrorMessage: string = '';
  repairServiceSubscription: Subscription = new Subscription();

  constructor(
    private loadingService: LoadingService,
    private infoService: InfoService,
    private errorHandlingService: ErrorHandlingService,
    private elementRef: ElementRef
  ) {}

  ngOnInit(): void {
    this.loadingService.setPageLoadingInit();
    this.getRepairServices();

    this.animateContent();
  }

  getRepairServices(): void {
    this.loadingService.setPageLoading(true);
    this.repairServiceSubscription = this.infoService
      .getRepairServices()
      .pipe(
        finalize(() => {
          this.loadingService.setPageLoading(false);
        })
      )
      .subscribe({
        next: (data: RepairService[]) => {
          this.repairServices = data;
        },
        error: (err: AppError) => {
          this.repairErrorMessage = this.errorHandlingService.errorMessage(
            err.error.message,
            err.status
          );
        },
      });
  }

  animateContent() {
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
  }
}
