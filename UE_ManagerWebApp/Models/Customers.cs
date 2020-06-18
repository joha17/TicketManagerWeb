using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace UE_ManagerWebApp.Models
{
    public class Customers
    {
        [Key]
        public int Id { get; set; }

        [Display(Name = "Código de Actualización")]
        public string CustomerCode { get; set; }

        [Display(Name = "Nombre")]
        public string CustomerName { get; set; }

        [Display(Name = "Estado")]
        public string Status { get; set; }

        [Display(Name = "Emisor o Adquirente")]
        public string IssuerAdquier { get; set; }

        [Display(Name = "Fecha de Creación")]
        public DateTime? CreationDate { get; set; }

        [Display(Name = "Usuario de Creación")]
        public string CreationUser { get; set; }

        [Display(Name = "Fecha de Actualización")]
        public DateTime? UpdateDate { get; set; }

        [Display(Name = "Usuario de Actualización")]
        public string UpdateUser { get; set; }

        [Display(Name = "Código de Pais")]
        public string CountryCode { get; set; }

        [Display(Name = "Cartera")]
        public int Wallet { get; set; }

        public ICollection<Tickets> Tickets { get; set; }
    }
}
