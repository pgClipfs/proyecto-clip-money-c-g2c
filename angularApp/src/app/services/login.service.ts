import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { RequestLogin } from '../models/request-login.model';

@Injectable({
  providedIn: 'root',
})
export class LoginService {
  url = 'https://localhost:44382/api/login/authenticate';
  url1 = 'https://localhost:44382/api/login/idcuenta';
  constructor(private http: HttpClient) {
    console.log('Service service is runnning!');
  }

  getAuthentication(reqLogin: RequestLogin): Observable<RequestLogin> {
    let header = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post<RequestLogin>(this.url, reqLogin, {
      headers: header,
    });
  }

  getAccountId(reqLogin: RequestLogin): Observable<any> {
    // let header = new HttpHeaders().set('Content-Type', 'application/json');
    // return this.http.get<RequestLogin>(this.url, requestLogin, {headers:header}); get method can't send login object as parameter
    let header = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post<RequestLogin>(this.url1, reqLogin, {
      headers: header,
    });
  }
}
