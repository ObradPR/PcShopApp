import { Component, HostListener } from '@angular/core';

@Component({
  selector: 'app-scroll-to-top',
  templateUrl: './scroll-to-top.component.html',
  styleUrls: ['./scroll-to-top.component.css'],
})
export class ScrollToTopComponent {
  showButton: boolean = false;

  constructor() {}

  @HostListener('window:scroll', [])
  onWindowScroll() {
    this.showButton = window.scrollY > 400;
  }

  onScrollToTop() {
    window.scrollTo({
      top: 0,
      behavior: 'smooth',
    });
  }
}
