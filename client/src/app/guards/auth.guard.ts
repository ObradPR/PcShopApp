import {
  ActivatedRouteSnapshot,
  CanActivateFn,
  Router,
  RouterStateSnapshot,
} from '@angular/router';
import { Observable, map } from 'rxjs';
import { Injectable } from '@angular/core';

// SERVICES
import { AuthService } from '../services/auth.service';

// INTERFACES
import { UserData } from '../common/interfaces/user-data.interface';

@Injectable({
  providedIn: 'root',
})
export class AuthGuard {
  constructor(private authService: AuthService, private router: Router) {}

  canActivate: CanActivateFn = (
    next: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
  ): Observable<boolean> => {
    return this.authService.getUserData().pipe(
      map((data: UserData | null) => {
        if (!data) {
          this.router.navigate(['/']);
          this.authService.setLoginVisibility(true);
          return false;
        } else {
          return true;
        }
      })
    );
  };
}
