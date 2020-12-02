import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AppComponent } from './app.component'; //
//import { HomeComponent } from './components/home/home.component';
import { LoginComponent } from './components/login/login.component';
import { UsuariosComponent } from './components/usuarios/usuarios.component';
import { HeaderComponent } from './components/header/header.component';

const routes: Routes = [
  {path:'', component:HeaderComponent},
  {path:'personas', component:UsuariosComponent},
  {path:'user/login', component:LoginComponent},
  {path: '**', redirectTo: '' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

//https://angular.io/guide/router