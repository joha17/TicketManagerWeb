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

        public string CustomerCode { get; set; }

        public string CustomerName { get; set; }

        public string Status { get; set; }

        public string IssuerAdquier { get; set; }

        public DateTime? CreationDate { get; set; }

        public string CreationUser { get; set; }

        public DateTime? UpdateDate { get; set; }

        public string UpdateUser { get; set; }

        public string CountryCode { get; set; }

        public int Wallet { get; set; }

        public ICollection<Tickets> Tickets { get; set; }
    }
}
