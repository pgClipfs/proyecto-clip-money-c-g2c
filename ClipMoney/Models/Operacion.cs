using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ClipMoney.Models
{
    public class Operacion
    {
        private int id;
        private DateTime fecha;
        private double monto;
        private long cbu;
        private int tipoOperacion;
        private string nombreOperacion;
        private long idCuenta;

        public Operacion()
        {
        }

        public Operacion(int id, DateTime fecha, double monto, long cbu, int tipoOperacion, string nombreOperacion, long idCuenta)
        {
            this.Id = id;
            this.Fecha = fecha;
            this.Monto = monto;
            this.Cbu = cbu;
            this.TipoOperacion = tipoOperacion;
            this.NombreOperacion = nombreOperacion;
            this.IdCuenta = idCuenta;
        }

        public int Id { get => id; set => id = value; }
        public DateTime Fecha { get => fecha; set => fecha = value; }
        public double Monto { get => monto; set => monto = value; }
        public long Cbu { get => cbu; set => cbu = value; }
        public int TipoOperacion { get => tipoOperacion; set => tipoOperacion = value; }
        public string NombreOperacion { get => nombreOperacion; set => nombreOperacion = value; }
        public long IdCuenta { get => idCuenta; set => idCuenta = value; }
    }
}