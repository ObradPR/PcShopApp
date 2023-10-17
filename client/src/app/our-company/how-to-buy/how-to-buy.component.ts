import { Component, OnInit } from '@angular/core';

// SERVICE
import { LoadingService } from 'src/app/services/loading.service';

@Component({
  selector: 'app-how-to-buy',
  templateUrl: './how-to-buy.component.html',
  styleUrls: ['./how-to-buy.component.css'],
})
export class HowToBuyComponent implements OnInit {
  constructor(private loadingService: LoadingService) {}

  ngOnInit(): void {
    this.loadingService.setPageLoadingInit();
  }
}
