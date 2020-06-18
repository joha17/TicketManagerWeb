using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace UE_ManagerWebApp.Models
{
    public class Applications
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Id Aplicación")]
        public string ApplicationName { get; set; }

        [Required]
        [Display(Name = "Tipo Aplicación")]
        public int ApplicationType { get; set; }

        [Display(Name = "Departamento")]
        public int DepartmentId { get; set; }

        [Display(Name = "Departamento")]
        public Departments Department { get; set; }

        [Display(Name = "Fecha de Creación")]
        public DateTime? CreationDate { get; set; }

        [Display(Name = "Usuario de Creación")]
        public string CreationUser { get; set; }

        [Display(Name = "Fecha de Actualización")]
        public DateTime? UpdateDate { get; set; }

        [Display(Name = "Usuario de Actualización")]
        public string UpdateUser { get; set; }
        public ICollection<Tickets> Tickets { get; set; }
    }
}
