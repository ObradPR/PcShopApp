import { ActivatedRouteSnapshot, ResolveFn } from '@angular/router';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

// SERVICES
import { WishlistService } from '../services/wishlist.service';

// INTERFACES
import { WishlistItem } from '../common/interfaces/wishlist-item.interface';

@Injectable({
  providedIn: 'root',
})
export class WishlistItemsResolver {
  constructor(private wishlistService: WishlistService) {}

  resolve: ResolveFn<WishlistItem[]> = (
    route: ActivatedRouteSnapshot
  ): Observable<WishlistItem[]> => {
    return this.wishlistService.getWishlistItems(+route.paramMap.get('userId'));
  };
}
