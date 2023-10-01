using ProjectXYZAPI.Model;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Net;
using System.Runtime.CompilerServices;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using static ProjectXYZAPI.FunctionHelper;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

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

        public dynamic getListCompany(string db)
        {
            DataTable dt = new DataTable();
            List<Company> listResults = new List<Company>();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_GetListCompany", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(dt);

                listResults = FunctionHelper.ConvertDataTable<Company>(dt);
            }
            catch (Exception ex)
            {
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = db,
                    msg = ex.Message                    
                };
                Insert_Request_Logs(log);

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
            return listResults;
        }

        public dynamic isLoginValidOrNot(isLogin param)
        {
            dynamic result;
            string token = string.Empty;
            string val = string.Empty;
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

        #region Lookup
        public DataSet GetLookupGSR(mLookupParam2 param, string db, string user)
        {
            DataSet ds = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_GSRNumber_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;

                cmd.Parameters.AddWithValue("@searchApproval", param.searchApproval ?? "");
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@UserID", user ?? "");
                //cmd.Parameters.AddWithValue("@pFilter", param.pFilter ?? "");
                //cmd.Parameters.AddWithValue("@searchApproval", param.searchApproval ?? "");
                //cmd.Parameters.AddWithValue("@mode", param.mode);
                //cmd.Parameters.AddWithValue("@page", param.page);
                //cmd.Parameters.AddWithValue("@size", param.size);
                //cmd.Parameters.AddWithValue("@user", user ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    db = db,
                    user = user,
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
            return ds;
        }

        public DataSet GetLookupTransactionID(mLookupParam param, string db)
        {
            DataSet ds = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_GetTransactionIDGSR_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    db = db,
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
            return ds;
        }

        public DataSet GetLookupSiteByUser(mLookupParam param, string db, string user)
        {
            DataSet ds = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_SiteID_By_UserID_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@UserID", user ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    db = db,
                    user = user,
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
            return ds;
        }
        
        public DataSet GetLookupSite(mLookupParam param, string db, string user)
        {
            DataSet ds = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_SiteID_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    db = db,
                    user = user,
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
            return ds;
        }

        public DataSet GetLookupFrerNumber(mLookupParam param, string db, string user)
        {
            DataSet ds = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_Link_FRER_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@UserID", user ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    db = db,
                    user = user,
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
            return ds;
        }

        public DataSet GetLookupBrancID(mLookupParam param, string db)
        {
            DataSet ds = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_BranchID_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    db = db,
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
            return ds;
        }

        public DataSet GetLookupUser(mLookupParam2 param, string db)
        {
            DataSet dt = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_UserID_2_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@Branch", param.param1 ?? "");

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
                    db = db,
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

        public DataSet GetLookupItembyTransaction(mLookupParam2 param, string db)
        {
            DataSet dt = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_ItemNbrByTransactionID_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@transactionID", param.param1 ?? "");
                cmd.Parameters.AddWithValue("@siteID", param.param3 ?? "");
                cmd.Parameters.AddWithValue("@Currency", param.param2 ?? "");

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
                    db = db,
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

        public DataSet GetLookupUofmByItem(mLookupParam2 param, string db)
        {
            DataSet dt = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_GetUOMByItemNbr_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@classUOM", param.param1 ?? "");
                cmd.Parameters.AddWithValue("@SiteID", param.param2 ?? "");
                cmd.Parameters.AddWithValue("@itemNbr", param.param3 ?? "");
                cmd.Parameters.AddWithValue("@Currency", param.param4 ?? "");

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
                    db = db,
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

        public DataSet GetLookupBank(mLookupParam param, string db)
        {
            DataSet dt = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_DealerBankID_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);

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
                    db = db,
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

        public DataSet GetLookupCurrency(mLookupParam2 param, string db)
        {
            DataSet dt = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_CurrencyID_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@itemNbr", param.param1 ?? "");
                cmd.Parameters.AddWithValue("@UOFM", param.param2 ?? "");
                cmd.Parameters.AddWithValue("@siteID", param.param3 ?? "");

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
                    db = db,
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

        public DataSet GetLookupITE_RefNo(mLookupParam param, string db, string user)
        {
            DataSet dt = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_ITE_GSRNumber_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@UserID", user ?? "");

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
                    db = db,
                    user = user,
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

        public DataSet GetLookupITE_DocNbr(mLookupParam param, string db, string user)
        {
            DataSet dt = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_ITEDocNbr_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@UserID", user ?? "");

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
                    db = db,
                    user = user,
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

        public DataSet GetLookupItemNbrBySiteID(mLookupParam2 param, string db)
        {
            DataSet dt = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_ItemNbrBySiteID_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@siteID", param.param1 ?? "");

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
                    db = db,
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

        public DataSet GetLookupItemTransferNumber(mLookupParam param, string db, string user)
        {
            DataSet ds = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_GetItemTransferEntryRefNo_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@UserID", user ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    db = db,
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
            return ds;
        }

        public DataSet getLookupItemTransferDocumenNumber(mLookupParam param, string db, string user)
        {
            DataSet dt = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_ItemTransferDocumentNbr_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@UserID", user ?? "");

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
                    db = db,
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

        public DataSet getLookupItemNumber(mLookupParam param, string db, string user)
        {
            DataSet dt = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_ItemNbr_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);

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
                    db = db,
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

        public DataSet getLookupFREREntertainNumber(mLookupParam2 param, string db, string user)
        {
            DataSet dt = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_FREREntertainNumber_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@searchApproval", param.searchApproval ?? "");
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@UserID", user ?? "");

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
                    db = db,
                    user = user,
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

        public DataSet getLookupEntertainID(mLookupParam param, string db)
        {
            DataSet dt = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_EntertainID_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);

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
                    db = db,
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

        public DataSet getLookupFRERPerjalananDinasNumber(mLookupParam2 param, string db, string user)
        {
            DataSet dt = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_FRERPerjalananDinasNumber_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@searchApproval", param.searchApproval ?? "");
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@UserID", user ?? "");

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
                    db = db,
                    user = user,
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

        public DataSet GetLookupFRERKotaTujuan(mLookupParam param, string db, string user)
        {
            DataSet dt = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_KotaTujuan_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);

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
                    db = db,
                    user = user,
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

        public DataSet GetLookupFRERKeperluanDinas(mLookupParam param, string db, string user)
        {
            DataSet ds = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_KeperluanDinasID_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    db = db,
                    user = user,
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
            return ds;
        }

        public DataSet GetLookupTravelExpense(mLookupParam param, string db, string user)
        {
            DataSet dt = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_TravelExpense_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);

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
                    db = db,
                    user = user,
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

        public DataSet GetLookupTravelExpense2(mLookupParam2 param, string db, string user)
        {
            DataSet dt = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_TravelExpense2_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@UserID", user ?? "");
                cmd.Parameters.AddWithValue("@kota", param.param2 ?? "");
                cmd.Parameters.AddWithValue("@currency", param.param3 ?? "");

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
                    db = db,
                    user = user,
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

        public DataSet getLookupFRERPromotionNumber(mLookupParam2 param, string db, string user)
        {
            DataSet dt = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_FRERPromotionNumber_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@searchApproval", param.searchApproval ?? "");
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@UserID", user ?? "");

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
                    db = db,
                    user = user,
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
        
        public DataSet GetLookupTransactionID_Promotion(mLookupParam2 param, string db, string user)
        {
            DataSet dt = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_TransactionID_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@transactionType", param.param1 ?? "");

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
                    db = db,
                    user = user,
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

        public DataSet GetLookupLinkGSRNumber(mLookupParam param, string db, string user)
        {
            DataSet ds = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_Link_GSR_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@UserID", user ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    db = db,
                    user = user,
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
            return ds;
        }
        
        public DataSet GetLookupPromotionExpense(mLookupParam param, string db, string user)
        {
            DataSet ds = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_PromotionExpense_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    db = db,
                    user = user,
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
            return ds;
        }
        
        public DataSet GetLookupDivisionID(mLookupParam param, string db, string user)
        {
            DataSet ds = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_DivisionID_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    db = db,
                    user = user,
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
            return ds;
        }
        
        public DataSet GetLookupPPH(mLookupParam param, string db, string user)
        {
            DataSet ds = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_PPH_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    db = db,
                    user = user,
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
            return ds;
        }
        
        public DataSet GetLookupVendorID(mLookupParam param, string db, string user)
        {
            DataSet ds = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_VendorID_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    db = db,
                    user = user,
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
            return ds;
        }
        
        public DataSet getlookupFRERBiayaUmumNumber(mLookupParam2 param, string db, string user)
        {
            DataSet dt = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_FRERBiayaUmumNumber_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@searchApproval", param.searchApproval ?? "");
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@UserID", user ?? "");

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
                    db = db,
                    user = user,
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

        public DataSet GetLookupFRERCategoryTrxBU(mLookupParam param, string db, string user)
        {
            DataSet ds = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_CategoryTransactionIDBU_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    db = db,
                    user = user,
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
            return ds;
        }

        public DataSet GetLookupFRERCategoryTrxBUF(mLookupParam param, string db, string user)
        {
            DataSet ds = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_CategoryTransactionIDBUF_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    db = db,
                    user = user,
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
            return ds;
        }

        public DataSet GetLookupTransactionID_BiayaUmum2(mLookupParam2 param, string db, string user)
        {
            DataSet dt = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_TransactionID2_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@CategoryTrxID", param.param1 ?? "");
                cmd.Parameters.AddWithValue("@transactionType", param.param2 ?? "");
                cmd.Parameters.AddWithValue("@VendorID", param.param3 ?? "");

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
                    db = db,
                    user = user,
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

        public DataSet getlookupFRERBiayaUmumFinanceNumber(mLookupParam2 param, string db, string user)
        {
            DataSet dt = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_FRERBiayaUmumFinanceNumber_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@searchApproval", param.searchApproval ?? "");
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@UserID", user ?? "");

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
                    db = db,
                    user = user,
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

        public DataSet getLookupFRERPettycashNumber(mLookupParam2 param, string db, string user)
        {
            DataSet dt = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_FRERPettycashNumber_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@searchApproval", param.searchApproval ?? "");
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@UserID", user ?? "");

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
                    db = db,
                    user = user,
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
        
        public DataSet GetLookupFRERNumberByFRERType(mLookupParam2 param, string db, string user)
        {
            DataSet dt = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_FRERNumberByFRERType_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@UserID", user ?? "");
                cmd.Parameters.AddWithValue("@FRERType", param.param1 ?? "");

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
                    db = db,
                    user = user,
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

        public DataSet GetLookupFRERSettlementNumber(mLookupParam2 param, string db, string user)
        {
            DataSet ds = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_FRERSettlementNumber_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@UserID", user ?? "");
                cmd.Parameters.AddWithValue("@TypeEntertainment", param.param1 ?? "");
                cmd.Parameters.AddWithValue("@TypePerjalananDinas", param.param2 ?? "");
                cmd.Parameters.AddWithValue("@TypePromotion", param.param3 ?? "");
                cmd.Parameters.AddWithValue("@TypeBiayaUmum", param.param4 ?? "");
                cmd.Parameters.AddWithValue("@TypeBiayaUmumFinance", param.param5 ?? "");

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    db = db,
                    user = user,
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
            return ds;
        }

        public DataSet GetLookupFRERInquiry(mLookupParam2 param, string db, string user)
        {
            DataSet dt = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_FRERInquiry_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);
                cmd.Parameters.AddWithValue("@FRERType", param.param1 ?? "");
                cmd.Parameters.AddWithValue("@UserID", user ?? "");
                cmd.Parameters.AddWithValue("@Save", param.param2 ?? "");
                cmd.Parameters.AddWithValue("@Submit", param.param3 ?? "");
                cmd.Parameters.AddWithValue("@Approve", param.param4 ?? "");
                cmd.Parameters.AddWithValue("@F_Approved", param.param5 ?? "");
                cmd.Parameters.AddWithValue("@Rejected", param.param6 ?? "");

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
                    db = db,
                    user = user,
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

        public DataSet GetLookupPPN(mLookupParam param, string db)
        {
            DataSet ds = new DataSet();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_Lookup_PPN_New", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@search", param.search ?? "");
                cmd.Parameters.AddWithValue("@length", param.length);
                cmd.Parameters.AddWithValue("@from", param.from);
                cmd.Parameters.AddWithValue("@ordercol", param.orderCol);
                cmd.Parameters.AddWithValue("@ordertype", param.orderType);

                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                adp.Fill(ds);
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = JsonConvert.SerializeObject(param),
                    db = db,
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
            return ds;
        }
        #endregion

        #region Setup
        public int ChangePassword_Validation_OLDPassword(string pass, string user, string db)
        {
            int retval = 0;

            try
            {
                using (SqlConnection con = new SqlConnection(connstring(db)))
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }

                    using (SqlCommand cmd = con.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "BCAF_User_Validation_Old_Password";
                        cmd.CommandTimeout = 0;
                        cmd.Parameters.AddWithValue("@USERID", user ?? "");
                        cmd.Parameters.AddWithValue("@OLDPASSWORD", pass ?? "");
                        cmd.Parameters.Add("@output", SqlDbType.Int);
                        cmd.Parameters["@output"].Direction = ParameterDirection.Output;
                        cmd.ExecuteNonQuery();

                        retval = Convert.ToInt32(cmd.Parameters["@output"].Value);

                    }
                }

                return retval;
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    Body = $"pass: {pass}",
                    db = db,
                    user = user,
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }           

        }

        public int ChangePassword_Validation(string user, string db)
        {
            int retval = 0;
            try
            {
                using (SqlConnection con = new SqlConnection(connstring(db)))
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }

                    using (SqlCommand cmd = con.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "spAI_Get_ChangePassword_Validation";
                        cmd.CommandTimeout = 0;
                        cmd.Parameters.AddWithValue("@User", user ?? "");
                        cmd.Parameters.Add("@output", SqlDbType.Int);
                        cmd.Parameters["@output"].Direction = ParameterDirection.Output;
                        cmd.ExecuteNonQuery();

                        retval = Convert.ToInt32(cmd.Parameters["@output"].Value);

                    }
                }

                return retval;
            }
            catch (Exception ex)
            {
                #region LOG
                string thismethod = GetActualAsyncMethodName();
                RequestLog log = new RequestLog
                {
                    url = thismethod,
                    db = db,
                    user = user,
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }
        }

        public string ChangePasswordSave(mChangePassword model, string user, string db)
        {
            string retval = string.Empty;
            try
            {
                using (SqlConnection con = new SqlConnection(connstring(db)))
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    using (SqlCommand cmd = con.CreateCommand())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "spAI_ChangePassword_Save";
                        cmd.CommandTimeout = 0;
                        cmd.Parameters.AddWithValue("@UserID", user ?? "");
                        cmd.Parameters.AddWithValue("@Password", model.NewPassword);
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
                    Body = JsonConvert.SerializeObject(model),
                    db = db,
                    user = user,
                    msg = ex.Message
                };
                Insert_Request_Logs(log);
                #endregion

                throw ex;
            }

            return retval;

        }
        #endregion

        #region REPORT
        public DataTable ReportStokGudang(string db, string FromLocCode, string ToLocCode, int AllOrNot, string sortBy)
        {
            DataTable dt = new DataTable();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("BCAF_LAPORAN_STOCK_GUDANG", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@From_LocCode", FromLocCode ?? "");
                cmd.Parameters.AddWithValue("@To_LocCode", ToLocCode ?? "");
                cmd.Parameters.AddWithValue("@All_OR_NOT", AllOrNot);
                cmd.Parameters.AddWithValue("@ORDERBY", sortBy ?? "");

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
                    Body = $"fromloccode: {FromLocCode}, toloccode: {ToLocCode}, allornot: {AllOrNot}, sorby: {sortBy}",
                    db = db,
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

        public DataTable ReportMutasiStokGudang(string db, string FromDocDate, string ToDocDate, string FromLocCode, string ToLocCode, int AllOrNot)
        {
            DataTable dt = new DataTable();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("BCAF_LAPORAN_MUTASI_STOCK", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FromDOCDATE", FromDocDate);
                cmd.Parameters.AddWithValue("@ToDOCDATE", ToDocDate);
                cmd.Parameters.AddWithValue("@FROM_LOCCODE", FromLocCode ?? "");
                cmd.Parameters.AddWithValue("@TO_LOCCODE", ToLocCode ?? "");
                cmd.Parameters.AddWithValue("@All_OR_NOT", AllOrNot);

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
                    Body = $"FromDocDate: {FromDocDate}, ToDocDate: {ToDocDate}, FromLocCode: {FromLocCode}, ToLocCode: {ToLocCode}, AllOrNot: {AllOrNot}",
                    db = db,
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

        public DataTable ReportStatusDokumenPrioritas(string db, string FromDocDate, string ToDocDate, string reqfrom, string regto, string gsrfrom,
            string gsrto, string status, string OrderBy)
        {
            DataTable dt = new DataTable();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("BCAF_STATUS_DOKUMEN_GSR", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FromDOCDATE", FromDocDate);
                cmd.Parameters.AddWithValue("@ToDOCDATE", ToDocDate);
                cmd.Parameters.AddWithValue("@FromCreator", reqfrom ?? "");
                cmd.Parameters.AddWithValue("@ToCreator", regto ?? "");
                cmd.Parameters.AddWithValue("@FromGSR", gsrfrom ?? "");
                cmd.Parameters.AddWithValue("@ToGSR", gsrto ?? "");
                cmd.Parameters.AddWithValue("@STATUS", status);
                cmd.Parameters.AddWithValue("@ORDERBY", OrderBy);

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
                    Body = $"FromDocDate: {FromDocDate}, ToDocDate: {ToDocDate}, reqfrom: {reqfrom}, regto: {regto}, gsrfrom: {gsrfrom}, gsrto: {gsrto}, status: {status}, OrderBy: {OrderBy}",
                    db = db,
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

        public DataTable ReportOutstandingAdvPrioritas(string db, string frertype, string cfrom, string cto, string OrderBy)
        {
            DataTable dt = new DataTable();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("BCAF_ER_LAPORAN_OUTSTANDING_FRER_ADVANCE", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FrerTypeInteger", frertype);
                cmd.Parameters.AddWithValue("@Cabang_From", cfrom ?? "");
                cmd.Parameters.AddWithValue("@Cabang_To", cto ?? "");
                cmd.Parameters.AddWithValue("@SortBy", OrderBy);

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
                    Body = $"frertype: {frertype}, cfrom: {cfrom}, cto: {cto}, OrderBy: {OrderBy}",
                    db = db,
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

        public DataTable ReportStatusFRERPrioritas(string db, string reqfrom, string regto, string frertype, string frerfrom,
            string frerto, int FRERAdvanceInteger, string status, string OrderBy)
        {
            DataTable dt = new DataTable();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("BCAF_ER_PERMOHONAN_BIAYA_REPORT", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Requester_From", reqfrom ?? "");
                cmd.Parameters.AddWithValue("@Requester_To", regto ?? "");
                cmd.Parameters.AddWithValue("@FrerTypeInteger", frertype);
                cmd.Parameters.AddWithValue("@FRER_Number_From", frerfrom ?? "");
                cmd.Parameters.AddWithValue("@FRER_Number_To", frerto ?? "");
                cmd.Parameters.AddWithValue("@FRERAdvanceInteger", FRERAdvanceInteger);
                cmd.Parameters.AddWithValue("@FRERStatusInteger", status);
                cmd.Parameters.AddWithValue("@SortBy", OrderBy);

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
                    Body = $"reqfrom: {reqfrom}, frertype: {frertype}, frerfrom: {frerfrom}, frerto: {frerto}, FRERAdvanceInteger: {FRERAdvanceInteger}, status: {status}, orderby: {OrderBy}",
                    db = db,
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

        public DataTable GSRReport(string db, string GSRNumber, string user, string date)
        {
            DataTable dt = new DataTable();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_PrintPermohonanBarangJasaWeb", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@GSR_NUMBER", GSRNumber ?? "");
                cmd.Parameters.AddWithValue("@USER_ID", user ?? "");
                cmd.Parameters.AddWithValue("@TANGGAL_CREATE", date);

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
                    Body = $"GSRNumber: {GSRNumber}, date: {date}",
                    db = db,
                    user = user,
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

        public DataTable FREREntertainReport(string db, string FRERNumber)
        {
            DataTable dt = new DataTable();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_ReportEntertainWeb", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FRERNumber", FRERNumber ?? "");

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
                    Body = $"FRERNumber: {FRERNumber}",
                    db = db,
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

        public DataTable FRERPerjalananDinasReport(string db, string FRERNumber)
        {
            DataTable dt = new DataTable();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_ReportPerjalananDinasWeb", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FRERNumber", FRERNumber ?? "");

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
                    Body = $"FRERNumber: {FRERNumber}",
                    db = db,
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

        public DataTable FRERPromotionReport(string db, string FRERNumber)
        {
            DataTable dt = new DataTable();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_ReportPromotionWeb", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FRERNumber", FRERNumber ?? "");

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
                    Body = $"FRERNumber: {FRERNumber}",
                    db = db,
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

        public DataTable FRERBiayaUmumReport(string db, string FRERNumber)
        {
            DataTable dt = new DataTable();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_ReportBiayaUmumWeb", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FRERNumber", FRERNumber ?? "");

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
                    Body = $"FRERNumber: {FRERNumber}",
                    db = db,
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

        public DataTable FRERBiayaUmumFinanceReport(string db, string FRERNumber)
        {
            DataTable dt = new DataTable();

            try
            {
                if (conn == null)
                    conn = new SqlConnection(connstring(db));
                if (conn.State != ConnectionState.Open)
                    conn.Open();

                SqlCommand cmd = new SqlCommand("spAI_ReportBiayaUmumFinanceWeb", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FRERNumber", FRERNumber ?? "");

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
                    Body = $"FRERNumber: {FRERNumber}",
                    db = db,
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
        #endregion REPORT REPORT

    }
}
