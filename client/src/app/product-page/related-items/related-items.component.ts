import { Component, Input, OnInit } from '@angular/core';
import { take } from 'rxjs';
import { AppError } from 'src/app/interfaces/app-error.interface';
import { Product } from 'src/app/interfaces/product.interface';
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

  constructor(private productService: ProductService) {}

  ngOnInit(): void {
    this.productService
      .getProductInfo(this.product.id_product)
      .pipe(take(1))
      .subscribe({
        next: (data: any) => {
          this.compatabileItems = data.compatabileItems;
        },
        error: (err: AppError) => console.log(err),
      });
  }
}
