import { Component, OnInit } from '@angular/core';
import { Subscription, finalize } from 'rxjs';

// INTERFACES
import { RepairService } from 'src/app/interfaces/repair-service.interface';
import { ErrorHandlingService } from 'src/app/services/error-handling.service';
import { InfoService } from 'src/app/services/info.service';

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
    private errorHandlingService: ErrorHandlingService
  ) {}

  ngOnInit(): void {
    this.loadingService.setPageLoadingInit();
    this.getRepairServices();
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
        error: (err: any) => {
          this.repairErrorMessage = this.errorHandlingService.errorMessage(
            err.error.message,
            err.status
          );
          console.log(err);
        },
      });
  }
}
