
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
       public int  Age { get; set; }
       public string Phone { get; set; }
       public bool IsActive { get; set; }
       public string CreatedBy { get; set; }
       public DateTime? Created { get; set; }
       
    }
}
