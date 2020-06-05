using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using UE_ManagerWebApp.CustomAttributes;
using UE_ManagerWebApp.Entity;
using UE_ManagerWebApp.Models;

namespace UE_ManagerWebApp.Controllers
{
    public class UsersController : Controller
    {
        private readonly AuthDBContext _context;

        public UsersController(AuthDBContext context)
        {
            _context = context;
        }

        // GET: Users
        [Authorize]
        public async Task<IActionResult> Index()
        {
            try
            {
                string role;
                if (TempData["UserRole"] != null)
                    role = TempData["UserRole"] as string;

                TempData.Keep();
                return View(await _context.Users.ToListAsync());
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        // GET: Users/Details/5
        [Authorize]
        public async Task<IActionResult> Details(int? id)
        {
            try
            {
                string role;
                if (TempData["UserRole"] != null)
                    role = TempData["UserRole"] as string;

                TempData.Keep();

                if (id == null)
                {
                    return NotFound();
                }

                var users = await _context.Users
                    .FirstOrDefaultAsync(m => m.Id == id);
                if (users == null)
                {
                    return NotFound();
                }

                return View(users);
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        // GET: Users/Create
        [Authorize]
        public IActionResult Create()
        {
            try
            {
                string role;
                if (TempData["UserRole"] != null)
                    role = TempData["UserRole"] as string;

                TempData.Keep();
                return View();
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        // POST: Users/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Username,Password,FirstName,LastName,EmailID,AccessLevel,ReadOnly")] Users users)
        {
            try
            {
                string role;
                if (TempData["UserRole"] != null)
                    role = TempData["UserRole"] as string;

                TempData.Keep();

                if (ModelState.IsValid)
                {
                    users.Password = MD5.MD5Crypto.Encrypt(users.Password);
                    _context.Add(users);
                    await _context.SaveChangesAsync();
                    return RedirectToAction(nameof(Index));
                }
                return View(users);
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        // GET: Users/Edit/5
        [Authorize]
        public async Task<IActionResult> Edit(int? id)
        {
            try
            {
                string role;
                if (TempData["UserRole"] != null)
                    role = TempData["UserRole"] as string;

                TempData.Keep();

                if (id == null)
                {
                    return NotFound();
                }

                var users = await _context.Users.FindAsync(id);
                if (users == null)
                {
                    return NotFound();
                }
                return View(users);
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        // POST: Users/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Username,Password,FirstName,LastName,EmailID,AccessLevel,ReadOnly")] Users users)
        {
            try
            {
                string role;
                if (TempData["UserRole"] != null)
                    role = TempData["UserRole"] as string;

                TempData.Keep();

                if (id != users.Id)
                {
                    return NotFound();
                }

                if (ModelState.IsValid)
                {
                    try
                    {
                        users.Password = MD5.MD5Crypto.Encrypt(users.Password);
                        _context.Update(users);
                        await _context.SaveChangesAsync();
                    }
                    catch (DbUpdateConcurrencyException)
                    {
                        if (!UsersExists(users.Id))
                        {
                            return NotFound();
                        }
                        else
                        {
                            throw;
                        }
                    }
                    return RedirectToAction(nameof(Index));
                }
                return View(users);
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        public IActionResult ChangePassword()
        {
            try
            {
                string role;
                if (TempData["UserRole"] != null)
                    role = TempData["UserRole"] as string;
                TempData.Keep();

                return View();
            }
            catch (Exception)
            {

                throw;
            }

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ChangePassword(ConfirmPassword passwords)
        {
            try
            {
                string role;
                if (TempData["UserRole"] != null)
                    role = TempData["UserRole"] as string;

                TempData.Keep();

                if (ModelState.IsValid)
                {
                    
                    if (passwords.Password != passwords.CheckPassword)
                    {
                        ViewBag.MessageConfirmation = "Las contraseñas deben de ser iguales.";
                        return View();
                    }
                    else
                    {
                        Users users;
                        string username = string.Empty;
                        string newPassword = MD5.MD5Crypto.Encrypt(passwords.Password);
                        foreach (var claim in HttpContext.User.Claims)
                            if (claim.Type.Equals("Username"))
                                username = claim.Value.ToString();
                        users = _context.Users.FirstOrDefault(x=> x.Username.Equals(username));
                        users.Password = newPassword;
                        _context.Update(users);
                        await _context.SaveChangesAsync();
                    }
                    ViewBag.MessageConfirmation = "Tu contraseña fue actualizada correctamente.";
                    return View();
                }
                return View();
            }
            catch (Exception)
            {

                throw;
            }

        }

        // GET: Users/Delete/5
        [Authorize]
        public async Task<IActionResult> Delete(int? id)
        {
            try
            {
                string role;
                if (TempData["UserRole"] != null)
                    role = TempData["UserRole"] as string;

                TempData.Keep();

                if (id == null)
                {
                    return NotFound();
                }

                var users = await _context.Users
                    .FirstOrDefaultAsync(m => m.Id == id);
                if (users == null)
                {
                    return NotFound();
                }

                return View(users);
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        // POST: Users/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            try
            {
                string role;
                if (TempData["UserRole"] != null)
                    role = TempData["UserRole"] as string;

                TempData.Keep();

                var users = await _context.Users.FindAsync(id);
                _context.Users.Remove(users);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        private bool UsersExists(int id)
        {
            return _context.Users.Any(e => e.Id == id);
        }
    }
}
