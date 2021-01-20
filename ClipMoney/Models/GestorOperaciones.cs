using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ClipMoney.Models
{
    public class GestorOperaciones
    {
        static string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ConnectionString;
        

        public List<Operacion> ObtenerUltimosMovimientos(long cvu)
        {
            List<Operacion> movimientos = new List<Operacion>();
            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand("dbo.proc_last_movements", conn);
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@id_account", cvu));
                SqlDataReader dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    int id = dr.GetInt16(0);
                    DateTime fecha = dr.GetDateTime(1);
                    decimal monto = dr.GetDecimal(2);
                    long cbu = 0;
                    if (!dr.IsDBNull(3))
                    {
                        cbu = dr.GetInt64(3);
                    }
                    int tipoOperacion = dr.GetInt16(4);
                    string nombreOperacion = dr.GetString(5);
                    long idCuenta = dr.GetInt64(6);
                    Operacion operacion = new Operacion(id, fecha, monto, cbu, tipoOperacion, nombreOperacion, idCuenta);
                    movimientos.Add(operacion);
                }
                dr.Close();
            }
            return movimientos;
        }

        public void RealizarGiroAlDescubierto(decimal monto, long idCuenta)
        {
            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.CommandText = "dbo.tr_overdraft2";
                comm.Connection = conn;
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@ammount", monto));
                comm.Parameters.Add(new SqlParameter("@id_account", idCuenta));
                comm.ExecuteNonQuery();
            }
        }
    }
}