﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ClipMoney.Models
{
    public class LoginRequest //¿Es necesaria una clase Login?
    {
        private string username;
        private string password;

        public string Username { get => username; set => username = value; }
        public string Password { get => password; set => password = value; }
    }
}