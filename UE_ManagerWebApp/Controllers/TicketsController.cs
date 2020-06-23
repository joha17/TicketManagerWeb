using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using UE_ManagerWebApp.CustomAttributes;
using UE_ManagerWebApp.Entity;
using UE_ManagerWebApp.Models;
using UE_ManagerWebApp.Paged;

namespace UE_ManagerWebApp.Controllers
{
    public class TicketsController : Controller
    {
        private readonly UEManagerDBContext _context;
        private readonly AuthDBContext _contextUsers;

        public TicketsController(UEManagerDBContext context, AuthDBContext contextUsers)
        {
            _context = context;
            _contextUsers = contextUsers;
        }

        // GET: Tickets
        [Microsoft.AspNetCore.Authorization.Authorize]
        public async Task<IActionResult> Index(string sortOrder, string currentFilter, string searchString, int? pageNumber)
        {
            try
            {
                string role;
                if (TempData["UserRole"] != null)
                    role = TempData["UserRole"] as string;
                TempData.Keep();

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

                var tickets = from s in _context.Tickets.Include(t => t.Application).Include(c => c.Cause).Include(d => d.Department).Include(k => k.Customer)
                              select s;
                if (!String.IsNullOrEmpty(searchString))
                {
                    tickets = tickets.Where(s => s.TicketNumber.Contains(searchString));
                }
                switch (sortOrder)
                {
                    case "name_desc":
                        tickets = tickets.OrderByDescending(s => s.TicketNumber);
                        break;
                    case "Date":
                        tickets = tickets.OrderBy(s => s.CreationDate);
                        break;
                    case "date_desc":
                        tickets = tickets.OrderByDescending(s => s.CreationDate);
                        break;
                    default:
                        tickets = tickets.OrderBy(s => s.TicketNumber);
                        break;
                }
                int pageSize = 10;

                foreach (var claim in HttpContext.User.Claims)
                    Console.WriteLine($"ClaimType:[{claim.Type}], ClaimValue:[{claim.Value}], Issuer:[{claim.Issuer}]");

                return View(await PaginatedList<Tickets>.CreateAsync(tickets.AsNoTracking(), pageNumber ?? 1, pageSize));
            }
            catch (Exception)
            {

                throw;
            }
        }

        // GET: Tickets/Details/5
        [Microsoft.AspNetCore.Authorization.Authorize]
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

                var tickets = await _context.Tickets.Include(t => t.Application).Include(c => c.Cause).Include(d => d.Department).Include(k => k.Customer)
                    .FirstOrDefaultAsync(m => m.Id == id);
                if (tickets == null)
                {
                    return NotFound();
                }

                return View(tickets);
            }
            catch (Exception)
            {

                throw;
            }
        }

        // GET: Tickets/Create
        [Microsoft.AspNetCore.Authorization.Authorize]
        public IActionResult Create()
        {
            try
            {
                string role;
                if (TempData["UserRole"] != null)
                    role = TempData["UserRole"] as string;
                TempData.Keep();

                ViewData["ApplicationId"] = new SelectList(_context.Applications, "Id", "ApplicationName");
                ViewData["DepartmentId"] = new SelectList(_context.Departments, "Id", "Name");
                ViewData["CauseId"] = new SelectList(_context.Causes, "Id", "Description");
                ViewData["CustomerId"] = new SelectList(_context.Customers, "Id", "CustomerName");
                ViewData["Username"] = new SelectList(_contextUsers.Users.OrderBy(x=> x.Username), "Username", "Username");
                return View();
            }
            catch (Exception)
            {

                throw;
            }
        }

        // POST: Tickets/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,TicketNumber,Keyword,AssignDate,EndDate,Comment,CreationUser,CreationDate,UpdateUser,UpdateDate,AssignUser,CustomerId,ApplicationId,CauseId,DepartmentId")] Tickets tickets)
        {
            try
            {
                string role;
                if (TempData["UserRole"] != null)
                    role = TempData["UserRole"] as string;
                TempData.Keep();

                if (ModelState.IsValid)
                {
                    tickets.CreationDate = DateTime.Now;
                    tickets.CreationUser = "jcervantes";
                    _context.Add(tickets);
                    await _context.SaveChangesAsync();
                    return RedirectToAction(nameof(Index));
                }
                ViewData["ApplicationId"] = new SelectList(_context.Applications, "Id", "ApplicationName", tickets.ApplicationId);
                ViewData["DepartmentId"] = new SelectList(_context.Departments, "Id", "Name", tickets.DepartmentId);
                ViewData["CauseId"] = new SelectList(_context.Causes, "Id", "Description", tickets.CauseId);
                ViewData["CustomerId"] = new SelectList(_context.Customers, "Id", "CustomerName", tickets.CustomerId);
                return View(tickets);
            }
            catch (Exception)
            {

                throw;
            }
        }

        // GET: Tickets/Edit/5
        [Microsoft.AspNetCore.Authorization.Authorize]
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

                var tickets = await _context.Tickets.FindAsync(id);
                if (tickets == null)
                {
                    return NotFound();
                }
                ViewData["ApplicationId"] = new SelectList(_context.Applications, "Id", "ApplicationName", tickets.ApplicationId);
                ViewData["DepartmentId"] = new SelectList(_context.Departments, "Id", "Name", tickets.DepartmentId);
                ViewData["CauseId"] = new SelectList(_context.Causes, "Id", "Description", tickets.CauseId);
                ViewData["CustomerId"] = new SelectList(_context.Customers, "Id", "CustomerName", tickets.CustomerId);
                return View(tickets);
            }
            catch (Exception)
            {

                throw;
            }
        }

        // POST: Tickets/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,TicketNumber,Keyword,AssignDate,EndDate,Comment,CreationUser,CreationDate,UpdateUser,UpdateDate,AssignUser,CustomerId,ApplicationId,CauseId,DepartmentId")] Tickets tickets)
        {
            try
            {
                string role;
                if (TempData["UserRole"] != null)
                    role = TempData["UserRole"] as string;
                TempData.Keep();

                if (id != tickets.Id)
                {
                    return NotFound();
                }

                if (ModelState.IsValid)
                {
                    try
                    {
                        tickets.UpdateDate = DateTime.Now;
                        tickets.UpdateUser = "jcervantes";
                        _context.Update(tickets);
                        await _context.SaveChangesAsync();
                    }
                    catch (DbUpdateConcurrencyException)
                    {
                        if (!TicketsExists(tickets.Id))
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
                ViewData["ApplicationId"] = new SelectList(_context.Applications, "Id", "ApplicationName", tickets.ApplicationId);
                ViewData["DepartmentId"] = new SelectList(_context.Departments, "Id", "Name", tickets.DepartmentId);
                ViewData["CauseId"] = new SelectList(_context.Causes, "Id", "Description", tickets.CauseId);
                ViewData["CustomerId"] = new SelectList(_context.Customers, "Id", "CustomerName", tickets.CustomerId);
                return View(tickets);
            }
            catch (Exception)
            {

                throw;
            }
        }

        // GET: Tickets/Delete/5
        [Microsoft.AspNetCore.Authorization.Authorize]
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

                var tickets = await _context.Tickets
                    .FirstOrDefaultAsync(m => m.Id == id);
                if (tickets == null)
                {
                    return NotFound();
                }

                return View(tickets);
            }
            catch (Exception)
            {

                throw;
            }
        }

        // POST: Tickets/Delete/5
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
                var tickets = await _context.Tickets.FindAsync(id);
                _context.Tickets.Remove(tickets);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            catch (Exception)
            {

                throw;
            }
        }

        private bool TicketsExists(int id)
        {
            return _context.Tickets.Any(e => e.Id == id);
        }
    }
}
