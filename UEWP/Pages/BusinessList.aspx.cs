using System;
using System.Collections.Generic;
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
    public partial class BusinessList : BasePage
    {

        BusinessManager bizMgr = new BusinessManager();
        User loginUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            loginUser = UserHelper.CurrentUser;
            this.Page.Header.Title = "业务列表";
            if (!Page.IsPostBack)
            {
                if (HasPermission())
                {
                    Bind();
                    SetDivVisible(true, divBusinessList, divInformationPanel);
                }
                else
                {
                    divInformationPanel.InnerText = "没有权限";
                    SetDivVisible(false, divBusinessList, divInformationPanel);
                }
            }
            
        }
        private List<Business> GetData()
        {
            string keyWord = txtKeyword.Value.Trim();
            List<Business> list = bizMgr.GetAllBizs(UserHelper.CurrentUser, keyWord).ToList();
            return list;
        }
        private void Bind()
        {
            gvBiz.DataSource = GetData();
            gvBiz.DataBind();
        }
        [WebMethod]
        public static ReturnClientObject Add()
        {
            ReturnClientObject clientObj = new ReturnClientObject();
            try
            {
                var newObj = new Business();
                newObj.Name = "Name";
                newObj.Description = "123456";             
                newObj.CreatedBy = "Johnny zhang";                
                newObj.ModifiedBy = "Johnny zhang";
                newObj.CompanyID = 4;
                new BusinessManager().Add(newObj);
                clientObj.IsSucceed = true;
                clientObj.Message = "添加成功";
            }
            catch (Exception ex)
            {
                clientObj.IsSucceed = false;
                clientObj.Message = ex.Message;
            }
            return clientObj;

        }
        protected void gvBiz_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBiz.PageIndex = e.NewPageIndex;
            Bind();
        }
        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            Bind();
        }
    }
}