
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UEWP.Models
{
   public  class User
    {
       public string ID { get; set; }
       public string Name { get; set; }
       public string Email { get; set; }
       public string Password { get; set; }
       public   bool Gender{ get; set; }
       public bool IsEnterpriseAdmin { get; set; }
       public bool IsSystemAdmin { get; set; }
       public int  Age { get; set; }
       public string Phone { get; set; }
       public bool IsActive { get; set; }
       public string CreatedBy { get; set; }
       public string Created { get; set; }
       public RoleType RoleType { set; get; }
       public int CompanyID { set; get; }
       public List<UserRole> RoleList { get; set; }
       
    }
}
