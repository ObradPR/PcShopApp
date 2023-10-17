import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

// INTERFACES
import { MessageModal } from '../interfaces/message-modal.interface';

@Injectable({
  providedIn: 'root',
})
export class MessageModalService {
  modalStatus: BehaviorSubject<boolean> = new BehaviorSubject(false);
  modalStyle: BehaviorSubject<string> = new BehaviorSubject(null);
  modalMessage: BehaviorSubject<string> = new BehaviorSubject('');

  getModalStatus(): Observable<boolean> {
    return this.modalStatus.asObservable();
  }

  setModalStatus(status: boolean) {
    this.modalStatus.next(status);

    // Auto closing if it's not clicked
    setTimeout(() => {
      this.modalStatus.next(false);
    }, 10000);
  }

  getModalStyle(): Observable<string> {
    return this.modalStyle.asObservable();
  }

  setModalStyle(style: string) {
    this.modalStyle.next(style);
  }

  getModalMessage(): Observable<string> {
    return this.modalMessage.asObservable();
  }

  setModalMessage(message: string) {
    this.modalMessage.next(message);
  }

  setModal(type: string, message: string) {
    this.setModalStatus(true);
    this.setModalStyle(type);
    this.setModalMessage(message);
  }
}
