import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Usuario } from '../models/usuario.model';
import { RegistrarUsuario } from '../models/registrar-usuario.model';

@Injectable({
  providedIn: 'root',
})
// export class RegistroService {
//   url = "https://localhost:44382/api/usuario"

//   constructor(private http:HttpClient) {
//     console.log("Service registro is runnning!");
//    }
//    //: Observable<Usuario>
//   // registrarUsuario(usuario:Usuario){
//   //   let header = new HttpHeaders().set('Content-Type', 'application/json');
//   //   return this.http.post<Usuario>(this.url, usuario, {headers:header});

//   // }
//   registrarUsuario(usuario:Usuario): Observable<Usuario>{
//     let header = new HttpHeaders().set('Content-Type', 'application/json');
//     return this.http.post<Usuario>(this.url, usuario, {headers:header});
//   }
// }
export class RegistroService {
  url = 'https://localhost:44382/api/cuenta';

  constructor(private http: HttpClient) {
    console.log('Service registro is runnning!');
  }
  //: Observable<Usuario>
  // registrarUsuario(usuario:Usuario){
  //   let header = new HttpHeaders().set('Content-Type', 'application/json');
  //   return this.http.post<Usuario>(this.url, usuario, {headers:header});

  // }
  registrarUsuario(
    registrarUsuario: RegistrarUsuario
  ): Observable<RegistrarUsuario> {
    let header = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.post<RegistrarUsuario>(this.url, registrarUsuario, {
      headers: header,
    });
  }
}
