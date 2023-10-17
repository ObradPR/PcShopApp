import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class LoadingService {
  private isPageLoading: BehaviorSubject<boolean> =
    new BehaviorSubject<boolean>(true);

  getPageLoading(): Observable<boolean> {
    return this.isPageLoading.asObservable();
  }

  setPageLoading(status: boolean) {
    this.isPageLoading.next(status);
  }

  setPageLoadingInit() {
    window.addEventListener('load', () => {
      this.setPageLoading(false);
    });
  }
}
