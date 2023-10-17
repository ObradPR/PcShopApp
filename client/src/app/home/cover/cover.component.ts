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
    const img = this.elementRef.nativeElement.querySelector('#cover-img');
    const btn = this.elementRef.nativeElement.querySelector('#cover-btn');
    const h1 = this.elementRef.nativeElement.querySelector('#cover-hero');
    const h2 = this.elementRef.nativeElement.querySelector('#cover-tag-line');

    img.classList.add('element-hidden-left');
    btn.classList.add('element-hidden-bottom');
    h1.classList.add('element-hidden-top');
    h2.classList.add('element-hidden-right');

    setTimeout(() => {
      img.classList.remove('element-hidden-left');
      btn.classList.remove('element-hidden-bottom');
      h1.classList.remove('element-hidden-top');
      h2.classList.remove('element-hidden-right');
    }, 500);
  }
}
