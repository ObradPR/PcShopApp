import { Injectable } from '@angular/core';

// SERVICES
import { DataService } from './data.service';

// INTERFACES
import { UserData } from '../interfaces/user-data.interface';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  constructor(private dataService: DataService) {}

  editUser(userObj: UserData): Observable<any> {
    return this.dataService.patch('user/edit-user', userObj);
  }
}
