import {
  Component,
  ElementRef,
  HostListener,
  OnDestroy,
  OnInit,
  Renderer2,
} from '@angular/core';
import { Subscription, finalize, take } from 'rxjs';

// SERVICES
import { ProductService } from 'src/app/services/product.service';
import { LoadingService } from 'src/app/services/loading.service';
import { ErrorHandlingService } from 'src/app/services/error-handling.service';
import { AuthService } from 'src/app/services/auth.service';
import { WishlistService } from 'src/app/services/wishlist.service';
import { MessageModalService } from 'src/app/services/message-modal.service';

// INTERFACES
import { FeaturedProduct } from 'src/app/interfaces/featured-product.interface';
import { UserData } from 'src/app/interfaces/user-data.interface';

@Component({
  selector: 'app-featured-products',
  templateUrl: './featured-products.component.html',
  styleUrls: ['./featured-products.component.css'],
})
export class FeaturedProductsComponent implements OnInit, OnDestroy {
  featuredProducts: FeaturedProduct[] = [];
  featuredErrorMessage: string = '';
  currSliderProducts: number;
  countSliderProducts: number;
  maxSliderProducts: number = 0;
  slidePositionX: any;
  translateX: number[] = [];
  subscriptions: Subscription[] = [];
  isLogged: boolean = false;
  userId: number = 0;

  breakpoints = [
    { max: 860, value: 140 },
    { max: 694, value: 116 },
    { max: 577, value: 119 },
    { max: 475, value: 122 },
  ];

  @HostListener('window:resize', ['$event'])
  onWindowResize(event: Event) {
    this.calculateTranslateX();
    const windowWidth = (event.target as Window).innerWidth;
    this.updateSliderProductsCount(windowWidth);
  }

  constructor(
    private renderer: Renderer2,
    private elementRef: ElementRef,
    private productService: ProductService,
    private loadingService: LoadingService,
    private errorHandlingService: ErrorHandlingService,
    private authService: AuthService,
    private wishlistService: WishlistService,
    private msgModalService: MessageModalService
  ) {}

  ngOnInit(): void {
    this.getUserStatus();
    this.getFeaturedProducts();

    setTimeout(() => {
      if (this.featuredProducts.length > 0) {
        this.calculateTranslateX();
        this.toCartIconHover();
        this.getSecondSlideXPosition();
        this.updateSliderProductsCount(window.innerWidth);
      }
    }, 1500);
  }

  // FETCHING DATA FROM BACKEND
  getFeaturedProducts(): void {
    this.subscriptions.push(
      this.productService
        .getFeaturedProducts(this.userId)
        .pipe(
          finalize(() => {
            // Turning loadingSpinner off
            this.loadingService.setPageLoading(false);
          })
        )
        .subscribe({
          next: (data: FeaturedProduct[]) => {
            this.featuredProducts = data;
            this.featuredProducts = this.featuredProducts.map(
              (product: FeaturedProduct) => {
                return {
                  ...product,
                  tag_names:
                    typeof product.tag_names === 'string'
                      ? product.tag_names.split(',')
                      : product.tag_names,
                };
              }
            );
            this.maxSliderProducts = this.featuredProducts.length;
          },
          error: (err) => {
            this.featuredErrorMessage = this.errorHandlingService.errorMessage(
              err.error.message,
              err.status
            );
            console.log(err);
          },
        })
    );
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

  // STYLES
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

  calculateTranslateX() {
    const windowWidth = window.innerWidth;
    for (let i = 0; i < this.featuredProducts.length; i++) {
      let percentage = 133;
      if (
        windowWidth <= this.breakpoints[0].max &&
        windowWidth > this.breakpoints[1].max
      ) {
        percentage = this.breakpoints[0].value;
      }
      if (
        windowWidth <= this.breakpoints[1].max &&
        windowWidth > this.breakpoints[2].max
      ) {
        percentage = this.breakpoints[1].value;
      }
      if (
        windowWidth <= this.breakpoints[2].max &&
        windowWidth > this.breakpoints[3].max
      ) {
        percentage = this.breakpoints[2].value;
      }
      if (windowWidth <= this.breakpoints[3].max) {
        percentage = this.breakpoints[3].value;
      }

      this.translateX[i] = i * percentage;
    }
  }

  getTranslateX(index: number): string {
    return `translateX(${this.translateX[index]}%)`;
  }

  // SLIDER FUNCTIONALITY
  updateSliderProductsCount(windowWidth: number) {
    if (windowWidth > 860) {
      this.currSliderProducts = this.countSliderProducts = 4;
    } else if (windowWidth <= 860 && windowWidth > 577) {
      this.currSliderProducts = this.countSliderProducts = 3;
    } else if (windowWidth <= 577) {
      this.currSliderProducts = this.countSliderProducts = 2;
    }
  }

  getAllSlides() {
    const slides =
      this.elementRef.nativeElement.querySelectorAll('.product--block');
    return slides;
  }

  getSecondSlideXPosition() {
    const slides = this.getAllSlides();
    const slide2 = slides[1];
    const computedStyles = window.getComputedStyle(slide2);
    const transformValue = computedStyles.getPropertyValue('transform');

    const matrixMatch = transformValue.match(/matrix.*\((.+)\)/);
    if (matrixMatch) {
      const matrix = matrixMatch[1].split(', ');

      // Extract the X translation components
      this.slidePositionX = parseFloat(matrix[4]);
    }
  }

  moveSlider(slides: [], direction: string) {
    slides.forEach((slide: HTMLElement, i: number) => {
      let oldTransform: string | string[] = slide.style.transform;
      oldTransform = oldTransform.split('').splice(11).slice(0, -2).join('');

      if (direction === 'right') {
        slide.style.transform = `translateX(${
          +oldTransform - this.translateX[1]
        }%)`;
      } else if (direction === 'left') {
        slide.style.transform = `translateX(${
          +oldTransform + this.translateX[1]
        }%)`;
      }
    });
  }

  onSlideLeft(): void {
    // console.log(this.currSliderProducts, this.countSliderProducts);
    if (this.currSliderProducts === this.countSliderProducts) {
      return;
    } else {
      const slides = this.getAllSlides();
      this.moveSlider(slides, 'left');
      this.currSliderProducts--;
    }
  }

  onSlideRight(): void {
    // console.log(this.currSliderProducts, this.countSliderProducts);
    if (this.currSliderProducts >= this.maxSliderProducts) {
      return;
    }
    if (this.currSliderProducts < this.maxSliderProducts) {
      const slides = this.getAllSlides();
      this.moveSlider(slides, 'right');
      this.currSliderProducts++;
    }
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
                  .getFeaturedProducts(this.userId)
                  .subscribe((products: FeaturedProduct[]) => {
                    this.featuredProducts = products;
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
                  .getFeaturedProducts(this.userId)
                  .subscribe((products: FeaturedProduct[]) => {
                    this.featuredProducts = products;
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
