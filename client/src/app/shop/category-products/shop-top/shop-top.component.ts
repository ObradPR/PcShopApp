import { Component, OnInit } from '@angular/core';

// INTERFACES
import { Product } from 'src/app/interfaces/product.interface';

// SERVICES
import { ShopService } from 'src/app/services/shop.service';

@Component({
  selector: 'app-shop-top',
  templateUrl: './shop-top.component.html',
  styleUrls: ['./shop-top.component.css'],
})
export class ShopTopComponent implements OnInit {
  products: Product[] = [];

  constructor(private shopService: ShopService) {}

  ngOnInit(): void {
    this.shopService.getProducts().subscribe((data: Product[]) => {
      this.products = data;
    });
  }

  onProductSorting(value: string): void {
    let sortProducts = this.products;
    switch (value) {
      case 'sort-name':
        sortProducts = sortProducts.sort((a, b) =>
          a.product_name > b.product_name ? 1 : -1
        );
        break;
      case 'sort-max-price':
        sortProducts = sortProducts.sort((a, b) => {
          const priceA =
            a.discount_price !== null ? a.discount_price : a.product_price;
          const priceB =
            b.discount_price !== null ? b.discount_price : b.product_price;

          return +priceB - +priceA;
        });
        break;
      case 'sort-min-price':
        sortProducts = sortProducts.sort((a, b) => {
          const priceA =
            a.discount_price !== null ? a.discount_price : a.product_price;
          const priceB =
            b.discount_price !== null ? b.discount_price : b.product_price;

          return +priceA - +priceB;
        });
        break;
      case 'sort-rating':
        sortProducts = sortProducts.sort((a, b) =>
          a.avg_rating < b.avg_rating ? 1 : -1
        );
        break;
      default:
        sortProducts = this.products;
    }

    this.shopService.setProducts(sortProducts);
  }
}
