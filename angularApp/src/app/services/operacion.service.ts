import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { OperacionDepositoExtraccion } from '../models/operacion-deposito-extraccion.model';
import { OperacionTransferencia } from '../models/operacion-transferencia.model';
import { Movimiento } from '../models/movimiento.model';

@Injectable({
  providedIn: 'root',
})
export class OperacionService {
  url = 'https://localhost:44382/api/operacion/deposito';
  url1 = 'https://localhost:44382/api/operacion';
  url2 = 'https://localhost:44382/api/operacion/extraccion';
  url3 = 'https://localhost:44382/api/operacion/transferencia';
  url4 = 'https://localhost:44382/api/giro';
  url5 = 'https://localhost:44382/api/movimientos/';

  constructor(private httpclient: HttpClient) {
    console.log('Service operacion is running!');
  }

  makeDeposit(operacion: OperacionDepositoExtraccion): Observable<any> {
    let header = new HttpHeaders().set('Content-Type', 'application/json');
    return this.httpclient.post<OperacionDepositoExtraccion>(
      this.url,
      operacion,
      { headers: header }
    );
  }

  makeExtraction(operacion: OperacionDepositoExtraccion): Observable<any> {
    let header = new HttpHeaders().set('Content-Type', 'application/json');
    return this.httpclient.post<OperacionDepositoExtraccion>(
      this.url2,
      operacion,
      { headers: header }
    );
  }

  makeTransference(operacion: OperacionTransferencia): Observable<any> {
    let header = new HttpHeaders().set('Content-Type', 'application/json');
    return this.httpclient.post<OperacionTransferencia>(this.url3, operacion, {
      headers: header,
    });
  }

  makeOverdraft(operacion: OperacionDepositoExtraccion): Observable<any> {
    let header = new HttpHeaders().set('Content-Type', 'application/json');
    return this.httpclient.post<OperacionDepositoExtraccion>(
      this.url4,
      operacion,
      { headers: header }
    );
  }

  getLastMovements(accountId: string): Observable<any> {
    let header = new HttpHeaders().set('Content-Type', 'application/json');
    return this.httpclient.get<any>(this.url5 + accountId, {
      headers: header,
    });
  }
}
