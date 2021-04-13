using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace UE_ManagerWebApp.Models
{
    public class Departments
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Nombre")]
        public string Name { get; set; }

        [Display(Name = "Fecha de Creación")]
        public DateTime? Creation_Date { get; set; }

        [Display(Name = "Usuario de Creación")]
        public string Create_User { get; set; }

        [Display(Name = "Fecha de Actualización")]
        public DateTime? Update_Date { get; set; }

        [Display(Name = "Usuario de Actualización")]
        public string Update_User { get; set; }


    }
}
