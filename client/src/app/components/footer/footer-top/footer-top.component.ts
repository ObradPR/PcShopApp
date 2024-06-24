import { Component, ElementRef, OnInit, Renderer2 } from '@angular/core';

@Component({
  selector: 'app-footer-top',
  templateUrl: './footer-top.component.html',
  styleUrls: ['./footer-top.component.css'],
})
export class FooterTopComponent implements OnInit {
  constructor(private elementRef: ElementRef, private renderer: Renderer2) {}

  ngOnInit(): void {
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

        this.renderer.setStyle(btnHolder, 'background-color', '#ffffff');
      });

      btn.addEventListener('mouseleave', () => {
        const btnHolder = socialBtnsHolder[i];

        this.renderer.removeStyle(btnHolder, 'background-color');
      });
    });
  }
}
