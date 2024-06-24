import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, ResolveFn } from '@angular/router';
import { Observable, switchMap } from 'rxjs';
import { ProductService } from '../services/product.service';
import { AuthService } from '../services/auth.service';
import { UserData } from '../common/interfaces/user-data.interface';

@Injectable({
  providedIn: 'root',
})
export class ProductPageResolver {
  userId: number = 0;

  constructor(
    private productService: ProductService,
    private authService: AuthService
  ) {}

  resolve: ResolveFn<any> = (
    route: ActivatedRouteSnapshot
  ): Observable<any> => {
    return this.authService.getUserData().pipe(
      switchMap((userData: UserData) => {
        if (userData === null) {
          this.userId = 0;
        } else {
          this.userId = userData.idUser;
        }
        return this.productService.getSingleProduct(
          route.params.name,
          this.userId
        );
      })
    );
  };
}
