import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

// SERVICES
import { DataService } from './data.service';

@Injectable({
  providedIn: 'root',
})
export class CartService {
  constructor(private dataService: DataService) {}

  setProductInCart(
    productId: number,
    userId?: number,
    cartId?: number
  ): Observable<{ message: string; cartId?: number }> {
    return this.dataService.post('cart/set-product-in-cart', {
      productId,
      userId,
      cartId,
    });
  }

  deleteCart(cartId: number) {
    return this.dataService.delete(`cart/delete-cart/${cartId}`);
  }
}
