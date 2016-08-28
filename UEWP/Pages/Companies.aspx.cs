using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UEWP.Models;
using UEWP.Services.Service;

namespace UEWP
{
    public partial class Companies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //test

            CompanyManager comManager = new CompanyManager();
           List<Company> list=comManager.GetCompanies("").OrderByDescending(com=>com.ApproveStatus).ToList();
           gvCompanies.DataSource = list;
           gvCompanies.DataBind();
        }
    }
}