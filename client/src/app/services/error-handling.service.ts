import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class ErrorHandlingService {
  errorMessage(content: string, statusCode: number): string {
    return `${content} with the status of ${statusCode}`;
  }
}
