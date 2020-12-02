import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import { Observable } from 'rxjs';
import { Usuario } from '../models/usuario.model';



@Injectable({
  providedIn: 'root'
})
export class UsuarioService {
  url = "https://localhost:44382/api/usuario"
  url1 = "https://localhost:44382/api/usuario/1017"
  constructor(private http:HttpClient) {
    console.log("Service usuario is runnning!")
   }

  getUsuarios(): Observable<Usuario[]>{
    let header = new HttpHeaders().set('Content-Type', 'application/json');
    
    return this.http.get<Usuario[]>(this.url, {headers:header});
  }
  getUsuarioById(): Observable<Usuario>{
    let header = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.get<Usuario>(this.url1, {headers:header});
  }
}
