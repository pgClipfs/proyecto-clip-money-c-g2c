﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Web.Http;
using System.Web.Http.Cors;
using ClipMoney.Models;

namespace ClipMoney.Controllers
{
    [AllowAnonymous]
    [RoutePrefix("api/login")]
    public class LoginController : ApiController
    {
        [HttpGet]
        [Route("echoping")]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult EchoPing()
        {
            return Ok(true);
        }

        [HttpGet]
        [Route("echouser")]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult EchoUser()
        {
            var identity = Thread.CurrentPrincipal.Identity;
            return Ok($" IPrincipal-user: {identity.Name} - IsAuthenticated: {identity.IsAuthenticated}");
        }

        [HttpPost]
        [Route("idcuenta")]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public long ObtenerId(LoginRequest loginRequest)
        {
            GestorLogin gestorLogin = new GestorLogin();
            return gestorLogin.ObtenerIdCuenta(loginRequest);
        }

        [HttpPost]
        [Route("authenticate")]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult Authenticate(LoginRequest login)
        {
            if (login == null)
                throw new HttpResponseException(HttpStatusCode.BadRequest);

            GestorLogin gLogin = new GestorLogin();

            bool isCredentialValid = gLogin.ValidarLogin(login);

            if (isCredentialValid)
            {
                var token = TokenGenerator.GenerateTokenJwt(login.Username);
                return Ok(token);
            }
            else
            {
                return Unauthorized();
            }
        }
    }
}