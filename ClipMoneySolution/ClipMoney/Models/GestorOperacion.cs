using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ClipMoney.Models
{
    public class GestorOperacion
    {
        public List<OperacionBase> ObtenerUltimosMovimientos(int idCuenta)
        {
            List<OperacionBase> lista = new List<OperacionBase>();
            string StrConn = "Server=DESKTOP-7SC2IQO\\SQLEXPRESS;Database=db_wallet_clip_money;Trusted_Connection=True;";
            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();
                //var output = conn.Query<OperacionBase>("dbo.proc_last_movements @id_account", new { id_account = idCuenta } ).ToList();
                //return output;

                //Usando sentencias normales
                SqlCommand comm = new SqlCommand();
                comm.CommandText = "dbo.proc_last_movements";
                comm.Connection = conn;
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@id_account", idCuenta));
                //comm.ExecuteNonQuery();
                SqlDataReader dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    byte idOperacion = dr.GetByte(0);
                    DateTime fechaDeOperacion = dr.GetDateTime(1);
                    decimal monto = dr.GetDecimal(2);
                    int cvuCbuDestino;
                    if (dr.IsDBNull(3))
                    {
                        cvuCbuDestino = 0;
                    }
                    else
                    {
                        cvuCbuDestino = dr.GetInt32(3);
                    }
                    byte tipoOperacion = dr.GetByte(5);
                    long idDeCuenta = dr.GetInt64(6);
                    OperacionBase op = new OperacionBase(idOperacion, fechaDeOperacion, monto, cvuCbuDestino, tipoOperacion, idDeCuenta);
                    lista.Add(op);
                }
                dr.Close();
            }
            return lista;
        }
    }
}