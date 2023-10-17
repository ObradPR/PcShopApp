import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AppRoutingModule } from '../routes/app-routing.module';

import { HomeComponent } from './home.component';
import { CoverComponent } from './cover/cover.component';
import { SiteInfoComponent } from './site-info/site-info.component';
import { FeaturedProductsComponent } from './featured-products/featured-products.component';
import { PopularCategoriesComponent } from './popular-categories/popular-categories.component';
import { InteractiveCategoriesComponent } from './interactive-categories/interactive-categories.component';
import { TestimonialsComponent } from './testimonials/testimonials.component';

@NgModule({
  declarations: [
    HomeComponent,
    CoverComponent,
    SiteInfoComponent,
    FeaturedProductsComponent,
    PopularCategoriesComponent,
    InteractiveCategoriesComponent,
    TestimonialsComponent,
  ],
  imports: [CommonModule, AppRoutingModule],
})
export class HomeModule {}
