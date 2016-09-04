using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UEWP.Data;
using UEWP.Models;

namespace UEWP.Services.Service
{
   public class RoleManager
    {
       /// <summary>
       /// 获得公司相关的业务信息以及用户在每个业务上的权限
       /// </summary>
       /// <param name="currentUser"></param>
       /// <returns></returns>
       public DataSet GetRoleInformationonAllBusiness(User currentUser)
       {
           SqlCommand command = new SqlCommand();
           command.CommandText = "GetRoleInformationonAllBusiness";
           //@CompanyID int,
           //@UserID uniqueIdentifier
           command.Parameters.Add(new SqlParameter() { ParameterName = "@CompanyID", SqlDbType = SqlDbType.Int, Value = currentUser.CompanyID });
           command.Parameters.Add(new SqlParameter() { ParameterName = "@UserID", SqlDbType = SqlDbType.UniqueIdentifier, Value = new Guid(currentUser.ID) });
           SqlParameter[] parameters = new SqlParameter[command.Parameters.Count];
           command.Parameters.CopyTo(parameters, 0);
           DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.conStr, command.CommandText, parameters);
           return ds;
       }
       /// <summary>
       /// 指定用户为企业管理员
       /// </summary>
       public int AssignRoles(User currentUser,List<int> bizIDs)
       {
           int affectedRow=0;
           //@UserID uniqueidentifier,
           // @RoleID int,
           // @BusinessID int,
           // @CompanyID int
           using (SqlConnection con = new SqlConnection(SqlHelper.conStr))
           {
               SqlCommand command = new SqlCommand();
               command.CommandText = "AddUserRole";

               if (currentUser.RoleType == RoleType.EnterpriseAdmin)
               {
                   command.Parameters.Add(new SqlParameter() { ParameterName = "@UserID", SqlDbType = SqlDbType.UniqueIdentifier, Value = new Guid(currentUser.ID) });
                   command.Parameters.Add(new SqlParameter() { ParameterName = "@RoleID", SqlDbType = SqlDbType.Int, Value = (int)RoleType.EnterpriseAdmin });
                   command.Parameters.Add(new SqlParameter() { ParameterName = "@BusinessID", SqlDbType = SqlDbType.Int, Value = null });
                   command.Parameters.Add(new SqlParameter() { ParameterName = "@CompanyID", SqlDbType = SqlDbType.Int, Value = currentUser.CompanyID });
                   SqlParameter[] parameters = new SqlParameter[command.Parameters.Count];
                   command.Parameters.CopyTo(parameters, 0);
                  affectedRow+= SqlHelper.ExecuteNonQuery(con, command.CommandText, parameters);
               }
               else
               {
                   foreach (int bizID in bizIDs)
                   {
                       command.Parameters.Clear();
                       command.Parameters.Add(new SqlParameter() { ParameterName = "@UserID", SqlDbType = SqlDbType.UniqueIdentifier, Value = new Guid(currentUser.ID) });
                       command.Parameters.Add(new SqlParameter() { ParameterName = "@RoleID", SqlDbType = SqlDbType.Int, Value = (int)RoleType.NormalUser });
                       command.Parameters.Add(new SqlParameter() { ParameterName = "@BusinessID", SqlDbType = SqlDbType.Int, Value = bizID });
                       command.Parameters.Add(new SqlParameter() { ParameterName = "@CompanyID", SqlDbType = SqlDbType.Int, Value = currentUser.CompanyID });
                       SqlParameter[] parameters = new SqlParameter[command.Parameters.Count];
                       command.Parameters.CopyTo(parameters, 0);
                       affectedRow += SqlHelper.ExecuteNonQuery(con, command.CommandText, parameters);
                   }
               }
               return affectedRow;
               
           }
       }
       public List<UserRole> GetAllRolesByUserID(User u)
       {
           List<UserRole> roleList = new List<UserRole>();
           //@UserID
           SqlCommand command = new SqlCommand();
           command.CommandText = "GetAllRolesByUserID";
           //@CompanyID int,
           //@UserID uniqueIdentifier
           command.Parameters.Add(new SqlParameter() { ParameterName = "@UserID", SqlDbType = SqlDbType.UniqueIdentifier, Value = new Guid(u.ID) });
           SqlParameter[] parameters = new SqlParameter[command.Parameters.Count];
           command.Parameters.CopyTo(parameters, 0);
           DataSet dsRoles = SqlHelper.ExecuteDataset(SqlHelper.conStr, command.CommandText, parameters);

           UserRole ur = new UserRole();
           if (dsRoles != null && dsRoles.Tables.Count > 0)
           {
               foreach (DataRow dr in dsRoles.Tables[0].Rows)
               {
                   roleList.Add(SetUserRole(dr));
               }
           }
           return roleList;
       }
       public List<UserRole> GetCompanyRolesByUserID(User u)
       {
           List<UserRole> roleList = new List<UserRole>();
           //GetAssignedBusinessByUserID
           //@UserID
           SqlCommand command = new SqlCommand();
           command.CommandText = "GetAssignedBusinessByUserID";
           //@CompanyID int,
           //@UserID uniqueIdentifier
           command.Parameters.Add(new SqlParameter() { ParameterName = "@UserID", SqlDbType = SqlDbType.UniqueIdentifier, Value = new Guid(u.ID) });
           command.Parameters.Add(new SqlParameter() { ParameterName = "@CompanyID", SqlDbType = SqlDbType.Int, Value = u.CompanyID});
           SqlParameter[] parameters = new SqlParameter[command.Parameters.Count];
           command.Parameters.CopyTo(parameters, 0);
           DataSet dsRoles = SqlHelper.ExecuteDataset(SqlHelper.conStr, command.CommandText, parameters);

           UserRole ur = new UserRole();
           if (dsRoles != null && dsRoles.Tables.Count > 0)
           {
               foreach (DataRow dr in dsRoles.Tables[0].Rows)
               {
                   roleList.Add(SetUserRole(dr));
               }
           }
           return roleList;
       }
       private UserRole SetUserRole(DataRow dr)
       {
           UserRole ur = new UserRole();
           ur.UserRoleID = dr["UserRoleID"].ToString();
           ur.UserID = dr["UserID"].ToString();
           ur.RoleID = int.Parse(dr["RoleID"].ToString());
           ur.BusinessName = dr["BusinessName"].ToString();
           if (string.IsNullOrEmpty(dr["BusinessID"].ToString()))
           {
               ur.BusinessID = null;
           }
           else
           {
               ur.BusinessID = int.Parse(dr["BusinessID"].ToString());
           }
           if (string.IsNullOrEmpty(dr["CompanyID"].ToString()))
           {
               ur.CompanyID = null;
           }
           else
           {
               ur.CompanyID = int.Parse(dr["CompanyID"].ToString());
           }
          
           return ur;
       }
    }
}
