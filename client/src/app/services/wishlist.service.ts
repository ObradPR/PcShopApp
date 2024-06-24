import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

// SERVICES
import { DataService } from './data.service';

// INTERFACES
import { WishlistItem } from '../common/interfaces/wishlist-item.interface';

@Injectable({
  providedIn: 'root',
})
export class WishlistService {
  private wishlistItemsChangedStatus: BehaviorSubject<boolean> =
    new BehaviorSubject<boolean>(false);

  constructor(private dataService: DataService) {}

  setWishlistItemsChangeStatus(status: boolean) {
    this.wishlistItemsChangedStatus.next(status);
  }

  getWishlistItemsChangeStatus(): Observable<boolean> {
    return this.wishlistItemsChangedStatus.asObservable();
  }

  getWishlistItems(userId: number): Observable<WishlistItem[]> {
    return this.dataService.get(`wishlist/wishlist-items/${userId}`);
  }

  removeItem(productId: number, userId: number) {
    return this.dataService.delete(
      `wishlist/remove-item-wishlist/${userId}/${productId}`
    );
  }

  addToWishlist(obj: {
    productId: number;
    userId: number;
  }): Observable<{ message: string }> {
    return this.dataService.post('wishlist/add-item-wishlist', obj);
  }
}
