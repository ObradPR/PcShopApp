import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ProductPageComponent } from './product-page.component';
import { RelatedItemsComponent } from './related-items/related-items.component';
import { ProductInfoComponent } from './product-info/product-info.component';
import { ProductDetailsComponent } from './product-details/product-details.component';
import { AppRoutingModule } from '../routes/app-routing.module';

@NgModule({
  declarations: [
    ProductPageComponent,
    RelatedItemsComponent,
    ProductInfoComponent,
    ProductDetailsComponent,
  ],
  imports: [CommonModule, AppRoutingModule],
})
export class ProductPageModule {}
