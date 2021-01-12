import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { LandingComponent } from './components/landing/landing.component'
import { LoginComponent } from './components/login/login.component';
import { RegisterComponent } from './components/register/register.component';
import { RecuperarPasswordComponent } from './components/recuperar-password/recuperar-password.component';
import { NewPasswordComponent } from './components/new-password/new-password.component';
import { MovimientosComponent } from './components/movimientos/movimientos.component';
import { RecuperarCuentaComponent } from './components/recuperar-cuenta/recuperar-cuenta.component';
import { ModificarDatosComponent } from './components/modificar-datos/modificar-datos.component';
import { ActivarCuentaComponent } from './components/activar-cuenta/activar-cuenta.component';
import { CuentaComponent } from './components/cuenta/cuenta.component';
import { IngresoDineroComponent } from './components/ingreso-dinero/ingreso-dinero.component';
import { ExtraerDineroComponent } from './components/extraer-dinero/extraer-dinero.component';
import { ModificarDomicilioComponent } from './components/modificar-domicilio/modificar-domicilio.component';
import { PerfilComponent } from './components/perfil/perfil.component';
//import { PerfilComponent } from './components/perfil/perfil.component';
//import { ModificarDatosComponent } from './components/modificar-datos/modificar-datos.component';
//import { ModificarDomicilioComponent } from './components/modificar-domicilio/modificar-domicilio.component';

const routes: Routes = [
  {
    path: '',
    redirectTo: 'landing',
    pathMatch: 'full',
  },
  {
    path:'landing',
    component: LandingComponent,
  },
  {
    path:'login',
    component: LoginComponent,
  },
  {
    path: 'home',
    component: HomeComponent,
  },
  {
    path:'register',
    component: RegisterComponent,
  },
  {
    path:'recuperar-password',
    component: RecuperarPasswordComponent,
  },
  {
    path:'new-password',
    component: NewPasswordComponent,
  },
  {
    path:'cuenta',
    component: CuentaComponent,
  },
  {
    path:'activar-cuenta',
    component: ActivarCuentaComponent,
  },
  {
    path:'movimientos',
    component: MovimientosComponent,
  },
  {
    path:'ingreso-dinero',
    component: IngresoDineroComponent,
  },
  {
    path:'extraer-dinero',
    component: ExtraerDineroComponent,
  },
  {
    path:'recuperar-cuenta',
    component: RecuperarCuentaComponent,
  },
  {
    path:'perfil',
    component: PerfilComponent,
  },
  {
    path:'modificar-datos',
    component: ModificarDatosComponent,
  },
  {
    path:'modificar-domicilio',
    component: ModificarDomicilioComponent,
  },
  {
    path:'perfil',
    component: PerfilComponent,
  },
  {
    path: '**',
    redirectTo: '',
  }
/*import { AppComponent } from './app.component'; //
//import { HomeComponent } from './components/home/home.component';
import { LoginComponent } from './components/login/login.component';
import { UsuariosComponent } from './components/usuarios/usuarios.component';
import { HeaderComponent } from './components/header/header.component';

const routes: Routes = [
  {path:'', component:HeaderComponent},
  {path:'personas', component:UsuariosComponent},
  {path:'user/login', component:LoginComponent},
  {path: '**', redirectTo: '' }*/
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

//https://angular.io/guide/router
