import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

// SERVICES
import { DataService } from './data.service';

@Injectable({
  providedIn: 'root',
})
export class CartService {
  private cartItemsChangedStatus: BehaviorSubject<boolean> =
    new BehaviorSubject<boolean>(false);

  constructor(private dataService: DataService) {}

  setCartItemsChangeStatus(status: boolean) {
    this.cartItemsChangedStatus.next(status);
  }

  getCartItemsChangeStatus(): Observable<boolean> {
    return this.cartItemsChangedStatus.asObservable();
  }

  getCartItems(userId: number, cartId: number): Observable<any> {
    return this.dataService.get(`cart/cart-items/${userId}/${cartId}`);
  }

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
