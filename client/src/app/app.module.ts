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
import { HomeModule } from './home/home.module';
import { AuthModule } from './auth/auth.module';
import { OurCompanyModule } from './our-company/our-company.module';
import { WishlistModule } from './wishlist/wishlist.module';
import { ShopModule } from './shop/shop.module';

// COMPONENTS
import { AppComponent } from './app.component';
import { HeaderComponent } from './header/header.component';
import { HeaderTopComponent } from './header/header-top/header-top.component';
import { HeaderBottomComponent } from './header/header-bottom/header-bottom.component';
import { FooterComponent } from './footer/footer.component';
import { FooterTopComponent } from './footer/footer-top/footer-top.component';
import { FooterBottomComponent } from './footer/footer-bottom/footer-bottom.component';
import { FooterCopyComponent } from './footer/footer-copy/footer-copy.component';
import { ScrollToTopComponent } from './scroll-to-top/scroll-to-top.component';
import { ContactComponent } from './contact/contact.component';
import { CartComponent } from './cart/cart.component';

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
    FormsModule
  ],
  providers: [JwtHelperService],
  bootstrap: [AppComponent],
})
export class AppModule {}
