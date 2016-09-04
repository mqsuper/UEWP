using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using UEWP.Models;
using UEWP.Services.Service;
using UEWP.Web.Code;

namespace UEWP.Web.Master
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        User loginUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            loginUser = UserHelper.CurrentUser;
            RenderMenuBasedonRole();
        }

        protected void btnLoginOut_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }
        private void RenderMenuBasedonRole()
        {
            StringBuilder sb = new StringBuilder();
            
            //build menu
            if (!loginUser.IsEnterpriseAdmin && !loginUser.IsSystemAdmin)
            {
                foreach (UserRole ur in loginUser.RoleList)
                {
                    sb.Append(string.Format(Constants.MenuItem, ur.BusinessID, "", ur.BusinessName));
                }
                divMenuItems.InnerHtml = sb.ToString();
            }
            
            
        }
    }
}