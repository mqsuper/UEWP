using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UEWP.Web.Pages
{
    public partial class TemplateList : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Header.Title = "模板列表";
        }
    }
}