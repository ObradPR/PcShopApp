import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AboutUsComponent } from './about-us/about-us.component';
import { WeRentComponent } from './we-rent/we-rent.component';
import { ReactiveFormsModule } from '@angular/forms';
import { CustomerRightsComponent } from './customer-rights/customer-rights.component';
import { HowToBuyComponent } from './how-to-buy/how-to-buy.component';
import { FaqsComponent } from './faqs/faqs.component';
import { RepairServiceComponent } from './repair-service/repair-service.component';
import { StoresComponent } from './stores/stores.component';
import { PaymentTypesComponent } from './payment-types/payment-types.component';

@NgModule({
  declarations: [
    AboutUsComponent,
    WeRentComponent,
    CustomerRightsComponent,
    HowToBuyComponent,
    FaqsComponent,
    RepairServiceComponent,
    StoresComponent,
    PaymentTypesComponent,
  ],
  imports: [CommonModule, ReactiveFormsModule],
})
export class OurCompanyModule {}
