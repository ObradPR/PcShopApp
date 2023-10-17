import { Component, ElementRef, OnInit, Renderer2 } from '@angular/core';

@Component({
  selector: 'app-interactive-categories',
  templateUrl: './interactive-categories.component.html',
  styleUrls: ['./interactive-categories.component.css'],
})
export class InteractiveCategoriesComponent implements OnInit {
  constructor(private elementRef: ElementRef, private renderer: Renderer2) {}

  ngOnInit(): void {
    this.popoverEvents();
  }

  popoverEvents(): void {
    this.monitorPopover();
    this.speakerPopover();
    this.mousePopover();
    this.keyboardPopover();
    this.pcsPopover();
  }

  monitorPopover(): void {
    const monitorPopover =
      this.elementRef.nativeElement.querySelector('.monitor-popover');
    const monitorCircle =
      this.elementRef.nativeElement.querySelector('.monitor-circle');

    monitorCircle.addEventListener('mouseenter', () => {
      this.renderer.setStyle(monitorPopover, 'display', 'block');
    });
    monitorCircle.addEventListener('mouseleave', () => {
      this.renderer.setStyle(monitorPopover, 'display', 'none');
    });
  }
  speakerPopover(): void {
    const speakerPopover =
      this.elementRef.nativeElement.querySelector('.speaker-popover');
    const speakerCircle =
      this.elementRef.nativeElement.querySelector('.speaker-circle');

    speakerCircle.addEventListener('mouseenter', () => {
      this.renderer.setStyle(speakerPopover, 'display', 'block');
    });
    speakerCircle.addEventListener('mouseleave', () => {
      this.renderer.setStyle(speakerPopover, 'display', 'none');
    });
  }
  mousePopover(): void {
    const mousePopover =
      this.elementRef.nativeElement.querySelector('.mouse-popover');
    const mouseCircle =
      this.elementRef.nativeElement.querySelector('.mouse-circle');

    mouseCircle.addEventListener('mouseenter', () => {
      this.renderer.setStyle(mousePopover, 'display', 'block');
    });
    mouseCircle.addEventListener('mouseleave', () => {
      this.renderer.setStyle(mousePopover, 'display', 'none');
    });
  }
  keyboardPopover(): void {
    const keyboardPopover =
      this.elementRef.nativeElement.querySelector('.keyboard-popover');
    const keyboardCircle =
      this.elementRef.nativeElement.querySelector('.keyboard-circle');

    keyboardCircle.addEventListener('mouseenter', () => {
      this.renderer.setStyle(keyboardPopover, 'display', 'block');
    });
    keyboardCircle.addEventListener('mouseleave', () => {
      this.renderer.setStyle(keyboardPopover, 'display', 'none');
    });
  }
  pcsPopover(): void {
    const pcsPopover =
      this.elementRef.nativeElement.querySelector('.pcs-popover');
    const pcsCircle =
      this.elementRef.nativeElement.querySelector('.pcs-circle');

    pcsCircle.addEventListener('mouseenter', () => {
      this.renderer.setStyle(pcsPopover, 'display', 'block');
    });
    pcsCircle.addEventListener('mouseleave', () => {
      this.renderer.setStyle(pcsPopover, 'display', 'none');
    });
  }
}
