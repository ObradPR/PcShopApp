import { Component, OnInit, OnDestroy } from '@angular/core';
import { Subscription } from 'rxjs';

// SERVICES
import { MessageModalService } from 'src/app/services/message-modal.service';

// ANIMATIONS
import { scaleAnimation } from '../animations';

@Component({
  selector: 'app-message-modal',
  templateUrl: './message-modal.component.html',
  styleUrls: ['./message-modal.component.css'],
  animations: [scaleAnimation],
})
export class MessageModalComponent implements OnInit, OnDestroy {
  message: string;
  modalStyle: string = 'success';
  subscriptions: Subscription[] = [];

  constructor(private messageModalService: MessageModalService) {}

  ngOnInit(): void {
    this.subscriptions.push(
      this.messageModalService.getModalStyle().subscribe((style: string) => {
        this.modalStyle = style;
      }),
      this.messageModalService
        .getModalMessage()
        .subscribe((message: string) => {
          this.message = message;
        })
    );
  }

  onModalClose() {
    this.messageModalService.setModalStatus(false);
  }

  ngOnDestroy(): void {
    this.subscriptions.forEach((subscription: Subscription) =>
      subscription.unsubscribe()
    );
  }
}
