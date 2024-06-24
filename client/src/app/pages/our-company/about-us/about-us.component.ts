import { Component, OnInit } from '@angular/core';

// SERVICE
import { LoadingService } from 'src/app/services/loading.service';

@Component({
  selector: 'app-about-us',
  templateUrl: './about-us.component.html',
  styleUrls: ['./about-us.component.css'],
})
export class AboutUsComponent implements OnInit {
  constructor(private loadingService: LoadingService) {}

  ngOnInit(): void {
    this.loadingService.setPageLoadingInit();
  }
}
