import {
  Component,
  ElementRef,
  OnDestroy,
  OnInit,
  Renderer2,
} from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Subscription, finalize } from 'rxjs';

// SERVICES
import { LoadingService } from '../services/loading.service';
import { InfoService } from '../services/info.service';
import { MessageModalService } from '../services/message-modal.service';

// INTERFACES
import { AppError } from '../interfaces/app-error.interface';

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.css'],
})
export class ContactComponent implements OnInit, OnDestroy {
  isLabelActive: { [key: string]: boolean } = {};
  contactForm: FormGroup;
  contactSubscription: Subscription = new Subscription();

  constructor(
    private loadingService: LoadingService,
    private elementRef: ElementRef,
    private renderer: Renderer2,
    private infoService: InfoService,
    private msgModalService: MessageModalService
  ) {}

  ngOnInit(): void {
    this.loadingService.setPageLoadingInit();
    this.formInit();
    this.socialBtnsHover();
  }

  socialBtnsHover(): void {
    const socialBtns =
      this.elementRef.nativeElement.querySelectorAll('.fa-brands');
    const socialBtnsHolder =
      this.elementRef.nativeElement.querySelectorAll('.media-holder');

    socialBtns.forEach((btn: HTMLElement, i: number) => {
      btn.addEventListener('mouseenter', () => {
        const btnHolder = socialBtnsHolder[i];

        this.renderer.setStyle(btnHolder, 'background-color', '#ff6c00');
      });

      btn.addEventListener('mouseleave', () => {
        const btnHolder = socialBtnsHolder[i];

        this.renderer.removeStyle(btnHolder, 'background-color');
      });
    });
  }

  onInputKeyup(inputId: string, inputValue: string): void {
    this.isLabelActive[inputId] = inputValue.trim() !== '';
  }

  formInit(): void {
    this.contactForm = new FormGroup({
      email: new FormControl(null, [
        Validators.required,
        Validators.email,
        Validators.maxLength(100),
      ]),
      title: new FormControl(null, [
        Validators.required,
        Validators.maxLength(100),
      ]),
      content: new FormControl(null, [
        Validators.required,
        Validators.maxLength(1000),
      ]),
    });
  }

  onSubmitForm(): void {
    // Loading spinner
    this.loadingService.setPageLoading(true);

    this.contactSubscription = this.infoService
      .sendContact(this.contactForm.value)
      .pipe(
        finalize(() => {
          this.loadingService.setPageLoading(false);
        })
      )
      .subscribe({
        next: (response: { message: string }) => {
          this.msgModalService.setModal('success', response.message);
          this.contactForm.reset();
        },
        error: (err: AppError) => {
          this.msgModalService.setModal('error', err.error.message);
        },
      });
  }

  ngOnDestroy(): void {
    this.contactSubscription.unsubscribe();
  }
}
