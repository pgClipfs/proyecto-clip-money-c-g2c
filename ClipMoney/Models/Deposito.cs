using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Configuration;

namespace ClipMoney.Models
{
    public class Deposito : OperacionBase
    {
        public Deposito()
        {
        }
        public Deposito(int idOperacion, DateTime fechaDeOperacion, decimal monto, Nullable<long> cvuCbuDestino, int tipoDeOperacion, long idCuenta) : base(idOperacion, fechaDeOperacion, monto, cvuCbuDestino, tipoDeOperacion, idCuenta)
        {
        }
        public void Depositar(decimal monto, int idCuenta)
        {
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();
            //string StrConn = "Server=DESKTOP-7SC2IQO\\SQLEXPRESS;Database=db_wallet_clip_money;Trusted_Connection=True;";
            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();
                //Deposito depositoNuevo = new Deposito(); //usar this.campo o pasar esto a un gestor?

                //Usando Dapper
                //conn.Execute("dbo.proc_make_deposit @monto, @id_cuenta", new { @monto = monto, @id_cuenta = idCuenta });

                //SqlCommand comm = conn.CreateCommand();

                //Usando sentencias normales
                SqlCommand comm = new SqlCommand();
                comm.CommandText = "dbo.proc_make_deposit";
                comm.Connection = conn;
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@monto", monto));
                //comm.Parameters.Add(new SqlParameter("@monto", this.Monto)); Maybe this can be used instead of the signature with parameters.
                comm.Parameters.Add(new SqlParameter("@id_cuenta", idCuenta));
                //comm.Parameters.Add(new SqlParameter("@id_cuenta", this.IdCuenta));
                comm.ExecuteNonQuery();
            }
        }
    }
}