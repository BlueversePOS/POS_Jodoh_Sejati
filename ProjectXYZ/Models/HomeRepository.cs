using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CMS.Models
{
    public class HomeRepository
    {
        readonly string conString;

        public HomeRepository()
        {
            conString = DataAccessCompany.ConnectionStringBuildRes();
        }

        public IDbConnection Connection
        {
            get
            {
                return new SqlConnection(conString);
            }
        }

        private SqlConnection conn;
        private SqlTransaction trans;

        public DataTable getDataUserbyGuid(string guid)
        {
            DataTable dt = new DataTable();

            conn = new SqlConnection(Connection.ConnectionString);
            if (conn.State != ConnectionState.Open)
                conn.Open();

            trans = conn.BeginTransaction();

            try
            {
                SqlCommand command = new SqlCommand("AI_GETDATAUSER_GUIDAD", conn, trans)
                {
                    CommandType = CommandType.StoredProcedure
                };
                command.Parameters.AddWithValue("@GUID", guid);

                SqlDataAdapter adp = new SqlDataAdapter
                {
                    SelectCommand = command
                };
                adp.Fill(dt);

                trans.Commit();

                return dt;
            }
            catch (Exception ex)
            {
                trans?.Rollback();
                throw new Exception(ex.Message);
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
        }

        public List<GroupCompany> getCompanyList(string userid)
        {
            DataTable dt = new DataTable();
            List<GroupCompany> companygroup = new List<GroupCompany>();

            conn = new SqlConnection(Connection.ConnectionString);
            if (conn.State != ConnectionState.Open)
                conn.Open();

            trans = conn.BeginTransaction();

            try
            {
                SqlCommand command = new SqlCommand("erAvailableCompanies", conn, trans)
                {
                    CommandType = CommandType.StoredProcedure
                };
                command.Parameters.AddWithValue("@user_id", userid);

                SqlDataAdapter adp = new SqlDataAdapter
                {
                    SelectCommand = command
                };
                adp.Fill(dt);

                trans.Commit();

                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        companygroup.Add(
                            new GroupCompany
                            {
                                Companyid = Convert.ToString(dr["company_id"]),
                                Companyname = dr["company_name"].ToString()
                            });
                    }
                    companygroup = companygroup.OrderBy(o => o.Companyname).ToList();
                }

                return companygroup;
            }
            catch (Exception ex)
            {
                trans?.Rollback();
                throw new Exception(ex.Message);
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
        }

        public List<GroupCompany> getCompanyListById(string userid, string companyid)
        {
            DataTable dt = new DataTable();
            List<GroupCompany> companyresult = new List<GroupCompany>();

            conn = new SqlConnection(Connection.ConnectionString);
            if (conn.State != ConnectionState.Open)
                conn.Open();

            trans = conn.BeginTransaction();

            try
            {
                SqlCommand command = new SqlCommand("erAvailableCompanies", conn, trans)
                {
                    CommandType = CommandType.StoredProcedure
                };
                command.Parameters.AddWithValue("@user_id", userid);

                SqlDataAdapter adp = new SqlDataAdapter
                {
                    SelectCommand = command
                };
                adp.Fill(dt);

                trans.Commit();

                if (dt.Rows.Count > 0)
                {
                    DataRow[] rowresult = dt.Select(string.Format("company_id={0}", companyid));

                    foreach (DataRow dr in rowresult)
                    {
                        companyresult.Add(
                            new GroupCompany
                            {
                                Companyid = Convert.ToString(dr["company_id"]),
                                Companyname = dr["company_name"].ToString(),
                                Companydb = dr["database_name"].ToString()
                            });
                    }
                    companyresult = companyresult.OrderBy(o => o.Companyname).ToList();
                }

                return companyresult;
            }
            catch (Exception ex)
            {
                trans?.Rollback();
                throw new Exception(ex.Message);
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
        }
    }
}