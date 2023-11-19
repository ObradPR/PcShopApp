import { Injectable } from '@angular/core';

// SERVICES
import { CartService } from './cart.service';

// INTERFACES

@Injectable({
  providedIn: 'root',
})
export class LocalStorageService {
  private accessTokenName: string = 'access_token';
  private cartTokenName: string = 'cart_id';

  constructor(private cartService: CartService) {}

  // USER ACCOUNT LOGIN/REGISTER
  setAccessToken(token: string) {
    localStorage.setItem(this.accessTokenName, token);
  }

  getAccessToken(): string {
    return localStorage.getItem(this.accessTokenName);
  }

  removeAccessToken() {
    localStorage.removeItem(this.accessTokenName);
  }

  // CART
  setCartId(cartId: number) {
    localStorage.setItem(this.cartTokenName, cartId.toString());
  }

  getCartId(): number {
    return parseInt(localStorage.getItem(this.cartTokenName));
  }

  removeCartId() {
    let cartId = this.getCartId();

    if (isNaN(cartId)) return;

    this.cartService.deleteCart(cartId).subscribe();

    localStorage.removeItem(this.cartTokenName);
  }
}
