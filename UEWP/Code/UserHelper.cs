using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using UEWP.Models;
using UEWP.Services.Service;

namespace UEWP.Web.Code
{
    public class UserHelper
    {
        public static User CurrentUser
        {
            get
            {
                User u = new User();                
                string userName = HttpContext.Current.User.Identity.Name;
                if (HttpContext.Current.Session[userName] != null)
                {
                    u = (User)HttpContext.Current.Session[userName];
                    return u;
                }
                u = new UserManager().GetUserByEmail(userName);
                u = GetAllRoles(u);
                HttpContext.Current.Session[userName] = u;
                return u;
            }

        }

        public static User GetAllRoles(User u)
        {
            List<UserRole> roleList = new RoleManager().GetAllRolesByUserID(u);
            u.RoleList=roleList;
            if (roleList.FindAll(r => r.BusinessID == null && r.CompanyID==null).Count!=0)
            {
                u.IsSystemAdmin = true;
            }
            if (roleList.FindAll(r => r.BusinessID == null && r.CompanyID == u.CompanyID).Count != 0)
            {
                u.IsEnterpriseAdmin = true;
            }
           
           
           
            
            return u;
        }
    }
}