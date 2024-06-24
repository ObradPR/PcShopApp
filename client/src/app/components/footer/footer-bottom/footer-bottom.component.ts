import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';

// INTERFACES
import { UserData } from 'src/app/common/interfaces/user-data.interface';
import { MessageModal } from 'src/app/common/interfaces/message-modal.interface';

// SERVICES
import { AuthService } from 'src/app/services/auth.service';
import { MessageModalService } from 'src/app/services/message-modal.service';

@Component({
  selector: 'app-footer-bottom',
  templateUrl: './footer-bottom.component.html',
  styleUrls: ['./footer-bottom.component.css'],
})
export class FooterBottomComponent implements OnInit, OnDestroy {
  isLogged: boolean = false;
  loginSubscription: Subscription = new Subscription();

  constructor(
    private authService: AuthService,
    private msgModalService: MessageModalService
  ) {}

  ngOnInit(): void {
    this.loginSubscription = this.authService
      .getUserData()
      .subscribe((userData: UserData | null) => {
        if (userData) this.isLogged = true;
        else this.isLogged = false;
      });
  }

  onOpenLoginModal(): void {
    this.authService.setLoginVisibility(true);
  }
  onOpenRegisterModal(): void {
    this.authService.setRegisterVisibility(true);
  }
  onLogout(): void {
    this.authService.logout();
    const modalMsg: MessageModal = {
      status: true,
      type: 'error',
      message:
        'We are sad to see you go 😟. If you had a bad experience you can share with us through contact form.',
    };

    this.setModal(modalMsg);
  }
  setModal(modal: MessageModal) {
    this.msgModalService.setModalStatus(modal.status);
    this.msgModalService.setModalStyle(modal.type);
    this.msgModalService.setModalMessage(modal.message);
  }

  ngOnDestroy(): void {
    this.loginSubscription.unsubscribe();
  }
}
