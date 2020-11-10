using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ClipMoney.Models
{
    public class OperacionBase
    {
        private int idOperacion;
        private DateTime fechaDeOperacion;
        private decimal monto;
        private Nullable<int> cvuCbuDestino;
        private int tipoDeOperacion;
        private long idCuenta;

        public OperacionBase()
        {

        }

        public OperacionBase(int idOperacion, DateTime fechaDeOperacion, decimal monto, Nullable<int> cvuCbuDestino, int tipoDeOperacion, long idCuenta)
        {
            this.idOperacion = idOperacion;
            this.fechaDeOperacion = fechaDeOperacion;
            this.monto = monto;
            this.cvuCbuDestino = cvuCbuDestino;
            this.tipoDeOperacion = tipoDeOperacion;
            this.idCuenta = idCuenta;
        }

        public int IdOperacion { get => idOperacion; set => idOperacion = value; }
        public DateTime FechaDeOperacion { get => fechaDeOperacion; set => fechaDeOperacion = value; }
        public decimal Monto { get => monto; set => monto = value; }
        public int TipoDeOperacion { get => tipoDeOperacion; set => tipoDeOperacion = value; }
        public long IdCuenta { get => idCuenta; set => idCuenta = value; }
        public Nullable<int> CvuCbuDestino { get => cvuCbuDestino; set => cvuCbuDestino = value; }

        //public abstract void Operar(decimal monto, int idCuenta); comentado porque las clases derivadas toman distintos parámetros
    }
    
}