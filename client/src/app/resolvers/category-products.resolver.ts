import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, ResolveFn } from '@angular/router';
import { Observable, switchMap } from 'rxjs';

// SERVICES
import { ProductService } from '../services/product.service';
import { AuthService } from '../services/auth.service';

// INTERFACES
import { UserData } from '../interfaces/user-data.interface';
import { Product } from '../interfaces/product.interface';

@Injectable({
  providedIn: 'root',
})
export class CategoryProductsResolver {
  userId: number = 0;

  constructor(
    private productService: ProductService,
    private authService: AuthService
  ) {}

  resolve: ResolveFn<Product[]> = (
    route: ActivatedRouteSnapshot
  ): Observable<Product[]> => {
    return this.authService.getUserData().pipe(
      switchMap((userData: UserData) => {
        if (userData === null) {
          this.userId = 0;
        } else {
          this.userId = userData.idUser;
        }
        const categoryId = +route.params.categoryId;
        return this.productService.getCategoryProducts(
          [categoryId],
          this.userId
        );
      })
    );
  };
}
