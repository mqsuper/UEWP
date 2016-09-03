﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UEWP.Models
{
    public class Business
    {
        public string ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }        
        public bool IsActive { get; set; }
        public string CreatedBy { get; set; }
        public string Created { get; set; }
        public string Modified { get; set; }
        public string ModifiedBy { get; set; }
        public int CompanyID { set; get; }
    }
}
