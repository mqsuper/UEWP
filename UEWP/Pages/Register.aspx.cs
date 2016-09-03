using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UEWP.Models;
using UEWP.Services.Service;

namespace UEWP.Web.Pages
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Header.Title = "用户注册";
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            var user = new User();
            user.Name = txtUserName.Value;
            user.Email = txtUserName.Value;
            user.Password = "ACBDEFG";

            var company = new Company();
            company.Name = txtCompanyName.Value;
            company.Phone = txtCompanyPhone.Value;
            company.Address = txtCompanyAddress.Value;
            company.Contactor = txtUserName.Value;

            //注册

            CommonManager commonManager = new CommonManager();
            commonManager.Register(user, company);


        }
    }
}