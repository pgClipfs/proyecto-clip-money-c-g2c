using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ClipMoney.Models
{
    public class Cuenta
    {
        private long cvu;
        private int idUsuario;
        private decimal saldo;
        private decimal limiteAlDescubierto;
        private byte interesesAlDescubierto;
        private string tipoDeMoneda;
        private DateTime fechaDeAlta;
        private Nullable<DateTime> fechaDeBaja;
        private Boolean cuentaActiva;

        public Cuenta()
        {

        }

        public Cuenta(long cvu, int idUsuario, decimal saldo, decimal limiteAlDescubierto, byte interesesAlDescubierto, string tipoDeMoneda, DateTime fechaDeAlta, Nullable<DateTime> fechaDeBaja, bool cuentaActiva)
        {
            this.cvu = cvu;
            this.idUsuario = idUsuario;
            this.saldo = saldo;
            this.limiteAlDescubierto = limiteAlDescubierto;
            this.interesesAlDescubierto = interesesAlDescubierto;
            this.tipoDeMoneda = tipoDeMoneda;
            this.fechaDeAlta = fechaDeAlta;
            this.fechaDeBaja = fechaDeBaja;
            this.cuentaActiva = cuentaActiva;
        }

        public long Cvu { get => cvu; set => cvu = value; }
        public int IdUsuario { get => idUsuario; set => idUsuario = value; }
        public decimal Saldo { get => saldo; set => saldo = value; }
        public decimal LimiteAlDescubierto { get => limiteAlDescubierto; set => limiteAlDescubierto = value; }
        public byte InteresesAlDescubierto { get => interesesAlDescubierto; set => interesesAlDescubierto = value; }
        public string TipoDeMoneda { get => tipoDeMoneda; set => tipoDeMoneda = value; }
        public DateTime FechaDeAlta { get => fechaDeAlta; set => fechaDeAlta = value; }
        public Nullable<DateTime> FechaDeBaja { get => fechaDeBaja; set => fechaDeBaja = value; }
        public bool CuentaActiva { get => cuentaActiva; set => cuentaActiva = value; }
    }
}