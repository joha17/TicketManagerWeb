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
        private readonly UEManagerDBContext _context;

        public DepartmentsController(UEManagerDBContext context)
        {
            _context = context;
        }

        // GET: Departments
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
        public async Task<IActionResult> Index()
        {
            try
            {
                string role;
                if (TempData["UserRole"] != null)
                    role = TempData["UserRole"] as string;
                TempData.Keep();
                return View(await _context.Departments.ToListAsync());
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
        }

        // GET: Departments/Details/5
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
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

                var departments = await _context.Departments
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
                string role;
                if (TempData["UserRole"] != null)
                    role = TempData["UserRole"] as string;
                TempData.Keep();
                if (ModelState.IsValid)
                {
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
                string role;
                if (TempData["UserRole"] != null)
                    role = TempData["UserRole"] as string;
                TempData.Keep();

                if (id == null)
                {
                    return NotFound();
                }

                var departments = await _context.Departments.FindAsync(id);
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
                string role;
                if (TempData["UserRole"] != null)
                    role = TempData["UserRole"] as string;
                TempData.Keep();
                if (id != departments.Id)
                {
                    return NotFound();
                }

                if (ModelState.IsValid)
                {
                    try
                    {
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
                string role;
                if (TempData["UserRole"] != null)
                    role = TempData["UserRole"] as string;
                TempData.Keep();
                if (id == null)
                {
                    return NotFound();
                }

                var departments = await _context.Departments
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
                string role;
                if (TempData["UserRole"] != null)
                    role = TempData["UserRole"] as string;
                TempData.Keep();
                var departments = await _context.Departments.FindAsync(id);
                _context.Departments.Remove(departments);
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
            return _context.Departments.Any(e => e.Id == id);
        }
    }
}
