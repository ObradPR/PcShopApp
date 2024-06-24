import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

// SERVICES
import { DataService } from './data.service';

// INTERFACES
import { Testimonial } from '../common/interfaces/testimonial.interface';
import { Contact } from '../common/interfaces/contact.interface';
import { Faq } from '../common/interfaces/faq.interface';
import { RepairService } from '../common/interfaces/repair-service.interface';
import { Store } from '../common/interfaces/store.interface';
import { PaymentType } from '../common/interfaces/payment-type.interface';
import { Category } from '../common/interfaces/category.interface';
import { City } from '../common/interfaces/city.interface';

@Injectable({
  providedIn: 'root',
})
export class InfoService {
  constructor(private dataService: DataService) {}

  getTestimonials(): Observable<Testimonial[]> {
    return this.dataService.get('testimonials');
  }

  sendRentOffer(offer: FormData): Observable<{ message: string }> {
    return this.dataService.postWithFiles('rent-offer', offer);
  }

  sendContact(data: Contact): Observable<{ message: string }> {
    return this.dataService.post('contact', data);
  }

  getFAQs(): Observable<Faq[]> {
    return this.dataService.get('faqs');
  }

  getRepairServices(): Observable<RepairService[]> {
    return this.dataService.get('repair-service');
  }

  getStoresInfo(): Observable<Store[]> {
    return this.dataService.get('stores');
  }

  getPaymentTypes(): Observable<PaymentType[]> {
    return this.dataService.get('payment-types');
  }

  getPopularCategories(): Observable<Category[]> {
    return this.dataService.get('popular-categories');
  }

  getCities(): Observable<City[]> {
    return this.dataService.get('cities');
  }
}
