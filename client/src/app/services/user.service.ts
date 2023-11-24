import { Injectable } from '@angular/core';

// SERVICES
import { DataService } from './data.service';

// INTERFACES

@Injectable({
  providedIn: 'root',
})
export class UserService {
  constructor(private dataService: DataService) {}

  
}
