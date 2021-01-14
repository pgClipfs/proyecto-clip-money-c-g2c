import { Component, OnInit } from '@angular/core';
import { RegistroService } from '../../services/registro.service';
//import { RequestLogin } from '../../models/request-login.model';
import {
  FormControl,
  Validators,
  FormBuilder,
  FormGroup,
} from '@angular/forms';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss'],
})
export class RegisterComponent implements OnInit {
  form: FormGroup;

  constructor(
    private registroService: RegistroService,
    protected formBuilder: FormBuilder
  ) {
    this.buildForm();
  }

  ngOnInit(): void {}

  private buildForm() {
    this.form = this.formBuilder.group({
      FotoFrenteDni: ['fotoFrente', [Validators.required]],
      FotoReversoDni: ['fotoReverso', [Validators.required]],
      Email: ['email'],
      username: ['username'],
      password: ['password'],
      //repitaContraseña: ['repitaContraseña'],
      Nombre: ['nombre'],
      Apellido: ['apellido'],
      Dni: [1],
      FechaDeNacimiento: [],
      Cuilcuit: [1],
      Telefono: [1],
      Calle: ['asd'],
      Altura: [1],
      Departamento: [],
      Piso: [1],
      Puerta: ['a'],
      Barrio: ['asd'],
      CodigoPostal: [],
      IdLocalidad: [1],
      PreguntaSecreta: [],
      RespuestaSecreta: ['respuesta secreta ejemplo'],
    });
  }

  requestRegister(event: Event) {
    event.preventDefault();
    if (this.form.valid) {
      const register = this.form.value;
      this.registroService
        .registrarUsuario(register)
        .subscribe((newRegister) => {
          console.log(newRegister);
          console.log('*******');
        });
    }
    console.log(this.form.value);
  }

  apretarRegistrarCuenta() {
    console.log('Info de formulario para registro:');

    if (!this.form.valid) {
      const formulario = this.form.value;
      console.log('Info de formulario valido para registro:');
      console.log(formulario);
    }
    if (this.form.valid) {
      const formulario = this.form.value;
      console.log('Info de formulario valido para registro:');
      console.log(formulario);
    }
  }
}
