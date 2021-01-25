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
  selector: 'app-transferencia',
  templateUrl: './transferencia.component.html',
  styleUrls: ['./transferencia.component.scss'],
})
export class TransferenciaComponent implements OnInit {
  form: FormGroup;
  public idEjemplo: number;
  @Input() mostrarTransferencia: boolean; //parece que aui no se utiliza la entrada mostraringreso para algo significativo
  @Input() entradaIdCuenta: number;
  constructor(
    private operacionService: OperacionService,
    private formBuilder: FormBuilder
  ) {
    //this.idEjemplo = 5;
    console.log(this.entradaIdCuenta);
    //this.buildForm(this.entradaIdCuenta);
    this.mostrarTransferencia = false;
    console.log(this.mostrarTransferencia);
  }

  ngOnInit(): void {
    let accountIdInput = document.querySelector('.idCuenta');
    accountIdInput.setAttribute('value', '2');
    //this.idEjemplo = 4;
    console.log(this.entradaIdCuenta);
    this.buildForm(this.entradaIdCuenta);
  }

  transference(event: Event) {
    event.preventDefault();
    if (this.form.valid) {
      const operacionMontoIdOrigenIdDestino = this.form.value;
      this.operacionService
        .makeTransference(operacionMontoIdOrigenIdDestino)
        .subscribe((depositOutput) => {
          console.log(
            'Mensaje de la subscripcion al metodo makeTransference del servicio operacion'
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
      CvuCbuDestino: [this.idEjemplo, [Validators.required]],
    });
  }
}
