using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ClipMoney.Models
{
    public class Usuario
    {
        private int idUsuario;
        private string nombre;
        private string apellido;
        private string fotoFrenteDni;
        private string fotoReversoDni;
        private int dni;
        private string email;
        private DateTime fechaDeNacimiento;
        private int cuilCuit;
        private string telefono;
        private string calle;
        private int numeroDeCalle;
        private bool departamento; //use Nullable type ?
        private int piso;
        private string puerta;
        private string barrio;
        private string codigoPostal;
        private int idLocalidad;
        //private string provincia; ¿Se incluyen estos campos?
        //private string pais;

        public Usuario()
        {

        }
        public Usuario(string nombre, string apellido)//constructor temporal para simplificar el proceso de construccion de controlador de usuario
        {
            this.nombre = nombre;
            this.apellido = apellido;
        }
        public Usuario(int idUsuario, string nombre, string apellido, string fotoFrenteDni, string fotoReversoDni, int dni, string email, DateTime fechaDeNacimiento, int cuilCuit, string telefono, string calle, int numeroDeCalle, bool departamento, int piso, string puerta, string barrio, string codigoPostal, int idLocalidad)
        {
            this.idUsuario = idUsuario;
            this.nombre = nombre;
            this.apellido = apellido;
            this.fotoFrenteDni = fotoFrenteDni;
            this.fotoReversoDni = fotoReversoDni;
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
            this.idLocalidad = idLocalidad;
            //this.provincia = provincia;
            //this.pais = pais;
        }

        public int IdUsuario { get => idUsuario; set => idUsuario = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Apellido { get => apellido; set => apellido = value; }
        public string FotoFrenteDni { get => fotoFrenteDni; set => fotoFrenteDni = value; }
        public string FotoReversoDni { get => fotoReversoDni; set => fotoReversoDni = value; }
        public int Dni { get => dni; set => dni = value; }
        public string Email { get => email; set => email = value; }
        public DateTime FechaDeNacimiento { get => fechaDeNacimiento; set => fechaDeNacimiento = value; }
        public int CuilCuit { get => cuilCuit; set => cuilCuit = value; }
        public string Telefono { get => telefono; set => telefono = value; }
        public string Calle { get => calle; set => calle = value; }
        public int NumeroDeCalle { get => numeroDeCalle; set => numeroDeCalle = value; }
        public bool Departamento { get => departamento; set => departamento = value; }
        public int Piso { get => piso; set => piso = value; }
        public string Puerta { get => puerta; set => puerta = value; }
        public string Barrio { get => barrio; set => barrio = value; }
        public string CodigoPostal { get => codigoPostal; set => codigoPostal = value; }
        public int IdLocalidad { get => idLocalidad; set => idLocalidad = value; }
        //public string Provincia { get => provincia; set => provincia = value; }
        //public string Pais { get => pais; set => pais = value; }
    }
}