import { Component, OnInit, Input } from '@angular/core';
import {
  FormControl,
  Validators,
  FormBuilder,
  FormGroup,
} from '@angular/forms';

@Component({
  selector: 'app-ingreso-dinero',
  templateUrl: './ingreso-dinero.component.html',
  styleUrls: ['./ingreso-dinero.component.scss'],
})
export class IngresoDineroComponent implements OnInit {
  form: FormGroup;
  public idEjemplo: number;
  @Input() mostrarIngresoDeposito: boolean; //parece que aui no se utiliza la entrada mostraringreso para algo significativo
  @Input() entradaIdCuenta: number;
  constructor(private formBuilder: FormBuilder) {
    //this.idEjemplo = 5;
    console.log(this.entradaIdCuenta);
    //this.buildForm(this.entradaIdCuenta);
    this.mostrarIngresoDeposito = false;
    console.log(this.mostrarIngresoDeposito);
  }

  ngOnInit(): void {
    let accountIdInput = document.querySelector('.idCuenta');
    accountIdInput.setAttribute('value', '2');
    //this.idEjemplo = 4;
    console.log(this.entradaIdCuenta);
    this.buildForm(this.entradaIdCuenta);
  }

  private buildForm(id: number) {
    this.idEjemplo = 3;
    this.form = this.formBuilder.group({
      Monto: [this.idEjemplo, [Validators.required]],
      IdCuenta: [id, [Validators.required]],
    });
  }
}
