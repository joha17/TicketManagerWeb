using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace UE_ManagerWebApp.CustomAttributes
{
    public class SetRole
    {
        public string setRole(string accessLevel)
        {
            try
            {
                if (accessLevel.Equals("ADMIN"))
                {
                    return "ADMIN";
                }
                if (accessLevel.Equals("SUPERVISOR"))
                {
                    return "SUPERVISOR";
                }
                if (accessLevel.Equals("LEAD"))
                {
                    return "LEAD";
                }
                else
                {
                    return "ANALYST";
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
