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

        public string Description { get; set; }

        public DateTime? CreationDate { get; set; }

        public string CreationUser { get; set; }

        public DateTime? UpdateDate { get; set; }

        public string UpdateUser { get; set; }

        public ICollection<Tickets> Tickets { get; set; }
    }
}
