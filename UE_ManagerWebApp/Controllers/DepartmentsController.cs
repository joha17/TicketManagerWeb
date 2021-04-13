using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using UE_ManagerWebApp.CustomAttributes;
using UE_ManagerWebApp.Entity;
using UE_ManagerWebApp.Models;

namespace UE_ManagerWebApp.Controllers
{
    public class DepartmentsController : Controller
    {
        private readonly AuthDBContext _context;

        public DepartmentsController(AuthDBContext context)
        {
            _context = context;
        }

        // GET: Departments
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
        public async Task<IActionResult> Index()
        {
            try
            {
                return View(await _context.Department.ToListAsync());
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        // GET: Departments/Details/5
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
        public async Task<IActionResult> Details(int? id)
        {
            try
            {
                if (id == null)
                {
                    return NotFound();
                }

                var departments = await _context.Department
                    .FirstOrDefaultAsync(m => m.Id == id);
                if (departments == null)
                {
                    return NotFound();
                }

                return View(departments);
            }
            catch (Exception)
            {

                throw;
            }
        }

        // GET: Departments/Create
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

        // POST: Departments/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Name,Creation_Date,Create_User,Update_Date,Update_User")] Departments departments)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    departments.Creation_Date = DateTime.Now;
                    departments.Create_User = HttpContext.User.Claims.FirstOrDefault(c => c.Type == "Username").Value.ToString();
                    _context.Add(departments);
                    await _context.SaveChangesAsync();
                    return RedirectToAction(nameof(Index));
                }
                return View(departments);
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        // GET: Departments/Edit/5
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
        public async Task<IActionResult> Edit(int? id)
        {
            try
            {
                if (id == null)
                {
                    return NotFound();
                }

                var departments = await _context.Department.FindAsync(id);
                if (departments == null)
                {
                    return NotFound();
                }
                return View(departments);
            }
            catch (Exception)
            {

                throw;
            }
        }

        // POST: Departments/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Name,Creation_Date,Create_User,Update_Date,Update_User")] Departments departments)
        {
            try
            {
                if (id != departments.Id)
                {
                    return NotFound();
                }

                if (ModelState.IsValid)
                {
                    try
                    {
                        departments.Update_Date = DateTime.Now;
                        departments.Update_User = HttpContext.User.Claims.FirstOrDefault(c => c.Type == "Username").Value.ToString();
                        _context.Update(departments);
                        await _context.SaveChangesAsync();
                    }
                    catch (DbUpdateConcurrencyException)
                    {
                        if (!DepartmentsExists(departments.Id))
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
                return View(departments);
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        // GET: Departments/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            try
            {
                if (id == null)
                {
                    return NotFound();
                }

                var departments = await _context.Department
                    .FirstOrDefaultAsync(m => m.Id == id);
                if (departments == null)
                {
                    return NotFound();
                }

                return View(departments);
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        // POST: Departments/Delete/5
        [HttpPost, ActionName("Delete")]
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            try
            {
                var departments = await _context.Department.FindAsync(id);
                _context.Department.Remove(departments);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        private bool DepartmentsExists(int id)
        {
            return _context.Department.Any(e => e.Id == id);
        }
    }
}
