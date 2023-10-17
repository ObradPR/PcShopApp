import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatSliderModule } from '@angular/material/slider';

// USER MODULES
import { AppRoutingModule } from '../routes/app-routing.module';

// COMPONENTS
import { ShopComponent } from './shop.component';
import { ShopCategoriesComponent } from './shop-categories/shop-categories.component';
import { CategoryProductsComponent } from './category-products/category-products.component';
import { ShopTopComponent } from './category-products/shop-top/shop-top.component';
import { FiltersComponent } from './category-products/filters/filters.component';
import { ShopProductsComponent } from './category-products/shop-products/shop-products.component';

@NgModule({
  declarations: [
    ShopComponent,
    ShopCategoriesComponent,
    CategoryProductsComponent,
    ShopTopComponent,
    FiltersComponent,
    ShopProductsComponent,
  ],
  imports: [CommonModule, AppRoutingModule, MatSliderModule],
})
export class ShopModule {}
