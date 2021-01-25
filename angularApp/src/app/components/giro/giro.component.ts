import { Component, OnInit, Input } from '@angular/core';
import { OperacionService } from '../../services/operacion.service';
import {
  FormControl,
  Validators,
  FormBuilder,
  FormGroup,
} from '@angular/forms';

@Component({
  selector: 'app-giro',
  templateUrl: './giro.component.html',
  styleUrls: ['./giro.component.scss']
})
export class GiroComponent implements OnInit {
  form: FormGroup;
  public idEjemplo: number;
  @Input() mostrarIngresoDeposito: boolean; //parece que aui no se utiliza la entrada mostraringreso para algo significativo
  @Input() entradaIdCuenta: number;

 constructor(
    private operacionService: OperacionService,
    private formBuilder: FormBuilder
  ) {
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

  giro(event: Event) {
    event.preventDefault();
    if (this.form.valid) {
      const operacionMontoID = this.form.value;
      this.operacionService
        .makeOverdraft(operacionMontoID)
        .subscribe((depositOutput) => {
          console.log(
            'Mensaje de la subscripcion al metodo overdraft del servicio operacion'
          );
          console.log(depositOutput);
        });
    }
  }

  private buildForm(id: number) {
    this.idEjemplo = 3;
    this.form = this.formBuilder.group({
      Monto: [this.idEjemplo, [Validators.required]],
      IdCuenta: [id, [Validators.required]],
    });
  }
}
