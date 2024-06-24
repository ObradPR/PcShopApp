import { Component, OnDestroy, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { Subscription, finalize } from 'rxjs';

// SERVICES
import { AuthService } from 'src/app/services/auth.service';
import { MessageModalService } from 'src/app/services/message-modal.service';
import { LoadingService } from 'src/app/services/loading.service';

// INTERFACES
import { UserData } from 'src/app/common/interfaces/user-data.interface';
import { AppError } from 'src/app/common/interfaces/app-error.interface';

// ANIMATIONS
import { scaleAnimation } from 'src/app/shared/animations';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css'],
  animations: [scaleAnimation],
})
export class RegisterComponent implements OnInit, OnDestroy {
  isLabelActive: { [key: string]: boolean } = {};
  regForm: FormGroup;
  registerSubscription: Subscription = new Subscription();

  constructor(
    private authService: AuthService,
    private msgModalService: MessageModalService,
    private loadingService: LoadingService
  ) {}

  ngOnInit(): void {
    this.formInit();
  }

  onInputKeyup(inputId: string, inputValue: string): void {
    this.isLabelActive[inputId] = inputValue.trim() !== '';
  }

  onClosingModal(): void {
    this.authService.setRegisterVisibility(false);
  }

  formInit(): void {
    this.regForm = new FormGroup({
      firstName: new FormControl(null, [
        Validators.required,
        Validators.pattern(this.authService.getNameRegex()),
      ]),
      lastName: new FormControl(null, [
        Validators.required,
        Validators.pattern(this.authService.getNameRegex()),
      ]),
      phone: new FormControl(null, [
        Validators.pattern(this.authService.getPhoneRegex()),
      ]),
      email: new FormControl(null, [Validators.required, Validators.email]),
      password: new FormControl(null, [
        Validators.required,
        Validators.pattern(this.authService.getPasswordRegex()),
      ]),
      retypePassword: new FormControl(null, [
        Validators.required,
        this.retypePasswordCheck.bind(this),
      ]),
      newsletter: new FormControl(false),
    });
  }

  onRegSubmit(): void {
    // Loading spinner
    this.loadingService.setPageLoading(true);

    this.registerSubscription = this.authService
      .registerUser(this.regForm.value)
      .pipe(
        finalize(() => {
          this.loadingService.setPageLoading(false);
        })
      )
      .subscribe({
        next: (data: { message: string; user: UserData }) => {
          console.log(data);
          this.msgModalService.setModal('success', data.message);
          this.regForm.reset();
          this.authService.onToggleAuthModals();
        },
        error: (err: AppError) => {
          this.msgModalService.setModal('error', err.error.message);
        },
      });
  }

  retypePasswordCheck(control: FormControl): null | { [key: string]: boolean } {
    const passControl = control.root.get('password');
    const passValue = passControl ? passControl.value : null;
    const retypePassValue = control.value;
    if (retypePassValue === passValue) {
      return null;
    } else {
      return { notSamePasswrod: true };
    }
  }

  onSwitchToLoginModal(): void {
    this.authService.onToggleAuthModals();
  }

  ngOnDestroy(): void {
    this.registerSubscription.unsubscribe();
  }
}
