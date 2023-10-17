import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

// SERVICES
import { DataService } from './data.service';

// INTERFACES
import { Category } from '../interfaces/category.interface';

// TYPES
type ShopCategoryData =
  | { products: boolean; subCategories: Category[] }
  | { products: boolean };

@Injectable({
  providedIn: 'root',
})
export class ShopService {
  private products: BehaviorSubject<any> = new BehaviorSubject<any>(null);
  private productsInit: BehaviorSubject<any> = new BehaviorSubject<any>(null);

  getProducts(): Observable<any> {
    return this.products.asObservable();
  }

  setProducts(products: any) {
    this.products.next(products);
  }

  getProductsInit(): Observable<any> {
    return this.productsInit.asObservable();
  }

  setProductsInit(products: any) {
    this.productsInit.next(products);
    this.products.next(products);
  }

  //! COCNSTRUCTOR
  constructor(private dataService: DataService) {}

  getCategories(categoryId?: number): Observable<Category[]> {
    return this.dataService.get(`shop/get-categories/${categoryId}`);
  }

  getCategory(categoryId: number): Observable<ShopCategoryData> {
    return this.dataService.get(`shop/get-category/${categoryId}`);
  }

  getAllCategories(): Observable<Category[]> {
    return this.dataService.get('shop/get-all-categories');
  }
}
