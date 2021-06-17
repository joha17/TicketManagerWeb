using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UE_ManagerWebApp.Entities;

namespace UE_ManagerWebApp.Features
{
    public class PagingResponse<T> where T : class
    {
        public List<T> Items { get; set; }
        public Metadata MetaData { get; set; }
    }
}
