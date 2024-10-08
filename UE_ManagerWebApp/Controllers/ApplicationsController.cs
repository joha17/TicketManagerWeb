﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using UE_ManagerWebApp.Entity;
using UE_ManagerWebApp.Models;
using UE_ManagerWebApp.Paged;

namespace UE_ManagerWebApp.Controllers
{
    public class ApplicationsController : Controller
    {
        private readonly UEManagerDBContext _context;
        private readonly AuthDBContext _contextAuth;

        public ApplicationsController(UEManagerDBContext context, AuthDBContext authDBContext)
        {
            _context = context;
            _contextAuth = authDBContext;
        }

        


        // GET: Applications
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
        public async Task<IActionResult> Index(string sortOrder, string currentFilter, string searchString, int? pageNumber)
        {
            try
            {
                //string role;
                //if (TempData["UserRole"] != null)
                //    role = TempData["UserRole"] as string;
                //TempData.Keep();
                ViewData["CurrentSort"] = sortOrder;
                ViewData["NameSortParm"] = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
                ViewData["DateSortParm"] = sortOrder == "Date" ? "date_desc" : "Date";
                if (searchString != null)
                {
                    pageNumber = 1;
                }
                else
                {
                    searchString = currentFilter;
                }

                ViewData["CurrentFilter"] = searchString;

                var applications = from s in _context.Applications
                                   select s;
                if (!String.IsNullOrEmpty(searchString))
                {
                    applications = applications.Where(s => s.ApplicationName.Contains(searchString));
                }
                switch (sortOrder)
                {
                    case "name_desc":
                        applications = applications.OrderByDescending(s => s.ApplicationName);
                        break;
                    case "Date":
                        applications = applications.OrderBy(s => s.CreationDate);
                        break;
                    case "date_desc":
                        applications = applications.OrderByDescending(s => s.CreationDate);
                        break;
                    default:
                        applications = applications.OrderBy(s => s.ApplicationName);
                        break;
                }
                int pageSize = 10;
                return View(await PaginatedList<Applications>.CreateAsync(applications.AsNoTracking(), pageNumber ?? 1, pageSize));
            }
            catch (Exception)
            {

                throw;
            }
        }

        // GET: Applications/Details/5
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
        public async Task<IActionResult> Details(int? id)
        {
            try
            {
                if (id == null)
                {
                    return NotFound();
                }

                var applications = await _context.Applications
                    .FirstOrDefaultAsync(m => m.Id == id);
                if (applications == null)
                {
                    return NotFound();
                }

                return View(applications);
            }
            catch (Exception)
            {

                throw;
            }
        }

        // GET: Applications/Create
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
        public IActionResult Create()
        {
            try
            {
                ViewData["DepartmentId"] = new SelectList(_contextAuth.Department, "Id", "Name");
                return View();
            }
            catch (Exception)
            {

                throw;
            }
        }

        // POST: Applications/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,ApplicationName,ApplicationType,CreationDate,CreationUser,UpdateDate,UpdateUser,DepartmentId")] Applications applications)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    applications.CreationDate = DateTime.Now;
                    applications.CreationUser = HttpContext.User.Claims.FirstOrDefault(c => c.Type == "Username").Value.ToString();
                    _context.Add(applications);
                    await _context.SaveChangesAsync();
                    return RedirectToAction(nameof(Index));
                }
                return View(applications);
            }
            catch (Exception)
            {

                throw;
            }
        }

        // GET: Applications/Edit/5
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
        public async Task<IActionResult> Edit(int? id)
        {
            try
            {
                if (id == null)
                {
                    return NotFound();
                }

                var applications = await _context.Applications.FindAsync(id);
                if (applications == null)
                {
                    return NotFound();
                }
                ViewData["DepartmentId"] = new SelectList(_contextAuth.Department, "Id", "Name", applications.Id);
                return View(applications);
            }
            catch (Exception)
            {

                throw;
            }
        }

        // POST: Applications/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,ApplicationName,ApplicationType,CreationDate,CreationUser,UpdateDate,UpdateUser")] Applications applications)
        {
            try
            {
                if (id != applications.Id)
                {
                    return NotFound();
                }

                if (ModelState.IsValid)
                {
                    try
                    {
                        applications.UpdateDate = DateTime.Now;
                        applications.UpdateUser = HttpContext.User.Claims.FirstOrDefault(c => c.Type == "Username").Value.ToString();
                        _context.Update(applications);
                        await _context.SaveChangesAsync();
                    }
                    catch (DbUpdateConcurrencyException)
                    {
                        if (!ApplicationsExists(applications.Id))
                        {
                            return NotFound();
                        }
                        else
                        {
                            throw;
                        }
                    }
                    ViewData["DepartmentId"] = new SelectList(_contextAuth.Department, "Id", "Name", applications.Id);
                    return RedirectToAction(nameof(Index));
                }
                return View(applications);
            }
            catch (Exception)
            {

                throw;
            }
        }

        // GET: Applications/Delete/5
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
        public async Task<IActionResult> Delete(int? id)
        {
            try
            {
                if (id == null)
                {
                    return NotFound();
                }

                var applications = await _context.Applications
                    .FirstOrDefaultAsync(m => m.Id == id);
                if (applications == null)
                {
                    return NotFound();
                }

                return View(applications);
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        // POST: Applications/Delete/5
        [HttpPost, ActionName("Delete")]
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            try
            {
                var applications = await _context.Applications.FindAsync(id);
                _context.Applications.Remove(applications);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            catch (Exception)
            {

                throw;
            }
        }

        private bool ApplicationsExists(int id)
        {
            return _context.Applications.Any(e => e.Id == id);
        }
    }
}
