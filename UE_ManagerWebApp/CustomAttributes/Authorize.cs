using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Security.Claims;
using System.Threading.Tasks;

namespace UE_ManagerWebApp.CustomAttributes
{
    public class AuthorizeAttribute : TypeFilterAttribute
    {
        public AuthorizeAttribute(params string[] claim) : base(typeof(AuthorizeFilter))
        {
            Arguments = new object[] { claim };
        }
    }

    public class AuthorizeFilter : IAuthorizationFilter
    {
        readonly string[] _claim;

        public AuthorizeFilter(params string[] claim)
        {
            _claim = claim;
        }

        public void OnAuthorization(AuthorizationFilterContext context)
        {
            var IsAuthenticated = context.HttpContext.User.Identity.IsAuthenticated;
            var claimsIndentity = context.HttpContext.User.Identity as ClaimsIdentity;
            string role = string.Empty;
            foreach (var claim in context.HttpContext.User.Claims)
                if (claim.Type.Equals("AccessLevel"))
                    role = claim.Value.ToString();

            //Console.WriteLine($"ClaimType:[{claim.Type}], ClaimValue:[{claim.Value}], Issuer:[{claim.Issuer}]");

            if (IsAuthenticated)
            {
                bool flagClaim = false;
                if (role.Equals("ADMIN"))
                {
                    flagClaim = true;
                }
                if (!flagClaim)
                    context.Result = new RedirectResult("~/Authentication/NoPermission");
            }
            else
            {
                context.Result = new RedirectResult("~/Home/Index");
            }
            return;
        }
    }
}
