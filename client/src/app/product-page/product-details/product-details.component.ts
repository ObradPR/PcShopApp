import { Component, Input, OnInit } from '@angular/core';
import { take } from 'rxjs';
import { AppError } from 'src/app/interfaces/app-error.interface';
import { Product } from 'src/app/interfaces/product.interface';
import { ProductService } from 'src/app/services/product.service';

@Component({
  selector: 'app-product-details',
  templateUrl: './product-details.component.html',
  styleUrls: ['./product-details.component.css'],
})
export class ProductDetailsComponent implements OnInit {
  @Input() product: Product;
  specifications: any;
  reviewsRatings: any;

  constructor(private productService: ProductService) {}

  ngOnInit(): void {
    this.getInfo();
  }

  getInfo() {
    this.productService
      .getProductInfo(this.product.id_product)
      .pipe(take(1))
      .subscribe({
        next: (data: any) => {
          this.specifications = data.specifications;
          this.reviewsRatings = data.reviewsRatings;
        },
        error: (err: AppError) => console.log(err),
      });
  }
}
