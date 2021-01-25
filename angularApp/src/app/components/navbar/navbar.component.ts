import { Component, OnInit, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css'],
})
export class NavbarComponent implements OnInit {
  @Output() opcionClickeada: EventEmitter<any> = new EventEmitter();
  @Output() opcionDeposito: EventEmitter<any> = new EventEmitter();
  @Output() opcionExtraccion: EventEmitter<any> = new EventEmitter();

  constructor() {}

  ngOnInit(): void {}

  enviarDatosTest() {
    console.log('test para envio de datos entre componentes');
    this.opcionClickeada.emit(true);
  }
  habilitarDeposito() {
    console.log('mensaje desde func para habilitar deposito');
    this.opcionClickeada.emit({ opcionValue: true, opcionType: 'deposito' });
  }
  habilitarExtraccion() {
    console.log('mensaje desde func para habilitar extraccion');
    this.opcionClickeada.emit({ opcionValue: true, opcionType: 'extraccion' });
  }
  habilitarInfoBasica() {
    console.log('mensaje desde func para habilitar información básica');
    this.opcionClickeada.emit({ opcionValue: true, opcionType: 'infoBasica' });
  }
  habilitarTransferencia() {
    console.log('mensaje desde func para habilitar transferencia');
    this.opcionClickeada.emit({
      opcionValue: true,
      opcionType: 'transferencia',
    });
  }
  habilitarUltimosMovimientos() {
    console.log('mensaje desde func para habilitar ultimosMovimientos');
    this.opcionClickeada.emit({
      opcionValue: true,
      opcionType: 'ultimosMovimientos',
    });
  }
  habilitarGiro() {
    console.log('mensaje desde func para habilitar giro');
    this.opcionClickeada.emit({ opcionValue: true, opcionType: 'giro' });
  }
}
