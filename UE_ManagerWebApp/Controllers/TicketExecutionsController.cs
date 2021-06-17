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
    public class TicketExecutionsController : Controller
    {
        private readonly UEManagerDBContext _context;

        public TicketExecutionsController(UEManagerDBContext context)
        {
            _context = context;
        }

        // GET: TicketExecutions
        public async Task<IActionResult> Index()
        {
            return View(await _context.TicketExecution.ToListAsync());
        }

        // GET: TicketExecutions/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var ticketExecution = await _context.TicketExecution
                .FirstOrDefaultAsync(m => m.Id == id);
            if (ticketExecution == null)
            {
                return NotFound();
            }

            return View(ticketExecution);
        }

        // GET: TicketExecutions/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: TicketExecutions/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,TicketNumber,Username,PlayDate,StopDate,CreationDate")] TicketExecution ticketExecution)
        {
            if (ModelState.IsValid)
            {
                _context.Add(ticketExecution);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(ticketExecution);
        }

        [HttpPost]
        public async Task<JsonResult> CreatePlay([FromForm] string id)
        {
            try
            {
                TicketExecution ticketExecution = new TicketExecution();
                TicketExecution ticketExecutionUpdate = new TicketExecution();

                var ticketOnPlay = await _context.TicketExecution.Where(x => x.Active == 1).FirstOrDefaultAsync();
                if (ticketOnPlay != null)
                {
                    ticketExecutionUpdate = await _context.TicketExecution.FindAsync(ticketOnPlay.Id);
                    ticketExecutionUpdate.Active = 0;
                    _context.Update(ticketExecutionUpdate);
                    await _context.SaveChangesAsync();
                }

                var ticket = await _context.Tickets.FindAsync(Convert.ToInt32(id));
                ticketExecution.Username = ticket.AssignUser;
                ticketExecution.TicketNumber = Convert.ToInt32(ticket.TicketNumber);
                ticketExecution.PlayDate = DateTime.Now;
                ticketExecution.CreationDate = DateTime.Now;
                ticketExecution.StopDate = null;
                ticketExecution.Active = 1;
                _context.Add(ticketExecution);
                await _context.SaveChangesAsync();

                return Json(ticketExecution);
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        [HttpPost]
        public async Task<JsonResult> CreateStop([FromForm] string id)
        {
            try
            {
                TicketExecution ticketExecution = new TicketExecution();
                TicketExecution ticketExecutionUpdate = new TicketExecution();
                
                var ticketOnPlay = await _context.TicketExecution.Where(x => x.Active == 1).FirstOrDefaultAsync();
                ticketExecutionUpdate = await _context.TicketExecution.FindAsync(ticketOnPlay.Id);
                ticketExecutionUpdate.Active = 0;
                _context.Update(ticketExecutionUpdate);
                await _context.SaveChangesAsync();

                var ticket = await _context.Tickets.FindAsync(Convert.ToInt32(id));
                ticketExecution.Username = ticket.AssignUser;
                ticketExecution.TicketNumber = Convert.ToInt32(ticket.TicketNumber);
                ticketExecution.StopDate = DateTime.Now;
                ticketExecution.CreationDate = DateTime.Now;
                ticketExecution.PlayDate = null;
                ticketExecution.Active = 0;
                _context.Add(ticketExecution);
                await _context.SaveChangesAsync();
                return Json(ticketExecution);
            }
            catch (Exception)
            {

                throw;
            }
            
            
        }

        // GET: TicketExecutions/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var ticketExecution = await _context.TicketExecution.FindAsync(id);
            if (ticketExecution == null)
            {
                return NotFound();
            }
            return View(ticketExecution);
        }

        // POST: TicketExecutions/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,TicketNumber,Username,PlayDate,StopDate,CreationDate")] TicketExecution ticketExecution)
        {
            if (id != ticketExecution.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(ticketExecution);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TicketExecutionExists(ticketExecution.Id))
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
            return View(ticketExecution);
        }

        // GET: TicketExecutions/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var ticketExecution = await _context.TicketExecution
                .FirstOrDefaultAsync(m => m.Id == id);
            if (ticketExecution == null)
            {
                return NotFound();
            }

            return View(ticketExecution);
        }

        // POST: TicketExecutions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var ticketExecution = await _context.TicketExecution.FindAsync(id);
            _context.TicketExecution.Remove(ticketExecution);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool TicketExecutionExists(int id)
        {
            return _context.TicketExecution.Any(e => e.Id == id);
        }
    }
}
