import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

// SERVICES
import { DataService } from './data.service';

// INTERFACES
import { FeaturedProduct } from '../interfaces/featured-product.interface';

@Injectable({
  providedIn: 'root',
})
export class ProductService {
  constructor(private dataService: DataService) {}

  getFeaturedProducts(userId: number): Observable<FeaturedProduct[]> {
    return this.dataService.get(`featured-products/${userId}`);
  }

  getCategoryProducts(categoryId: number, userId: number): Observable<any> {
    return this.dataService.get(
      `shop/get-category-products/${categoryId}/${userId}`
    );
  }
}
