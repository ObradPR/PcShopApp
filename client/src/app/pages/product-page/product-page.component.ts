import { Component, OnInit } from '@angular/core';
import { LoadingService } from '../../services/loading.service';
import { ActivatedRoute, Router } from '@angular/router';
import { Product } from '../../common/interfaces/product.interface';

@Component({
  selector: 'app-product-page',
  templateUrl: './product-page.component.html',
  styleUrls: ['./product-page.component.css'],
})
export class ProductPageComponent implements OnInit {
  product: Product = null;

  constructor(
    private loadingService: LoadingService,
    private route: ActivatedRoute,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.loadingService.setPageLoadingInit();

    this.route.data.subscribe({
      next: (data: {
        singleProduct: { message: string; product: Product };
      }) => {
        this.product = data.singleProduct.product;
        this.product.tag_names =
          typeof this.product.tag_names === 'string'
            ? this.product.tag_names.split(',')
            : [];
      },
      error: (err) => {
        console.log(err);
        this.router.navigateByUrl('/');
      },
    });
  }
}
