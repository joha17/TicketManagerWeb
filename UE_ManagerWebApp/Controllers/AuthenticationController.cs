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
        private readonly UEManagerDBContext _contextUE;

        [TempData]
        public int countTicketsTotal { get; set; }

        [TempData]
        public int countMyTicketsTotal { get; set; }

        public AuthenticationController(AuthDBContext context, UEManagerDBContext contextUE)
        {
            _context = context;
            _contextUE = contextUE;
        }

        public IActionResult LoginUser()
        {
            try
            {
                return View();
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        [HttpPost]
        public async Task<IActionResult> LoginUser(Users login)
        {
            try
            {
                var dbUser = await _context
                    .Users
                    .SingleOrDefaultAsync(u => u.Username == login.Username);

                TokenProvider _tokenProvider = new TokenProvider();
                var userToken = _tokenProvider.LoginUser(login.Username.Trim(), login.Password.Trim(), dbUser);
                if (userToken != null)
                {
                    HttpContext.Session.SetString("JWToken", userToken);
                    ViewBag.Message = "Welcome!";

                    //SetRole _setRole = new SetRole();

                    //TempData["UserRole"] = _setRole.setRole(dbUser.AccessLevel.ToString());

                    countTicketsTotal = _contextUE.Tickets.Count();
                    countMyTicketsTotal = _contextUE.Tickets.Where(x=> x.AssignUser == login.Username).Count();

                    return Redirect("~/Tickets/Index");
                    //return View("Views/Home/Index.cshtml");
                }
                ViewBag.Message = "User logged in bad!";
                return View();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
        }

        public IActionResult Logoff()
        {
            try
            {
                HttpContext.Session.Clear();
                return Redirect("LoginUser");
            }
            catch (Exception)
            {

                throw;
            }
            
        }
    }
}