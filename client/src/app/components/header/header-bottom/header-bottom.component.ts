import {
  Component,
  ElementRef,
  HostListener,
  OnDestroy,
  OnInit,
} from '@angular/core';
import { Subscription } from 'rxjs';
import { Router } from '@angular/router';

// SERVICES
import { AuthService } from 'src/app/services/auth.service';
import { MessageModalService } from 'src/app/services/message-modal.service';
import { WishlistService } from 'src/app/services/wishlist.service';
import { ProductService } from 'src/app/services/product.service';
import { CartService } from 'src/app/services/cart.service';
import { LocalStorageService } from 'src/app/services/local-storage.service';

// INTERFACES
import { UserData } from 'src/app/common/interfaces/user-data.interface';
import { WishlistItem } from 'src/app/common/interfaces/wishlist-item.interface';
import { SearchProduct } from 'src/app/common/interfaces/search-product.interface';
import { CartItem } from 'src/app/common/interfaces/cart-item.interface';
import { CartStats } from 'src/app/common/interfaces/cart-stats.interface';

@Component({
  selector: 'app-header-bottom',
  templateUrl: './header-bottom.component.html',
  styleUrls: ['./header-bottom.component.css'],
})
export class HeaderBottomComponent implements OnInit, OnDestroy {
  collapsedMenu: boolean = true;
  activeMenu: boolean = false;
  isLogged: boolean = false;
  userId: number = 0;
  subscriptions: Subscription[] = [];
  checkWishlist: boolean = false;
  wishlistItemsCount: number = 0;
  navMenu: HTMLElement;
  searchProductsText: string = '';
  searchProducts: SearchProduct[] = [];
  searchProductsBlock: HTMLElement;
  cartItemsCount: number = 0;

  constructor(
    private authService: AuthService,
    private msgModalService: MessageModalService,
    private router: Router,
    private wishlistService: WishlistService,
    private elementRef: ElementRef,
    private productService: ProductService,
    private cartService: CartService,
    private localStorageService: LocalStorageService
  ) {}

  @HostListener('window:resize', ['$event'])
  onWindowResize(event: Event) {
    const windowWidth = (event.target as Window).innerWidth;
    if (windowWidth > 949) {
      this.collapsedMenu = true;
    } else {
      this.collapsedMenu = false;
      this.navMenu.style.maxHeight = this.navMenu.scrollHeight + 'px';
    }
  }

  ngOnInit(): void {
    this.navMenu = this.elementRef.nativeElement.querySelector(
      '#nav-menu'
    ) as HTMLElement;
    this.searchProductsBlock = this.elementRef.nativeElement.querySelector(
      '#search-results'
    ) as HTMLElement;

    this.subscriptions.push(
      this.authService.getUserData().subscribe((userData: UserData | null) => {
        if (userData) {
          this.userId = userData.idUser;
          this.isLogged = true;
        } else this.isLogged = false;
      }),
      this.wishlistService
        .getWishlistItemsChangeStatus()
        .subscribe((status: boolean) => {
          if (this.userId !== 0) {
            this.wishlistService
              .getWishlistItems(this.userId)
              .subscribe((items: WishlistItem[]) => {
                if (items.length > 0) {
                  this.setWishlistHeartInfo(true, items.length);
                } else {
                  this.setWishlistHeartInfo(false, items.length);
                }
              });
          }
        }),
      this.cartService
        .getCartItemsChangeStatus()
        .subscribe((status: boolean) => {
          let cartId = this.localStorageService.getCartId();

          if (isNaN(cartId)) cartId = 0;

          this.cartService
            .getCartItems(this.userId, cartId)
            .subscribe(
              (data: { cartItems: CartItem[]; cartStats: CartStats }) => {
                if (data.cartItems.length > 0) {
                  this.setCartItemsInfo(data.cartItems.length);
                } else {
                  this.setCartItemsInfo(data.cartItems.length);
                }
              }
            );
        })
    );
  }

  setWishlistHeartInfo(status: boolean, count?: number): void {
    this.checkWishlist = status;
    this.wishlistItemsCount = count;
  }

  setCartItemsInfo(count: number): void {
    this.cartItemsCount = count;
  }

  onLogout(): void {
    this.router.navigate(['/']);
    this.authService.logout();
    this.msgModalService.setModal(
      'error',
      'We are sad to see you go 😟. If you had a bad experience you can share with us through contact form.'
    );
    this.setWishlistHeartInfo(false, 0);
    this.setCartItemsInfo(0);
  }

  onToggleNavigation() {
    this.collapsedMenu = !this.collapsedMenu;
    if (this.collapsedMenu) {
      this.navMenu.style.maxHeight = this.navMenu.scrollHeight + 'px';
    } else {
      this.navMenu.style.maxHeight = 0 + 'px';
    }
  }

  onOpenLoginModal() {
    this.authService.setLoginVisibility(true);
  }

  onOpenRegisterModal() {
    this.authService.setRegisterVisibility(true);
  }

  onSearchProducts() {
    if (this.searchProductsText === '') {
      this.searchProductsBlock.style.maxHeight = 0 + 'vh';

      setTimeout(() => {
        this.searchProducts = [];
      }, 200);

      return;
    }

    this.subscriptions.push(
      this.productService
        .getProductsBySearch(this.searchProductsText)
        .subscribe((data: SearchProduct[]) => {
          console.log(data);
          if (data.length === 0) {
            this.searchProductsBlock.style.maxHeight = 0 + 'vh';
          } else {
            this.searchProducts = data;
            this.searchProductsBlock.style.maxHeight = 80 + 'vh';
          }
        })
    );
  }

  ngOnDestroy(): void {
    this.subscriptions.forEach((subscription: Subscription) =>
      subscription.unsubscribe()
    );
  }
}
