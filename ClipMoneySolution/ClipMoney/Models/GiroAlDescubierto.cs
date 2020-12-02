using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ClipMoney.Models
{
    public class GiroAlDescubierto : OperacionBase
    {
        public GiroAlDescubierto()
        {

        }
        public GiroAlDescubierto(int idOperacion, DateTime fechaDeOperacion, decimal monto, int cvuCbuDestino, int tipoDeOperacion, long idCuenta) : base(idOperacion, fechaDeOperacion, monto, cvuCbuDestino, tipoDeOperacion, idCuenta)
        {
        }
        public void GirarAlDescubierto(decimal monto, int idCuenta)
        {
            string StrConn = "Server=DESKTOP-7SC2IQO\\SQLEXPRESS;Database=db_wallet_clip_money;Trusted_Connection=True;";
            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();

                //conn.Execute("dbo.tr_transference @monto @cvu_cbu_destino @id_cuenta", new { @ammount = monto, @cvu_cbu_destino = cvuCbuDestino, @id_account = idCuenta });

                SqlCommand comm = new SqlCommand();
                comm.CommandText = "dbo.tr_overdraft";
                comm.Connection = conn;
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@ammount", monto));
                comm.Parameters.Add(new SqlParameter("@id_account", IdCuenta));
                comm.ExecuteNonQuery();
            }
        }
    }
}