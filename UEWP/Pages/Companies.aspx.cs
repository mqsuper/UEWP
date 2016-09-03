using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
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
                BindCompany();
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
        public static ReturnClientObject AddCompany()
        {
            ReturnClientObject clientObj = new ReturnClientObject();
            try
            {
                var company = new Company();
                company.Name = "Name";
                company.Phone = "123456";
                company.Address = "Address";
                company.Contactor = "johnny";
                new CompanyManager().Add(company);
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