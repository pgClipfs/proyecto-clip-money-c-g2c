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
    path:'movimientos',
    component: MovimientosComponent,
  },
  {
    path:'recuperar-cuenta',
    component: RecuperarCuentaComponent,
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