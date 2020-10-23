using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Billetera.Models
{
    public class Operacion
    {
        private int idOperacion;
        private DateTime fechaDeOperacion;
        private decimal monto;
        private long cbuDestino;
        private long cvuDestino;
        private TipoDeOperacion tipoDeOperacion;
        private Cuenta cuenta;
    }
}