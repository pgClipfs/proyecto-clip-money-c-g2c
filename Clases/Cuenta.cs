using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Billetera.Models
{
    public class Cuenta
    {
        private long cvu;
        private Usuario usuario;
        private decimal saldo;
        private decimal limiteAlDescubierto;
        private bool cuentaActiva;
        private int interesesAlDescubierto;
        private TipoDeCuenta tipoDeCuenta;
        private DateTime fechaDeAlta;
        private DateTime fechaDeBaja;
    }
}