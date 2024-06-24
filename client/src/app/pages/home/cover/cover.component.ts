import { Component, ElementRef, OnInit } from '@angular/core';

@Component({
  selector: 'app-cover',
  templateUrl: './cover.component.html',
  styleUrls: ['./cover.component.css'],
})
export class CoverComponent implements OnInit {
  constructor(private elementRef: ElementRef) {}

  ngOnInit(): void {
    this.revealElements();
  }

  revealElements(): void {
    this.hideElements();

    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          switch (entry.target.localName) {
            case 'div':
              entry.target.classList.remove('element-hidden-left');
              break;
            case 'a':
              entry.target.classList.remove('element-hidden-right');
              break;
            case 'h1':
              entry.target.classList.remove('element-hidden-right');
              break;
            case 'h2':
              entry.target.classList.remove('element-hidden-right');
              break;
          }

          observer.unobserve(entry.target);
        }
      });
    });

    const hiddenEls =
      this.elementRef.nativeElement.querySelectorAll('.hidden-el');

    hiddenEls.forEach((el: HTMLElement) => observer.observe(el));
  }

  hideElements() {
    const img = this.elementRef.nativeElement.querySelector('#cover-img');
    const btn = this.elementRef.nativeElement.querySelector('#cover-btn');
    const h1 = this.elementRef.nativeElement.querySelector('#cover-hero');
    const h2 = this.elementRef.nativeElement.querySelector('#cover-tag-line');

    img.classList.add('element-hidden-left');
    btn.classList.add('element-hidden-right');
    h1.classList.add('element-hidden-right');
    h2.classList.add('element-hidden-right');
  }
}
