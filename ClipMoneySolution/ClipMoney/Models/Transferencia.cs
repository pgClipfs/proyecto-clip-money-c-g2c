using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ClipMoney.Models
{
    public class Transferencia : OperacionBase
    {
        public Transferencia()
        {

        }
        public Transferencia(int idOperacion, DateTime fechaDeOperacion, decimal monto, int cvuCbuDestino, int tipoDeOperacion, long idCuenta) : base(idOperacion, fechaDeOperacion, monto, cvuCbuDestino, tipoDeOperacion, idCuenta)
        {
        }
        public void Transferir(decimal monto, int idCuenta, Nullable<int> cvuCbuDestino)
        {
            string StrConn = "Server=DESKTOP-7SC2IQO\\SQLEXPRESS;Database=db_wallet_clip_money;Trusted_Connection=True;";
            using(SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                //conn.Execute("dbo.tr_transference @monto @cvu_cbu_destino @id_cuenta", new { @ammount = monto, @cvu_cbu_destino = cvuCbuDestino, @id_account = idCuenta });

                SqlCommand comm = new SqlCommand();
                comm.CommandText = "dbo.tr_transference";
                comm.Connection = conn;
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@monto", monto));
                comm.Parameters.Add(new SqlParameter("@id_cuenta", idCuenta));
                comm.Parameters.Add(new SqlParameter("@cvu_cbu_destino", cvuCbuDestino));
                comm.ExecuteNonQuery();
            }
        }
    }
}