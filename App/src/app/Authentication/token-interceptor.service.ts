import { HttpEvent, HttpHandler, HttpInterceptor, HttpRequest } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class TokenInterceptorService implements HttpInterceptor{ 

  constructor(private auth: AuthService) { }

  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>>{
    const token: string = this.auth.token;
    let request = req; 
    console.log('Interceptó');    //ESTO ES PARA VER MÁS EXPLICITAMENTE QUE FUNCIONA
    if (token) {
      request = req.clone({
        setHeaders: {
          token: `${ token }`
        }
      });
    }
    return next.handle(request);
  }


}
