import { Component, ElementRef, OnInit, OnDestroy } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { Subscription } from 'rxjs';

// SERVICES
import { LoadingService } from '../services/loading.service';
import { AuthService } from '../services/auth.service';

// INTERFACES
import { UserData } from '../interfaces/user-data.interface';

// ANIMATIONS
import { scaleAnimation } from 'src/app/shared/animations';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css'],
  animations: [scaleAnimation],
})
export class UserComponent implements OnInit, OnDestroy {
  userData: UserData = null;
  editForm: FormGroup;
  subscriptions: Subscription[] = [];
  editModalVisible: boolean = false;

  constructor(
    private loadingService: LoadingService,
    private elementRef: ElementRef,
    private authService: AuthService
  ) {}

  ngOnInit(): void {
    this.pageLoaded();

    this.gearHoverAnimation();

    this.getUserInformation();
  }

  pageLoaded() {
    this.loadingService.setPageLoadingInit();

    this.loadingService.getPageLoading().subscribe((status: boolean) => {
      if (status) this.loadingService.setPageLoading(false);
    });
  }

  gearHoverAnimation() {
    const gear =
      this.elementRef.nativeElement.querySelector('i.fa-solid.fa-gear');

    gear.addEventListener('mouseenter', () => {
      gear.classList.add('fa-spin');
    });
    gear.addEventListener('mouseleave', () => {
      gear.classList.remove('fa-spin');
    });
  }

  getUserInformation() {
    this.subscriptions.push(
      this.authService.getUserData().subscribe((user: UserData) => {
        this.userData = user;
      })
    );
  }

  onEditUser() {
    this.editModalVisible = true;
  }

  onClosingModal() {
    this.editModalVisible = false;
  }

  //TODO:
  onEditSubmit() {}

  ngOnDestroy(): void {
    this.subscriptions.forEach((subscription: Subscription) =>
      subscription.unsubscribe()
    );
  }
}
