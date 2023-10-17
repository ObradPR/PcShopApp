import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class LocalStorageService {
  private accessTokenName: string = 'access_token';

  setAccessToken(token: string) {
    localStorage.setItem(this.accessTokenName, token);
  }

  getAccessToken(): string {
    return localStorage.getItem(this.accessTokenName);
  }

  removeAccessToken(): void {
    localStorage.removeItem(this.accessTokenName);
  }
}
