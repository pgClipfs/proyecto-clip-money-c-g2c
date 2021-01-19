using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace ClipMoney.Models
{
    public class Operacion
    {
        private int idOperacion;
        private DateTime fechaDeOperacion;
        private decimal monto;
        private Nullable<long> cvuCbuDestino;
        private int tipoDeOperacion;
        //private long cbu;
        private string nombreOperacion;
        private long idCuenta;

        public Operacion()
        {

        }

        public Operacion(decimal monto, int idOperacion)
        {

        }

        public Operacion(int idOperacion, DateTime fechaDeOperacion, decimal monto, Nullable<long> cvuCbuDestino, int tipoDeOperacion, long idCuenta)
        {
            this.idOperacion = idOperacion;
            this.fechaDeOperacion = fechaDeOperacion;
            this.monto = monto;
            this.cvuCbuDestino = cvuCbuDestino;
            this.tipoDeOperacion = tipoDeOperacion;
            this.idCuenta = idCuenta;
        }
        //Constructor para ultimos movimientos
        public Operacion(int idOperacion, DateTime fechaDeOperacion, decimal monto, Nullable<long> cvuCbuDestino, int tipoDeOperacion, string nombreOperacion, long idCuenta)
        {
            this.idOperacion = idOperacion;
            this.fechaDeOperacion = fechaDeOperacion;
            this.monto = monto;
            this.cvuCbuDestino = cvuCbuDestino;
            this.tipoDeOperacion = tipoDeOperacion;
            this.idCuenta = idCuenta;
            this.nombreOperacion = nombreOperacion;
        }

        //Constructor para giro al descubierto
        public Operacion( decimal monto, long idCuenta)
        {
            this.monto = monto;
            this.idCuenta = idCuenta;
        }

        public int IdOperacion { get => idOperacion; set => idOperacion = value; }
        public DateTime FechaDeOperacion { get => fechaDeOperacion; set => fechaDeOperacion = value; }
        public decimal Monto { get => monto; set => monto = value; }
        public int TipoDeOperacion { get => tipoDeOperacion; set => tipoDeOperacion = value; }
        public long IdCuenta { get => idCuenta; set => idCuenta = value; }
        public Nullable<long> CvuCbuDestino { get => cvuCbuDestino; set => cvuCbuDestino = value; }

        public void Depositar()
        {
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();
            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.CommandText = "dbo.proc_make_deposit";
                comm.Connection = conn;
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@monto", this.Monto));
                comm.Parameters.Add(new SqlParameter("@id_cuenta", this.IdCuenta));
                comm.ExecuteNonQuery();
            }
        }
    }

}

        /*public Operacion(int id, DateTime fecha, decimal monto, long cbu, int tipoOperacion, string nombreOperacion, long idCuenta)
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
        public decimal Monto { get => monto; set => monto = value; }
        public long Cbu { get => cbu; set => cbu = value; }
        public int TipoOperacion { get => tipoOperacion; set => tipoOperacion = value; }
        public string NombreOperacion { get => nombreOperacion; set => nombreOperacion = value; }
        public long IdCuenta { get => idCuenta; set => idCuenta = value; }*/