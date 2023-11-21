import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

// SERVICES
import { DataService } from './data.service';

// INTERFACES
import { CartItem } from '../interfaces/cart-item.interface';
import { CartStats } from '../interfaces/cart-stats.interface';

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

  getCartItems(
    userId: number,
    cartId: number
  ): Observable<{ cartItems: CartItem[]; cartStats: CartStats }> {
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

  deleteCartItem(itemId: number) {
    return this.dataService.delete(`cart/delete-cart-item/${itemId}`);
  }

  changeItemAmount(howMuch: number, itemId: number) {
    return this.dataService.patch('cart/update-item-amount', {
      howMuch,
      itemId,
    });
  }
}
