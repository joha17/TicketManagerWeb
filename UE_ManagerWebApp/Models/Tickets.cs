using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace UE_ManagerWebApp.Models
{
    public class Tickets
    {
        [Key]
        [Display(Name = "ID")]
        public int Id { get; set; }

        [Display(Name = "#Incidente")]
        public string TicketNumber { get; set; }

        [Display(Name = "Palabra Clave")]
        public string Keyword { get; set; }

        [Display(Name = "Fecha de  Asignación")]
        public DateTime? AssignDate { get; set; }

        [Display(Name = "Fecha Final")]
        public DateTime? EndDate { get; set; }

        [Display(Name = "Comentario")]
        public string Comment { get; set; }

        [Display(Name = "Usuario de Creación")]
        public string CreationUser { get; set; }

        [Display(Name = "Fecha de Creación")]
        public DateTime? CreationDate { get; set; }

        [Display(Name = "Usuario de Creación")]
        public string UpdateUser { get; set; }

        [Display(Name = "Fecha de Actualización")]
        public DateTime? UpdateDate { get; set; }

        [Display(Name = "Fecha de Asignación")]
        public string AssignUser { get; set; }

        [Display(Name = "Id Aplicación")]
        public int ApplicationId { get; set; }
        public Applications Application { get; set; }


        [Display(Name = "Causa Raiz")]
        public int CauseId { get; set; }
        public Causes Cause { get; set; }

        [Display(Name = "Departamento")]
        public int DepartmentId { get; set; }
        public Departments Department { get; set; }

        [Display(Name = "Cliente")]
        public int CustomerId { get; set; }
        public Customers Customer { get; set; }

    }
}
