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

        public string RealizarGiroAlDescubierto(decimal monto, long idCuenta)
        {
            string resultado = "";
            decimal saldo = obtenerSaldo(idCuenta);
            if (monto <= saldo * (decimal)1.10 && monto > saldo && saldo >= 0)
            {
                {
                    using (SqlConnection conn = new SqlConnection(StrConn))
                    {
                        conn.Open();
                        SqlCommand comm = new SqlCommand();
                        comm.CommandText = "dbo.proc_giroAlDescubierto";
                        comm.Connection = conn;
                        comm.CommandType = System.Data.CommandType.StoredProcedure;
                        comm.Parameters.Add(new SqlParameter("@ammount", monto));
                        comm.Parameters.Add(new SqlParameter("@id_account", idCuenta));
                        comm.ExecuteNonQuery();
                        conn.Close();
                    }
                    resultado = "Operación realizada con exitosamente";
                }
            }
            else
            {
                if (saldo < 0)
                {
                    resultado = "No posee dinero en la cuenta";
                }
                else
                {
                    resultado = "El monto debe ser superior a " + (saldo.ToString("0.##")) + " e inferior o igual a " + (saldo * (decimal)1.10).ToString("0.##"); ;
                }
            }
            return resultado;
        }

        public decimal obtenerSaldo(long cvu)
        {
            decimal saldo;
            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                string consulta = "SELECT saldo FROM cuentas WHERE cvu=" + cvu;
                conn.Open();
                SqlCommand comm = new SqlCommand(consulta, conn);
                comm.CommandType = System.Data.CommandType.Text;
                SqlDataReader dr = comm.ExecuteReader();
                dr.Read();
                saldo = dr.GetDecimal(0);
                dr.Close();
            }
            return saldo;
        }

    }
}