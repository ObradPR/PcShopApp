import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

// SERVICES
import { DataService } from './data.service';

// INTERFACES
import { FeaturedProduct } from '../interfaces/featured-product.interface';
import { SearchProduct } from '../interfaces/search-product.interface';
import { Product } from '../interfaces/product.interface';

@Injectable({
  providedIn: 'root',
})
export class ProductService {
  constructor(private dataService: DataService) {}

  getFeaturedProducts(userId: number): Observable<FeaturedProduct[]> {
    return this.dataService.get(`featured-products/${userId}`);
  }

  getCategoryProducts(
    categoryIds: number[],
    userId: number
  ): Observable<Product[]> {
    return this.dataService.post(`shop/get-category-products`, {
      categories: categoryIds,
      userId,
    });
  }

  getProductsBySearch(title: string): Observable<SearchProduct[]> {
    return this.dataService.get(`products-by-search/${title}`);
  }

  getSingleProduct(productName: string, userId: number): Observable<any> {
    return this.dataService.get(
      `product/single-product/${productName}/${userId}`
    );
  }

  getProductInfo(productId: number, lookFor?: string): Observable<any> {
    return this.dataService.get(`product/info/${productId}/${lookFor}`);
  }
}
