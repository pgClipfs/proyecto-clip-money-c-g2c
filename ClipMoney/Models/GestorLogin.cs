using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

namespace ClipMoney.Models
{
    public class GestorLogin
    {
        public bool ValidarLogin(LoginRequest ploginRequest)
        {
            string strConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();
            bool result = false;

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();

                SqlCommand comm = new SqlCommand("dbo.proc_obtener_login", conn);
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@username", ploginRequest.Username));
                comm.Parameters.Add(new SqlParameter("@password", ploginRequest.Password));

                SqlDataReader reader = comm.ExecuteReader();

                if (reader.HasRows)
                {
                    result = true;
                }

            }
            return result;

        }
        public long ObtenerIdCuenta(LoginRequest loginRequest)
        {
            string strConn = ConfigurationManager.ConnectionStrings["BDLocal"].ToString();
            long cvu = 0;

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();

                SqlCommand comm = new SqlCommand("dbo.proc_obtener_login", conn);
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@username", loginRequest.Username));
                comm.Parameters.Add(new SqlParameter("@password", loginRequest.Password));

                SqlDataReader reader = comm.ExecuteReader();

                if (reader.Read())
                {
                    cvu = reader.GetInt64(4);
                }

            }
            return cvu;
        }
    }
}