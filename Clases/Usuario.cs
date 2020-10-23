using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Billetera.Models
{
    public class Usuario
    {
        private int idUsuario;
        private string nombreUsuario;
        private string apellidoUsuario;
        private string fotoDniFrente;
        private string fotoDniReverso;
        private int dni;
        private string email;
        private DateTime fechaDeNacimiento;
        private long cuitCuil;
        private string telefono;
        private string calle;
        private string numeroDeCalle;
        private string departamento;
        private int piso;
        private string puerta;
        private string barrio;
        private string codigoPostal;
        private string localidad;
        private string provincia;
        private string pais;
        private int idLogin;
        private string nombreLogin;
        private string password;
        private DateTime ultimoAcceso;
        private bool logActivo;
    }
}