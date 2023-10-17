import { Component, OnInit } from '@angular/core';

// SERVICES
import { LoadingService } from '../services/loading.service';

@Component({
  selector: 'app-shop',
  templateUrl: './shop.component.html',
  styleUrls: ['./shop.component.css'],
})
export class ShopComponent implements OnInit {
  constructor(private loadingService: LoadingService) {}

  ngOnInit(): void {
    this.loadingService.setPageLoadingInit();
  }
}
