using ClipMoney.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace ClipMoney.Controllers
{
    public class UsuarioController : Controller
    {
        // GET: Usuario
        public ActionResult Index()
        {
            return View();
        }


    /*
        [HttpPost]
        [Route("api/Usuario/login")]   //ver las rutas de ellos
        public Usuario login([FromBody]Usuario oUsuario)
        {
            int rpta = 0;
            Usuario oUsuarios = new Usuario();
            using (baseDatos bd = new baseDatos())   // ver ese tema
            {


                SHA256Managed sha = new SHA256Managed();
                byte[] dataNoCifrada = Encoding.Default.GetBytes(oUsuario.Password);
                byte[] dataCifrada = sha.ComputeHash(dataNoCifrada);
                string claveCifrada = BitConverter.ToString(dataCifrada).Replace("-", "");
                // necesito que agregar password a la bd para usarla aca
                rpta = bd.Usuario.Where(p => p.Nombreusuario.ToUpper() == oUsuario.Nombre.ToUpper() && p.password == claveCifrada).Count();
                if (rpta == 1)
                {
                    Usuario oUsuarioRecuperar = bd.Usuario.Where(p => p.Nombreusuario.ToUpper() == oUsuario.Nombre.ToUpper() && p.Contra == claveCifrada).First();
                 // esperar al frond
                    //   HttpContext.Session.SetString("usuario", oUsuario.IdUsuario.ToString());
                    ///////
                    oUsuarios.IdUsuario = oUsuarioRecuperar.IdUsuario;
                    oUsuarios.Nombre = oUsuarioRecuperar.Nombre;
                }
                else
                {
                    oUsuarios.IdUsuario = 0;
                    oUsuarios.Nombre = "";
                }

            }
            return oUsuarios;
        }
     */


    }
}