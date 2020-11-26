import { Component, OnInit } from '@angular/core';
import { AuthService } from '../Authentication/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  username: any;
  password: any;

  constructor(private auth: AuthService) { }

  ngOnInit(): void {
  }

  login() {
    this.auth.login(this.username , this.password);
  }

}
