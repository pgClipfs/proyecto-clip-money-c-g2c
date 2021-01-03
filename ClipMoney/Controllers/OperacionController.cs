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
    [Authorize]
    [RoutePrefix("api/operacion")]
    public class OperacionController : ApiController
    {
        // GET: api/Operation
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/Operacion/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Operation
        [AllowAnonymous]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public void Post([FromBody] ParametroParaDeposito parametroParaDeposito)
        {
            Deposito deposito = new Deposito();
            deposito.Monto = parametroParaDeposito.Monto;
            deposito.IdCuenta = parametroParaDeposito.IdCuenta;
            deposito.Depositar(parametroParaDeposito.Monto, parametroParaDeposito.IdCuenta);
            //retornar id de la operacion?
        }
        //public void Post([FromBody] decimal monto, int id)
        //{
        //    Deposito deposito = new Deposito();
        //    deposito.Monto = monto;
        //    deposito.IdCuenta = id;
        //    deposito.Depositar(monto, id);
        //    //retornar id de la operacion?
        //}

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