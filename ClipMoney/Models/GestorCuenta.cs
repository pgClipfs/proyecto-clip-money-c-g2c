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
        public int CrearCuenta(Usuario usuario, LoginRequest loginRequest)//Revisar este método
        {
            int id = 0;
            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.CommandText = "dbo.tr_register_client_new_account";
                comm.Connection = conn;
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@nombre", usuario.Nombre));
                comm.Parameters.Add(new SqlParameter("@apellido", usuario.Apellido));
                comm.Parameters.Add(new SqlParameter("@foto_frente_dni", usuario.FotoFrenteDni));
                comm.Parameters.Add(new SqlParameter("@foto_reverso_dni", usuario.FotoReversoDni));
                comm.Parameters.Add(new SqlParameter("@dni", usuario.Dni));
                comm.Parameters.Add(new SqlParameter("@email", usuario.Email));
                comm.Parameters.Add(new SqlParameter("@fecha_nacimiento", usuario.FechaDeNacimiento));
                comm.Parameters.Add(new SqlParameter("@cuilcuit", usuario.CuilCuit));
                comm.Parameters.Add(new SqlParameter("@telefono", usuario.Telefono));
                comm.Parameters.Add(new SqlParameter("@calle", usuario.Calle));
                comm.Parameters.Add(new SqlParameter("@numero_calle", usuario.NumeroDeCalle));
                comm.Parameters.Add(new SqlParameter("@departamento", usuario.Departamento));
                comm.Parameters.Add(new SqlParameter("@piso", usuario.Piso));
                comm.Parameters.Add(new SqlParameter("@puerta", usuario.Puerta));
                comm.Parameters.Add(new SqlParameter("@barrio", usuario.Barrio));
                comm.Parameters.Add(new SqlParameter("@codigo_postal", usuario.CodigoPostal));
                comm.Parameters.Add(new SqlParameter("@localidad", usuario.Localidad));
                comm.Parameters.Add(new SqlParameter("@username", loginRequest.Username));
                comm.Parameters.Add(new SqlParameter("@password", loginRequest.Password));
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
    }
}