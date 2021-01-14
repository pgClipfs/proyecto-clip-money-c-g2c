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
    [RoutePrefix("api/movimientos")]
    public class MovimientosController : ApiController
    {
        // GET: api/Movimientos
        public IEnumerable<string> Get()
        {
            return new string[] { "valuej1", "value2" };
        }

        // GET: api/Movimientos/5
        [AllowAnonymous]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public List<Operacion> Get(int id)
        {
            GestorOperaciones gestorOperaciones = new GestorOperaciones();
            List<Operacion> movimientos = gestorOperaciones.ObtenerUltimosMovimientos(id);
            return movimientos;     
            //return new Operacion();
        }

        // POST: api/Movimientos
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Movimientos/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Movimientos/5
        public void Delete(int id)
        {
        }
    }
}
