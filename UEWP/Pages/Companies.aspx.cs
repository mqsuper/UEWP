using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using UEWP.Models;
using UEWP.Services.Service;

namespace UEWP.Web.Pages
{
    public partial class Companies : BasePage
    {
        CompanyManager compmanyMgr = new CompanyManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Header.Title = "公司列表";
            if (!Page.IsPostBack)
            {
                if (HasPermission())
                {
                    BindCompany();
                    SetDivVisible(true,divCompanyList,divInformationPanel);
                }
                else {
                    divInformationPanel.InnerText = "没有权限";
                    SetDivVisible(false, divCompanyList, divInformationPanel);
                }
            }
        }

        
        private List<Company> GetCompanies()
        {
         
            string keyWord = txtKeyword.Value.Trim();
            List<Company> list = compmanyMgr.GetCompanies(keyWord).OrderByDescending(com => com.ApproveStatus).ToList();
            return list;
        }
        private void BindCompany()
        {
            
            gvCompanies.DataSource = GetCompanies();
            gvCompanies.DataBind();
        }
        [WebMethod]
        public static ReturnClientObject AddCompany(Company newCom)
        {
            ReturnClientObject clientObj = new ReturnClientObject();
            try
            {
                if (newCom.ID == 0 || newCom.ID == -1)
                {
                    newCom.ApproveStatus = true;
                    new CompanyManager().Add(newCom);
                }
                else
                { 
                    //TODO编辑
                }
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
        protected void gvCompanies_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCompanies.PageIndex = e.NewPageIndex;
            BindCompany();
        }
        protected void btnRefreshCompanies_Click(object sender, EventArgs e)
        {
            BindCompany();
        }
    }
}