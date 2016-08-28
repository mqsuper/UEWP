using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UEWP.Models
{
   public class Company
    {
       public string Name { get; set; }
       public string Address { get; set; }
       public string Phone { get; set; }
       public string Contactor { get; set; }
       public int ID { get; set; }
       public bool ApproveStatus{ get; set; }
    }
}
