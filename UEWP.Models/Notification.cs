using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UEWP.Models
{
    public class Notification
    {
        public string ID { get; set; }
        public string Title { get; set; }
        public string Content { set;get; }
        public string To {set;get;}
        public string From {set;get;}
        public DateTime? DueDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? Created { get; set; }

    }
}
