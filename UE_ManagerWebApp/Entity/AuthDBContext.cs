using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UE_ManagerWebApp.Models;

namespace UE_ManagerWebApp.Entity
{
    public class AuthDBContext : DbContext
    {
        public AuthDBContext(DbContextOptions<AuthDBContext> options)
            : base(options)
        {
        }
        public DbSet<Users> Users { get; set; }
    }
}
