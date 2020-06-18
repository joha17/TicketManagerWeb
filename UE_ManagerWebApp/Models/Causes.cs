using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace UE_ManagerWebApp.Models
{
    public class Causes
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Descripción")]
        public string Description { get; set; }

        [Display(Name = "Fecha de Creación")]
        public DateTime? CreationDate { get; set; }

        [Display(Name = "Usuario de Actualización")]
        public string CreationUser { get; set; }

        [Display(Name = "Fecha de Actualización")]
        public DateTime? UpdateDate { get; set; }

        [Display(Name = "Usuario de Actualización")]
        public string UpdateUser { get; set; }

        public ICollection<Tickets> Tickets { get; set; }
    }
}
