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
    [RoutePrefix("api/operacion")]
    public class OperacionController : ApiController
    {
        // GET: api/Operation
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/Operation/5
        [AllowAnonymous]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public decimal Get(int id)
        {
            GestorCuenta gestorCuenta = new GestorCuenta();
            return gestorCuenta.ConsultarSaldo(id);
        }

        // POST: api/Operation
        [HttpPost]
        [Route("deposito")]
        [AllowAnonymous]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public void PostDeposit([FromBody] Operacion operacionMontoId)
        {
            Operacion operacion = new Operacion();
            operacion.Monto = operacionMontoId.Monto;
            operacion.IdCuenta = operacionMontoId.IdCuenta;
            operacion.Depositar();
        }

        [HttpPost]
        [Route("extraccion")]
        [AllowAnonymous]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public void PostExtraction([FromBody] Operacion operacionMontoId)
        {
            Operacion operacion = new Operacion();
            operacion.Monto = operacionMontoId.Monto;
            operacion.IdCuenta = operacionMontoId.IdCuenta;
            operacion.Extraer();
        }

        [HttpPost]
        [Route("transferencia")]
        [AllowAnonymous]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public void PostTransferencia([FromBody] Operacion operacionMontoIdCvuDestino)
        {
            Operacion operacion = new Operacion();
            operacion.Monto = operacionMontoIdCvuDestino.Monto;
            operacion.IdCuenta = operacionMontoIdCvuDestino.IdCuenta;
            operacion.CvuCbuDestino = operacionMontoIdCvuDestino.CvuCbuDestino;
            operacion.Transferir();
        }

        // PUT: api/Operation/5
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/Operation/5
        public void Delete(int id)
        {
        }
    }
}