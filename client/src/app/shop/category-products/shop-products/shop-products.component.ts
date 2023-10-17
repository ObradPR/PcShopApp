import {
  AfterViewInit,
  Component,
  ElementRef,
  Input,
  OnDestroy,
  OnInit,
  Renderer2,
} from '@angular/core';
import { Subscription, finalize, take } from 'rxjs';

// INTERFACES
import { UserData } from 'src/app/interfaces/user-data.interface';

// SERVICES
import { AuthService } from 'src/app/services/auth.service';
import { LoadingService } from 'src/app/services/loading.service';
import { MessageModalService } from 'src/app/services/message-modal.service';
import { ProductService } from 'src/app/services/product.service';
import { ShopService } from 'src/app/services/shop.service';
import { WishlistService } from 'src/app/services/wishlist.service';

@Component({
  selector: 'app-shop-products',
  templateUrl: './shop-products.component.html',
  styleUrls: ['./shop-products.component.css'],
})
export class ShopProductsComponent implements OnInit, AfterViewInit, OnDestroy {
  @Input() products: any = [];
  isLogged: boolean = false;
  userId: number = 0;
  subscriptions: Subscription[] = [];
  categoryId: number = 0;

  constructor(
    private renderer: Renderer2,
    private elementRef: ElementRef,
    private authService: AuthService,
    private loadingService: LoadingService,
    private wishlistService: WishlistService,
    private msgModalService: MessageModalService,
    private productService: ProductService,
    private shopService: ShopService
  ) {}

  ngOnInit(): void {
    this.shopService.getProducts().subscribe((data: any) => {
      this.products = data;
      if (this.products.length === 0) {
        this.categoryId = 0;
      } else {
        this.categoryId = this.products[0].id_category;
      }
    });
    this.getUserStatus();
  }

  ngAfterViewInit(): void {
    this.toCartIconHover();
  }

  getUserStatus(): void {
    this.subscriptions.push(
      this.authService.getUserData().subscribe((user: UserData | null) => {
        if (user !== null) {
          this.isLogged = true;
          this.userId = user.idUser;
        } else {
          this.isLogged = false;
        }
      })
    );
  }

  toCartIconHover(): void {
    const cartIcons = this.elementRef.nativeElement.querySelectorAll(
      '.fa-solid.fa-cart-shopping'
    );

    const toCartTriangles =
      this.elementRef.nativeElement.querySelectorAll('.to-cart-triangle');

    cartIcons.forEach((icon: HTMLElement, i: number) => {
      const toCartTriangle = toCartTriangles[i];
      icon.addEventListener('mouseenter', () => {
        this.renderer.setStyle(
          toCartTriangle,
          'border-top-color',
          'transparent'
        );
        this.renderer.setStyle(
          toCartTriangle,
          'border-right-color',
          'transparent'
        );
        this.renderer.setStyle(
          toCartTriangle,
          'border-bottom-color',
          '#fa812b'
        );
        this.renderer.setStyle(
          toCartTriangle,
          'border-left-color',
          'transparent'
        );
      });

      icon.addEventListener('mouseleave', () => {
        this.renderer.removeStyle(toCartTriangle, 'border-top-color');
        this.renderer.removeStyle(toCartTriangle, 'border-right-color');
        this.renderer.removeStyle(toCartTriangle, 'border-bottom-color');
        this.renderer.removeStyle(toCartTriangle, 'border-left-color');
      });
    });
  }

  addProductToWishlist(productId: number, inWishlist: boolean): void {
    if (!this.isLogged) {
      this.authService.setLoginVisibility(true);
    } else {
      this.loadingService.setPageLoading(true);
      if (!inWishlist) {
        const obj = { productId, userId: this.userId };

        this.subscriptions.push(
          this.wishlistService
            .addToWishlist(obj)
            .pipe(
              finalize(() => {
                this.loadingService.setPageLoading(false);
              })
            )
            .subscribe({
              next: (response: { message: string }) => {
                this.productService
                  .getCategoryProducts(this.categoryId, this.userId)
                  .subscribe((products: any) => {
                    this.products = products;
                  });

                this.msgModalService.setModal('success', response.message);

                this.wishlistService
                  .getWishlistItemsChangeStatus()
                  .pipe(take(1))
                  .subscribe((status: boolean) => {
                    this.wishlistService.setWishlistItemsChangeStatus(!status);
                  });
              },
              error: (err: any) => {
                console.log(err);
                this.msgModalService.setModal('error', err.error.message);
              },
            })
        );
      } else {
        this.subscriptions.push(
          this.wishlistService
            .removeItem(productId, this.userId)
            .pipe(
              finalize(() => {
                this.loadingService.setPageLoading(false);
              })
            )
            .subscribe({
              next: (response: { message: string }) => {
                this.productService
                  .getCategoryProducts(this.categoryId, this.userId)
                  .subscribe((products: any) => {
                    this.products = products;
                  });

                this.msgModalService.setModal('success', response.message);

                this.wishlistService
                  .getWishlistItemsChangeStatus()
                  .pipe(take(1))
                  .subscribe((status: boolean) => {
                    this.wishlistService.setWishlistItemsChangeStatus(!status);
                  });
              },
              error: (err: any) => {
                console.log(err);
                this.msgModalService.setModal('error', err.error.message);
              },
            })
        );
      }
    }
  }

  ngOnDestroy(): void {
    this.subscriptions.forEach((subscription: Subscription) =>
      subscription.unsubscribe()
    );
  }
}
