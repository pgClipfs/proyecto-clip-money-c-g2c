import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import { Observable } from 'rxjs';
import { RequestLogin } from '../models/request-login.model';

@Injectable({
  providedIn: 'root'
})
export class LoginService {
  url = "https://localhost:44382/api/login/authenticate"
  constructor(private http:HttpClient) {
    console.log("Service service is runnning!")
   }

  getAuthentication(reqLogin: RequestLogin): Observable<RequestLogin>{ 
    let header = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post<RequestLogin>(this.url, reqLogin , {headers:header});
  }
}
