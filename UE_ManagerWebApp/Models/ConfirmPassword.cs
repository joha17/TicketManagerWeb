using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace UE_ManagerWebApp.Models
{
    public class ConfirmPassword
    {
        [Required]
        public string Password { get; set; }

        [Required]
        public string CheckPassword { get; set; }
    }
}
