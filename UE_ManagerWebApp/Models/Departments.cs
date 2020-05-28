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

        public string Name { get; set; }

        public DateTime? Creation_Date { get; set; }

        public string Create_User { get; set; }

        public DateTime? Update_Date { get; set; }

        public string Update_User { get; set; }

        public ICollection<Applications> Applications { get; set; }
        public ICollection<Tickets> Tickets { get; set; }
    }
}
