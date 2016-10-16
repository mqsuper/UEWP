using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using UEWP.Models;
using UEWP.Web.Code;

namespace UEWP.Web
{
    public class BasePage : System.Web.UI.Page
    {
        public static User loginUser;
        protected override void OnInit(EventArgs e)
        {
            loginUser = UserHelper.CurrentUser;
            if (!Request.IsAuthenticated)
            {
                Response.Redirect("pages/login.aspx");
            }
        }
        protected bool HasPermission()
        {
            if (!loginUser.IsSystemAdmin && !loginUser.IsEnterpriseAdmin)
            {
                return false;
            }
            return true;
        }

        protected void SetDivVisible(bool hasPermission, HtmlGenericControl dataDiv, HtmlGenericControl messageDiv)
        {
            messageDiv.Visible = !hasPermission;
            dataDiv.Visible = hasPermission;
        }
    }
}