import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class DataService {
  private apiUrl = 'http://localhost:8000/';
  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json',
    }),
  };

  constructor(private http: HttpClient) {}

  get(endpoint: string): Observable<any> {
    return this.http.get(this.apiUrl + endpoint, this.httpOptions);
  }

  post(endpoint: string, body: {}): Observable<any> {
    return this.http.post(this.apiUrl + endpoint, body, this.httpOptions);
  }

  postWithFiles(endpoint: string, body: {}): Observable<any> {
    return this.http.post(this.apiUrl + endpoint, body);
  }

  patch(endpoint: string, body: {}): Observable<any> {
    return this.http.patch(this.apiUrl + endpoint, body, this.httpOptions);
  }

  delete(endpoint: string) {
    return this.http.delete(this.apiUrl + endpoint, this.httpOptions);
  }
}
