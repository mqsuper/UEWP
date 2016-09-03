using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UEWP.Common;
using UEWP.Data;
using UEWP.Models;

namespace UEWP.Services.Service
{
    public class UserManager
    {
        /// <summary>
        /// 登录验证
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="pwd">做演示用， 密码没有加密</param>
        /// <returns></returns>
        public bool Validate(string userName, string pwd)
        {
            //对pwd进行加密处理
            pwd = EncryptionHelper.Encrypt(pwd);
            //验证
            object validate = SqlHelper.ExecuteScalar(SqlHelper.conStr, "ValidateUser", new object[] { userName, pwd });
            return (int)validate==0?false:true;
        }
        /// <summary>
        /// 根据用户权限获得用户列表
        /// </summary>
        /// <returns></returns>
        public List<User> GetAllUsers(User currentUser,string keyWord)
        {
            List<User> userList = new List<User>();
            //根据权限不同，返回不同的数据
            DataSet dsUser = GetUserDataSet(currentUser,keyWord);
            if (dsUser != null && dsUser.Tables.Count != 0)
            {
                foreach (DataRow row in dsUser.Tables[0].Rows)
                {
                    userList.Add(SetUser(row));
                }
            }
            return userList;
        }

        public string Add(User obj)
        {
            //加密密码：
            //for testing, set "admin" by default 
            obj.Password = "admin";
            obj.Password = EncryptionHelper.Encrypt(obj.Password);
            string newID = string.Empty;
            using (SqlConnection conn = new SqlConnection(SqlHelper.conStr)) //放在这里，以前以后有需要transation的地方
            {
                try
                {
                    #region parameters
                    #region
                   //@CompanyID int,
                   // @UserName nvarchar(50),
                   // @UserEmail nvarchar(100),
                   // @UserPWD nvarchar(100),
                   // @UserGender bit,
                   // @UserAge int,
                   // @UserPhone nvarchar(50),
                   // @IsActive bit,
                   // @CreatedBy nvarchar(50),
                   // @UserID uniqueidentifier output
                    #endregion
                    SqlCommand command = new SqlCommand();
                    command.CommandText = "AddUser";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@CompanyID", SqlDbType = SqlDbType.Int, Value = obj.CompanyID });
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@UserName", SqlDbType = SqlDbType.NVarChar, Value = obj.Name });
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@UserEmail", SqlDbType = SqlDbType.NVarChar, Value = obj.Email });
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@UserPWD", SqlDbType = SqlDbType.NVarChar, Value = obj.Password });
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@UserGender", SqlDbType = SqlDbType.Bit, Value = obj.Gender });
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@UserAge", SqlDbType = SqlDbType.Bit, Value = obj.Age });
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@UserPhone", SqlDbType = SqlDbType.NVarChar, Value = obj.Phone });
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@IsActive", SqlDbType = SqlDbType.Bit, Value = obj.IsActive });                    
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@CreatedBy", SqlDbType = SqlDbType.NVarChar, Value = obj.CreatedBy });
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@UserID", SqlDbType = SqlDbType.UniqueIdentifier, Direction = ParameterDirection.Output,Value=null });
                    #endregion
                    SqlParameter[] parameters = new SqlParameter[command.Parameters.Count];
                    command.Parameters.CopyTo(parameters, 0);
                    SqlDataReader reader = SqlHelper.ExecuteReader(conn, command.CommandText, parameters);

                    if (reader.HasRows)
                    {
                        reader.Read();
                        newID = reader["UserID"].ToString(); 
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

        /// <summary>
        /// @keyWord
        /// </summary>
        /// <param name="currentUser"></param>
        /// <returns></returns>
        private DataSet GetUserDataSet(User currentUser,string keyWord)
        {
            SqlCommand command = new SqlCommand();
            switch (currentUser.RoleType)
            {
                case RoleType.CompanyAdmin:
                    {
                        command.CommandText = "GetUsersByCompany";
                        command.Parameters.Add(new SqlParameter() { ParameterName = "@CompanyID", SqlDbType = SqlDbType.Int, Value = currentUser.CompanyID });
                        command.Parameters.Add(new SqlParameter() { ParameterName = "@keyWord", SqlDbType = SqlDbType.NVarChar, Value = keyWord });
                    };
                    break;
                case RoleType.SystemAdmin:
                    {
                        command.CommandText = "GetAllUsers";
                        command.Parameters.Add(new SqlParameter() { ParameterName = "@keyWord", SqlDbType = SqlDbType.NVarChar, Value = keyWord });
                    };
                    break;
                default: break;
            }
            SqlParameter[] parameters = new SqlParameter[command.Parameters.Count];
            command.Parameters.CopyTo(parameters, 0);
            return SqlHelper.ExecuteDataset(SqlHelper.conStr, command.CommandText, parameters);
        }
        private User SetUser(DataRow dr)
        {
            User obj = new User();
            obj.ID= dr["UserID"].ToString();
            obj.CompanyID = (dr["CompanyID"]==null|| string.IsNullOrEmpty(dr["UserAge"].ToString()))?-1:int.Parse(dr["CompanyID"].ToString());
            obj.Name = dr["UserName"].ToString();
            obj.Email = dr["UserEmail"].ToString();
            obj.Password = dr["UserPWD"].ToString();
            //1男，0女
            obj.Gender = dr["IsActive"]==null?false:true; 
            obj.Age = (dr["UserAge"]==null || string.IsNullOrEmpty(dr["UserAge"].ToString()))?-1: int.Parse( dr["UserAge"].ToString());
            obj.IsActive = dr["IsActive"]==null ?false:true;
            obj.Created = dr["CreatedDate"].ToString();
            obj.CreatedBy = dr["CreatedBy"].ToString();

            return obj;
        }
    }
}
