import { Component, OnInit } from '@angular/core';

// SERVICES
import { LoadingService } from '../services/loading.service';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css'],
})
export class UserComponent implements OnInit {
  constructor(private loadingService: LoadingService) {}

  ngOnInit(): void {
    this.pageLoaded();
  }

  pageLoaded() {
    this.loadingService.setPageLoadingInit();

    this.loadingService.getPageLoading().subscribe((status: boolean) => {
      if (status) this.loadingService.setPageLoading(false);
    });
  }
}
