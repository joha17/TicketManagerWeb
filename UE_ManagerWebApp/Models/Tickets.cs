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
        public int Id { get; set; }

        public string TicketNumber { get; set; }
        public string Keyword { get; set; }

        public DateTime? AssignDate { get; set; }

        public DateTime? EndDate { get; set; }

        public string Comment { get; set; }

        public string CreationUser { get; set; }

        public DateTime? CreationDate { get; set; }

        public string UpdateUser { get; set; }

        public DateTime? UpdateDate { get; set; }

        public string AssignUser { get; set; }

        public int ApplicationId { get; set; }
        public Applications Application { get; set; }


        public int CauseId { get; set; }
        public Causes Cause { get; set; }


        public int DepartmentId { get; set; }
        public Departments Department { get; set; }


        public int CustomerId { get; set; }
        public Customers Customer { get; set; }

    }
}
