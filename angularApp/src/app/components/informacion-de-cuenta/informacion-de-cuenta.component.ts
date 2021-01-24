import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-informacion-de-cuenta',
  templateUrl: './informacion-de-cuenta.component.html',
  styleUrls: ['./informacion-de-cuenta.component.scss'],
})
export class InformacionDeCuentaComponent implements OnInit {
  public dataDashboard: number;
  @Input() accountId: number;
  public saldo: number;
  constructor() {}

  ngOnInit(): void {
    let accountIdElement = document.querySelector('.account-id');
    accountIdElement.innerHTML = this.accountId.toString();
  }
}
