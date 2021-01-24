using ClipMoney.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace ClipMoney.Controllers
{
    //[Authorize]
    [AllowAnonymous]
    [RoutePrefix("api/cuenta")]
    public class CuentaController : ApiController
    {
        // GET: api/Cuenta
        [AllowAnonymous]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IEnumerable<Cuenta> Get()
        {
            GestorCuenta gestorCuenta = new GestorCuenta();
            return gestorCuenta.ObtenerCuentas();
        }

        // GET: api/Cuenta/5
        [AllowAnonymous]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public Cuenta Get(int id)
        {
            GestorCuenta gestorCuenta = new GestorCuenta();
            return gestorCuenta.ObtenerPorId(id);
        }

        // POST: api/Cuenta
        [AllowAnonymous]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        //public int Post([FromBody]Usuario usuario, LoginRequest loginRequest)//Revisar esta petición
        //{
        //    int id;
        //    GestorCuenta gestorCuenta = new GestorCuenta();
        //    id = gestorCuenta.CrearCuenta(usuario, loginRequest);
        //    return id;
        //}
        public int Post([FromBody] CrearCuentaInfo crearCuentaInfo)//Revisar esta petición
        {
            int id;
            GestorCuenta gestorCuenta = new GestorCuenta();
            id = gestorCuenta.CrearCuenta(crearCuentaInfo);
            return id;
        }

        // PUT: api/Cuenta/5
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public void Put([FromBody] Cuenta cuenta)
        {
            GestorCuenta gestorCuenta = new GestorCuenta();
            gestorCuenta.ModificarCuenta(cuenta);
        }

        // DELETE: api/Cuenta/5
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public void Delete(int id)
        {
            GestorCuenta gestorCuenta = new GestorCuenta();
            gestorCuenta.DesactivarCuenta(id);
        }

        // POST: api/activate/5
        [Route("activate")]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public void ActivarCuenta([FromBody] Usuario usuario)
        {
            GestorCuenta gestorCuenta = new GestorCuenta();
            gestorCuenta.ActivarCuenta(usuario.IdUsuario, usuario.FotoFrenteDni, usuario.FotoReversoDni);
        }

    }
}