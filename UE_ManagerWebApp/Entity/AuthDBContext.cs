using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UE_ManagerWebApp.Models;

namespace UE_ManagerWebApp.Entity
{
    public class AuthDBContext : DbContext
    {
        protected readonly IConfiguration Configuration;
        public AuthDBContext(IConfiguration configuration)
        {
            Configuration = configuration;
        }
        
        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            // connect to sql server database
            options.UseSqlServer(Configuration.GetConnectionString("AuthDBConn"));
        }

        public DbSet<Users> Users { get; set; }

        public DbSet<Departments> Department { get; set; }
    }
}
