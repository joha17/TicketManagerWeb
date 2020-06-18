using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace UE_ManagerWebApp.Models
{
    public class Users
    {
        public int Id { get; set; }

        [Display(Name = "Usuario")]
        public string Username { get; set; }

        [Display(Name = "Contraseña")]
        public string Password { get; set; }

        [Display(Name = "Nombre")]
        public string FirstName { get; set; }

        [Display(Name = "Apellidos")]
        public string LastName { get; set; }

        [Display(Name = "Correo Electronico")]
        public string EmailID { get; set; }

        [Display(Name = "Nivel de Acceso")]
        public string AccessLevel { get; set; }

    }
}
