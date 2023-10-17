import { Injectable } from '@angular/core';
import { ResolveFn } from '@angular/router';
import { Observable } from 'rxjs';

// SERVICES
import { ShopService } from '../services/shop.service';

// INTERFACES
import { Category } from '../interfaces/category.interface';

@Injectable({
  providedIn: 'root',
})
export class ShopCategoriesResolver {
  constructor(private shopService: ShopService) {}

  resolve: ResolveFn<Category[]> = (): Observable<Category[]> => {
    return this.shopService.getCategories();
  };
}
