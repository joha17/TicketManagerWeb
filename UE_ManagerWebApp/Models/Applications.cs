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

        public string ApplicationName { get; set; }

        [Required]
        public int ApplicationType { get; set; }

        public int DepartmentId { get; set; }

        public Departments Department { get; set; }

        public DateTime? CreationDate { get; set; }

        public string CreationUser { get; set; }

        public DateTime? UpdateDate { get; set; }

        public string UpdateUser { get; set; }
        public ICollection<Tickets> Tickets { get; set; }
    }
}
