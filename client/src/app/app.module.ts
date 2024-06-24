import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { LeafletModule } from '@asymmetrik/ngx-leaflet';

// SERVICES
import { JwtHelperService, JwtModule, JWT_OPTIONS } from '@auth0/angular-jwt';

// USER MODULES
import { AppRoutingModule } from './routes/app-routing.module';
import { SharedModule } from './shared/shared.module';
import { HomeModule } from './pages/home/home.module';
import { AuthModule } from './components/auth/auth.module';
import { OurCompanyModule } from './pages/our-company/our-company.module';
import { WishlistModule } from './pages/wishlist/wishlist.module';
import { ShopModule } from './pages/shop/shop.module';
import { UserModule } from './pages/user/user.module';

// COMPONENTS
import { AppComponent } from './app.component';
import { HeaderComponent } from './components/header/header.component';
import { HeaderTopComponent } from './components/header/header-top/header-top.component';
import { HeaderBottomComponent } from './components/header/header-bottom/header-bottom.component';
import { FooterComponent } from './components/footer/footer.component';
import { FooterTopComponent } from './components/footer/footer-top/footer-top.component';
import { FooterBottomComponent } from './components/footer/footer-bottom/footer-bottom.component';
import { FooterCopyComponent } from './components/footer/footer-copy/footer-copy.component';
import { ScrollToTopComponent } from './components/scroll-to-top/scroll-to-top.component';
import { ContactComponent } from './pages/contact/contact.component';
import { CartComponent } from './pages/cart/cart.component';
import { ProductPageModule } from './pages/product-page/product-page.module';

export function jwtOptionsFactory() {
  return {};
}

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    HeaderTopComponent,
    HeaderBottomComponent,
    FooterComponent,
    FooterTopComponent,
    FooterBottomComponent,
    FooterCopyComponent,
    ScrollToTopComponent,
    ContactComponent,
    CartComponent,
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    ReactiveFormsModule,
    BrowserAnimationsModule,
    AppRoutingModule,
    JwtModule.forRoot({
      jwtOptionsProvider: {
        provide: JWT_OPTIONS,
        useFactory: jwtOptionsFactory,
      },
    }),
    LeafletModule,
    SharedModule,
    HomeModule,
    AuthModule,
    OurCompanyModule,
    WishlistModule,
    ShopModule,
    FormsModule,
    UserModule,
    ProductPageModule,
  ],
  providers: [JwtHelperService],
  bootstrap: [AppComponent],
})
export class AppModule {}
