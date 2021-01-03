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
        static string strConn = ConfigurationManager.ConnectionStrings["BDLocal"].ConnectionString;
        

        public List<Operacion> ObtenerUltimosMovimientos(long cvu)
        {
            List<Operacion> movimientos = new List<Operacion>();
            SqlConnection conn = new SqlConnection(strConn);
            conn.Open();
            SqlCommand comm = new SqlCommand("dbo.proc_last_movements", conn);
            comm.CommandType = System.Data.CommandType.StoredProcedure;
            comm.Parameters.Add(new SqlParameter("@cvu", cvu));
            SqlDataReader dr = comm.ExecuteReader();
            if (dr.Read())
            {
                int id=dr.GetInt32(0);
                DateTime fecha =dr.GetDateTime(1);
                double monto=dr.GetDouble(2);
                long cbu=0;
                if (!dr.IsDBNull(3))
                {
                    cbu = dr.GetInt64(3);
                }
                int tipoOperacion=dr.GetInt32(4);
                string nombreOperacion=dr.GetString(5);
                long idCuenta=dr.GetInt64(6);
                Operacion operacion = new Operacion(id, fecha, monto, cbu, tipoOperacion, nombreOperacion, idCuenta);
                movimientos.Add(operacion);
            }
            dr.Close();
            return movimientos;
        }
    }
}