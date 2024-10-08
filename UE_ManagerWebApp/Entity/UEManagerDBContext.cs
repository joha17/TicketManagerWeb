﻿using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UE_ManagerWebApp.Models;

namespace UE_ManagerWebApp.Entity
{
    public class UEManagerDBContext : DbContext
    {
        public UEManagerDBContext(DbContextOptions<UEManagerDBContext> options)
            : base(options)
        {
        }
        
        public DbSet<Causes> Causes { get; set; }
        public DbSet<Applications> Applications { get; set; }
        public DbSet<Customers> Customers { get; set; }
        public DbSet<UE_ManagerWebApp.Models.Tickets> Tickets { get; set; }
        public DbSet<UE_ManagerWebApp.Models.TicketLog> TicketLog { get; set; }

        public DbSet<UE_ManagerWebApp.Models.TicketExecution> TicketExecution { get; set; }

    }
}
