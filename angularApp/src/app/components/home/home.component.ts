import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
})
export class HomeComponent implements OnInit {
  public dataDashboard: number;
  mostrarIngresoDepositoHome: boolean;
  mostrarExtraccion: boolean;
  mostrarInfoBasica: boolean;
  mostrarTransferencia: boolean;
  mostrarUltimosMovimientos: boolean;
  mostrarGiro: boolean;

  constructor() {
    this.mostrarInfoBasica = true;
    //this.mostrarUltimosMovimientos = false;
  }

  ngOnInit(): void {
    this.mostrarIngresoDepositoHome = false;

    this.dataDashboard = history.state.data;
    // console.log('assssdadsasdasdasdasdadsad');
    // console.log(this.dataDashboard);
    // let accountIdElement = document.querySelector('.account-id');
    // accountIdElement.innerHTML = this.dataDashboard.toString();
  }

  opcionClick(entrada: { opcionValue: boolean; opcionType: string }) {
    console.log('output recibido en home.ts');
    console.log(entrada.opcionValue);
    //this.mostrarIngresoDepositoHome = entrada.opcionValue;
    switch (entrada.opcionType) {
      case 'deposito':
        this.mostrarIngresoDepositoHome = entrada.opcionValue;
        this.mostrarExtraccion = false;
        this.mostrarInfoBasica = false;
        this.mostrarTransferencia = false;
        this.mostrarUltimosMovimientos = false;
        this.mostrarGiro = false;
        break;

      case 'extraccion':
        this.mostrarExtraccion = entrada.opcionValue;
        this.mostrarIngresoDepositoHome = false;
        this.mostrarInfoBasica = false;
        this.mostrarTransferencia = false;
        this.mostrarUltimosMovimientos = false;
        this.mostrarGiro = false;
        break;

      case 'infoBasica':
        this.mostrarInfoBasica = entrada.opcionValue;
        this.mostrarExtraccion = false;
        this.mostrarIngresoDepositoHome = false;
        this.mostrarTransferencia = false;
        //this.mostrarUltimosMovimientos = false;
        this.mostrarGiro = false;
        break;

      case 'transferencia':
        this.mostrarTransferencia = entrada.opcionValue;
        this.mostrarExtraccion = false;
        this.mostrarInfoBasica = false;
        this.mostrarIngresoDepositoHome = false;
        this.mostrarUltimosMovimientos = false;
        this.mostrarGiro = false;
        break;

      case 'ultimosMovimientos':
        this.mostrarUltimosMovimientos = entrada.opcionValue;
        this.mostrarExtraccion = false;
        this.mostrarInfoBasica = false;
        this.mostrarTransferencia = false;
        this.mostrarIngresoDepositoHome = false;
        this.mostrarGiro = false;
        break;

        case 'giro':
          console.log("giro");
        this.mostrarGiro = entrada.opcionValue;
        this.mostrarExtraccion = false;
        this.mostrarInfoBasica = false;
        this.mostrarTransferencia = false;
        this.mostrarIngresoDepositoHome = false;
        this.mostrarUltimosMovimientos = false;
        break;

      default:
        break;
    }
  }
}
