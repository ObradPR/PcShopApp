import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

// SERVICES
import { DataService } from './data.service';

// INTERFACES
import { Category } from '../interfaces/category.interface';
import { Product } from '../interfaces/product.interface';

// TYPES
type ShopCategoryData =
  | { products: boolean; subCategories: Category[] }
  | { products: boolean };

@Injectable({
  providedIn: 'root',
})
export class ShopService {
  private products: BehaviorSubject<Product[]> = new BehaviorSubject<Product[]>(
    null
  );
  private productsInit: BehaviorSubject<Product[]> = new BehaviorSubject<
    Product[]
  >(null);

  getProducts(): Observable<Product[]> {
    return this.products.asObservable();
  }

  setProducts(products: Product[]) {
    this.products.next(products);
  }

  getProductsInit(): Observable<Product[]> {
    return this.productsInit.asObservable();
  }

  setProductsInit(products: Product[]) {
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
