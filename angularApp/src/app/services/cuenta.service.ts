import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
//import { Usuario } from '../models/usuario.model';

@Injectable({
  providedIn: 'root',
})
export class CuentaService {
  url = 'https://localhost:44382/api/operacion/';
  constructor(private http: HttpClient) {
    console.log('Service cuenta is running!');
  }

  getAccountBalance(accountId: string): Observable<Number> {
    let header = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get<Number>(this.url + accountId, { headers: header });
  }
}
