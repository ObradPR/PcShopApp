import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

// SERVICES
import { DataService } from './data.service';

// INTERFACES
import { UserData } from '../common/interfaces/user-data.interface';

@Injectable({
  providedIn: 'root',
})
export class UserService {
  constructor(private dataService: DataService) {}

  editUser(userObj: UserData): Observable<{ message: string; token: string }> {
    return this.dataService.patch('user/edit-user', userObj);
  }

  getUserMessages(userId: number): Observable<any> {
    return this.dataService.get(`user/get-messages/${userId}`);
  }

  readMessage(messageId: number): Observable<{ message: string }> {
    return this.dataService.patch('user/read-message', { messageId });
  }
}
