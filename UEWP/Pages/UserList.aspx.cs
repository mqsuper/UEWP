using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using UEWP.Models;
using UEWP.Services.Service;
using UEWP.Web.Code;

namespace UEWP.Web.Pages
{
    public partial class UserList : BasePage
    {
        UserManager userMgr = new UserManager();
        static User loginUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            loginUser = UserHelper.CurrentUser;
            this.Page.Header.Title = "用户管理";
            if (!Page.IsPostBack)
            {
                if (HasPermission())
                {
                    BindUser();
                    SetDivVisible(true, divUserList, divInformationPanel);
                }
                else
                {
                    divInformationPanel.InnerHtml = "<p>没有权限</p>";
                    SetDivVisible(false, divUserList, divInformationPanel);
                }
            }
        }
        private List<User> GetUsers()
        {
          
            string keyWord = txtKeyword.Value.Trim();
            List<User> list = userMgr.GetAllUsers(loginUser, keyWord).ToList();
            return list;
        }
        private void BindUser()
        {
            gvUsers.DataSource = GetUsers();
            gvUsers.DataBind();
        }
        [WebMethod]
        public static ReturnClientObject AddUser(User newUser)
        {
            ReturnClientObject clientObj = new ReturnClientObject();
            try
            {
                string newID = string.Empty;
                if (string.IsNullOrEmpty(newUser.ID))
                {
                    newUser.CompanyID = loginUser.CompanyID;
                    newUser.CreatedBy = loginUser.Name;
                    newID = new UserManager().Add(newUser);
                }
                else //编辑
                { 
                    //TODO 增加编辑逻辑
                }
              
                
                clientObj.IsSucceed =string.IsNullOrEmpty(newID)?false: true;
                clientObj.Message = "添加成功";
            }
            catch (Exception ex)
            {
                clientObj.IsSucceed = false;
                clientObj.Message = ex.Message;
            }
            return clientObj;

        }

        protected void gvUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUsers.PageIndex = e.NewPageIndex;
            BindUser();
        }
        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            BindUser();
        }
    }
}