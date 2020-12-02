using ClipMoney.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Routing;
using System.Web.Http;
using System.Web.Http.Cors;

namespace ClipMoney.Controllers
{
    [Authorize]
    [RoutePrefix("api/usuario")]
    public class UsuarioController : ApiController
    {
        //[Authorize]
        [AllowAnonymous]
        // GET: api/Usuario
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IEnumerable<Usuario> Get()
        {
            GestorUsuario gestorUsuario = new GestorUsuario();
            return gestorUsuario.ObtenerUsuarios();
        }

        // GET: api/Usuario/5
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public Usuario Get(int id)
        {
            GestorUsuario gestorUsuario = new GestorUsuario();
            return gestorUsuario.ObtenerPorId(id);
        }

        // POST: api/Usuario
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public Usuario Post([FromBody] Usuario usuario)
        {
            int id;
            GestorUsuario gestorUsuario = new GestorUsuario();
            id = gestorUsuario.AgregarUsuario(usuario);
            usuario.IdUsuario = id;
            return usuario;
        }

        // PUT: api/Usuario
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public void Put([FromBody] Usuario usuario)
        {
            GestorUsuario gestorUsuario = new GestorUsuario();
            gestorUsuario.ModificarUsuario(usuario);
        }

        // DELETE: api/Usuario/5
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public void Delete(int id)
        {
            GestorUsuario gestorUsuario = new GestorUsuario();
            gestorUsuario.EliminarUsuario(id);
        }
    }
}
