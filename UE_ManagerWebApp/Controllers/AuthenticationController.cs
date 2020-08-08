﻿using System;
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

                    SetRole _setRole = new SetRole();

                    TempData["UserRole"] = _setRole.setRole(dbUser.AccessLevel.ToString());
                    HttpContext.Session.SetString("Username", login.Username);

                    return Redirect("~/Tickets/Index");
                    //return View("Views/Home/Index.cshtml");
                }
                ViewBag.Message = "User logged in bad!";
                return View();
            }
            catch (Exception)
            {

                throw;
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
        public IActionResult NoPermission()
        {
            try
            {
                string role;
                if (TempData["UserRole"] != null)
                    role = TempData["UserRole"] as string;
                TempData.Keep();

                ViewBag.UserRole = GetRole();
                return View("NoPermission");
            }
            catch (Exception)
            {

                throw;
            }
        }

        private string setRole(string accessLevel) 
        {
            try
            {
                if (accessLevel.Equals("ADMIN"))
                {
                    return "ADMIN";
                }
                if (accessLevel.Equals("SUPERVISOR"))
                {
                    return "SUPERVISOR";
                }
                if (accessLevel.Equals("LEAD"))
                {
                    return "LEAD";
                }
                else
                {
                    return "ANALYST";
                }
            }
            catch (Exception)
            {

                throw;
            }
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