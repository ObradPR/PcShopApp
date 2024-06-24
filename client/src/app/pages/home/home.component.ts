import { Component, ElementRef, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';

// SERVICES
import { MessageModalService } from '../../services/message-modal.service';

// INTERFACES
import { MessageModal } from '../../common/interfaces/message-modal.interface';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
})
export class HomeComponent implements OnInit, OnDestroy {
  modalMessage: string;
  modalMessageVisible: boolean;
  modalMessageStatusSubscription: Subscription;

  constructor(
    private messageModalService: MessageModalService,
    private elementRef: ElementRef
  ) {}

  ngOnInit(): void {
    this.revealSections();
    // Message modal ne znam dal ce mi trebati u ovoj komponenti ali neka stoji za primer
    this.modalMessageStatusSubscription = this.messageModalService
      .getModalStatus()
      .subscribe((status: boolean) => {
        this.modalMessageVisible = status;
      });

    // ====================
  }
  // REVEAL SECTIONS
  revealSections(): void {
    const allSections =
      this.elementRef.nativeElement.querySelectorAll('.home-section');

    const revealSection = (entries, observer) => {
      const [entry] = entries;

      if (!entry.isIntersecting) return;

      entry.target.classList.remove('section-hidden');
      observer.unobserve(entry.target);
    };

    const sectionObserver = new IntersectionObserver(revealSection, {
      root: null,
      threshold: 0.25,
    });

    allSections.forEach((section: HTMLElement) => {
      sectionObserver.observe(section);
      section.classList.add('section-hidden');
    });
  }

  // ============================
  openModal(modal: MessageModal) {
    this.messageModalService.setModalStatus(modal.status);
    this.messageModalService.setModalStyle(modal.type);
    this.modalMessage = modal.message;
  }
  // ============================
  ngOnDestroy(): void {
    this.modalMessageStatusSubscription.unsubscribe();
  }
}
