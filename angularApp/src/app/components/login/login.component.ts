import { Component, OnInit } from '@angular/core';
import { LoginService } from '../../services/login.service';
import { RequestLogin } from '../../models/request-login.model';
import {
  FormControl,
  Validators,
  FormBuilder,
  FormGroup,
} from '@angular/forms';
import { Routes, RouterModule, Route, Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  //styleUrls: ['./login.component.css']
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent implements OnInit {
  emailField: FormControl;
  form: FormGroup;
  usernameField: FormControl;
  passwordField: FormControl;

  constructor(
    private loginService: LoginService,
    private formBuilder: FormBuilder,
    private router: Router
  ) {
    this.emailField = new FormControl('', [
      /*Validators.required,
      // Validators.minLength(6),
      // Validators.maxLength(14)
      Validators.email
    ]);

    this.buildForm();*/

      Validators.required,
      // Validators.minLength(6),
      // Validators.maxLength(14)
      Validators.email,
    ]);

    this.buildForm();
  }

  reqLog: RequestLogin;
  reqLogin = { Username: 'nicolas', Password: 'nico' };
  ngOnInit(): void {}

  sendLogin() {
    if (this.emailField.valid) {
      console.log(this.emailField.value);
    }
  }

  requestLogin(event: Event) {
    event.preventDefault();
    if (this.form.valid) {
      const login = this.form.value;
      this.loginService.getAuthentication(login).subscribe((newLogin) => {
        console.log(newLogin);
        window.localStorage.setItem('token', newLogin.toString()); //or "" + newLogin
        console.log('*******');
        console.log(window.localStorage.getItem('token'));
      });
    }
    console.log(this.form.value);
  }

  //new methods:
  private buildForm() {
    this.form = this.formBuilder.group({
      Username: ['asd', [Validators.required]],
      Password: ['', [Validators.required]],
    });
  }

  getIdWhenLogin(event: Event) {
    event.preventDefault();
    let info: number;
    info = 123;
    if (this.form.valid) {
      const login = this.form.value;
      this.loginService.getAccountId(login).subscribe((idAccount) => {
        //console.log(newLogin);
        //window.localStorage.setItem('token', newLogin.toString()); //or "" + newLogin

        //COMENTADO PARA MEJORAR, REVISAR
        // console.log(`Msg de getIdwhenlogin, idaccount: ${idAccount}`);
        // console.log(
        //   `Msg de getIdwhenlogin, stateservicedata: ${this.stateService.data} before`
        // );

        // console.log(idAccount);
        // console.log('+++++++++');
        //console.log(window.localStorage.getItem('token'));

        //COMENTADO PARA MEJORAR, REVISAR
        // this.stateService.data = idAccount;
        // this.dato1 = idAccount;
        // info = idAccount;
        // console.log(
        //   `Msg de getIdwhenlogin, stateservicedata: ${this.stateService.data} after`
        // );

        console.log;
        this.router.navigate(['/home'], {
          state: { data: idAccount },
        });
        console.log('Mensaje luego de enviar el id en el atributo de la ruta.');
      });
    }
    //this.router.navigate(['dashboard']);
    // this.router.navigate(['/dashboard'], {
    //   state: { data: info },
    // });
  }
}
