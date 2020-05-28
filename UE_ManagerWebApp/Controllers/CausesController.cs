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
        public async Task<IActionResult> Index()
        {
            return View(await _context.Causes.ToListAsync());
        }

        // GET: Causes/Details/5
        public async Task<IActionResult> Details(int? id)
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

        // GET: Causes/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Causes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Description,CreationDate,CreationUser,UpdateDate,UpdateUser")] Causes causes)
        {
            if (ModelState.IsValid)
            {
                _context.Add(causes);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(causes);
        }

        // GET: Causes/Edit/5
        public async Task<IActionResult> Edit(int? id)
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

        // POST: Causes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Description,CreationDate,CreationUser,UpdateDate,UpdateUser")] Causes causes)
        {
            if (id != causes.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
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

        // GET: Causes/Delete/5
        public async Task<IActionResult> Delete(int? id)
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

        // POST: Causes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var causes = await _context.Causes.FindAsync(id);
            _context.Causes.Remove(causes);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CausesExists(int id)
        {
            return _context.Causes.Any(e => e.Id == id);
        }
    }
}
