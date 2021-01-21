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
    [RoutePrefix("api/giro")]
    public class GiroController : ApiController
    {
        // GET: api/Giro
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/Giro/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Giro
        [AllowAnonymous]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public string Post([FromBody] Operacion operacion)
        {
            GestorOperaciones gestorOperaciones = new GestorOperaciones();
            return gestorOperaciones.RealizarGiroAlDescubierto(operacion.Monto, operacion.IdCuenta);
        }

        // PUT: api/Giro/1
        
        public string Put([FromBody] string value)
        {
            return value;
            
        }

        // DELETE: api/Giro/5
        public void Delete(int id)
        {
        }
    }
}
