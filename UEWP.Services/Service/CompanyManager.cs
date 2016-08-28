﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UEWP.Data;
using UEWP.Models;

namespace UEWP.Services.Service
{
   public class CompanyManager
    {
       public CompanyManager()
       { }
       public void Add(Company com)
       { 
        
       }
       public void Update(Company com)
       { 
       
       }
       public List<Company> GetCompanies(string keyWord)
       {
           List<Company> comList = new List<Company>();
           DataSet ds=SqlHelper.ExecuteDataset(SqlHelper.conStr, "GET_COMPANIES", new object[] { keyWord });
           if (ds != null && ds.Tables != null &&ds.Tables[0].Rows.Count!=0)
           {
               Company com=new Company();
               foreach (DataRow dr in ds.Tables[0].Rows)
               { 
                    com=new Company();
                    com.ID = int.Parse(dr["CompanyID"].ToString());
                   com.Name=dr["CompanyName"].ToString();
                    com.Address=dr["ComanyAddress"].ToString();
                    com.Contactor = dr["CompanyName"].ToString();
                    com.Phone = dr["CompanyName"].ToString();
                    comList.Add(com);
               }
           }
           return comList;
       }
       public Company GetCompanyByID(int comID)
       {
           Company com = new Company();
           return com;
          
       }
    }
    
}
