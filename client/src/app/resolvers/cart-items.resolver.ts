import { ActivatedRouteSnapshot, ResolveFn } from '@angular/router';
import { Observable, switchMap } from 'rxjs';
import { Injectable } from '@angular/core';

// SERVICES
import { AuthService } from '../services/auth.service';
import { LocalStorageService } from '../services/local-storage.service';
import { CartService } from '../services/cart.service';

// INTERFACES
import { UserData } from '../common/interfaces/user-data.interface';
import { CartItem } from '../common/interfaces/cart-item.interface';
import { CartStats } from '../common/interfaces/cart-stats.interface';

@Injectable({
  providedIn: 'root',
})
export class CartItemsResolver {
  userId: number = 0;

  constructor(
    private authService: AuthService,
    private localStorageService: LocalStorageService,
    private cartService: CartService
  ) {}

  resolve: ResolveFn<{ cartItems: CartItem[]; cartStats: CartStats }> = (
    route: ActivatedRouteSnapshot
  ): Observable<{ cartItems: CartItem[]; cartStats: CartStats }> => {
    return this.authService.getUserData().pipe(
      switchMap((userData: UserData) => {
        if (userData !== null) {
          this.userId = userData.idUser;

          return this.cartService.getCartItems(this.userId, 0);
        } else {
          const cartId = this.localStorageService.getCartId();

          return this.cartService.getCartItems(0, cartId);
        }
      })
    );
  };
}
