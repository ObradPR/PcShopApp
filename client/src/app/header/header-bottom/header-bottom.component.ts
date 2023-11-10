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

// INTERFACES
import { UserData } from 'src/app/interfaces/user-data.interface';
import { WishlistItem } from 'src/app/interfaces/wishlist-item.interface';

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

  constructor(
    private authService: AuthService,
    private msgModalService: MessageModalService,
    private router: Router,
    private wishlistService: WishlistService,
    private elementRef: ElementRef
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
        })
    );
  }

  setWishlistHeartInfo(status: boolean, count?: number): void {
    this.checkWishlist = status;
    this.wishlistItemsCount = count;
  }

  onLogout(): void {
    this.router.navigate(['/']);
    this.authService.logout();
    this.msgModalService.setModal(
      'error',
      'We are sad to see you go 😟. If you had a bad experience you can share with us through contact form.'
    );
    this.setWishlistHeartInfo(false, 0);
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

  ngOnDestroy(): void {
    this.subscriptions.forEach((subscription: Subscription) =>
      subscription.unsubscribe()
    );
  }
}
