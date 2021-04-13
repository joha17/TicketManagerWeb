using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using ExcelDataReader;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
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

        [TempData]
        public int countTicketsTotal { get; set; }

        [TempData]
        public int countMyTicketsTotal { get; set; }

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

                var tickets = from s in _context.Tickets.Include(t => t.Application).Include(c => c.Cause).Include(k => k.Customer)
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

                var user = HttpContext.User.Claims.FirstOrDefault(c => c.Type == "Username");
                var username = user.Value.ToString();
                var roleuser = HttpContext.User.Claims.FirstOrDefault(c => c.Type == "AccessLevel").Value.ToString();

                countTicketsTotal = _context.Tickets.Count();
                countMyTicketsTotal = _context.Tickets.Where(x => x.AssignUser == username).Count();


                return View(await PaginatedList<Tickets>.CreateAsync(tickets.AsNoTracking(), pageNumber ?? 1, pageSize));
            }
            catch (Exception ex )
            {

                throw ex;
            }
        }

        public async Task<IActionResult> MyTickets(string sortOrder, string currentFilter, string searchString, int? pageNumber)
        {
            try
            {
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
                var username = HttpContext.User.Claims.FirstOrDefault(c => c.Type == "Username").Value.ToString();
                var tickets = from s in _context.Tickets.Include(t => t.Application).Include(c => c.Cause).Include(k => k.Customer).Where(x => x.AssignUser == username)
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

                countTicketsTotal = _context.Tickets.Count();
                countMyTicketsTotal = _context.Tickets.Where(x => x.AssignUser == username).Count();

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
                if (id == null)
                {
                    return NotFound();
                }

                var tickets = await _context.Tickets.Include(t => t.Application).Include(c => c.Cause).Include(k => k.Customer)
                    .FirstOrDefaultAsync(m => m.Id == id);
                if (tickets == null)
                {
                    return NotFound();
                }

                var ticketLogs = _context.TicketLog.Where(x => x.TicketNumber == Convert.ToInt32(tickets.TicketNumber)).ToList();
                ViewData["TicketLog"] = ticketLogs;

                return View(tickets);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        // GET: Tickets/Create
        [Microsoft.AspNetCore.Authorization.Authorize]
        public IActionResult Create()
        {
            try
            {
                ViewData["ApplicationId"] = new SelectList(_context.Applications, "Id", "ApplicationName");
                ViewData["DepartmentId"] = new SelectList(_contextUsers.Department, "Id", "Name");
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
                if (ModelState.IsValid)
                {
                    tickets.CreationDate = DateTime.Now;
                    tickets.CreationUser = HttpContext.User.Claims.FirstOrDefault(c => c.Type == "Username").Value.ToString();
                    _context.Add(tickets);
                    await _context.SaveChangesAsync();
                    return RedirectToAction(nameof(Index));
                }
                ViewData["ApplicationId"] = new SelectList(_context.Applications, "Id", "ApplicationName", tickets.ApplicationId);
                ViewData["DepartmentId"] = new SelectList(_contextUsers.Department, "Id", "Name");
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
                if (id == null)
                {
                    return NotFound();
                }

                var tickets = await _context.Tickets.FindAsync(id);
                if (tickets == null)
                {
                    return NotFound();
                }

                string lsticketNumbertemp;
                string lsassingUsertemp;
                if (TempData["TicketNumber"] != null && TempData["AssignUser"] != null)
                    lsticketNumbertemp = TempData["TicketNumber"] as string;
                    lsassingUsertemp = TempData["AssignUser"] as string;

                ViewData["ApplicationId"] = new SelectList(_context.Applications, "Id", "ApplicationName", tickets.ApplicationId);
                ViewData["DepartmentId"] = new SelectList(_contextUsers.Department, "Id", "Name");
                ViewData["CauseId"] = new SelectList(_context.Causes, "Id", "Description", tickets.CauseId);
                ViewData["CustomerId"] = new SelectList(_context.Customers, "Id", "CustomerName", tickets.CustomerId);
                TempData["TicketNumber"] = tickets.TicketNumber;
                TempData["AssignUser"] = tickets.AssignUser;
                ViewData["Username"] = new SelectList(_contextUsers.Users.OrderBy(x => x.Username), "Username", "Username", tickets.AssignUser);
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
                if (id != tickets.Id)
                {
                    return NotFound();
                }

                if (ModelState.IsValid)
                {
                    try
                    {
                        tickets.UpdateDate = DateTime.Now;
                        tickets.UpdateUser = HttpContext.User.Claims.FirstOrDefault(c => c.Type == "Username").Value.ToString();
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
                ViewData["DepartmentId"] = new SelectList(_contextUsers.Department, "Id", "Name");
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

        [HttpGet, ActionName("Upload")]
        public IActionResult Upload(List<Tickets> tickets = null)
        {
            try
            {
                tickets = tickets == null ? new List<Tickets>() : tickets;
                return View(tickets);
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        [HttpPost]
        public IActionResult Upload(IFormFile file, [FromServices] IHostingEnvironment hostingEnvironment)
        {
            try
            {
                ViewBag.UploadError = string.Empty;
                string filename = $"{hostingEnvironment.WebRootPath}\\files\\{file.FileName}";
                using (FileStream fileStream = System.IO.File.Create(filename))
                {
                    file.CopyTo(fileStream);
                    fileStream.Flush();
                }
                var excelTickets = this.getTicketsList(file.FileName);
                
                List<Users> allUsers = _contextUsers.Users.ToList();

                foreach (var ticket in excelTickets)
                {
                    foreach (var user in allUsers)
                    {
                        if (ticket.AssignUser != null)
                        {
                            if (ticket.AssignUser.Contains(user.LastName))
                            {
                                ticket.AssignUser = user.Username;
                            }
                        }
                        else
                        {
                            ticket.AssignUser = null;
                        }
                        
                    }
                }
                return Upload(excelTickets);
            }
            catch (Exception ex)
            {
                ViewBag.UploadError = ex.Message;
                return Upload();
            }
            
        }

        private List<Tickets> getTicketsList(string fname)
        {
            try
            {
                List<Tickets> tickets = new List<Tickets>();
                List<string> header = new List<string>();
                var fileName = $"{Directory.GetCurrentDirectory()}{@"\wwwroot\files"}" + "\\" + fname;
                System.Text.Encoding.RegisterProvider(System.Text.CodePagesEncodingProvider.Instance);

                using (var stream = System.IO.File.Open(fileName, FileMode.Open, FileAccess.Read))
                {
                    using (var reader = ExcelReaderFactory.CreateReader(stream))
                    {
                        while (reader.Read())
                        {
                            if (reader.GetFieldType(8) != typeof(string))
                            {
                                tickets.Add(new Tickets()
                                {
                                    TicketNumber = reader.GetValue(1).ToString(),
                                    Keyword = reader.GetValue(3).ToString(),
                                    AssignDate = reader.GetDateTime(8),
                                    Comment = reader.GetValue(4).ToString(),
                                    AssignUser = reader.GetValue(10) == null ? null : reader.GetValue(10).ToString(),
                                    CreationDate = reader.GetDateTime(7),
                                    UpdateDate = Convert.ToDateTime(reader.GetValue(17).ToString())
                                });
                            }
                        }
                    }
                }
                return tickets;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
        }

        private static ExcelDataSetConfiguration GetDataSetConfig()
        {
            return new ExcelDataSetConfiguration
            {
                ConfigureDataTable = _ => new ExcelDataTableConfiguration()
                {
                    UseHeaderRow = true,

                    // Gets or sets a callback to determine which row is the header row. 
                    // Only called when UseHeaderRow = true.
                    ReadHeaderRow = (rowReader) => {
                        // F.ex skip the first row and use the 2nd row as column headers:
                        rowReader.Read();
                    }
                }
            };
        }

        [HttpPost]
        public async Task<IActionResult> ImportData(List<string> rows)
        {
            try
            {
                //_context.Add(tickets);
                //await _context.SaveChangesAsync();
                //return RedirectToAction(nameof(Upload));
                List<Tickets> allTickets = _context.Tickets.ToList();
                List<Tickets> tickets = new List<Tickets>();
                List<Tickets> filterTicketsList = new List<Tickets>();
                rows.ForEach(x =>
                {
                    var row = x.Split('|');
                    tickets.Add(new Tickets()
                    {
                        TicketNumber = row[0],
                        AssignDate = Convert.ToDateTime(row[1]),
                        Comment = row[2],
                        AssignUser = row[3],
                        CreationDate = Convert.ToDateTime(row[4]),
                        UpdateDate = Convert.ToDateTime(row[5])
                    });
                });

                foreach (var ticket in tickets)
                {
                    if (!allTickets.Exists(item => item.TicketNumber == ticket.TicketNumber))
                    {
                        filterTicketsList.Add(ticket);
                    }
                }
                //Estos valores 425,16 y 154 estan quemados, porque significan en analisis
                foreach (var item in filterTicketsList)
                {
                    item.ApplicationId = 425;
                    item.CauseId = 16;
                    item.CustomerId = 154;
                    item.Status = "A";
                    item.CreationUser = HttpContext.User.Claims.FirstOrDefault(c => c.Type == "Username").Value.ToString();
                    _context.Add(item);
                }

                await _context.SaveChangesAsync();

                return Json(true);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        // GET: Tickets/Delete/5
        [Microsoft.AspNetCore.Authorization.Authorize]
        public async Task<IActionResult> Transfer()
        {
            try
            {
                string lsticketNumbertemp;
                if (TempData["TicketNumber"] != null)
                    lsticketNumbertemp = TempData["UserRole"] as string;

                TempData.Keep();

                var tickets = await _context.Tickets
                    .FirstOrDefaultAsync(m => m.TicketNumber == TempData["TicketNumber"].ToString());
                if (tickets == null)
                {
                    return NotFound();
                }
                
                ViewData["Usernames"] = new SelectList(_contextUsers.Users.OrderBy(x => x.Username), "Username", "Username");
                ViewBag.Username = tickets.AssignUser;
                ViewBag.TicketNumber = tickets.TicketNumber;

                return View();
            }
            catch (Exception)
            {

                throw;
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Transfer(int id,Tickets tickets, TicketLog ticketLog)
        {
            try
            {
                if (id != tickets.Id)
                {
                    return NotFound();
                }

                if (ModelState.IsValid)
                {
                    try
                    {
                        var ticketsEdit = await _context.Tickets
                        .FirstOrDefaultAsync(m => m.TicketNumber == tickets.TicketNumber);
                        if (tickets == null)
                        {
                            return NotFound();
                        }
                        ticketsEdit.UpdateDate = DateTime.Now;
                        ticketsEdit.UpdateUser = tickets.UpdateUser;
                        ticketsEdit.AssignUser = ticketLog.DestinationUser;
                        _context.Update(ticketsEdit);
                        await _context.SaveChangesAsync();

                        ticketLog.CreationDate = DateTime.Now;
                        _context.Add(ticketLog);
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

                ViewData["Username"] = new SelectList(_contextUsers.Users.OrderBy(x => x.Username), "Username", "Username");

                return View(tickets);
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
