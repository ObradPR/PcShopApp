import { Component, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css'],
})
export class CartComponent implements OnInit, OnDestroy {
  subscriptions: Subscription[] = [];

  constructor(private route: ActivatedRoute) {}

  ngOnInit(): void {
    this.subscriptions.push(
      this.route.data.subscribe((data: { cartItems: any[] }) => {
        console.log(data.cartItems);
      })
    );
  }

  ngOnDestroy(): void {
    this.subscriptions.forEach((subscription: Subscription) =>
      subscription.unsubscribe()
    );
  }
}
