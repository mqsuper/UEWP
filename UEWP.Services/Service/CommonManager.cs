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
    public class CommonManager
    {
        public CommonManager()
        { }

        public bool Register(User user, Company com)
        {
            bool isRegistered = true;
            string error = string.Empty;
            string sqlText = string.Empty;
                        
            using (SqlConnection conn = new SqlConnection(SqlHelper.conStr)) //放在这里，以前以后有需要transation的地方
            {
                try
                {
                    #region parameters
                    //@UserName nvarchar(50),
                    //@UserEmail nvarchar(100),
                    //@UserPWD nvarchar(100),
                    //@CompanyName nvarchar(200),
                    //@CompanyAddress nvarchar(300),
                    //@CompanyPhone nvarchar(50)
                    SqlCommand command = new SqlCommand();
                    command.CommandText = "Register";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@UserName", SqlDbType = SqlDbType.NVarChar, Value = user.Name });
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@UserEmail", SqlDbType = SqlDbType.NVarChar, Value = user.Email });
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@UserPWD", SqlDbType = SqlDbType.NVarChar, Value = user.Password });
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@CompanyName", SqlDbType = SqlDbType.NVarChar, Value = com.Name });
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@CompanyAddress", SqlDbType = SqlDbType.NVarChar, Value = com.Address});
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@CompanyPhone", SqlDbType = SqlDbType.NVarChar, Value = com.Phone });
                    #endregion 
                    SqlParameter[] parameters=new SqlParameter[command.Parameters.Count];
                    command.Parameters.CopyTo(parameters,0);
                    SqlHelper.ExecuteNonQuery(conn, command.CommandText, parameters) ;
                   
                    
                }
                catch (Exception ex)
                {
                     //log
                }
            }
            return isRegistered;

        }
    }
}
