import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class ErrorHandlingService {
  errorMessage(content: string, statusCode: string): string {
    return `${content} with the status of ${statusCode}`;
  }
}
