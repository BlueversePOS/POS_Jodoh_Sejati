using ProjectXYZAPI.Model;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System;
using System.Data;
using System.Data.SqlClient;
using System.IdentityModel.Tokens.Jwt;
using System.Net;
using System.Runtime.CompilerServices;
using System.Security.Claims;
using System.Text;
using static ProjectXYZAPI.FunctionHelper;
using System.Linq;
using System.Collections.Generic;
using System.ComponentModel;

namespace ProjectXYZAPI.Repository
{
    public class Repo
    {
        string conString;
        private readonly SqlDBHelper sql;
        private IConfiguration _config;
        private SqlConnection conn;
        private SqlTransaction trans;

        static string GetActualAsyncMethodName([CallerMemberName]string name = null) => name;

        public Repo(IConfiguration config)
        {
            sql = new SqlDBHelper();
            _config = config;
        }

        public string connstring(string db)
        {
            return conString = Startup.ConnectionStringBuild(db);
        }

        private void ConnSql(string db)
        {
            try
            {
                string conns = connstring(db);

                if (conn == null)
                    conn = new SqlConnection(conns);
                if (conn.State != ConnectionState.Open)
                    conn.Open();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public dynamic isLoginValidOrNot(isLogin param)
        {
            dynamic result;
            string token = string.Empty;
            string val = string.Empty;
            try
            {
                param.PASSWORD = Encrypt(param.PASSWORD);
                using (SqlConnection con = new SqlConnection(connstring(param.INTERCOMPANY)))
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }

                    using (SqlCommand cmd = con.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "spAI_IsValidLoginOrNot";
                        cmd.CommandTimeout = 0;
                        cmd.Parameters.Add(new SqlParameter("@userId", param.USER));
                        cmd.Parameters.Add(new SqlParameter("@password", param.PASSWORD));
                        cmd.Parameters.Add("@isSuccess", SqlDbType.Bit);
                        cmd.Parameters["@isSuccess"].Direction = ParameterDirection.Output;
                        cmd.ExecuteNonQuery();

                        bool retval = Convert.ToBoolean(cmd.Parameters["@isSuccess"].Value);
                        if (retval == true)
                        {
                            token = GenerateJWT(param);
                            result = new
                            {
                                code = (int)HttpStatusCode.OK,
                                message = token
                            };
                        }
                        else
                        {
                            string msg = string.Empty;
                            int codes;
                            is_User_Validation(param);
                            val = is_User_Validation_Change(param);

                            if (Convert.ToInt32(val) >= 3)
                            {
                                codes = 103;
                                msg = "Your account is locked, please contact the Administrator";
                            }
                            else
                            {
                                codes = 403;
                                msg = "Invalid UserName or Password";
                            }

                            result = new
                            {
                                code = codes,
                                message = msg
                            };
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return result;

        }

        public dynamic isLoginSession(isLogin param)
        {
            dynamic result;
            string token = string.Empty;
            string val = string.Empty;
            string msg = string.Empty;
            int codes;
            try
            {
                using (SqlConnection con = new SqlConnection(connstring(param.INTERCOMPANY)))
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }

                    using (SqlCommand cmd = con.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "spAI_IsLoginSession";
                        cmd.CommandTimeout = 0;
                        cmd.Parameters.Add(new SqlParameter("@userId", param.USER));
                        cmd.Parameters.Add(new SqlParameter("@session", param.SessionID));
                        cmd.Parameters.Add(new SqlParameter("@dateLogin", DateTime.Now));
                        cmd.Parameters.Add(new SqlParameter("@interid", param.INTERCOMPANY));
                        cmd.Parameters.Add(new SqlParameter("@company", param.COMPANY_NAME ?? ""));
                        cmd.Parameters.Add("@isSuccess", SqlDbType.Bit);
                        cmd.Parameters["@isSuccess"].Direction = ParameterDirection.Output;
                        cmd.ExecuteNonQuery();

                        bool retval = Convert.ToBoolean(cmd.Parameters["@isSuccess"].Value);
                        if (retval == true)
                        {
                            result = new
                            {
                                code = "200",
                                message = ""
                            };
                        }
                        else
                        {
                            result = new
                            {
                                code = "999",
                                message = "Your account is already logged in, please try again later"
                            };
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return result;

        }

        public string is_User_Validation(isLogin param)
        {
            string retval = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(connstring(param.INTERCOMPANY)))
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }

                    using (SqlCommand cmd = con.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "BCAF_User_Validation";
                        cmd.CommandTimeout = 0;
                        cmd.Parameters.Add(new SqlParameter("@USERID", param.USER));
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                retval = ex.Message.ToString();
                return retval;
            }

            return retval;

        }

        public string is_User_Validation_Change(isLogin param)
        {
            string retval = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(connstring(param.INTERCOMPANY)))
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }

                    using (SqlCommand cmd = con.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "BCAF_User_Validation_Change";
                        cmd.CommandTimeout = 0;
                        cmd.Parameters.Add(new SqlParameter("@USERID", param.USER));
                        cmd.Parameters.Add("@output", SqlDbType.Int);
                        cmd.Parameters["@output"].Direction = ParameterDirection.Output;
                        cmd.ExecuteNonQuery();

                        retval = Convert.ToString(cmd.Parameters["@output"].Value);
                    }
                }
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                retval = ex.Message.ToString();
                return retval;
            }

            return retval;

        }

        public string is_User_Unlocked(isLogin param)
        {
            string retval = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(connstring(param.INTERCOMPANY)))
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }

                    using (SqlCommand cmd = con.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "BCAF_User_Unlocked";
                        cmd.CommandTimeout = 0;
                        cmd.Parameters.Add(new SqlParameter("@USERID", param.USER));
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                retval = ex.Message.ToString();
                return retval;
            }

            return retval;

        }

        private string GenerateJWT(isLogin param)
        {
            try
            {
                var security = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["JwtConfig:Key"]));
                var credential = new SigningCredentials(security, SecurityAlgorithms.HmacSha256);

                var claim = new[]
                {
                    new Claim(JwtRegisteredClaimNames.Sub,param.USER),
                    new Claim(JwtRegisteredClaimNames.Jti,Guid.NewGuid().ToString())
                };

                var token = new JwtSecurityToken(
                    issuer: _config["JwtConfig:Issuer"],
                    audience: _config["JwtConfig:Issuer"],
                    claim,
                    //expires: DateTime.Now.AddMinutes(120),
                    expires: DateTime.Now.AddDays(1),
                    signingCredentials: credential);

                var entoken = new JwtSecurityTokenHandler().WriteToken(token);
                return entoken;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static DataTable ListToDataTable<T>(IList<T> data)
        {
            try
            {
                DataTable table = new DataTable();

                //special handling for value types and string
                if (typeof(T).IsValueType || typeof(T).Equals(typeof(string)))
                {

                    DataColumn dc = new DataColumn("Value", typeof(T));
                    table.Columns.Add(dc);
                    foreach (T item in data)
                    {
                        DataRow dr = table.NewRow();
                        dr[0] = item;
                        table.Rows.Add(dr);
                    }
                }
                else
                {
                    PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(typeof(T));
                    foreach (PropertyDescriptor prop in properties)
                    {
                        table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);
                    }
                    foreach (T item in data)
                    {
                        DataRow row = table.NewRow();
                        foreach (PropertyDescriptor prop in properties)
                        {
                            try
                            {
                                row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;
                            }
                            catch (Exception)
                            {
                                row[prop.Name] = DBNull.Value;
                            }
                        }
                        table.Rows.Add(row);
                    }
                }
                return table;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw e;
            }

        }

        #region USER

        public DataTable getDataUser(UserLogin param)
        {
            DataTable dt = new DataTable();

            try
            {
                param.PASSWORD = Encrypt(param.PASSWORD);
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_LoginCheck", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@EmailAddress", param.EmailAddress ?? "");
                cmd.Parameters.AddWithValue("@PASSWORD", param.PASSWORD ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    db = "",
                    user = param.EmailAddress.ToString(),
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable SignUpUser(UserAccount param)
        {
            DataTable dt = new DataTable();

            ConnSql("");
            trans = conn.BeginTransaction();
            try
            {
                param.PASSWORD = Encrypt(param.PASSWORD);
                SqlCommand cmd = new SqlCommand("Web_SIGNUP_INSERTUPDATE", conn, trans);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");
                cmd.Parameters.AddWithValue("@EmailAddress", param.EmailAddress ?? "");
                cmd.Parameters.AddWithValue("@PASSWORD", param.PASSWORD ?? "");
                cmd.Parameters.AddWithValue("@Business_Name", param.Business_Name ?? "");
                cmd.Parameters.AddWithValue("@Currency", param.Currency ?? "");
                cmd.Parameters.AddWithValue("@Country", param.Country ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }

                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    db = "",
                    user = param.UserID.ToString(),
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
                if (trans != null)
                {
                    trans.Dispose();
                    trans = null;
                }
            }
            return dt;
        }

        public DataTable CheckEmailUser(UserLogin param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_CheckEmailUser", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@EmailAddress", param.EmailAddress ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    db = "",
                    user = param.EmailAddress.ToString(),
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable UpdatePasswordUser(UserLogin param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_UpdatePasswordUser", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@EmailAddress", param.EmailAddress ?? "");
                cmd.Parameters.AddWithValue("@PASSWORD", param.PASSWORD ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    db = "",
                    user = param.EmailAddress.ToString(),
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        #endregion

        #region Employee

        public DataTable GetAccessRight()
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_AccessRight_Getdatalist", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable GetAccessRightDetail(AccessRight param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_AccessRight_Getdatadetail", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@Role_ID", param.Role_ID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable SaveAccessRight(AccessRight param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                trans = conn.BeginTransaction();
                SqlCommand cmd = new SqlCommand("Web_AccessRight_SaveData", conn, trans);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");
                cmd.Parameters.AddWithValue("@Role_ID", param.Role_ID ?? "");
                cmd.Parameters.AddWithValue("@Role_Name", param.Role_Name ?? "");
                cmd.Parameters.AddWithValue("@POS_Flag", param.POS_Flag);
                cmd.Parameters.AddWithValue("@POS_AccessPayments", param.POS_AccessPayments);
                cmd.Parameters.AddWithValue("@POS_ApplyDiscount", param.POS_ApplyDiscount);
                cmd.Parameters.AddWithValue("@POS_ChangeTaxes", param.POS_ChangeTaxes);
                cmd.Parameters.AddWithValue("@POS_ViewReceipt", param.POS_ViewReceipt);
                cmd.Parameters.AddWithValue("@POS_ReprintSendReceipt", param.POS_ReprintSendReceipt);
                cmd.Parameters.AddWithValue("@POS_ViewShift", param.POS_ViewShift);
                cmd.Parameters.AddWithValue("@POS_ManageItemsPOS", param.POS_ManageItemsPOS);
                cmd.Parameters.AddWithValue("@POS_ViewCostPOS", param.POS_ViewCostPOS);
                cmd.Parameters.AddWithValue("@POS_ChangeSetting", param.POS_ChangeSetting);
                cmd.Parameters.AddWithValue("@BckOffice_Flag", param.BckOffice_Flag);
                cmd.Parameters.AddWithValue("@BckOffice_ViewSales", param.BckOffice_ViewSales);
                cmd.Parameters.AddWithValue("@BckOffice_ManageItemsOff", param.BckOffice_ManageItemsOff);
                cmd.Parameters.AddWithValue("@BckOffice_ViewCostOff", param.BckOffice_ViewCostOff);
                cmd.Parameters.AddWithValue("@BckOffice_ManageEmployee", param.BckOffice_ManageEmployee);
                cmd.Parameters.AddWithValue("@BckOffice_ManageCustomers", param.BckOffice_ManageCustomers);
                cmd.Parameters.AddWithValue("@BckOffice_EditSetting", param.BckOffice_EditSetting);
                cmd.Parameters.AddWithValue("@BckOffice_ManagePayTypes", param.BckOffice_ManagePayTypes);
                cmd.Parameters.AddWithValue("@BckOffice_ManageTaxes", param.BckOffice_ManageTaxes);
                cmd.Parameters.AddWithValue("@BckOffice_POSDevices", param.BckOffice_POSDevices);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
                if (trans != null)
                {
                    trans.Dispose();
                    trans = null;
                }
            }
            return dt;
        }

        public DataTable GetEmployee(Employee param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_Employee_Getdata", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@Employee_ID", param.Employee_ID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable SaveEmployee(Employee param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                trans = conn.BeginTransaction();
                SqlCommand cmd = new SqlCommand("Web_Employee_SaveData", conn, trans);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");
                cmd.Parameters.AddWithValue("@Employee_ID", param.Employee_ID ?? "");
                cmd.Parameters.AddWithValue("@Employee_Name", param.Employee_Name ?? "");
                cmd.Parameters.AddWithValue("@Email", param.Email ?? "");
                cmd.Parameters.AddWithValue("@Phone", param.Phone ?? "");
                cmd.Parameters.AddWithValue("@Role_ID", param.Role_ID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
                if (trans != null)
                {
                    trans.Dispose();
                    trans = null;
                }
            }
            return dt;
        }

        #endregion

        #region Account

        public DataTable GetDataAccount(Accounts param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_Account_GetData", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable SaveAccount(Accounts param)
        {
            DataTable dt = new DataTable();

            try
            {
                param.PASSWORD = Encrypt(param.PASSWORD);
                ConnSql("");

                trans = conn.BeginTransaction();
                SqlCommand cmd = new SqlCommand("Web_Account_SaveData", conn, trans);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");
                cmd.Parameters.AddWithValue("@EmailAddress", param.EmailAddress ?? "");
                cmd.Parameters.AddWithValue("@PASSWORD", param.PASSWORD ?? "");
                cmd.Parameters.AddWithValue("@Business_Name", param.Business_Name ?? "");
                cmd.Parameters.AddWithValue("@Currency", param.Currency ?? "");
                cmd.Parameters.AddWithValue("@Timezone", param.Timezone ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
                if (trans != null)
                {
                    trans.Dispose();
                    trans = null;
                }
            }
            return dt;
        }

        #endregion

        #region Item List

        public DataTable GetDataDiscount()
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_Discounts_GetData", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable SaveDiscount(Discount param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                trans = conn.BeginTransaction();
                SqlCommand cmd = new SqlCommand("Web_Discounts_SaveData", conn, trans);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");
                cmd.Parameters.AddWithValue("@Discount_ID", param.DISCOUNT_ID ?? "");
                cmd.Parameters.AddWithValue("@Discount_Name", param.DISCOUNT_NAME ?? "");
                cmd.Parameters.AddWithValue("@Discount_Type", param.DISCOUNT_TYPE);
                cmd.Parameters.AddWithValue("@Discount_Value", param.DISCOUNT_VALUE);
                cmd.Parameters.AddWithValue("@Restricted_Access", param.RESTRICTED_ACCESS);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
                if (trans != null)
                {
                    trans.Dispose();
                    trans = null;
                }
            }
            return dt;
        }

        public DataTable GetDataCategories()
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_Categories_GetData", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable SaveCategories(Category param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_Categories_SaveData", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");
                cmd.Parameters.AddWithValue("@Category_ID", param.Category_ID ?? "");
                cmd.Parameters.AddWithValue("@Category_Name", param.Category_Name ?? "");
                cmd.Parameters.AddWithValue("@Category_Color", param.Category_Color ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable SaveItem(ItemList param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                trans = conn.BeginTransaction();
                #region Convert Composite Item

                DataTable dtTblComp = new DataTable();

                if (param.CompositeItem != null)
                {
                    var tblFiltered = (from N in param.CompositeItem.AsEnumerable()
                                       select new
                                       {
                                           N.Item_Number,
                                           N.Item_Quantity,
                                           N.Item_Cost,
                                           N.Item_Composite
                                       }).ToList();

                    dtTblComp = ListToDataTable(tblFiltered);
                }
                else
                {
                    dtTblComp.Columns.Add("Item_Number", typeof(string));
                    dtTblComp.Columns.Add("Item_Quantity", typeof(int));
                    dtTblComp.Columns.Add("Item_Cost", typeof(decimal));
                    dtTblComp.Columns.Add("Item_Composite", typeof(string));
                }

                #endregion

                #region Convert Item Variant

                DataTable dtTblVar = new DataTable();

                if (param.ItemVariant != null)
                {
                    var tblFiltered = (from N in param.ItemVariant.AsEnumerable()
                                       select new
                                       {
                                           N.Item_Number,
                                           N.LineItem_Option,
                                           N.CB_Available,
                                           N.Option_ID,
                                           N.Option_Name,
                                           N.LineItem_Variant,
                                           N.Variant_Name,
                                           N.Item_Price,
                                           N.Item_Cost,
                                           N.InStock,
                                           N.LowStock,
                                           N.OptimalStock,
                                           N.Item_SKU,
                                           N.Item_Barcode
                                       }).ToList();

                    dtTblVar = ListToDataTable(tblFiltered);
                }
                else
                {
                    dtTblVar.Columns.Add("Item_Number", typeof(string));
                    dtTblVar.Columns.Add("LineItem_Option", typeof(int));
                    dtTblVar.Columns.Add("CB_Available", typeof(decimal));
                    dtTblVar.Columns.Add("Option_ID", typeof(string));
                    dtTblVar.Columns.Add("Option_Name", typeof(string));
                    dtTblVar.Columns.Add("LineItem_Variant", typeof(string));
                    dtTblVar.Columns.Add("Variant_Name", typeof(string));
                    dtTblVar.Columns.Add("Item_Price", typeof(string));
                    dtTblVar.Columns.Add("Item_Cost", typeof(string));
                    dtTblVar.Columns.Add("InStock", typeof(string));
                    dtTblVar.Columns.Add("LowStock", typeof(string));
                    dtTblVar.Columns.Add("OptimalStock", typeof(string));
                    dtTblVar.Columns.Add("Item_SKU", typeof(string));
                    dtTblVar.Columns.Add("Item_Barcode", typeof(string));
                }

                #endregion

                SqlCommand cmd = new SqlCommand("Web_Items_SaveData", conn, trans);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");
                cmd.Parameters.AddWithValue("@Item_Number", param.Item_Number ?? "");
                cmd.Parameters.AddWithValue("@Item_Name", param.Item_Name ?? "");
                cmd.Parameters.AddWithValue("@Item_Description", param.Item_Description ?? "");
                cmd.Parameters.AddWithValue("@UOFM", param.UOFM ?? "");
                cmd.Parameters.AddWithValue("@Category_ID", param.Category_ID ?? "");
                cmd.Parameters.AddWithValue("@Item_Sales", param.Item_Sales);
                cmd.Parameters.AddWithValue("@Item_SoldBy", param.Item_SoldBy);
                cmd.Parameters.AddWithValue("@Item_Price", param.Item_Price);
                cmd.Parameters.AddWithValue("@Item_Cost", param.Item_Cost);
                cmd.Parameters.AddWithValue("@Item_SKU", param.Item_SKU ?? "");
                cmd.Parameters.AddWithValue("@Item_Barcode", param.Item_Barcode ?? "");
                cmd.Parameters.AddWithValue("@Composite_Item", param.Composite_Item);
                cmd.Parameters.AddWithValue("@Track_Stock", param.Track_Stock);
                cmd.Parameters.AddWithValue("@InStock", param.InStock);
                cmd.Parameters.AddWithValue("@LowStock", param.LowStock);
                cmd.Parameters.AddWithValue("@Tax_ID", param.Tax_ID);
                cmd.Parameters.AddWithValue("@Representation", param.Representation);
                cmd.Parameters.AddWithValue("@Item_Color", param.Item_Color ?? "");
                cmd.Parameters.AddWithValue("@Item_Shape", param.Item_Shape ?? "");
                cmd.Parameters.AddWithValue("@Item_Image", param.Item_Image ?? "");

                var dtlprm = cmd.CreateParameter();
                dtlprm.TypeName = "dbo.COMPTYPE";
                dtlprm.Value = dtTblComp;
                dtlprm.ParameterName = "@COMPTYPE";
                cmd.Parameters.Add(dtlprm);

                var dtlprm2 = cmd.CreateParameter();
                dtlprm2.TypeName = "dbo.VARTYPE";
                dtlprm2.Value = dtTblVar;
                dtlprm2.ParameterName = "@VARTYPE";
                cmd.Parameters.Add(dtlprm2);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
                if (trans != null)
                {
                    trans.Dispose();
                    trans = null;
                }
            }
            return dt;
        }

        public DataTable GetCompositeItems(FilterItem param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_Items_GetDataComposite", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@Item_Number", param.Item_Number ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable GetDataItems(FilterItem param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_Items_GetDataList", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@Item_Number", param.Item_Number ?? "");
                cmd.Parameters.AddWithValue("@Category_ID", param.Category_ID ?? "");
                cmd.Parameters.AddWithValue("@StockAlert", param.LowStock);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable GetDataItemComposite(FilterItem param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_Items_GetItemComposite", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@Item_Number", param.Item_Number ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable GetDataItemVariant(FilterItem param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_Items_GetItemVariant", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@Item_Number", param.Item_Number ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        #endregion

        #region Account

        public DataTable GetDatalistCustomer(Customers param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_Customer_GetData", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable GetDataCustomer(Customers param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_Customer_GetDataDetail", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@Customer_ID", param.Customer_ID ?? "");
                cmd.Parameters.AddWithValue("@Customer_Code", param.Customer_Code ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable SaveCustomer(Customers param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                trans = conn.BeginTransaction();
                SqlCommand cmd = new SqlCommand("Web_Customer_SaveData", conn, trans);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");
                cmd.Parameters.AddWithValue("@Customer_ID", param.Customer_ID ?? "");
                cmd.Parameters.AddWithValue("@Customer_Name", param.Customer_Name ?? "");
                cmd.Parameters.AddWithValue("@Email", param.Email ?? "");
                cmd.Parameters.AddWithValue("@Phone", param.Phone ?? "");
                cmd.Parameters.AddWithValue("@Address", param.Address ?? "");
                cmd.Parameters.AddWithValue("@Country", param.Country ?? "");
                cmd.Parameters.AddWithValue("@Province", param.Province ?? "");
                cmd.Parameters.AddWithValue("@City", param.City ?? "");
                cmd.Parameters.AddWithValue("@Postal_Code", param.Postal_Code ?? "");
                cmd.Parameters.AddWithValue("@Customer_Code", param.Customer_Code ?? "");
                cmd.Parameters.AddWithValue("@Note", param.Note ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
                if (trans != null)
                {
                    trans.Dispose();
                    trans = null;
                }
            }
            return dt;
        }

        #endregion

        #region Setting

        public DataTable GetDataFeatures(Param param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_Sett_FeaturesGetData", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@Feature_ID", param.ID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable SaveFeatures(Features param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                trans = conn.BeginTransaction();
                SqlCommand cmd = new SqlCommand("Web_Sett_SaveDataFeature", conn, trans);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");
                cmd.Parameters.AddWithValue("@Feature_ID", param.Feature_ID ?? "");
                cmd.Parameters.AddWithValue("@Feature_Shift", param.Feature_Shift);
                cmd.Parameters.AddWithValue("@Feature_TimeClock", param.Feature_TimeClock);
                cmd.Parameters.AddWithValue("@Feature_LowStock", param.Feature_LowStock);
                cmd.Parameters.AddWithValue("@Feature_NegativeStock", param.Feature_NegativeStock);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
                if (trans != null)
                {
                    trans.Dispose();
                    trans = null;
                }
            }
            return dt;
        }

        public DataTable GetDataPaymentType(Param param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_Sett_PayTypeGetData", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@Payment_ID", param.ID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable SavePaymentType(PaymentType param)
        {
            DataTable dt = new DataTable();

            try
            {
                #region Convert Store

                DataTable dtTbl = new DataTable();

                if (param.payStore != null)
                {
                    var tblFiltered = (from N in param.payStore.AsEnumerable()
                                       select new
                                       {
                                           N.LineItem,
                                           N.AllStore,
                                           N.Store_ID,
                                           N.Store_Name
                                       }).ToList();

                    dtTbl = ListToDataTable(tblFiltered);
                }
                else
                {
                    dtTbl.Columns.Add("LineItem", typeof(int));
                    dtTbl.Columns.Add("AllStore", typeof(int));
                    dtTbl.Columns.Add("Store_ID", typeof(string));
                    dtTbl.Columns.Add("Store_Name", typeof(string));
                }

                #endregion
                ConnSql("");

                trans = conn.BeginTransaction();
                SqlCommand cmd = new SqlCommand("Web_Sett_SaveDataPayment", conn, trans);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");
                cmd.Parameters.AddWithValue("@Payment_ID", param.Payment_ID ?? "");
                cmd.Parameters.AddWithValue("@Payment_Type", param.Payment_Type ?? "");
                cmd.Parameters.AddWithValue("@Payment_Name", param.Payment_Name ?? "");
                cmd.Parameters.AddWithValue("@AllStore", param.AllStore);

                var dtlprm = cmd.CreateParameter();
                dtlprm.TypeName = "dbo.PAYTYPE";
                dtlprm.Value = dtTbl;
                dtlprm.ParameterName = "@PAYTYPE";
                cmd.Parameters.Add(dtlprm);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
                if (trans != null)
                {
                    trans.Dispose();
                    trans = null;
                }
            }
            return dt;
        }

        public DataTable GetDataTaxes(Param param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_Sett_TaxesGetData", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@Tax_ID", param.ID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable SaveTaxes(Taxes param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                trans = conn.BeginTransaction();
                SqlCommand cmd = new SqlCommand("Web_Sett_SaveDataTaxes", conn, trans);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");
                cmd.Parameters.AddWithValue("@Tax_ID", param.Tax_ID ?? "");
                cmd.Parameters.AddWithValue("@Tax_Name", param.Tax_Name ?? "");
                cmd.Parameters.AddWithValue("@Tax_Rate", param.Tax_Rate);
                cmd.Parameters.AddWithValue("@Tax_Type", param.Tax_Type);
                cmd.Parameters.AddWithValue("@Tax_Option", param.Tax_Option);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
                if (trans != null)
                {
                    trans.Dispose();
                    trans = null;
                }
            }
            return dt;
        }

        public DataTable GetDataStores(Param param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_Sett_StoresGetData", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@Store_ID", param.ID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable SaveStore(Stores param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                trans = conn.BeginTransaction();
                SqlCommand cmd = new SqlCommand("Web_Sett_SaveDataStore", conn, trans);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");
                cmd.Parameters.AddWithValue("@Store_ID", param.Store_ID ?? "");
                cmd.Parameters.AddWithValue("@Store_Name", param.Store_Name ?? "");
                cmd.Parameters.AddWithValue("@Address", param.Address ?? "");
                cmd.Parameters.AddWithValue("@Country", param.Country ?? "");
                cmd.Parameters.AddWithValue("@CountryName", param.CountryName ?? "");
                cmd.Parameters.AddWithValue("@Province", param.Province ?? "");
                cmd.Parameters.AddWithValue("@City", param.City ?? "");
                cmd.Parameters.AddWithValue("@Postal_Code", param.Postal_Code ?? "");
                cmd.Parameters.AddWithValue("@Phone", param.Phone ?? "");
                cmd.Parameters.AddWithValue("@Description", param.Description ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
                if (trans != null)
                {
                    trans.Dispose();
                    trans = null;
                }
            }
            return dt;
        }

        public DataTable GetDataSalesType(Param param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_Sett_SalesTypeGetData", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@SalesType_ID", param.ID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable SaveSalesType(SalesType param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                trans = conn.BeginTransaction();
                SqlCommand cmd = new SqlCommand("Web_Sett_SaveDataSalesType", conn, trans);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");
                cmd.Parameters.AddWithValue("@SalesType_ID", param.SalesType_ID ?? "");
                cmd.Parameters.AddWithValue("@SalesType_Name", param.SalesType_Name ?? "");
                cmd.Parameters.AddWithValue("@Store_ID", param.Store_ID ?? "");
                cmd.Parameters.AddWithValue("@Store_Name", param.Store_Name ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
                if (trans != null)
                {
                    trans.Dispose();
                    trans = null;
                }
            }
            return dt;
        }

        public DataTable GetDataSites(Param param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_Sett_SitesGetData", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@Site_ID", param.ID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable SaveSite(Sites param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                trans = conn.BeginTransaction();
                SqlCommand cmd = new SqlCommand("Web_Sett_SaveDataSite", conn, trans);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");
                cmd.Parameters.AddWithValue("@Site_ID", param.Site_ID ?? "");
                cmd.Parameters.AddWithValue("@Site_Name", param.Site_Name ?? "");
                cmd.Parameters.AddWithValue("@DefaultSite", param.DefaultSite);
                cmd.Parameters.AddWithValue("@Store_ID", param.Store_ID ?? "");
                cmd.Parameters.AddWithValue("@Store_Name", param.Store_Name ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
                if (trans != null)
                {
                    trans.Dispose();
                    trans = null;
                }
            }
            return dt;
        }

        public DataTable GetDataDevices(Param param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_Sett_DevicesGetData", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@POS_Device_ID", param.ID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable SaveDevice(Devices param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                trans = conn.BeginTransaction();
                SqlCommand cmd = new SqlCommand("Web_Sett_SaveDataDevice", conn, trans);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");
                cmd.Parameters.AddWithValue("@POS_Device_ID", param.POS_Device_ID ?? "");
                cmd.Parameters.AddWithValue("@POS_Device_Name", param.POS_Device_Name ?? "");
                cmd.Parameters.AddWithValue("@Store_ID", param.Store_ID ?? "");
                cmd.Parameters.AddWithValue("@Store_Name", param.Store_Name ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
                if (trans != null)
                {
                    trans.Dispose();
                    trans = null;
                }
            }
            return dt;
        }

        #endregion

        #region Generate Number

        public DataTable GetNumberMaster(GenerateNumberParam param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_Generate_NewNumber", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@TABLE", param.TABLE ?? "");
                cmd.Parameters.AddWithValue("@FIELD", param.FIELD ?? "");
                cmd.Parameters.AddWithValue("@DOCID", param.DOCID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable GenerateNumberTRX(GenerateNumberParam param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("TRX_GenerateNumber_Master", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@TABLE", param.TABLE ?? "");
                cmd.Parameters.AddWithValue("@FIELD", param.FIELD ?? "");
                cmd.Parameters.AddWithValue("@DOCID", param.DOCID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable GenerateNumberPerDay(GenerateNumber param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("TRX_GenerateNumberPerDay_Master", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@DOCID", param.DOCID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        #endregion

        #region Transaction

        #region Mobile

        public DataTable GetReason()
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_Trx_GetReason", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable SaveOpenShift(ShiftParam param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("TRX_SaveOpenShift", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@Batch_ID", param.Batch_ID ?? "");
                cmd.Parameters.AddWithValue("@Lineitmseq", param.Lineitmseq);
                cmd.Parameters.AddWithValue("@Payment_ID", param.Payment_ID ?? "");
                cmd.Parameters.AddWithValue("@Payment_Type", param.Payment_Type ?? "");
                cmd.Parameters.AddWithValue("@Amount_Opening", param.Amount_Opening);
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable SaveCloseShift(ShiftParam param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("TRX_SaveCloseShift", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@Batch_ID", param.Batch_ID ?? "");
                cmd.Parameters.AddWithValue("@Lineitmseq", param.Lineitmseq);
                cmd.Parameters.AddWithValue("@Payment_ID", param.Payment_ID ?? "");
                cmd.Parameters.AddWithValue("@Payment_Type", param.Payment_Type ?? "");
                cmd.Parameters.AddWithValue("@Amount_Opening", param.Amount_Opening);
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable SaveCashManagement(CashManagement param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("TRX_SaveCashManagement", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@Batch_ID", param.Batch_ID ?? "");
                cmd.Parameters.AddWithValue("@Type_CashManagement", param.Type_CashManagement ?? "");
                cmd.Parameters.AddWithValue("@Amount", param.Amount);
                cmd.Parameters.AddWithValue("@Notes", param.Notes ?? "");
                cmd.Parameters.AddWithValue("@POS_ID", param.POS_ID ?? "");
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable SaveSummaryShift(SummShiftParam param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("TRX_SaveSummaryShift", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@Batch_ID", param.Batch_ID ?? "");
                cmd.Parameters.AddWithValue("@LastEdit_Date", param.LastEdit_Date);
                cmd.Parameters.AddWithValue("@LastEdit_time", param.LastEdit_time);
                cmd.Parameters.AddWithValue("@Store_ID", param.Store_ID ?? "");
                cmd.Parameters.AddWithValue("@POS_Device_ID", param.POS_Device_ID ?? "");
                cmd.Parameters.AddWithValue("@Opening_Date", param.Opening_Date);
                cmd.Parameters.AddWithValue("@Opening_time", param.Opening_time);
                cmd.Parameters.AddWithValue("@Closing_Date", param.Closing_Date);
                cmd.Parameters.AddWithValue("@Closing_time", param.Closing_time);
                cmd.Parameters.AddWithValue("@Sum_Amount_Opening", param.Sum_Amount_Opening);
                cmd.Parameters.AddWithValue("@Sum_Amount_Closing", param.Sum_Amount_Closing);
                cmd.Parameters.AddWithValue("@Sum_Invoice_Posted", param.Sum_Invoice_Posted);
                cmd.Parameters.AddWithValue("@Sum_Tendered", param.Sum_Tendered);
                cmd.Parameters.AddWithValue("@Sum_Changes", param.Sum_Changes);
                cmd.Parameters.AddWithValue("@Sum_Amount_Discount", param.Sum_Amount_Discount);
                cmd.Parameters.AddWithValue("@Sum_Amount_Tax", param.Sum_Amount_Tax);
                cmd.Parameters.AddWithValue("@Sum_Invoice_Refund_Posted", param.Sum_Invoice_Refund_Posted);
                cmd.Parameters.AddWithValue("@Sum_Amount_PayOut", param.Sum_Amount_PayOut);
                cmd.Parameters.AddWithValue("@Sum_Amount_PayIn", param.Sum_Amount_PayIn);
                cmd.Parameters.AddWithValue("@Count_Customers", param.Count_Customers);
                cmd.Parameters.AddWithValue("@Status_Batch", param.Status_Batch);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable GetSummaryShift(GetSummShiftParam param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("TRX_GetSummaryShift", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@Batch_ID", param.Batch_ID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable SaveSetupPrinter(SetupPrint param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("TRX_SaveSetupPrinter", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@PrinterID", param.PrinterID ?? "");
                cmd.Parameters.AddWithValue("@PrinterName", param.PrinterName ?? "");
                cmd.Parameters.AddWithValue("@Printer_Checkbox1", param.Printer_Checkbox1);
                cmd.Parameters.AddWithValue("@Printer_Checkbox2", param.Printer_Checkbox2);
                cmd.Parameters.AddWithValue("@Printer_Checkbox3", param.Printer_Checkbox3);
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable SaveTransaction(TrxHeader param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                trans = conn.BeginTransaction();
                #region Convert Detail

                DataTable dtTbl = new DataTable();

                if (param.TrxDetailTYPE != null)
                {
                    var tblFiltered = (from N in param.TrxDetailTYPE.AsEnumerable()
                                       select new
                                       {
                                           N.DOCNUMBER,
                                           N.DOCTYPE,
                                           N.DOCDATE,
                                           N.Lineitmseq,
                                           N.Item_Number,
                                           N.Item_Description,
                                           N.Quantity,
                                           N.UofM,
                                           N.Item_Price,
                                           N.Item_Cost,
                                           N.Store_ID,
                                           N.Site_ID,
                                           N.SalesType_ID,
                                           N.Discount_ID,
                                           N.Discount_Amount,
                                           N.Notes,
                                           N.POS_Device_ID,
                                           N.POS_Version
                                       }).ToList();

                    dtTbl = ListToDataTable(tblFiltered);
                }
                else
                {
                    dtTbl.Columns.Add("DOCNUMBER", typeof(string));
                    dtTbl.Columns.Add("DOCTYPE", typeof(int));
                    dtTbl.Columns.Add("DOCDATE", typeof(DateTime));
                    dtTbl.Columns.Add("Lineitmseq", typeof(int));
                    dtTbl.Columns.Add("Item_Number", typeof(string));
                    dtTbl.Columns.Add("Item_Description", typeof(string));
                    dtTbl.Columns.Add("Quantity", typeof(decimal));
                    dtTbl.Columns.Add("UofM", typeof(string));
                    dtTbl.Columns.Add("Item_Price", typeof(decimal));
                    dtTbl.Columns.Add("Item_Cost", typeof(decimal));
                    dtTbl.Columns.Add("Store_ID", typeof(string));
                    dtTbl.Columns.Add("Site_ID", typeof(string));
                    dtTbl.Columns.Add("SalesType_ID", typeof(string));
                    dtTbl.Columns.Add("Discount_ID", typeof(string));
                    dtTbl.Columns.Add("Discount_Amount", typeof(decimal));
                    dtTbl.Columns.Add("Notes", typeof(string));
                    dtTbl.Columns.Add("POS_Device_ID", typeof(string));
                    dtTbl.Columns.Add("POS_Version", typeof(string));
                }

                #endregion

                SqlCommand cmd = new SqlCommand("TRX_SaveTrx_TEMP", conn, trans);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");
                cmd.Parameters.AddWithValue("@DOCNUMBER", param.DOCNUMBER ?? "");
                cmd.Parameters.AddWithValue("@DOCTYPE", param.DOCTYPE);
                cmd.Parameters.AddWithValue("@DOCDATE", param.DOCDATE);
                cmd.Parameters.AddWithValue("@Store_ID", param.Store_ID ?? "");
                cmd.Parameters.AddWithValue("@Site_ID", param.Site_ID ?? "");
                cmd.Parameters.AddWithValue("@SalesType_ID", param.SalesType_ID ?? "");
                cmd.Parameters.AddWithValue("@CustName", param.CustName ?? "");
                cmd.Parameters.AddWithValue("@Total_Line_Item", param.Total_Line_Item);
                cmd.Parameters.AddWithValue("@ORIGTOTAL", param.ORIGTOTAL);
                cmd.Parameters.AddWithValue("@SUBTOTAL", param.SUBTOTAL);
                cmd.Parameters.AddWithValue("@Tax_Amount", param.Tax_Amount);
                cmd.Parameters.AddWithValue("@Discount_ID", param.Discount_ID ?? "");
                cmd.Parameters.AddWithValue("@Discount_Amount", param.Discount_Amount);
                cmd.Parameters.AddWithValue("@Amount_Tendered", param.Amount_Tendered);
                cmd.Parameters.AddWithValue("@Change_Amount", param.Change_Amount);
                cmd.Parameters.AddWithValue("@Batch_ID", param.Batch_ID ?? "");
                cmd.Parameters.AddWithValue("@POS_Device_ID", param.POS_Device_ID ?? "");
                cmd.Parameters.AddWithValue("@POS_Version", param.POS_Version ?? "");
                cmd.Parameters.AddWithValue("@SyncStatus", param.SyncStatus);
                cmd.Parameters.AddWithValue("@Payment_ID", param.Payment_ID ?? "");
                cmd.Parameters.AddWithValue("@Payment_Type", param.Payment_Type ?? "");
                cmd.Parameters.AddWithValue("@Lnitmseq", param.Lnitmseq);

                var dtlprm = cmd.CreateParameter();
                dtlprm.TypeName = "dbo.TrxDetailTYPE";
                dtlprm.Value = dtTbl;
                dtlprm.ParameterName = "@TrxDetailTYPE";
                cmd.Parameters.Add(dtlprm);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
                if (trans != null)
                {
                    trans.Dispose();
                    trans = null;
                }
            }
            return dt;
        }

        public DataTable SaveTrxPost(TrxPost param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                trans = conn.BeginTransaction();

                SqlCommand cmd = new SqlCommand("TRX_SaveTrx_POST", conn, trans);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@DOCNUMBER", param.DOCNUMBER ?? "");
                cmd.Parameters.AddWithValue("@SyncStatus", param.SyncStatus);
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
                if (trans != null)
                {
                    trans.Dispose();
                    trans = null;
                }
            }
            return dt;
        }

        #endregion

        #region Stock Adjustment

        public DataTable AdjGetDataItems(SAFilterItem param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("TRX_Adjustment_GetItemBySite", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@Item_Number", param.Item_Number ?? "");
                cmd.Parameters.AddWithValue("@LineItem_Option", param.LineItem_Option);
                cmd.Parameters.AddWithValue("@Site_ID", param.Site_ID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable AdjGetDataList(SAFilterItem param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("TRX_Adjustment_GetDataList", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@Reason", param.Reason ?? "");
                cmd.Parameters.AddWithValue("@Store_ID", param.Store_ID ?? "");
                cmd.Parameters.AddWithValue("@Site_ID", param.Site_ID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable AdjGetDataHeader(SAFilterItem param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("TRX_Adjustment_GetDataHeader", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@DOCNUMBER", param.DOCNUMBER ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable AdjGetDataDetail(SAFilterItem param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("TRX_Adjustment_GetDataDetail", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@DOCNUMBER", param.DOCNUMBER ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable SaveAdj(SAHeader param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                trans = conn.BeginTransaction();

                #region Items

                DataTable dtTbl = new DataTable();

                if (param.SADetails != null)
                {
                    var tblFiltered = (from N in param.SADetails.AsEnumerable()
                                       select new
                                       {
                                           N.DOCDATE,
                                           N.Reason,
                                           N.Lineitmseq,
                                           N.Item_Number,
                                           N.LineItem_Option,
                                           N.Item_Description,
                                           N.Qty_Stock,
                                           N.Qty_Add_Stock,
                                           N.Qty_Remove_Stock,
                                           N.Item_Cost,
                                           N.Qty_After_Stock,
                                           N.Expected_Stock,
                                           N.Counted_Stock
                                       }).ToList();

                    dtTbl = ListToDataTable(tblFiltered);
                }
                else
                {
                    dtTbl.Columns.Add("Item_Number", typeof(string));
                    dtTbl.Columns.Add("DOCDATE", typeof(DateTime));
                    dtTbl.Columns.Add("Reason", typeof(string));
                    dtTbl.Columns.Add("Lineitmseq", typeof(int));
                    dtTbl.Columns.Add("Item_Number", typeof(string));
                    dtTbl.Columns.Add("LineItem_Option", typeof(int));
                    dtTbl.Columns.Add("Item_Description", typeof(string));
                    dtTbl.Columns.Add("Qty_Stock", typeof(decimal));
                    dtTbl.Columns.Add("Qty_Add_Stock", typeof(decimal));
                    dtTbl.Columns.Add("Qty_Remove_Stock", typeof(decimal));
                    dtTbl.Columns.Add("Item_Cost", typeof(decimal));
                    dtTbl.Columns.Add("Qty_After_Stock", typeof(decimal));
                    dtTbl.Columns.Add("Expected_Stock", typeof(decimal));
                    dtTbl.Columns.Add("Counted_Stock", typeof(decimal));
                }

                #endregion

                SqlCommand cmd = new SqlCommand("TRX_Adjustment_Save", conn, trans);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@DOCNUMBER", param.DOCNUMBER ?? "");
                cmd.Parameters.AddWithValue("@DOCDATE", param.DOCDATE);
                cmd.Parameters.AddWithValue("@Site_ID", param.Site_ID ?? "");
                cmd.Parameters.AddWithValue("@Site_Name", param.Site_Name ?? "");
                cmd.Parameters.AddWithValue("@Reason", param.Reason ?? "");
                cmd.Parameters.AddWithValue("@Total_Line_Item", param.Total_Line_Item);
                cmd.Parameters.AddWithValue("@Notes", param.Notes ?? "");
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");

                var dtlprm = cmd.CreateParameter();
                dtlprm.TypeName = "dbo.TrxAdjDetailTYPE";
                dtlprm.Value = dtTbl;
                dtlprm.ParameterName = "@TrxAdjDetailTYPE";
                cmd.Parameters.Add(dtlprm);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
                if (trans != null)
                {
                    trans.Dispose();
                    trans = null;
                }
            }
            return dt;
        }

        #endregion

        #region Transfer Item

        public DataTable TrfItemGetItemBySite(TrfItemFilter param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("TRX_TrfItem_GetItemBySite", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@Item_Number", param.Item_Number ?? "");
                cmd.Parameters.AddWithValue("@LineItem_Option", param.LineItem_Option);
                cmd.Parameters.AddWithValue("@SourceSite_ID", param.SourceSite_ID ?? "");
                cmd.Parameters.AddWithValue("@DestSite_ID", param.DestSite_ID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable TrfItemGetDataTransfer(TrfItemFilter param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("TRX_TrfItem_GetDataTransfer", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@Status", param.Status);
                cmd.Parameters.AddWithValue("@SourceSite_ID", param.SourceSite_ID ?? "");
                cmd.Parameters.AddWithValue("@DestSite_ID", param.DestSite_ID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable TrfItemGetDataHeader(TrfItemFilter param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("TRX_TrfItem_GetDataTransferHDR", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@DOCNUMBER", param.DOCNUMBER ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable TrfItemGetDataDetail(TrfItemFilter param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("TRX_TrfItem_GetDataTransferDTL", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@DOCNUMBER", param.DOCNUMBER ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable TrfItemSaveTransfer(TransferItemHeader param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                trans = conn.BeginTransaction();

                #region Items

                DataTable dtTbl = new DataTable();

                if (param.TrfDetails != null)
                {
                    var tblFiltered = (from N in param.TrfDetails.AsEnumerable()
                                       select new
                                       {
                                           N.DOCDATE,
                                           N.Lineitmseq,
                                           N.Item_Number,
                                           N.LineItem_Option,
                                           N.Item_Description,
                                           N.Item_SKU,
                                           N.Source_Stock,
                                           N.Dest_Stock,
                                           N.Qty_Transfer
                                       }).ToList();

                    dtTbl = ListToDataTable(tblFiltered);
                }
                else
                {
                    dtTbl.Columns.Add("DOCDATE", typeof(DateTime));
                    dtTbl.Columns.Add("Lineitmseq", typeof(int));
                    dtTbl.Columns.Add("Item_Number", typeof(string));
                    dtTbl.Columns.Add("LineItem_Option", typeof(int));
                    dtTbl.Columns.Add("Item_Description", typeof(string));
                    dtTbl.Columns.Add("Item_SKU", typeof(string));
                    dtTbl.Columns.Add("Source_Stock", typeof(decimal));
                    dtTbl.Columns.Add("Dest_Stock", typeof(decimal));
                    dtTbl.Columns.Add("Qty_Transfer", typeof(decimal));
                }

                #endregion

                SqlCommand cmd = new SqlCommand("TRX_TrfItem_SaveTemp", conn, trans);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@DOCNUMBER", param.DOCNUMBER ?? "");
                cmd.Parameters.AddWithValue("@DOCDATE", param.DOCDATE);
                cmd.Parameters.AddWithValue("@SourceSite_ID", param.SourceSite_ID ?? "");
                cmd.Parameters.AddWithValue("@SourceSite_Name", param.SourceSite_Name ?? "");
                cmd.Parameters.AddWithValue("@DestSite_ID", param.DestSite_ID ?? "");
                cmd.Parameters.AddWithValue("@DestSite_Name", param.DestSite_Name ?? "");
                cmd.Parameters.AddWithValue("@Total_Line_Item", param.Total_Line_Item);
                cmd.Parameters.AddWithValue("@Notes", param.Notes ?? "");
                cmd.Parameters.AddWithValue("@Status", param.Status);
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");

                var dtlprm = cmd.CreateParameter();
                dtlprm.TypeName = "dbo.TrxItemTrfDetailTYPE";
                dtlprm.Value = dtTbl;
                dtlprm.ParameterName = "@TrxItemTrfDetailTYPE";
                cmd.Parameters.Add(dtlprm);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
                if (trans != null)
                {
                    trans.Dispose();
                    trans = null;
                }
            }
            return dt;
        }

        public DataTable TrfItemReceiveItem(TrfItemFilter param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                trans = conn.BeginTransaction();

                SqlCommand cmd = new SqlCommand("TRX_TrfItem_ReceiveDeleteItem", conn, trans);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@DOCNUMBER", param.DOCNUMBER ?? "");
                cmd.Parameters.AddWithValue("@Status", param.Status);
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
                if (trans != null)
                {
                    trans.Dispose();
                    trans = null;
                }
            }
            return dt;
        }

        #endregion

        #region Inventory Counts

        public DataTable ICGetCategory()
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("TRX_InvCounts_GetCategory", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable ICGetDataItems(ICFilterItem param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("TRX_InvCounts_GetItemBySite", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@Item_Number", param.Item_Number ?? "");
                cmd.Parameters.AddWithValue("@LineItem_Option", param.LineItem_Option);
                cmd.Parameters.AddWithValue("@Site_ID", param.Site_ID ?? "");
                cmd.Parameters.AddWithValue("@Category_ID", param.Category_ID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable ICGetDataList(ICFilterItem param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("TRX_InvCount_GetDataList", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@DOCNUMBER", param.DOCNUMBER ?? "");
                cmd.Parameters.AddWithValue("@Status", param.Status);
                cmd.Parameters.AddWithValue("@Site_ID", param.Site_ID ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable ICGetDataDetail(ICFilterItem param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("TRX_InvCount_GetDataDetail", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@DOCNUMBER", param.DOCNUMBER ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable ICSaveCount(ICHeader param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                trans = conn.BeginTransaction();

                #region Items

                DataTable dtTbl = new DataTable();

                if (param.ICDetails != null)
                {
                    var tblFiltered = (from N in param.ICDetails.AsEnumerable()
                                       select new
                                       {
                                           N.Lineitmseq,
                                           N.Item_Number,
                                           N.Item_Description,
                                           N.Item_SKU,
                                           N.Expected_Stock,
                                           N.Counted_Stock,
                                           N.Different_Stock,
                                           N.Item_Cost,
                                           N.Item_Cost_Different
                                       }).ToList();

                    dtTbl = ListToDataTable(tblFiltered);
                }
                else
                {
                    dtTbl.Columns.Add("Lineitmseq", typeof(int));
                    dtTbl.Columns.Add("Item_Number", typeof(string));
                    dtTbl.Columns.Add("Item_Description", typeof(string));
                    dtTbl.Columns.Add("Item_SKU", typeof(string));
                    dtTbl.Columns.Add("Expected_Stock", typeof(decimal));
                    dtTbl.Columns.Add("Counted_Stock", typeof(decimal));
                    dtTbl.Columns.Add("Different_Stock", typeof(decimal));
                    dtTbl.Columns.Add("Item_Cost", typeof(decimal));
                    dtTbl.Columns.Add("Item_Cost_Different", typeof(decimal));
                }

                #endregion

                SqlCommand cmd = new SqlCommand("TRX_InvCount_Save", conn, trans);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@DOCNUMBER", param.DOCNUMBER ?? "");
                cmd.Parameters.AddWithValue("@Site_ID", param.Site_ID ?? "");
                cmd.Parameters.AddWithValue("@Site_Name", param.Site_Name ?? "");
                cmd.Parameters.AddWithValue("@Type_Inventory_Count", param.Type_Inventory_Count);
                cmd.Parameters.AddWithValue("@Notes", param.Notes ?? "");
                cmd.Parameters.AddWithValue("@Status", param.Status);
                cmd.Parameters.AddWithValue("@InvCount", param.InvCount);
                cmd.Parameters.AddWithValue("@UserID", param.UserID ?? "");

                var dtlprm = cmd.CreateParameter();
                dtlprm.TypeName = "dbo.TrxInvCountTYPE";
                dtlprm.Value = dtTbl;
                dtlprm.ParameterName = "@TrxInvCountTYPE";
                cmd.Parameters.Add(dtlprm);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);

                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
                if (trans != null)
                {
                    trans.Dispose();
                    trans = null;
                }
            }
            return dt;
        }

        #endregion

        #region Inventory History

        public DataTable InvHistGetDataList(InvHistory param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("TRX_InvHistory_GetDataList", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@DateFrom", param.DateFrom);
                cmd.Parameters.AddWithValue("@DateTo", param.DateTo);
                cmd.Parameters.AddWithValue("@Reason", param.Reason ?? "");
                cmd.Parameters.AddWithValue("@Employee", param.Employee ?? "");
                cmd.Parameters.AddWithValue("@Store_ID", param.Store_ID ?? "");
                cmd.Parameters.AddWithValue("@Site_ID", param.Site_ID ?? "");
                cmd.Parameters.AddWithValue("@SEARCH", param.SEARCH ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        #endregion

        #region Reports

        public DataTable ReportsDiscountGetDataList(ParamReport param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("TRX_ReportsDiscount_GetDataList", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@DateFrom", param.DateFrom);
                cmd.Parameters.AddWithValue("@DateTo", param.DateTo);
                cmd.Parameters.AddWithValue("@FilterTime", param.FilterTime);
                cmd.Parameters.AddWithValue("@TimeFrom", param.TimeFrom);
                cmd.Parameters.AddWithValue("@TimeTo", param.TimeTo);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable ReportsCategoryGetDataList(ParamReport param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("TRX_ReportsCategory_GetDataList", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@DateFrom", param.DateFrom);
                cmd.Parameters.AddWithValue("@DateTo", param.DateTo);
                cmd.Parameters.AddWithValue("@FilterTime", param.FilterTime);
                cmd.Parameters.AddWithValue("@TimeFrom", param.TimeFrom);
                cmd.Parameters.AddWithValue("@TimeTo", param.TimeTo);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        public DataTable ReportsPayTypesGetDataList(ParamReport param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("TRX_ReportsPayTypes_GetDataList", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@DateFrom", param.DateFrom);
                cmd.Parameters.AddWithValue("@DateTo", param.DateTo);
                cmd.Parameters.AddWithValue("@FilterTime", param.FilterTime);
                cmd.Parameters.AddWithValue("@TimeFrom", param.TimeFrom);
                cmd.Parameters.AddWithValue("@TimeTo", param.TimeTo);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = "",
                    db = "",
                    user = "",
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
            finally
            {
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                        conn.Close();

                    conn.Dispose();
                    conn = null;
                }
            }
            return dt;
        }

        #endregion

        #endregion
    }
}
