import { Component, Input, OnInit } from '@angular/core';
import { NavigationEnd, Router } from '@angular/router';
import { take } from 'rxjs';
import { AppError } from 'src/app/common/interfaces/app-error.interface';
import { Product } from 'src/app/common/interfaces/product.interface';
import { ProductService } from 'src/app/services/product.service';

@Component({
  selector: 'app-related-items',
  templateUrl: './related-items.component.html',
  styleUrls: ['./related-items.component.css'],
})
export class RelatedItemsComponent implements OnInit {
  @Input() product: Product;
  compatabileItems: any = [];
  categoryItems: any = [];

  constructor(private productService: ProductService, private router: Router) {}

  ngOnInit(): void {
    this.getRelatedProducts();

    this.router.events.subscribe((event) => {
      if (event instanceof NavigationEnd) {
        setTimeout(() => {
          this.getRelatedProducts();
        }, 200);
      }
    });
  }
  getRelatedProducts() {
    this.productService
      .getProductInfo(
        this.product.id_product,
        'compatability',
        this.product.category_name
      )
      .pipe(take(1))
      .subscribe({
        next: (data: any) => {
          this.compatabileItems = data.compatabileItems;
          this.categoryItems = data.categoryProducts;
        },
        error: (err: AppError) => console.log(err),
      });
  }
}
