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
using System.Reflection.Metadata;

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

        #region USER

        public DataTable getDataUser(UserLogin param)
        {
            DataTable dt = new DataTable();

            try
            {
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

        #endregion

    }
}
