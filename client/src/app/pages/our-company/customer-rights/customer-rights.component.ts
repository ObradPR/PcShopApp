import { Component, OnInit } from '@angular/core';

// SERVICE
import { LoadingService } from 'src/app/services/loading.service';

@Component({
  selector: 'app-customer-rights',
  templateUrl: './customer-rights.component.html',
  styleUrls: ['./customer-rights.component.css'],
})
export class CustomerRightsComponent implements OnInit {
  constructor(private loadingService: LoadingService) {}

  ngOnInit(): void {
    this.loadingService.setPageLoadingInit();
  }
}
