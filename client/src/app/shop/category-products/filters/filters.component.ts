import {
  Component,
  ElementRef,
  OnDestroy,
  OnInit,
  Renderer2,
  ViewChild,
} from '@angular/core';
import { ActivatedRoute, Params } from '@angular/router';
import { Subscription, filter, finalize } from 'rxjs';

// INTERFACES
import { Category } from 'src/app/interfaces/category.interface';
import { UserData } from 'src/app/interfaces/user-data.interface';
import { AuthService } from 'src/app/services/auth.service';

// SERVICES
import { LoadingService } from 'src/app/services/loading.service';
import { ProductService } from 'src/app/services/product.service';
import { ShopService } from 'src/app/services/shop.service';

@Component({
  selector: 'app-filters',
  templateUrl: './filters.component.html',
  styleUrls: ['./filters.component.css'],
})
export class FiltersComponent implements OnInit, OnDestroy {
  @ViewChild('leftInput') minPriceInput: any;
  @ViewChild('rightInput') maxPriceInput: any;
  activeCategory: number = 0;
  categories: Category[] = [];
  products: any[] = [];
  productsInit: any[] | null = null;
  baseMinPrice: number | null = null;
  baseMaxPrice: number | null = null;
  minPriceChanged: number = 0;
  maxPriceChanged: number = 0;
  subscriptions: Subscription[] = [];
  brands: { id_brand: number; brand_name: string; brand_count: number }[] = [];
  tags: { tag_name: string; product_count: number }[] = [];
  selectedBrands: [] | any = [];
  selectedTags: [] | any = [];
  selectedCategories: [] | any = [];
  userId: number = 0;

  constructor(
    private shopService: ShopService,
    private route: ActivatedRoute,
    private elementRef: ElementRef,
    private productService: ProductService,
    private authService: AuthService
  ) {}

  ngOnInit(): void {
    this.subscriptions.push(
      this.route.params.subscribe((params: Params) => {
        this.activeCategory = +params.categoryId;
      }),
      this.authService.getUserData().subscribe((userData: UserData) => {
        if (userData === null) this.userId = 0;
        else this.userId = userData.idUser;
      })
    );

    this.getProducts();
    this.getTags();
    this.getAllActiveBrands();
    this.priceRangeInit();
    this.getAllCategories();
    this.setFilters();
  }

  setFilters(): void {
    const filterHeaders =
      this.elementRef.nativeElement.querySelectorAll('.filter-header');

    filterHeaders.forEach((el: HTMLElement) => {
      setTimeout(() => {
        this.toggleFilters(el);
      }, 500);
      el.addEventListener('click', () => {
        el.classList.toggle('active');

        this.toggleFilters(el);
      });
    });
  }

  toggleFilters(el: HTMLElement): void {
    const holder = el.nextElementSibling as HTMLElement;

    if (el.classList.contains('active')) {
      holder.style.maxHeight = holder.scrollHeight + 'px';
    } else {
      holder.style.maxHeight = 0 + 'px';
    }
  }

  refreshFiltersHeight(): void {
    const filterHeaders =
      this.elementRef.nativeElement.querySelectorAll('.filter-header');

    filterHeaders.forEach((el: HTMLElement) => {
      const holder = el.nextElementSibling as HTMLElement;

      if (el.classList.contains('active')) {
        el.classList.remove('active');
        holder.style.maxHeight = 0 + 'px';
        setTimeout(() => {
          el.classList.add('active');
          holder.style.maxHeight = holder.scrollHeight + 'px';
        }, 20);
      }
    });
  }

  getProducts(): void {
    this.shopService.getProducts().subscribe((data: any) => {
      if (this.productsInit === null) {
        this.productsInit = data;
      }
      this.products = data;
    });

    this.shopService.getProductsInit().subscribe((data: any) => {
      console.log(`ProductsInit subscribed`, data);
      this.productsInit = data;
    });
  }

  getTags(): void {
    const tagCounts: { [key: string]: number } = {};

    for (const product of this.products) {
      for (const tag of product.tag_names) {
        if (tagCounts.hasOwnProperty(tag)) {
          tagCounts[tag]++;
        } else {
          tagCounts[tag] = 1;
        }
      }
    }

    this.tags = Object.keys(tagCounts).map((tagName) => ({
      tag_name: tagName,
      product_count: tagCounts[tagName],
    }));
  }

  getAllActiveBrands(): void {
    const brandCounts: { [key: string]: number } = {};

    for (const product of this.products) {
      const brandKey = `${product.id_brand}_${product.brand_name}`;

      if (!brandCounts.hasOwnProperty(brandKey)) {
        brandCounts[brandKey] = 1;
      } else {
        brandCounts[brandKey]++;
      }
    }

    this.brands = [];
    for (const product of this.products) {
      const brandKey = `${product.id_brand}_${product.brand_name}`;

      if (!this.brands.some((brand) => brand.id_brand === product.id_brand)) {
        this.brands.push({
          id_brand: product.id_brand,
          brand_name: product.brand_name,
          brand_count: brandCounts[brandKey],
        });
      }
    }
  }

  priceRangeInit(): void {
    for (const product of this.products) {
      // FIND BASE MIN PRICE
      if (
        product.discount_price !== null &&
        (this.baseMinPrice === null ||
          product.discount_price < this.baseMinPrice)
      ) {
        this.baseMinPrice = Math.floor(product.discount_price);
      } else if (
        product.product_price < this.baseMinPrice ||
        this.baseMinPrice === null
      ) {
        this.baseMinPrice = Math.floor(product.product_price);
      }

      // FIND BASE MAX PRICE
      if (
        product.discount_price !== null &&
        (this.baseMaxPrice === null ||
          product.discount_price > this.baseMaxPrice)
      ) {
        this.baseMaxPrice = Math.ceil(product.discount_price);
      } else if (
        product.product_price > this.baseMaxPrice ||
        this.baseMaxPrice === null
      ) {
        this.baseMaxPrice = Math.ceil(product.product_price);
      }
    }

    this.minPriceChanged = this.baseMinPrice;
    this.maxPriceChanged = this.baseMaxPrice;
  }

  getAllCategories(): void {
    this.subscriptions.push(
      this.shopService
        .getAllCategories()
        .subscribe((categories: Category[]) => {
          this.categories = categories;
        })
    );
  }

  onPriceRangeChange(event: any): void {
    const eventTarget = event.target;
    if (eventTarget.classList.contains('mat-slider__right-input')) {
      this.maxPriceChanged = +this.maxPriceInput.nativeElement.ariaValueText;
    } else {
      this.minPriceChanged = +this.minPriceInput.nativeElement.ariaValueText;
    }

    if (this.products.length !== 0) {
      this.products = this.checkTheProductPrice(this.productsInit);
    } else {
      this.products = this.checkTheProductPrice(this.productsInit);
    }

    this.shopService.setProducts(this.products);

    this.getTags();
    this.getAllActiveBrands();
  }

  checkTheProductPrice(productsArr: any[]): any {
    return productsArr.filter((product: any) => {
      if (
        product.discount_price &&
        product.discount_price >= this.minPriceChanged &&
        product.discount_price <= this.maxPriceChanged
      ) {
        return product;
      }
      if (
        !product.discount_price &&
        product.product_price >= this.minPriceChanged &&
        product.product_price <= this.maxPriceChanged
      ) {
        return product;
      }
    });
  }

  onFilterCategoriesChange(): void {
    this.selectedCategories = [];

    const categories = this.elementRef.nativeElement.querySelectorAll(
      '.tb-categories:checked'
    );

    categories.forEach((el: any) => {
      this.selectedCategories.push(+el.value);
    });
    if (this.selectedCategories.length === 0) return;
    this.productService
      .getCategoryProducts(this.selectedCategories, this.userId)
      .subscribe((products: any) => {
        let productsArr = products;

        productsArr = productsArr.map((product: any) => {
          return {
            ...product,
            tag_names:
              typeof product.tag_names === 'string'
                ? product.tag_names.split(',')
                : [],
          };
        });

        this.products = productsArr;

        this.shopService.setProducts(this.products);
        this.shopService.setProductsInit(this.products);

        this.priceRangeInit();
        this.getTags();
        this.getAllActiveBrands();
        this.refreshFiltersHeight();
      });
  }

  checkTheSelectedFilters(productsArr: any[]): any {
    // CHECKING CATEGORIES FILTERS

    // CHECKING BRAND FILTERS
    this.selectedBrands = [];

    const brands =
      this.elementRef.nativeElement.querySelectorAll('.tb-brands:checked');

    brands.forEach((el: any) => {
      this.selectedBrands.push(el.nextElementSibling.innerText);
    });

    productsArr = this.productsInit.filter((product: any) => {
      return this.selectedBrands.includes(product.brand_name);
    });

    // CHECKING TAG FILTERS
    this.selectedTags = [];

    const tags =
      this.elementRef.nativeElement.querySelectorAll('.tb-tags:checked');

    tags.forEach((el: any) => {
      this.selectedTags.push(el.nextElementSibling.innerText);
    });

    productsArr = productsArr.filter((product: any) => {
      return product.tag_names.some((el) => this.selectedTags.includes(el));
    });

    return productsArr;
  }

  onBrandsChange(): void {
    this.products = this.checkTheSelectedFilters(this.products);

    this.products = this.checkTheProductPrice(this.products);

    this.shopService.setProducts(this.products);
  }

  onTagsChange(): void {
    this.products = this.checkTheSelectedFilters(this.products);

    this.products = this.checkTheProductPrice(this.products);

    this.shopService.setProducts(this.products);
  }

  ngOnDestroy(): void {
    this.subscriptions.forEach((subscription: Subscription) =>
      subscription.unsubscribe()
    );
  }
}
