using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ClipMoney.Models
{
    public class GestorUsuario
    {
        string StrConn = ConfigurationManager.ConnectionStrings["BDLocal"].ConnectionString;

        public Usuario ObtenerPorId(int id)
        {
            Usuario u = null;
            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand("dbo.proc_obtener_usuario", conn);
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@id", id));
                SqlDataReader dr = comm.ExecuteReader();
                if (dr.Read())
                {
                    string nombre = dr.GetString(0);
                    string apellido = dr.GetString(1);
                    u = new Usuario(nombre, apellido);
                }
                dr.Close();
            }
            return u;
        }

        public List<Usuario> ObtenerUsuarios()
        {
            List<Usuario> lista = new List<Usuario>();
            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand("dbo.proc_obtener_usuarios", conn);
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataReader dr = comm.ExecuteReader();
                while (dr.Read())
                {
                    //int idUsuario = dr.GetInt32(0);
                    string nombre = dr.GetString(1);
                    string apellido = dr.GetString(2);
                    Usuario u = new Usuario(nombre, apellido);
                    lista.Add(u);
                }
                dr.Close();
            }
            return lista;
        }

        public int AgregarUsuario(Usuario nuevo)
        {
            int id = 0;
            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.CommandText = "dbo.proc_agregar_usuario";
                comm.Connection = conn;
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@nombre", nuevo.Nombre));
                comm.Parameters.Add(new SqlParameter("@apellido", nuevo.Apellido));
                comm.Parameters.Add(new SqlParameter("@foto_frente_dni", nuevo.FotoFrenteDni));
                comm.Parameters.Add(new SqlParameter("@foto_reverso_dni", nuevo.FotoReversoDni));
                comm.Parameters.Add(new SqlParameter("@dni", nuevo.Dni));
                comm.Parameters.Add(new SqlParameter("@email", nuevo.Email));
                comm.Parameters.Add(new SqlParameter("@fecha_nacimiento", nuevo.FechaDeNacimiento));
                comm.Parameters.Add(new SqlParameter("@cuilcuit", nuevo.CuilCuit));
                comm.Parameters.Add(new SqlParameter("@telefono", nuevo.Telefono));
                comm.Parameters.Add(new SqlParameter("@calle", nuevo.Calle));
                comm.Parameters.Add(new SqlParameter("@numero_calle", nuevo.NumeroDeCalle));
                comm.Parameters.Add(new SqlParameter("@departamento", nuevo.Departamento));
                comm.Parameters.Add(new SqlParameter("@piso", nuevo.Piso));
                comm.Parameters.Add(new SqlParameter("@puerta", nuevo.Puerta));
                comm.Parameters.Add(new SqlParameter("@barrio", nuevo.Barrio));
                comm.Parameters.Add(new SqlParameter("@codigo_postal", nuevo.CodigoPostal));
                comm.Parameters.Add(new SqlParameter("@localidad", nuevo.Localidad));
                id = Convert.ToInt32(comm.ExecuteScalar());
            }
            return id;
        }

        public void ModificarUsuario(Usuario nuevo)
        {
            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.CommandText = "dbo.proc_modificar_usuario";
                comm.Connection = conn;
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@idUsuario", nuevo.IdUsuario));
                comm.Parameters.Add(new SqlParameter("@nombre", nuevo.Nombre));
                comm.Parameters.Add(new SqlParameter("@apellido", nuevo.Apellido));
                comm.Parameters.Add(new SqlParameter("@foto_frente_dni", nuevo.FotoFrenteDni));
                comm.Parameters.Add(new SqlParameter("@foto_reverso_dni", nuevo.FotoReversoDni));
                comm.Parameters.Add(new SqlParameter("@dni", nuevo.Dni));
                comm.Parameters.Add(new SqlParameter("@email", nuevo.Email));
                comm.Parameters.Add(new SqlParameter("@fecha_nacimiento", nuevo.FechaDeNacimiento));
                comm.Parameters.Add(new SqlParameter("@cuilcuit", nuevo.CuilCuit));
                comm.Parameters.Add(new SqlParameter("@telefono", nuevo.Telefono));
                comm.Parameters.Add(new SqlParameter("@calle", nuevo.Calle));
                comm.Parameters.Add(new SqlParameter("@numero_calle", nuevo.NumeroDeCalle));
                comm.Parameters.Add(new SqlParameter("@departamento", nuevo.Departamento));
                comm.Parameters.Add(new SqlParameter("@piso", nuevo.Piso));
                comm.Parameters.Add(new SqlParameter("@puerta", nuevo.Puerta));
                comm.Parameters.Add(new SqlParameter("@barrio", nuevo.Barrio));
                comm.Parameters.Add(new SqlParameter("@codigo_postal", nuevo.CodigoPostal));
                comm.Parameters.Add(new SqlParameter("@localidad", nuevo.Localidad));
                comm.ExecuteNonQuery();
            }
        }

        public void EliminarUsuario(int id)//Cambiar por desactivar cuenta o usuario
        {
            using (SqlConnection conn = new SqlConnection(StrConn))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand("proc_eliminar_usuario", conn);
                comm.CommandType = System.Data.CommandType.StoredProcedure;
                comm.Parameters.Add(new SqlParameter("@Id", id));
                comm.ExecuteNonQuery();
            }
        }
    }
}