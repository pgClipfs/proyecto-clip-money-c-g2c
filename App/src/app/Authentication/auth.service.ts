import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  API_URL = 'http://icaro.cdgweb.com.ar/public/'; //Modificar URL de API por la API nuestra
  isLogged: boolean = false;
  token: any;

  constructor(private http: HttpClient, private router: Router) { 
    const token = localStorage.getItem('icaro_token');
    if (token) {
      this.token = token;
      this.isLogged = true;
      this.router.navigate(['profile'])
    }
   }

  login(user: any, pass: any) {
    const data = {            //ESTE OBJETO "DATA" TIENE QUE SER IGUAL AL DEL LOGIN DEL BACK PARA QUE FUNCIONE
      user_username: user,
      user_password: pass,
    };  

    this.http.post(this.API_URL + 'login' , {data}).subscribe(res => {
      const loginResponse: any = res;
      this.isLogged = true;
      this.token = loginResponse.token;
      localStorage.setItem('icaro_token' , this.token) // ESTO ES PARA PERSISITIR DATOS EN EL NAVEGADOR, SE PUEDE OBSERVAR EN LAS DEV TOOLS DE CHROME => APPLICATION
      this.router.navigate(['profile']);
    }, err => {
      this.isLogged = false;
      this.token = null;
    });
  }

}
