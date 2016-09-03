using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using UEWP.Services.Service;

namespace UEWP.Web.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Header.Title = "用户登录";
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            //不显示错误提示
            txtLoginMsg.Visible = false;
            string userName = txtUserEmail.Value.Trim();
            string userPWD=txtUserPWD.Value.Trim();
            bool isValid = new UserManager().Validate(userName, userPWD);
            if (!isValid)
            {
                txtLoginMsg.InnerText = "用户名或者密码不对，请检查。";
                txtLoginMsg.Visible = true;
            }
            else
            {
                FormsAuthentication.SetAuthCookie(userName, true);
                FormsAuthentication.RedirectFromLoginPage(userName,true);                
            }
        }
    }
}