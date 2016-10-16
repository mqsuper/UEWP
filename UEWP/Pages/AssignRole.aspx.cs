using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using UEWP.Models;
using UEWP.Services.Service;
using UEWP.Web.Code;

namespace UEWP.Web.Pages
{
    public partial class AssignRole : System.Web.UI.Page
    {
        public static User _currentUser;
        public static bool isEnterpriseAdmin = false;
      
        protected void Page_Load(object sender, EventArgs e)
        {
            _currentUser = UserHelper.CurrentUser;
        }
        [WebMethod]
        public static string GetRoleInformationonAllBusiness(string userID, int compandyID)
        {
            
            User selectedUser = new User();
            selectedUser.CompanyID = compandyID;
            selectedUser.ID = userID;
            #region             
            selectedUser = UserHelper.GetAllRoles(selectedUser);
            isEnterpriseAdmin = selectedUser.IsEnterpriseAdmin;
            #endregion

            #region business roles
            DataSet ds = new RoleManager().GetRoleInformationonAllBusiness(selectedUser);
            if(ds!=null && ds.Tables.Count!=0)
            {
                return BuildHtml(ds.Tables[0]);
            }
            #endregion
            return "";            
        }   
        /// <summary>
        /// //如果只是公司管理员， 只需要插入一条在T_User_Role 表
        //RoleType.EnterpriseAdmin, 不需要添加business 信息
        //如果不是管理员， 在根据选中的业务模块，插入相关的记录
        /// </summary>
        /// <param name="bizIDs">selected business IDs</param>
        /// <param name="isCompanyAdmin">whether the use was selected as company admin</param>
        /// <returns></returns>
        [WebMethod]
        public static string SaveRoleAssignment(string[] bizIDs, bool isCompanyAdmin,string userID, int companyID)
        {
            var user = _currentUser;
            _currentUser.RoleType = isCompanyAdmin == true ? RoleType.EnterpriseAdmin : RoleType.NormalUser;
            _currentUser.CompanyID = companyID;
            _currentUser.ID = userID;
            List<int> bizIDList=new List<int>();
            int bizID=-1;
            foreach (string s in bizIDs)
            {
                if (int.TryParse(s, out bizID))
                {
                    bizIDList.Add(bizID);
                }
            }
            new RoleManager().AssignRoles(_currentUser, bizIDList);
            
            return "";
            
        }
        
        static string BuildHtml(DataTable dt)
        { 
            StringBuilder sb=new StringBuilder();
            string isChecked=string.Empty;
            foreach (DataRow dr in dt.Rows)
            {
                if (dr["UserRoleID"] == null || string.IsNullOrEmpty(dr["UserRoleID"].ToString()))
                    isChecked = "";
                else
                    isChecked = "checked=\"Checked\"";
                sb.Append(string.Format(Constants.BUSINESSROW, dr["BusinessID"].ToString(), isChecked, dr["BusinessName"].ToString()));
            }
            return sb.ToString();
        }
    }
}