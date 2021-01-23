import { Component, OnInit, Input } from '@angular/core';
import { CuentaService } from '../../services/cuenta.service';

@Component({
  selector: 'app-consultar-saldo',
  templateUrl: './consultar-saldo.component.html',
  styleUrls: ['./consultar-saldo.component.scss'],
})
export class ConsultarSaldoComponent implements OnInit {
  @Input() accountId: number;
  public saldo: number;
  constructor(private cuentaService: CuentaService) {}

  ngOnInit(): void {
    let accountIdForBalance = this.accountId.toString();
    this.ObtenerSaldoDeCuenta(accountIdForBalance);
  }

  ObtenerSaldoDeCuenta(accountId: string) {
    this.cuentaService.getAccountBalance(accountId).subscribe((res) => {
      console.log(res);
      console.log(`Msg de obtenersaldodecuenta()`);

      let saldo = document.querySelector('.saldo');
      saldo.innerHTML = res.toString();
    });
  }
}
