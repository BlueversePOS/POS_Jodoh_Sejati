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
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;
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

        public DataTable ResetPassword(UserLogin param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_Reset_Password", conn);
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

        public DataTable SaveAccessRight(AccessRight param)
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_AccessRight_SaveData", conn);
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

                SqlCommand cmd = new SqlCommand("Web_Account_SaveData", conn);
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

        public DataTable GetCompositeItems()
        {
            DataTable dt = new DataTable();

            try
            {
                ConnSql("");

                SqlCommand cmd = new SqlCommand("Web_Items_GetDataComposite", conn);
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

                SqlCommand cmd = new SqlCommand("Web_Discounts_SaveData", conn);
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

                SqlCommand cmd = new SqlCommand("Web_Items_SaveData", conn);
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
                cmd.Parameters.AddWithValue("@Tax_10", param.Tax_10);
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

                SqlCommand cmd = new SqlCommand("Web_Customer_SaveData", conn);
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

    }
}
