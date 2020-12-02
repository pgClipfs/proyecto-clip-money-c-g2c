using ClipMoney.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ClipMoney.Controllers
{
    public class OperacionController : Controller
    {
        // GET: Operacion
        public ActionResult Index()
        {
            return View();
        }
        //[HttpPost]
        public ActionResult Depositar(decimal monto, int idCuenta)
        {
            Deposito deposito = new Deposito();
            deposito.Monto = monto;
            deposito.IdCuenta = idCuenta;
            deposito.Depositar(monto, idCuenta);
            return View(deposito);
        }
        public ActionResult Extraer(decimal monto, int idCuenta)
        {
            Extraccion extraccion = new Extraccion();
            extraccion.Monto = monto;
            extraccion.IdCuenta = idCuenta;
            extraccion.Extraer(monto, idCuenta);
            return View(extraccion);
        }
        public ActionResult Transferir(decimal monto, int idCuenta, Nullable<int> cvuCbuDestino)
        {
            Transferencia transferencia = new Transferencia();
            transferencia.Monto = monto;
            transferencia.IdCuenta = idCuenta;
            transferencia.CvuCbuDestino = cvuCbuDestino;
            transferencia.Transferir(monto, idCuenta, cvuCbuDestino);
            return View(transferencia);
        }
        public ActionResult GirarAlDescubierto(decimal monto, int idCuenta)
        {
            GiroAlDescubierto giroAlDescubierto = new GiroAlDescubierto();
            giroAlDescubierto.Monto = monto;
            giroAlDescubierto.IdCuenta = idCuenta;
            giroAlDescubierto.GirarAlDescubierto(monto, idCuenta);
            return View(giroAlDescubierto);
        }
        //[HttpGet]
        public ActionResult ObtenerUltimosMovimientos(int idCuenta)
        {
            GestorOperacion gestorOperacion = new GestorOperacion();
            List<OperacionBase> lista = new List<OperacionBase>();
            //lista = gestorOperacion.ObtenerUltimosMovimientos(idCuenta);
            //OperacionBase opEjemplo = lista[0];
            OperacionBase elem1 = new OperacionBase { IdOperacion = 100, Monto = 1000 };
            lista.Add(elem1);
            ViewBag.listaOperaciones = lista;
            return View(gestorOperacion.ObtenerUltimosMovimientos(idCuenta));
        }
    }
}