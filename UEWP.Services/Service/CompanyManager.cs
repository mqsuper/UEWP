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
    public class CompanyManager
    {
        public CompanyManager()
        { }
        /// <summary>
        /// </summary>
        /// <param name="com"></param>
        public int Add(Company com)
        {
            int newID = -1;
            using (SqlConnection conn = new SqlConnection(SqlHelper.conStr)) //放在这里，以前以后有需要transation的地方
            {
                try
                {
                    #region parameters
                    #region
                    //@CompanyName nvarchar(200),
                    //@CompanyAddress nvarchar(300),
                    //@CompanyPhone nvarchar(50),
                    //@CompanyContactor nvarchar (50),
                    //@IsActive bit,
                    //@ApprovalStatus bit, 
                    //@Level int,
                    //@CompanyID int output,
                    //@ApplyUserID Uniqueidentifier
                    #endregion
                    SqlCommand command = new SqlCommand();
                    command.CommandText = "AddCompany";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@CompanyName", SqlDbType = SqlDbType.NVarChar, Value = com.Name });
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@CompanyAddress", SqlDbType = SqlDbType.NVarChar, Value = com.Address });
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@CompanyPhone", SqlDbType = SqlDbType.NVarChar, Value = com.Phone });
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@CompanyContactor", SqlDbType = SqlDbType.NVarChar, Value = com.Contactor });
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@IsActive", SqlDbType = SqlDbType.Bit, Value = com.IsActive });
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@ApprovalStatus", SqlDbType = SqlDbType.Bit, Value = com.IsActive });
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@Level", SqlDbType = SqlDbType.Int, Value = com.Level });
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@CompanyID", SqlDbType = SqlDbType.NVarChar, Direction = ParameterDirection.Output });
                    command.Parameters.Add(new SqlParameter() { ParameterName = "@ApplyUserID", SqlDbType = SqlDbType.UniqueIdentifier, Value = com.Level });
                    #endregion
                    SqlParameter[] parameters = new SqlParameter[command.Parameters.Count];
                    command.Parameters.CopyTo(parameters, 0);
                    SqlDataReader reader = SqlHelper.ExecuteReader(conn, command.CommandText, parameters);

                    if (reader.HasRows)
                    {
                        reader.Read();
                        int.TryParse(reader["CompanyID"].ToString(), out newID);
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
        public void Update(Company com)
        {

        }
        public List<Company> GetCompanies(string keyWord)
        {
            List<Company> comList = new List<Company>();
            DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.conStr, "GetAllCompanies", new object[] { keyWord });
            if (ds != null && ds.Tables != null && ds.Tables[0].Rows.Count != 0)
            {
                Company com = new Company();
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    com = new Company();
                    com.ID = int.Parse(dr["CompanyID"].ToString());
                    com.Name = dr["CompanyName"].ToString();
                    com.Address = dr["ComanyAddress"].ToString();
                    com.Contactor = dr["CompanyName"].ToString();
                    com.Phone = dr["CompanyName"].ToString();
                    comList.Add(com);
                }
            }
            return comList;
        }
        public Company GetCompanyByID(int comID)
        {
            Company com = new Company();
            return com;

        }
    }

}
