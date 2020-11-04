using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using UE_ManagerWebApp.Entity;
using UE_ManagerWebApp.Models;

namespace UE_ManagerWebApp.Controllers
{
    public class CausesController : Controller
    {
        private readonly UEManagerDBContext _context;

        public CausesController(UEManagerDBContext context)
        {
            _context = context;
        }

        // GET: Causes
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
        public async Task<IActionResult> Index()
        {
            try
            {
                return View(await _context.Causes.ToListAsync());
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        // GET: Causes/Details/5
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
        public async Task<IActionResult> Details(int? id)
        {
            try
            {
                if (id == null)
                {
                    return NotFound();
                }

                var causes = await _context.Causes
                    .FirstOrDefaultAsync(m => m.Id == id);
                if (causes == null)
                {
                    return NotFound();
                }

                return View(causes);
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        // GET: Causes/Create
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
        public IActionResult Create()
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

        // POST: Causes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Description,CreationDate,CreationUser,UpdateDate,UpdateUser")] Causes causes)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    causes.CreationDate = DateTime.Now;
                    causes.CreationUser = HttpContext.User.Claims.FirstOrDefault(c => c.Type == "Username").Value.ToString();
                    _context.Add(causes);
                    await _context.SaveChangesAsync();
                    return RedirectToAction(nameof(Index));
                }
                return View(causes);
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        // GET: Causes/Edit/5
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
        public async Task<IActionResult> Edit(int? id)
        {
            try
            {
                if (id == null)
                {
                    return NotFound();
                }

                var causes = await _context.Causes.FindAsync(id);
                if (causes == null)
                {
                    return NotFound();
                }
                return View(causes);
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        // POST: Causes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Description,CreationDate,CreationUser,UpdateDate,UpdateUser")] Causes causes)
        {
            try
            {
                if (id != causes.Id)
                {
                    return NotFound();
                }

                if (ModelState.IsValid)
                {
                    try
                    {
                        causes.UpdateDate = DateTime.Now;
                        causes.UpdateUser = HttpContext.User.Claims.FirstOrDefault(c => c.Type == "Username").Value.ToString();
                        _context.Update(causes);
                        await _context.SaveChangesAsync();
                    }
                    catch (DbUpdateConcurrencyException)
                    {
                        if (!CausesExists(causes.Id))
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
                return View(causes);
            }
            catch (Exception)
            {

                throw;
            }
        }

        // GET: Causes/Delete/5
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
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

                var causes = await _context.Causes
                    .FirstOrDefaultAsync(m => m.Id == id);
                if (causes == null)
                {
                    return NotFound();
                }

                return View(causes);
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        // POST: Causes/Delete/5
        [HttpPost, ActionName("Delete")]
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            try
            {
                string role;
                if (TempData["UserRole"] != null)
                    role = TempData["UserRole"] as string;

                TempData.Keep();

                var causes = await _context.Causes.FindAsync(id);
                _context.Causes.Remove(causes);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        private bool CausesExists(int id)
        {
            return _context.Causes.Any(e => e.Id == id);
        }
    }
}
