using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
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
        
        private IWebHostEnvironment _hostingEnvironment;

        public TicketsController(UEManagerDBContext context, AuthDBContext contextUsers, IWebHostEnvironment hostingEnvironment)
        {
            _context = context;
            _contextUsers = contextUsers;
            _hostingEnvironment = hostingEnvironment;
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
                    tickets.CreationUser = HttpContext.Session.GetString("Username");
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

        public ActionResult ImportExcel()
        {
            string role;
            if (TempData["UserRole"] != null)
                role = TempData["UserRole"] as string;
            TempData.Keep();
            return View();
        }

        public async Task<IActionResult> Import (Tickets tickets)
        {
            string role;
            if (TempData["UserRole"] != null)
                role = TempData["UserRole"] as string;
            TempData.Keep();

            IFormFile file = Request.Form.Files[0];
            string folderName = "UploadExcel";
            string webRootPath = _hostingEnvironment.WebRootPath;
            string newPath = Path.Combine(webRootPath, folderName);

            StringBuilder sb = new StringBuilder();
            List<string> listExcel = new List<string>();
            if (!Directory.Exists(newPath))
            {
                Directory.CreateDirectory(newPath);
            }
            procExcel(newPath, file, tickets);
            if (file.Length > 0)
            {
                string sFileExtension = Path.GetExtension(file.FileName).ToLower();
                ISheet sheet;
                string fullPath = Path.Combine(newPath, file.FileName);
                using (var stream = new FileStream(fullPath, FileMode.Create))
                {
                    file.CopyTo(stream);
                    stream.Position = 0;
                    if (sFileExtension == ".xls")
                    {
                        HSSFWorkbook hssfwb = new HSSFWorkbook(stream); //This will read the Excel 97-2000 formats  
                        sheet = hssfwb.GetSheetAt(0); //get first sheet from workbook  
                    }
                    else
                    {
                        XSSFWorkbook hssfwb = new XSSFWorkbook(stream); //This will read 2007 Excel format  
                        sheet = hssfwb.GetSheetAt(0); //get first sheet from workbook   
                    }
                    IRow headerRow = sheet.GetRow(0); //Get Header Row
                    int cellCount = headerRow.LastCellNum;
                    for (int j = 0; j < cellCount; j++)
                    {
                        NPOI.SS.UserModel.ICell cell = headerRow.GetCell(j);
                        if (cell == null || string.IsNullOrWhiteSpace(cell.ToString())) continue;
                    }
                    for (int i = (sheet.FirstRowNum + 1); i <= sheet.LastRowNum; i++) //Read Excel File
                    {
                        IRow row = sheet.GetRow(i);
                        if (row == null) continue;
                        if (row.Cells.All(d => d.CellType == CellType.Blank)) continue;
                        for (int j = row.FirstCellNum; j < cellCount; j++)
                        {
                            if (row.GetCell(j) != null)
                            {
                                //listExcel.Add(row.GetCell(j).ToString());

                            }
                        }
                    }
                }
            }

            return this.Content(sb.ToString());
        }

        public static List<List<T>> splitList<T>(List<T> locations, int nSize = 31)
        {
            var list = new List<List<T>>();

            for (int i = 0; i < locations.Count; i += nSize)
            {
                list.Add(locations.GetRange(i, Math.Min(nSize, locations.Count - i)));
            }

            return list;
        }

        public async Task<Tickets> procExcel(string fileName, IFormFile file, Tickets tickets)
        {
            try
            {
                string fullPath = Path.Combine(fileName, file.FileName);
                List<Tickets> listExcel = new List<Tickets>();
                using (var fs = new FileStream(fullPath, FileMode.Create))
                {
                    IWorkbook workbook = null;
                    file.CopyTo(fs);
                    fs.Position = 0;
                    if (file.FileName.IndexOf(".xlsx") > 0)
                    {
                        workbook = new XSSFWorkbook(fs);
                        //sheet = hssfwb.GetSheetAt(0);
                    }

                    else if (file.FileName.IndexOf(".xls") > 0)
                    {
                        workbook = new HSSFWorkbook(fs);
                        //sheet = hssfwb.GetSheetAt(0);
                    }

                    //First sheet
                    ISheet sheet = workbook.GetSheetAt(0);
                    if (sheet != null)
                    {
                        int rowCount = sheet.LastRowNum; // This may not be valid row count.
                                                         // If first row is table head, i starts from 1
                        for (int i = 1; i <= rowCount; i++)
                        {
                            IRow curRow = sheet.GetRow(i);
                            // Works for consecutive data. Use continue otherwise 
                            if (curRow == null)
                            {
                                // Valid row count
                                rowCount = i - 1;
                                break;
                            }
                            var ticketNumber = from t in _context.Tickets
                                               where t.TicketNumber.Equals(curRow.GetCell(1).StringCellValue.Trim())
                                               select t.TicketNumber;


                            if (ticketNumber.FirstOrDefault() == null)
                            {
                                tickets.TicketNumber = curRow.GetCell(1).StringCellValue.Trim();
                                tickets.CreationDate = DateTime.Now;
                                tickets.Comment = curRow.GetCell(4).StringCellValue.Trim().Replace("\n", "").Replace("\r", "");
                                tickets.CreationUser = HttpContext.Session.GetString("UserName");
                                var date1 = GetFormattedCellValue(curRow.GetCell(7), null);
                                tickets.CreationDate = Convert.ToDateTime(date1);
                                var date2 = GetFormattedCellValue(curRow.GetCell(8), null);
                                tickets.AssignDate = Convert.ToDateTime(date2);

                                string UserName = string.Empty;
                                foreach (var item in _contextUsers.Users)
                                {
                                    if (curRow.GetCell(10).StringCellValue.Trim().Equals(item.FirstName + " " + item.LastName))
                                    {
                                        UserName = item.Username;
                                    }
                                }
                                tickets.AssignUser = UserName;

                                string customerName = string.Empty;
                                foreach (var item in _context.Customers)
                                {
                                    if (item.CustomerName.Contains(curRow.GetCell(3).StringCellValue.Trim().ToString().ToUpper()))
                                    {
                                        customerName = item.CustomerCode;
                                    }
                                }
                                if (customerName == "")
                                {
                                    customerName = "NA";
                                }
                                tickets.CustomerId = (from customer in _context.Customers
                                                      where customer.CustomerCode.Equals(customerName)
                                                      select customer.Id).FirstOrDefault();
                                tickets.Status = "A";
                                tickets.ApplicationId = 425;
                                tickets.DepartmentId = 1;
                                tickets.CauseId = 16;

                                using (var context = new UEManagerDBContext)
                                {
                                    context.Tickets.Add(tickets);
                                    try
                                    {
                                        // using SSMS, manually start a transaction in your db to force a timeout
                                        context.SaveChanges();
                                    }
                                    catch (Exception)
                                    {
                                        // catch the time out exception
                                    }
                                    // stop the transaction in SSMS
                                    context.Tickets.Add(tickets);
                                    context.SaveChanges(); // this would cause the exception
                                }

                                //_context.Add(tickets);
                                //await _context.SaveChangesAsync();
                                // Get data from the 4th column (4th cell of each row)
                                //var cellValue = curRow.GetCell(3).StringCellValue.Trim();
                                //Console.WriteLine(cellValue);
                            }
                        }
                    }
                }
                return new Tickets();
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public static string GetFormattedCellValue(ICell cell, IFormulaEvaluator eval = null)
        {
            if (cell != null)
            {
                switch (cell.CellType)
                {
                    case CellType.String:
                        return cell.StringCellValue;

                    case CellType.Numeric:
                        if (DateUtil.IsCellDateFormatted(cell))
                        {
                            try
                            {
                                return cell.DateCellValue.ToString();
                            }
                            catch (NullReferenceException)
                            {
                                return DateTime.FromOADate(cell.NumericCellValue).ToString();
                            }
                        }
                        else
                        {
                            return cell.NumericCellValue.ToString();
                        }

                    case CellType.Boolean:
                        return cell.BooleanCellValue ? "TRUE" : "FALSE";

                    case CellType.Formula:
                        if (eval != null)
                            return GetFormattedCellValue(eval.EvaluateInCell(cell));
                        else
                            return cell.CellFormula;

                    case CellType.Error:
                        return FormulaError.ForInt(cell.ErrorCellValue).String;
                }
            }
            // null or blank cell, or unknown cell type
            return string.Empty;
        }
   

    private bool TicketsExists(int id)
        {
            return _context.Tickets.Any(e => e.Id == id);
        }
    }
}
