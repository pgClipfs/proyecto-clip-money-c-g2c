import { Component, OnInit, Input } from '@angular/core';
import { OperacionService } from '../../services/operacion.service';
import { OperacionDepositoExtraccion } from '../../models/operacion-deposito-extraccion.model';
import {
  FormControl,
  Validators,
  FormBuilder,
  FormGroup,
} from '@angular/forms';

@Component({
  selector: 'app-extraer-dinero',
  templateUrl: './extraer-dinero.component.html',
  styleUrls: ['./extraer-dinero.component.scss'],
})
export class ExtraerDineroComponent implements OnInit {
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

  private buildForm(id: number) {
    this.idEjemplo = 3;
    this.form = this.formBuilder.group({
      Monto: [this.idEjemplo, [Validators.required]],
      IdCuenta: [id, [Validators.required]],
    });
  }

  extraction(event: Event) {
    event.preventDefault();
    if (this.form.valid) {
      const operacionMontoID = this.form.value;
      this.operacionService
        .makeExtraction(operacionMontoID)
        .subscribe((extractionOutput) => {
          console.log(
            'Mensaje de la subscripcion al metodo makeExtraction del servicio operacion'
          );
          console.log(extractionOutput);
        });
    }
  }
}
