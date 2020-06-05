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
    public class CustomersController : Controller
    {
        private readonly UEManagerDBContext _context;

        public CustomersController(UEManagerDBContext context)
        {
            _context = context;
        }

        // GET: Customers
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
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

                var customers = from s in _context.Customers
                                select s;
                if (!String.IsNullOrEmpty(searchString))
                {
                    customers = customers.Where(s => s.CustomerName.Contains(searchString)
                                           || s.CustomerCode.Contains(searchString));
                }
                switch (sortOrder)
                {
                    case "name_desc":
                        customers = customers.OrderByDescending(s => s.CustomerName);
                        break;
                    case "Date":
                        customers = customers.OrderBy(s => s.CreationDate);
                        break;
                    case "date_desc":
                        customers = customers.OrderByDescending(s => s.CreationDate);
                        break;
                    default:
                        customers = customers.OrderBy(s => s.CustomerName);
                        break;
                }
                int pageSize = 10;
                return View(await PaginatedList<Customers>.CreateAsync(customers.AsNoTracking(), pageNumber ?? 1, pageSize));
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        // GET: Customers/Details/5
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

                var customers = await _context.Customers
                    .FirstOrDefaultAsync(m => m.Id == id);
                if (customers == null)
                {
                    return NotFound();
                }

                return View(customers);
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        // GET: Customers/Create
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

        // POST: Customers/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,CustomerCode,CustomerName,Status,IssuerAdquier,CreationDate,CreationUser,UpdateDate,UpdateUser,CountryCode,Wallet")] Customers customers)
        {
            try
            {
                string role;
                if (TempData["UserRole"] != null)
                    role = TempData["UserRole"] as string;
                TempData.Keep();
                if (ModelState.IsValid)
                {
                    _context.Add(customers);
                    await _context.SaveChangesAsync();
                    return RedirectToAction(nameof(Index));
                }
                return View(customers);
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        // GET: Customers/Edit/5
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

                var customers = await _context.Customers.FindAsync(id);
                if (customers == null)
                {
                    return NotFound();
                }
                return View(customers);
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        // POST: Customers/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Microsoft.AspNetCore.Authorization.Authorize(Policy = "IsAdmin")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,CustomerCode,CustomerName,Status,IssuerAdquier,CreationDate,CreationUser,UpdateDate,UpdateUser,CountryCode,Wallet")] Customers customers)
        {
            try
            {
                string role;
                if (TempData["UserRole"] != null)
                    role = TempData["UserRole"] as string;
                TempData.Keep();
                if (id != customers.Id)
                {
                    return NotFound();
                }

                if (ModelState.IsValid)
                {
                    try
                    {
                        _context.Update(customers);
                        await _context.SaveChangesAsync();
                    }
                    catch (DbUpdateConcurrencyException)
                    {
                        if (!CustomersExists(customers.Id))
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
                return View(customers);
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        // GET: Customers/Delete/5
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

                var tickets = await _context.Customers
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

        // POST: Customers/Delete/5
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
                var customers = await _context.Customers.FindAsync(id);
                _context.Customers.Remove(customers);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            catch (Exception)
            {

                throw;
            }
        }

        

        private bool CustomersExists(int id)
        {
            return _context.Customers.Any(e => e.Id == id);
        }
    }
}
