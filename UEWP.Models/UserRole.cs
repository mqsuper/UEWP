using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UEWP.Models
{
    public class UserRole
    {
        public string UserRoleID { set; get; }
        public string UserID { set; get; }
        public int RoleID { set; get; }
        public int? BusinessID { set; get; }
        public int? CompanyID { set; get; }
        public string BusinessName { set; get; }
    }
}
