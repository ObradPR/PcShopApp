import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable, take } from 'rxjs';
import { JwtHelperService } from '@auth0/angular-jwt';

// SERVICES
import { DataService } from './data.service';
import { LocalStorageService } from './local-storage.service';

// INTERFACES
import { UserData } from '../common/interfaces/user-data.interface';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  constructor(
    private dataService: DataService,
    private localStorageService: LocalStorageService,
    private jwtHelper: JwtHelperService
  ) {}
  // ============================================
  // LOGIN & REGISTER MODALS
  // REGEX
  private nameRegex =
    /^[A-ZČĆŽĐŠ][a-zA-ZČĆŽĐŠčćžđš]*('[a-zA-ZČĆŽĐŠčćžđš]*)?(\s[a-zA-ZČĆŽĐŠčćžđš]*)?$/;
  private phoneRegex = /^[0-9]{3}-[0-9]{3}-[0-9]{4}$/;
  private passwordRegex =
    /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()\-_=+{};:,<.>]).{8,}$/;
  private positiveNumberRegex = /^\d{2,}$/;
  private squareFootageRegex = /^(7[0-9]|1\d{2}|200)$/;

  getNameRegex(): RegExp {
    return this.nameRegex;
  }
  getPhoneRegex(): RegExp {
    return this.phoneRegex;
  }
  getPasswordRegex(): RegExp {
    return this.passwordRegex;
  }
  getPositiveNumberRegex(): RegExp {
    return this.positiveNumberRegex;
  }
  getSquareFootageRegex(): RegExp {
    return this.squareFootageRegex;
  }

  // LOGIC
  private isVisibleRegister: BehaviorSubject<boolean> =
    new BehaviorSubject<boolean>(false);
  private isVisibleLogin: BehaviorSubject<boolean> =
    new BehaviorSubject<boolean>(false);

  getRegisterVisibility(): Observable<boolean> {
    return this.isVisibleRegister.asObservable();
  }
  setRegisterVisibility(status: boolean) {
    this.isVisibleRegister.next(status);
  }
  getLoginVisibility(): Observable<boolean> {
    return this.isVisibleLogin.asObservable();
  }
  setLoginVisibility(status: boolean) {
    this.isVisibleLogin.next(status);
  }

  onToggleAuthModals(): void {
    this.getLoginVisibility()
      .pipe(take(1))
      .subscribe((status: boolean) => {
        this.setLoginVisibility(!status);
        this.setRegisterVisibility(status);
      });
  }

  // ============================================
  // LOGIC & REGISTER
  private userData: BehaviorSubject<UserData> = new BehaviorSubject<UserData>(
    null
  );

  registerUser(
    user: UserData
  ): Observable<{ message: string; user: UserData }> {
    return this.dataService.post('user/register', user);
  }

  loginUser(user: UserData): Observable<{ message: string; token: string }> {
    return this.dataService.post('user/login', user);
  }

  isLoggedIn(): boolean {
    const token = this.localStorageService.getAccessToken();

    return token && !this.jwtHelper.isTokenExpired(token);
  }

  setUserFromLocalStorage(): void | null {
    const token = this.localStorageService.getAccessToken();

    if (token) {
      const decodedToken = this.jwtHelper.decodeToken(token);
      this.userData.next(decodedToken);
    }

    return null;
  }

  getUserData(): Observable<UserData> {
    return this.userData.asObservable();
  }

  logout(): void {
    this.localStorageService.removeAccessToken();
    this.userData.next(null);
  }
}
