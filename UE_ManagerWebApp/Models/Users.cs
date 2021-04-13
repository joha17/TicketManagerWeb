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

        [Required]
        [Display(Name = "Usuario")]
        public string Username { get; set; }

        [Required]
        [Display(Name = "Contraseña")]
        public string Password { get; set; }

        [Required]
        [Display(Name = "Nombre")]
        public string FirstName { get; set; }

        [Required]
        [Display(Name = "Apellidos")]
        public string LastName { get; set; }

        [Required]
        [Display(Name = "Correo Electronico")]
        public string EmailID { get; set; }

        [Required]
        [Display(Name = "Nivel de Acceso")]
        public string AccessLevel { get; set; }

        [Display(Name = "Departamento")]
        public int DepartmentId { get; set; }
        public Departments Department { get; set; }

    }
}
