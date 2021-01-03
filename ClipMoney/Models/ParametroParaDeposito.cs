using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ClipMoney.Models
{
    public class ParametroParaDeposito
    {
        private decimal monto;
        private int idCuenta;

        public ParametroParaDeposito()
        {

        }

        public ParametroParaDeposito(decimal monto, int idCuenta)
        {
            this.monto = monto;
            this.idCuenta = idCuenta;
        }

        public decimal Monto { get => monto; set => monto = value; }
        public int IdCuenta { get => idCuenta; set => idCuenta = value; }
    }
}