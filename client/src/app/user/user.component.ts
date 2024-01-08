import { Component, ElementRef, OnInit, OnDestroy } from '@angular/core';
import {
  AbstractControl,
  FormControl,
  FormGroup,
  Validators,
} from '@angular/forms';
import { Subscription } from 'rxjs';

// SERVICES
import { LoadingService } from '../services/loading.service';
import { AuthService } from '../services/auth.service';
import { MessageModalService } from '../services/message-modal.service';
import { UserService } from '../services/user.service';
import { LocalStorageService } from '../services/local-storage.service';

// INTERFACES
import { UserData } from '../interfaces/user-data.interface';

// ANIMATIONS
import { scaleAnimation } from 'src/app/shared/animations';
import { AppError } from '../interfaces/app-error.interface';

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
  userMessages: any = [];

  constructor(
    private loadingService: LoadingService,
    private elementRef: ElementRef,
    private authService: AuthService,
    private msgModalService: MessageModalService,
    private userService: UserService,
    private localStorageService: LocalStorageService
  ) {}

  ngOnInit(): void {
    this.pageLoaded();

    this.gearHoverAnimation();

    this.getUserInformation();

    this.formInit();

    this.getUserMessages();
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

  formInit() {
    this.editForm = new FormGroup({
      firstName: new FormControl(this.userData.firstName, [
        Validators.required,
        Validators.pattern(this.authService.getNameRegex()),
      ]),
      lastName: new FormControl(this.userData.lastName, [
        Validators.required,
        Validators.pattern(this.authService.getNameRegex()),
      ]),
      phone: new FormControl(this.userData.phone, [
        Validators.pattern(this.authService.getPhoneRegex()),
      ]),
      email: new FormControl(this.userData.email, [
        Validators.required,
        Validators.email,
      ]),
      newPassword: new FormControl(null, [
        Validators.pattern(this.authService.getPasswordRegex()),
      ]),
      newPasswordRetype: new FormControl(null, [
        (control) => this.retypePasswordCheck(control, 'newPassword'),
      ]),
      oldPassword: new FormControl(null, [
        Validators.pattern(this.authService.getPasswordRegex()),
      ]),
      oldPasswordRetype: new FormControl(null, [
        (control) => this.retypePasswordCheck(control, 'oldPassword'),
      ]),
      newsletter: new FormControl(this.userData.newsletter),
    });
  }

  retypePasswordCheck(
    control: AbstractControl,
    compareTo: string
  ): null | { [key: string]: boolean } {
    const passControl = control.root.get(compareTo);
    const passValue = passControl ? passControl.value : null;
    const retypePassValue = control.value;

    if (retypePassValue === passValue) {
      return null;
    } else {
      return { notSamePasswrod: true };
    }
  }

  onEditUser() {
    this.editModalVisible = true;
  }

  onClosingModal() {
    this.editModalVisible = false;
  }

  onEditSubmit() {
    const editFormValues = this.editForm.value;

    if (
      editFormValues.firstName === this.userData.firstName &&
      editFormValues.lastName === this.userData.lastName &&
      editFormValues.email === this.userData.email &&
      editFormValues.phone === this.userData.phone &&
      editFormValues.newsletter === this.userData.newsletter &&
      (editFormValues.newPassword === '' ||
        editFormValues.newPassword === null ||
        editFormValues.newPasswordRetype !== editFormValues.newPassword ||
        editFormValues.oldPassword === '' ||
        editFormValues.oldPassword === null ||
        editFormValues.oldPasswordRetype !== editFormValues.oldPassword ||
        editFormValues.oldPassword === editFormValues.newPassword)
    ) {
      this.msgModalService.setModal(
        'error',
        "You haven't changed anything, try again!"
      );
    } else {
      editFormValues.id_user = this.userData.idUser;

      this.subscriptions.push(
        this.userService.editUser(editFormValues).subscribe({
          next: (data: { message: string; token: string }) => {
            this.localStorageService.removeAccessToken();
            this.localStorageService.setAccessToken(data.token);
            this.authService.setUserFromLocalStorage();

            this.msgModalService.setModal('success', data.message);

            this.onClosingModal();
          },
          error: (err: AppError) => {
            this.msgModalService.setModal('error', err.error.message);
          },
        })
      );
    }
  }

  getUserMessages() {
    if (!this.userData) return;

    this.subscriptions.push(
      this.userService.getUserMessages(this.userData.idUser).subscribe({
        next: (response: any) => {
          this.userMessages = response.userMessages;
          console.log(this.userMessages);

          this.userMessagesExpandFun();
        },
      })
    );
  }

  userMessagesExpandFun() {
    setTimeout(() => {
      const messagesTitle =
        this.elementRef.nativeElement.querySelectorAll(`.user-message-row`);
      const messagesContent =
        this.elementRef.nativeElement.querySelectorAll(`.message-content`);

      messagesTitle.forEach((el: HTMLElement, i: number) => {
        el.addEventListener('click', () => {
          messagesContent[i].classList.toggle('toggle');
          el.classList.toggle('active');
        });
      });
    }, 500);
  }

  onReadMessage(messageId: number) {
    this.subscriptions.push(
      this.userService.readMessage(messageId).subscribe({
        next: (response) => {
          // console.log(response.message);
          this.getUserMessages();
        },
        error: (err: AppError) => {
          this.msgModalService.setModal('error', err.error.message);
        },
      })
    );
  }

  ngOnDestroy(): void {
    this.subscriptions.forEach((subscription: Subscription) =>
      subscription.unsubscribe()
    );
  }
}
