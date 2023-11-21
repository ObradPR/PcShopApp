import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

// INTERFACES
import { Product } from 'src/app/interfaces/product.interface';

// SERVICES
import { ShopService } from 'src/app/services/shop.service';

@Component({
  selector: 'app-category-products',
  templateUrl: './category-products.component.html',
  styleUrls: ['./category-products.component.css'],
})
export class CategoryProductsComponent implements OnInit {
  constructor(
    private route: ActivatedRoute,
    private shopService: ShopService
  ) {}

  ngOnInit(): void {
    this.route.data.subscribe((data: { categoryProducts: Product[] }) => {
      let products = data.categoryProducts;

      products = products.map((product: Product) => {
        return {
          ...product,
          tag_names:
            typeof product.tag_names === 'string'
              ? product.tag_names.split(',')
              : [],
        };
      });

      // console.log(products);

      this.shopService.setProductsInit(products);
    });
  }
}
