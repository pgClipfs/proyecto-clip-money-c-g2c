import { Component, OnInit, Input } from '@angular/core';
import { OperacionService } from '../../services/operacion.service';
import { OperacionDepositoExtraccion } from '../../models/operacion-deposito-extraccion.model';
import {
  FormControl,
  Validators,
  FormBuilder,
  FormGroup,
} from '@angular/forms';
import { Movimiento } from 'src/app/models/movimiento.model';

@Component({
  selector: 'app-ultimos-movimientos',
  templateUrl: './ultimos-movimientos.component.html',
  styleUrls: ['./ultimos-movimientos.component.scss'],
})
export class UltimosMovimientosComponent implements OnInit {
  form: FormGroup;
  public idEjemplo: number;
  @Input() mostrarUltimosMovimientos: boolean; //parece que aui no se utiliza la entrada mostraringreso para algo significativo
  @Input() entradaIdCuenta: number;
  public movimientos: Movimiento[];
  constructor(
    private operacionService: OperacionService,
    private formBuilder: FormBuilder
  ) {
    //this.idEjemplo = 5;
    console.log(this.entradaIdCuenta);
    //this.buildForm(this.entradaIdCuenta);
    //this.mostrarUltimosMovimientos = false;
    console.log(this.mostrarUltimosMovimientos);
  }

  ngOnInit(): void {
    // let accountIdInput = document.querySelector('.idCuenta');
    // accountIdInput.setAttribute('value', '2');
    //this.idEjemplo = 4;
    console.log(this.entradaIdCuenta);
    // this.buildForm(this.entradaIdCuenta);
    let idCuenta: string;
    idCuenta = this.entradaIdCuenta.toString();
    this.operacionService.getLastMovements(idCuenta).subscribe((res) => {
      console.log(res);
      this.movimientos = res;
    });
  }

  deposit(event: Event) {
    event.preventDefault();
    if (this.form.valid) {
      const operacionMontoID = this.form.value;
      this.operacionService
        .makeDeposit(operacionMontoID)
        .subscribe((depositOutput) => {
          console.log(
            'Mensaje de la subscripcion al metodo makeDeposit del servicio operacion'
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
