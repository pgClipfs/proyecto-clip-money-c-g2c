import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {HttpClientModule,HTTP_INTERCEPTORS} from '@angular/common/http';
import {FormsModule,ReactiveFormsModule, FormGroup } from '@angular/forms';


import { AppRoutingModule } from './app-routing.module';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { AppComponent } from './app.component';
import { LoginComponent } from './components/login/login.component';

import { UsuarioService } from './services/usuario.service';
import { UsuariosComponent } from './components/usuarios/usuarios.component';
import { LoginService } from './services/login.service';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatInputModule} from '@angular/material/input';
import { MatFormFieldModule} from '@angular/material/form-field';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule} from '@angular/material/card';
import { AuthInterceptorService } from './interceptors/auth-interceptor.service';
import { RegisterComponent } from './components/register/register.component';
import { HeaderComponent } from './components/header/header.component';
import { HomeComponent } from './components/home/home.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { RecuperarPasswordComponent } from './components/recuperar-password/recuperar-password.component';
import { NewPasswordComponent } from './components/new-password/new-password.component';
import { LandingComponent } from './components/landing/landing.component';
import { NavbarLandingComponent } from './components/navbar-landing/navbar-landing.component';
import { MaterialModule } from './components/material/material.module';
import { MovimientosComponent } from './components/movimientos/movimientos.component';
import { RecuperarCuentaComponent } from './components/recuperar-cuenta/recuperar-cuenta.component';
//import from {JwtHelperService} from '@auth0/angular-jwt';


@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    HeaderComponent,
    NavbarLandingComponent,
    HomeComponent,
    NavbarComponent,
    NewPasswordComponent,
    RecuperarPasswordComponent,
    UsuariosComponent,
    RegisterComponent,
    LandingComponent,
    MovimientosComponent,
    RecuperarCuentaComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    //FormGroup,
    NgbModule,
    BrowserAnimationsModule,
    MatInputModule,
    MatButtonModule,
    MatFormFieldModule,
    MatCardModule,
    MaterialModule
  ],
  providers: [
    {
      provide: HTTP_INTERCEPTORS,
      useClass: AuthInterceptorService,
      multi: true
    }
  ], //this is needed?
  bootstrap: [AppComponent]
})
export class AppModule { }
