using System;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using UE_ManagerWebApp.CustomAttributes;
using UE_ManagerWebApp.Entity;
using UE_ManagerWebApp.Models;
using UE_ManagerWebApp.Services;

namespace UE_ManagerWebApp.Controllers
{
    public class AuthenticationController : Controller
    {

        private readonly AuthDBContext _context;

        public AuthenticationController(AuthDBContext context)
        {
            _context = context;
        }

        public IActionResult LoginUser()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> LoginUser(Users login)
        {
            var dbUser = await _context
                    .Users
                    .SingleOrDefaultAsync(u => u.Username == login.Username);

            var userr = _context.Users.SingleOrDefault(x => x.Username == "jcervantes");

            TokenProvider _tokenProvider = new TokenProvider();
            var userToken = _tokenProvider.LoginUser(login.Username.Trim(), login.Password.Trim(), dbUser);
            if (userToken != null)
            {
                HttpContext.Session.SetString("JWToken", userToken);
                ViewBag.Message = "Welcome!";
                return Redirect("~/Home/Index");
                //return View("Views/Home/Index.cshtml");
            }
            ViewBag.Message = "User logged in bad!";
            return View();
        }

        public IActionResult Logoff()
        {
            HttpContext.Session.Clear();
            return Redirect("LoginUser");
        }
        public IActionResult NoPermission()
        {
            ViewBag.UserRole = GetRole();
            return View("NoPermission");
        }


        private string GetRole()
        {
            if (this.HavePermission(Roles.ADMIN))
                return " - Admistrador";
            if (this.HavePermission(Roles.SUPERVISOR))
                return " - Supervisor";
            if (this.HavePermission(Roles.ANALYST))
                return " - Analista";
            if (this.HavePermission(Roles.LEAD))
                return " - Lider Técnico";
            return null;
        }
    }
}