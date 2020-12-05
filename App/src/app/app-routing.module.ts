import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuardService } from './Authentication/auth-guard.service';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';
import { ProfileComponent } from './profile/profile.component';
import { RegisterComponent } from './register/register.component';
import { RecuperarPasswordComponent } from './recuperar-password/recuperar-password.component';
import { NewPasswordComponent } from './new-password/new-password.component';

const routes: Routes = [
  {
    path: '',
    redirectTo: 'login',
    pathMatch: 'full',
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
    path: 'profile',
    canActivate: [AuthGuardService],
    component: ProfileComponent,
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
