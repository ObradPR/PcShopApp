import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

// GUARDS
import { AuthGuard } from '../guards/auth.guard';

// RESOLVERS
import { WishlistItemsResolver } from '../resolvers/wishlist-items.resolver';
import { ShopCategoriesResolver } from '../resolvers/shop-categories.resolver';
import { CategoryProductsResolver } from '../resolvers/category-products.resolver';
import { CartItemsResolver } from '../resolvers/cart-items.resolver';

// COMPONENTS
import { HomeComponent } from '../pages/home/home.component';
import { AboutUsComponent } from '../pages/our-company/about-us/about-us.component';
import { WeRentComponent } from '../pages/our-company/we-rent/we-rent.component';
import { CustomerRightsComponent } from '../pages/our-company/customer-rights/customer-rights.component';
import { HowToBuyComponent } from '../pages/our-company/how-to-buy/how-to-buy.component';
import { ContactComponent } from '../pages/contact/contact.component';
import { FaqsComponent } from '../pages/our-company/faqs/faqs.component';
import { RepairServiceComponent } from '../pages/our-company/repair-service/repair-service.component';
import { StoresComponent } from '../pages/our-company/stores/stores.component';
import { PaymentTypesComponent } from '../pages/our-company/payment-types/payment-types.component';
import { WishlistComponent } from '../pages/wishlist/wishlist.component';
import { ShopCategoriesComponent } from '../pages/shop/shop-categories/shop-categories.component';
import { ShopComponent } from '../pages/shop/shop.component';
import { CategoryProductsComponent } from '../pages/shop/category-products/category-products.component';
import { CartComponent } from '../pages/cart/cart.component';
import { UserComponent } from '../pages/user/user.component';
import { ProductPageComponent } from '../pages/product-page/product-page.component';
import { ProductPageResolver } from '../resolvers/product-page.resolver';

const appRoutes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'about-us', component: AboutUsComponent },
  { path: 'we-rent', component: WeRentComponent },
  { path: 'customer-rights', component: CustomerRightsComponent },
  { path: 'how-to-buy', component: HowToBuyComponent },
  { path: 'contact', component: ContactComponent },
  { path: 'faqs', component: FaqsComponent },
  { path: 'repair-service', component: RepairServiceComponent },
  { path: 'stores', component: StoresComponent },
  { path: 'payment-types', component: PaymentTypesComponent },
  {
    path: 'wishlist/:userId',
    component: WishlistComponent,
    canActivate: [AuthGuard],
    resolve: { wishlistProducts: WishlistItemsResolver },
  },
  {
    path: 'shop',
    component: ShopComponent,
    children: [
      { path: '', redirectTo: 'categories', pathMatch: 'full' },
      {
        path: 'categories',
        component: ShopCategoriesComponent,
        resolve: { primaryCategories: ShopCategoriesResolver },
      },
      {
        path: 'products/:categoryId',
        component: CategoryProductsComponent,
        resolve: { categoryProducts: CategoryProductsResolver },
      },
    ],
  },
  {
    path: 'cart',
    component: CartComponent,
    resolve: { cartInfo: CartItemsResolver },
  },
  { path: 'user', component: UserComponent },
  {
    path: 'product/:name',
    component: ProductPageComponent,
    resolve: { singleProduct: ProductPageResolver },
  },
];

@NgModule({
  imports: [
    RouterModule.forRoot(appRoutes, {
      scrollPositionRestoration: 'top',
    }),
  ],
  exports: [RouterModule],
})
export class AppRoutingModule {}
