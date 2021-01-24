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

  constructor() {
    this.mostrarInfoBasica = true;
  }

  ngOnInit(): void {
    this.mostrarIngresoDepositoHome = false;

    this.dataDashboard = history.state.data;
    console.log('assssdadsasdasdasdasdadsad');
    console.log(this.dataDashboard);
    let accountIdElement = document.querySelector('.account-id');
    accountIdElement.innerHTML = this.dataDashboard.toString();
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
        break;

      case 'extraccion':
        this.mostrarExtraccion = entrada.opcionValue;
        this.mostrarIngresoDepositoHome = false;
        this.mostrarInfoBasica = false;
        break;

      case 'infoBasica':
        this.mostrarInfoBasica = entrada.opcionValue;
        this.mostrarExtraccion = false;
        this.mostrarIngresoDepositoHome = false;
        break;

      default:
        break;
    }
  }
}
