import { Component, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Subscription } from 'rxjs';

// SERVICES
import { LoadingService } from '../services/loading.service';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css'],
})
export class CartComponent implements OnInit, OnDestroy {
  subscriptions: Subscription[] = [];
  items: [] = [];
  cartItemsErrorMessage: string = '';

  constructor(
    private route: ActivatedRoute,
    private loadingService: LoadingService
  ) {}

  ngOnInit(): void {
    this.loadingService.setPageLoadingInit();

    this.subscriptions.push(
      this.route.data.subscribe((data: { cartItems: [] }) => {
        this.items = data.cartItems;
        this.loadingService.setPageLoading(false);
      })
    );
  }

  onRemoveItem(productId: number) {
    // remove a product
  }

  onChangeItemAmount(how: string, productId: number) {
    if (how === 'decrement') {
      console.log('-');
    } else if (how === 'increment') {
      console.log('+');
    }
  }

  ngOnDestroy(): void {
    this.subscriptions.forEach((subscription: Subscription) =>
      subscription.unsubscribe()
    );
  }
}
