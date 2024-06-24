import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';

// SERVICES
import { AuthService } from './services/auth.service';
import { LoadingService } from './services/loading.service';
import { MessageModalService } from './services/message-modal.service';

// INTERFACES
import { UserData } from './common/interfaces/user-data.interface';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent implements OnInit, OnDestroy {
  loadingPage: boolean;
  isVisibleRegister: boolean;
  isVisibleLogin: boolean;
  msgModalVisible: boolean;
  modalMessage: string;
  subscribtions: Subscription[] = [];

  constructor(
    private authService: AuthService,
    private loadingService: LoadingService,
    private msgModalService: MessageModalService
  ) {}

  ngOnInit(): void {
    this.subscribtions.push(
      this.loadingService.getPageLoading().subscribe((status: boolean) => {
        this.loadingPage = status;
      }),
      this.authService.getRegisterVisibility().subscribe((status: boolean) => {
        this.isVisibleRegister = status;
      }),
      this.authService.getLoginVisibility().subscribe((status: boolean) => {
        this.isVisibleLogin = status;
      }),
      this.msgModalService.getModalStatus().subscribe((status: boolean) => {
        this.msgModalVisible = status;
      }),
      this.authService.getUserData().subscribe((data: UserData | null) => {
        if (data !== null) {
          this.msgModalService.setModal(
            'success',
            `Welcome back ${data.firstName} ${data.lastName}!!!`
          );
        }
      })
    );

    if (this.authService.isLoggedIn()) {
      this.authService.setUserFromLocalStorage();
    }
  }

  ngOnDestroy(): void {
    this.subscribtions.forEach((subscription: Subscription) =>
      subscription.unsubscribe()
    );
  }
}
