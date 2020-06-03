using Microsoft.AspNetCore.Authorization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace UE_ManagerWebApp.CustomAttributes
{
    public class RoleRequirement : IAuthorizationRequirement
    {
        public string RoleEmployed { get; private set; }

        public RoleRequirement(string role)
        {
            this.RoleEmployed = role;
        }
    }
}
