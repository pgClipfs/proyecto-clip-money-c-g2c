using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ClipMoney.Models
{
    public class UsuarioDTO
    {
        private int idUsuario;
        private string nombre;
        private string apellido;
        private int dni;
        private string email;
        private DateTime fechaDeNacimiento;
        private long cuilCuit;
        private string telefono;
        private string calle;
        private string numeroDeCalle;
        private bool departamento;
        private int piso;
        private string puerta;
        private string barrio;
        private string codigoPostal;
        private string localidad;
        private string provincia;
        private string pais;

        public UsuarioDTO()
        {
        }

        public UsuarioDTO(int idUsuario, string nombre, string apellido, int dni, string email, DateTime fechaDeNacimiento, long cuilCuit, string telefono, string calle, string numeroDeCalle, bool departamento, int piso, string puerta, string barrio, string codigoPostal, string localidad, string provincia, string pais)
        {
            this.idUsuario = idUsuario;
            this.nombre = nombre;
            this.apellido = apellido;
            this.dni = dni;
            this.email = email;
            this.fechaDeNacimiento = fechaDeNacimiento;
            this.cuilCuit = cuilCuit;
            this.telefono = telefono;
            this.calle = calle;
            this.numeroDeCalle = numeroDeCalle;
            this.departamento = departamento;
            this.piso = piso;
            this.puerta = puerta;
            this.barrio = barrio;
            this.codigoPostal = codigoPostal;
            this.localidad = localidad;
            this.provincia = provincia;
            this.pais = pais;
        }

        public int IdUsuario { get => idUsuario; set => idUsuario = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Apellido { get => apellido; set => apellido = value; }
        public int Dni { get => dni; set => dni = value; }
        public string Email { get => email; set => email = value; }
        public DateTime FechaDeNacimiento { get => fechaDeNacimiento; set => fechaDeNacimiento = value; }
        public long CuilCuit { get => cuilCuit; set => cuilCuit = value; }
        public string Telefono { get => telefono; set => telefono = value; }
        public string Calle { get => calle; set => calle = value; }
        public string NumeroDeCalle { get => numeroDeCalle; set => numeroDeCalle = value; }
        public bool Departamento { get => departamento; set => departamento = value; }
        public int Piso { get => piso; set => piso = value; }
        public string Puerta { get => puerta; set => puerta = value; }
        public string Barrio { get => barrio; set => barrio = value; }
        public string CodigoPostal { get => codigoPostal; set => codigoPostal = value; }
        public string Localidad { get => localidad; set => localidad = value; }
        public string Provincia { get => provincia; set => provincia = value; }
        public string Pais { get => pais; set => pais = value; }
    }
}