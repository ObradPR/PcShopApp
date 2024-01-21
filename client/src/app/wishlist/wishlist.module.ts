import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { WishlistComponent } from './wishlist.component';
import { AppRoutingModule } from '../routes/app-routing.module';

@NgModule({
  declarations: [WishlistComponent],
  imports: [CommonModule, AppRoutingModule],
})
export class WishlistModule {}
