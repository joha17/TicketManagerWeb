using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace UE_ManagerWebApp.Models
{
    public class TicketLog
    {
        [Key]
        public int Id { get; set; }

        public int TicketNumber { get; set; }

        public DateTime CreationDate { get; set; }

        public string DestinationUser { get; set; }

        public string FromUser { get; set; }

        public string CommentLog { get; set; }
    }
}
