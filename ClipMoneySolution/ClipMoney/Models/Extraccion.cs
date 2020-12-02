using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ClipMoney.Models
{
    public class Extraccion : OperacionBase
    {
        public Extraccion()
        {

        }
        public Extraccion(int idOperacion, DateTime fechaDeOperacion, decimal monto, int cvuCbuDestino, int tipoDeOperacion, long idCuenta) : base(idOperacion, fechaDeOperacion, monto, cvuCbuDestino, tipoDeOperacion, idCuenta)
        {
        }
        public void Extraer(decimal monto, int idCuenta)
        {
            string StrConn = "Server=DESKTOP-7SC2IQO\\SQLEXPRESS;Database=db_wallet_clip_money;Trusted_Connection=True;";
            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();
                //usando dapper da error: incorrect sintax near "@id_account"
                //conn.Execute("dbo.proc_do_extraction @ammount @id_account", new { @ammount = monto, @id_account = idCuenta });

                SqlCommand comm = new SqlCommand();
                comm.CommandText = "dbo.proc_do_extraction";
                comm.Connection = conn;
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@ammount", monto));
                comm.Parameters.Add(new SqlParameter("@id_account", idCuenta));
                comm.ExecuteNonQuery();
            }
        }
    }
}