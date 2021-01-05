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
<<<<<<< HEAD
import { ModificarDatosComponent } from './components/modificar-datos/modificar-datos.component';
=======
import { ActivarCuentaComponent } from './components/activar-cuenta/activar-cuenta.component';
import { CuentaComponent } from './components/cuenta/cuenta.component';
import { IngresoDineroComponent } from './components/ingreso-dinero/ingreso-dinero.component';
import { ExtraerDineroComponent } from './components/extraer-dinero/extraer-dinero.component';
>>>>>>> adf7c2b9f513b5779216aea0860550eac61adb71

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
    path:'modificar-datos',
    component: ModificarDatosComponent,
  },
  {
    path: '**',
    redirectTo: '',
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
