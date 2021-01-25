using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ClipMoney.Models
{
    public class GestorCuenta
    {
        string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ConnectionString;

        public Cuenta ObtenerPorId(long cvu)
        {
            Cuenta c = null;
            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand("dbo.proc_obtener_cuenta", conn);
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@cvu", cvu));
                SqlDataReader dr = comm.ExecuteReader();
                if (dr.Read())
                {
                    //long cvu = dr.GetInt64(0);
                    int idUsuario = dr.GetInt32(1);
                    decimal saldo = dr.GetDecimal(2);
                    decimal limiteAlDescubierto = dr.GetDecimal(3);
                    byte interesesAlDescubierto = dr.GetByte(4);
                    string tipoDeMoneda = dr.GetString(5);
                    DateTime fechaDeAlta = dr.GetDateTime(6);
                    Nullable<DateTime> fechaDeBaja;
                    if (dr.IsDBNull(7))
                    {
                        fechaDeBaja = null;
                    }
                    else
                    {
                        fechaDeBaja = dr.GetDateTime(7);
                    }
                    Boolean cuentaActiva = dr.GetBoolean(8);
                    c = new Cuenta(cvu, idUsuario, saldo, limiteAlDescubierto, interesesAlDescubierto, tipoDeMoneda, fechaDeAlta, fechaDeBaja, cuentaActiva);
                }
                dr.Close();
            }
            return c;
        }
        public List<Cuenta> ObtenerCuentas()
        {
            List<Cuenta> lista = new List<Cuenta>();
            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand("dbo.proc_obtener_cuentas", conn);
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataReader dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    long cvu = dr.GetInt64(0);
                    int idUsuario = dr.GetInt32(1);
                    decimal saldo = dr.GetDecimal(2);
                    decimal limiteAlDescubierto = dr.GetDecimal(3);
                    byte interesesAlDescubierto = dr.GetByte(4);
                    string tipoDeMoneda = dr.GetString(5);
                    DateTime fechaDeAlta = dr.GetDateTime(6);
                    Nullable<DateTime> fechaDeBaja;
                    if (dr.IsDBNull(7))
                    {
                        fechaDeBaja = null;
                    }
                    else
                    {
                        fechaDeBaja = dr.GetDateTime(7);
                    }
                    Boolean cuentaActiva = dr.GetBoolean(8);
                    Cuenta c;
                    c = new Cuenta(cvu, idUsuario, saldo, limiteAlDescubierto, interesesAlDescubierto, tipoDeMoneda, fechaDeAlta, fechaDeBaja, cuentaActiva);
                    lista.Add(c);
                }
                dr.Close();
            }
            return lista;
        }
        public int CrearCuenta(CrearCuentaInfo crearCuentaInfo)//Revisar este método
        {
            int id = 0;
            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.CommandText = "dbo.tr_register_client_new_account";
                comm.Connection = conn;
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@nombre", crearCuentaInfo.Nombre));
                comm.Parameters.Add(new SqlParameter("@apellido", crearCuentaInfo.Apellido));
                comm.Parameters.Add(new SqlParameter("@foto_frente_dni", crearCuentaInfo.FotoFrenteDni));
                comm.Parameters.Add(new SqlParameter("@foto_reverso_dni", crearCuentaInfo.FotoReversoDni));
                comm.Parameters.Add(new SqlParameter("@dni", crearCuentaInfo.Dni));
                comm.Parameters.Add(new SqlParameter("@email", crearCuentaInfo.Email));
                comm.Parameters.Add(new SqlParameter("@fecha_nacimiento", crearCuentaInfo.FechaDeNacimiento));
                comm.Parameters.Add(new SqlParameter("@cuilcuit", crearCuentaInfo.CuilCuit));
                comm.Parameters.Add(new SqlParameter("@telefono", crearCuentaInfo.Telefono));
                comm.Parameters.Add(new SqlParameter("@calle", crearCuentaInfo.Calle));
                comm.Parameters.Add(new SqlParameter("@numero_calle", crearCuentaInfo.NumeroDeCalle));
                comm.Parameters.Add(new SqlParameter("@departamento", crearCuentaInfo.Departamento));
                comm.Parameters.Add(new SqlParameter("@piso", crearCuentaInfo.Piso));
                comm.Parameters.Add(new SqlParameter("@puerta", crearCuentaInfo.Puerta));
                comm.Parameters.Add(new SqlParameter("@barrio", crearCuentaInfo.Barrio));
                comm.Parameters.Add(new SqlParameter("@codigo_postal", crearCuentaInfo.CodigoPostal));
                comm.Parameters.Add(new SqlParameter("@id_localidad", crearCuentaInfo.IdLocalidad));
                comm.Parameters.Add(new SqlParameter("@username", crearCuentaInfo.Username));
                comm.Parameters.Add(new SqlParameter("@password", crearCuentaInfo.Password));
                comm.Parameters.Add(new SqlParameter("@preguntaSecreta", crearCuentaInfo.PreguntaSecreta));
                comm.Parameters.Add(new SqlParameter("@respuestaSecreta", crearCuentaInfo.RespuestaSecreta));
                id = Convert.ToInt32(comm.ExecuteScalar());//Aquí quizás debiera tomar el id de la cuenta pero esta tomando el del usuario
                //SqlDataReader dr = comm.ExecuteReader(); //Con este sqldatareader quizás es una solución para obtener los id necesarios
                //while (dr.Read())
                //{
                //    int idUsuario = dr.GetInt32(0);
                //    int idLogin = dr.GetInt32(18);
                //    long cvuCuenta = dr.GetInt64(22);
                //}
                //dr.Close();
            }
            return id;
        }
        public void ModificarCuenta(Cuenta cuenta)
        {
            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.CommandText = "dbo.proc_modificar_cuenta";
                comm.Connection = conn;
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@cvu", cuenta.Cvu));
                comm.Parameters.Add(new SqlParameter("@id_us", cuenta.IdUsuario));
                comm.Parameters.Add(new SqlParameter("@saldo", cuenta.Saldo));
                comm.Parameters.Add(new SqlParameter("@limite_al_descubierto", cuenta.LimiteAlDescubierto));
                comm.Parameters.Add(new SqlParameter("@intereses_al_descubierto", cuenta.InteresesAlDescubierto));
                comm.Parameters.Add(new SqlParameter("@tipo_de_moneda", cuenta.TipoDeMoneda));
                comm.Parameters.Add(new SqlParameter("@fecha_alta", cuenta.FechaDeAlta));
                comm.Parameters.Add(new SqlParameter("@fecha_baja", cuenta.FechaDeBaja));
                comm.Parameters.Add(new SqlParameter("@cuenta_activa", cuenta.CuentaActiva));
                comm.ExecuteNonQuery();
            }
        }
        public void DesactivarCuenta(int cvu)//Cambiar por desactivar cuenta o usuario
        {
            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand("proc_desactivar_cuenta", conn);
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@cvu", cvu));
                comm.ExecuteNonQuery();
            }
        }
        public decimal ConsultarSaldo(long cvu)
        {
            decimal saldo = 0;
            string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand("select saldo from cuentas where cvu = @cvu", conn);
                //comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@cvu", cvu));
                SqlDataReader dr = comm.ExecuteReader();
                if (dr.Read())
                {
                    saldo = dr.GetDecimal(0);
                }
                dr.Close();
            }

            return saldo;
        }

        public void ActivarCuenta(int idUsuario, string frente, string reverso)
        {
            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.CommandText = "dbo.proc_activar_cuenta";
                comm.Connection = conn;
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@idUsuario", idUsuario));
                comm.Parameters.Add(new SqlParameter("@frenteDNI", frente));
                comm.Parameters.Add(new SqlParameter("@reversoDNI", reverso));
                comm.ExecuteNonQuery();
            }
        }
    }
}