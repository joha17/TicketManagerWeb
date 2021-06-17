using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace UE_ManagerWebApp.Models
{
    public class TicketExecution
    {
        [Key]
        public int Id { get; set; }

        public int TicketNumber { get; set; }

        public string Username { get; set; }

        public Nullable<DateTime> PlayDate { get; set; }

        public Nullable<DateTime> StopDate { get; set; }

        public DateTime CreationDate { get; set; }

        public int Active { get; set; }
    }
}
