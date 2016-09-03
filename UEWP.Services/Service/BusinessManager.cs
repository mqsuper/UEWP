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
   public class BusinessManager
    {
       public int Add(Business obj)
       {
           int newID = -1;
           using (SqlConnection conn = new SqlConnection(SqlHelper.conStr)) //放在这里，以前以后有需要transation的地方
           {
               try
               {
                   #region parameters
                   #region
                    //@BusinessName nvarchar(50),
                    //@BusinessDescription nvarchar(200),	
                    //@CompanyID int output,
                    //@IsActive bit,
                    //@UserName nvarchar(50)
                   //@@BusinessID
                   #endregion
                   SqlCommand command = new SqlCommand();
                   command.CommandText = "AddBusiness";
                   command.CommandType = CommandType.StoredProcedure;

                   command.Parameters.Add(new SqlParameter() { ParameterName = "@BusinessName", SqlDbType = SqlDbType.NVarChar, Value = obj.Name });
                   command.Parameters.Add(new SqlParameter() { ParameterName = "@BusinessDescription", SqlDbType = SqlDbType.NVarChar, Value = obj.Description });
                   command.Parameters.Add(new SqlParameter() { ParameterName = "@CompanyID", SqlDbType = SqlDbType.Int, Value = obj.CompanyID });                 
                   command.Parameters.Add(new SqlParameter() { ParameterName = "@IsActive", SqlDbType = SqlDbType.Bit, Value = obj.IsActive });
                   command.Parameters.Add(new SqlParameter() { ParameterName = "@UserName", SqlDbType = SqlDbType.NVarChar, Value = obj.CreatedBy });
                   command.Parameters.Add(new SqlParameter() { ParameterName = "@BusinessID", SqlDbType = SqlDbType.NVarChar, Direction = ParameterDirection.Output });
                   
                   #endregion
                   SqlParameter[] parameters = new SqlParameter[command.Parameters.Count];
                   command.Parameters.CopyTo(parameters, 0);
                   SqlDataReader reader = SqlHelper.ExecuteReader(conn, command.CommandText, parameters);

                   if (reader.HasRows)
                   {
                       reader.Read();
                       int.TryParse(reader["BusinessID"].ToString(), out newID);
                   }
                   //关闭连接
                   reader.Close();
               }
               catch (Exception ex)
               {
                   LogHelper.Log(new UEWPLog() { }, "");
               }

               return newID;
           }
       }
       public List<Business> GetAllBizs(User currentUser,string keyWord)
       {
           List<Business> list = new List<Business>();
           //根据权限不同，返回不同的数据
           DataSet dsUser = GetDataSet(currentUser, keyWord);
           if (dsUser != null && dsUser.Tables.Count != 0)
           {
               foreach (DataRow row in dsUser.Tables[0].Rows)
               {
                   list.Add(SetViewModel(row));
               }
           }
           return list;
       }
       private DataSet GetDataSet(User currentUser, string keyWord)
       {
           SqlCommand command = new SqlCommand();
           switch (currentUser.RoleType)
           {
               case RoleType.CompanyAdmin:
                   {
                       command.CommandText = "GetBusinessByCompany";
                       command.Parameters.Add(new SqlParameter() { ParameterName = "@CompanyID", SqlDbType = SqlDbType.Int, Value = currentUser.CompanyID });
                       command.Parameters.Add(new SqlParameter() { ParameterName = "@keyWord", SqlDbType = SqlDbType.NVarChar, Value = keyWord });
                   };
                   break;
               case RoleType.SystemAdmin:
                   {
                       command.CommandText = "GetAllBusiness";
                       command.Parameters.Add(new SqlParameter() { ParameterName = "@keyWord", SqlDbType = SqlDbType.NVarChar, Value = keyWord });
                   };
                   break;
               default: break;
           }
           SqlParameter[] parameters = new SqlParameter[command.Parameters.Count];
           command.Parameters.CopyTo(parameters, 0);
           return SqlHelper.ExecuteDataset(SqlHelper.conStr, command.CommandText, parameters);
       }
       private Business SetViewModel(DataRow dr)
       {
           Business obj = new Business();
           obj.ID = dr["BUSINESSID"].ToString();
           obj.CompanyID = (dr["CompanyId"] == null || string.IsNullOrEmpty(dr["CompanyId"].ToString())) ? -1 : int.Parse(dr["CompanyId"].ToString());
           obj.Name = dr["BusinessName"].ToString();
           obj.Description = dr["BusinessDescription"].ToString();         
           obj.IsActive = dr["IsActive"] == null ? false : true;
           obj.Created = dr["CreatedDate"].ToString();
           obj.CreatedBy = dr["CreatedBy"].ToString();
           obj.Modified = dr["ModifiedDate"].ToString();
           obj.ModifiedBy = dr["ModifiedBy"].ToString();
           return obj;
       }
    }
}
