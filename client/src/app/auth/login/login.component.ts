import { Component, OnDestroy, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { Subscription, finalize, take } from 'rxjs';

// SERVICES
import { AuthService } from 'src/app/services/auth.service';
import { LoadingService } from 'src/app/services/loading.service';
import { MessageModalService } from 'src/app/services/message-modal.service';
import { LocalStorageService } from 'src/app/services/local-storage.service';
import { WishlistService } from 'src/app/services/wishlist.service';

// INTERFACES
import { AppError } from 'src/app/interfaces/app-error.interface';

// ANIMATIONS
import { scaleAnimation } from 'src/app/shared/animations';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
  animations: [scaleAnimation],
})
export class LoginComponent implements OnInit, OnDestroy {
  isLabelActive: { [key: string]: boolean } = {};
  loginForm: FormGroup;
  loginSubscription: Subscription = new Subscription();

  constructor(
    private authService: AuthService,
    private loadingService: LoadingService,
    private msgModalService: MessageModalService,
    private localStorageService: LocalStorageService,
    private wishlistService: WishlistService
  ) {}

  ngOnInit(): void {
    this.formInit();
  }

  onClosingModal(): void {
    this.authService.setLoginVisibility(false);
  }

  formInit(): void {
    this.loginForm = new FormGroup({
      email: new FormControl(null, [Validators.required, Validators.email]),
      password: new FormControl(null, Validators.required),
    });
  }

  onLoginSubmit(): void {
    // Loading spinner
    this.loadingService.setPageLoading(true);

    this.loginSubscription = this.authService
      .loginUser(this.loginForm.value)
      .pipe(
        finalize(() => {
          this.wishlistService
            .getWishlistItemsChangeStatus()
            .pipe(take(1))
            .subscribe((status: boolean) => {
              this.wishlistService.setWishlistItemsChangeStatus(!status);
            });

          this.loadingService.setPageLoading(false);
        })
      )
      .subscribe({
        next: (data: { message: string; token: string }) => {
          // console.log(data);

          this.localStorageService.setAccessToken(data.token);
          this.authService.setUserFromLocalStorage();

          this.msgModalService.setModal('success', data.message);
          this.loginForm.reset();
          this.onClosingModal();
        },
        error: (err: AppError) => {
          this.msgModalService.setModal('error', err.error.message);
        },
      });
  }

  onInputKeyup(inputId: string, inputValue: string): void {
    this.isLabelActive[inputId] = inputValue.trim() !== '';
  }

  onSwitchToRegModal(): void {
    this.authService.onToggleAuthModals();
  }

  ngOnDestroy(): void {
    this.loginSubscription.unsubscribe();
  }
}
