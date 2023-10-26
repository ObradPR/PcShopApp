import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Subscription, finalize } from 'rxjs';

// SERVICE
import { LoadingService } from 'src/app/services/loading.service';
import { AuthService } from 'src/app/services/auth.service';
import { InfoService } from 'src/app/services/info.service';
import { MessageModalService } from 'src/app/services/message-modal.service';

// INTERFACES
import { AppError } from 'src/app/interfaces/app-error.interface';

@Component({
  selector: 'app-we-rent',
  templateUrl: './we-rent.component.html',
  styleUrls: ['./we-rent.component.css'],
})
export class WeRentComponent implements OnInit {
  @ViewChild('pictures') pictures: ElementRef;
  isLabelActive: { [key: string]: boolean } = {};
  offerForm: FormGroup;
  files: File[] = [];
  offerSubscription: Subscription = new Subscription();

  constructor(
    private loadingService: LoadingService,
    private authService: AuthService,
    private infoService: InfoService,
    private msgModalService: MessageModalService
  ) {}

  ngOnInit(): void {
    this.loadingService.setPageLoadingInit();

    this.formInit();
  }

  formInit(): void {
    this.offerForm = new FormGroup({
      clientName: new FormControl(null, [
        Validators.required,
        Validators.pattern(this.authService.getNameRegex()),
      ]),
      contactOfferEmail: new FormControl(null, [
        Validators.required,
        Validators.email,
      ]),
      contactOfferPhone: new FormControl(null, [
        Validators.required,
        Validators.pattern(this.authService.getPhoneRegex()),
      ]),
      premisesAddress: new FormControl(null, Validators.required),
      squareFootage: new FormControl(null, [
        Validators.required,
        Validators.pattern(this.authService.getSquareFootageRegex()),
      ]),
      financialOffer: new FormControl(null, [
        Validators.required,
        Validators.pattern(this.authService.getPositiveNumberRegex()),
      ]),
      pictures: new FormControl([], Validators.required),
      offerDetails: new FormControl(null, Validators.required),
    });
  }

  onUploadImage() {
    if (this.pictures.nativeElement.files.length === 2) {
      for (let picture of this.pictures.nativeElement.files) {
        this.files.push(picture);
      }
    }
  }

  onOfferFormSubmit(): void {
    const formData = new FormData();
    formData.append('clientName', this.offerForm.get('clientName').value);
    formData.append(
      'contactOfferEmail',
      this.offerForm.get('contactOfferEmail').value
    );
    formData.append(
      'contactOfferPhone',
      this.offerForm.get('contactOfferPhone').value
    );
    formData.append(
      'premisesAddress',
      this.offerForm.get('premisesAddress').value
    );
    formData.append('squareFootage', this.offerForm.get('squareFootage').value);
    formData.append(
      'financialOffer',
      this.offerForm.get('financialOffer').value
    );
    formData.append('offerDetails', this.offerForm.get('offerDetails').value);
    for (let file of this.files) {
      formData.append('files', file, file.name);
    }
    // Loading spinner
    this.loadingService.setPageLoading(true);

    this.offerSubscription = this.infoService
      .sendRentOffer(formData)
      .pipe(
        finalize(() => {
          this.loadingService.setPageLoading(false);
        })
      )
      .subscribe({
        next: (response: { message: string }) => {
          this.msgModalService.setModal('success', response.message);
          this.offerForm.reset();
        },
        error: (err: AppError) => {
          this.msgModalService.setModal('error', err.error.message);
        },
      });
  }

  onInputKeyup(inputId: string, inputValue: string): void {
    this.isLabelActive[inputId] = inputValue.trim() !== '';
  }
}
