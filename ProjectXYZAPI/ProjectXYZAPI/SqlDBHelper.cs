using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace ProjectXYZAPI
{
    public class SqlDBHelper
    {
        string conString;

        public SqlDBHelper(string constr)
        {
            conString = constr;
        }

        public SqlDBHelper()
        {

        }

        public string constring(string db)
        {
            return conString = Startup.ConnectionStringBuild(db);

        }


        // This function will be used to execute R(CRUD) operation of parameterless commands
        public bool ExecuteNonQuery(string CommandName, System.Data.CommandType cmdType, System.Data.SqlClient.SqlParameter[] pars, string db)
        {

            int result = 0;

            using (SqlConnection con = new SqlConnection(constring(db)))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandType = cmdType;
                    cmd.CommandText = CommandName;
                    cmd.Parameters.AddRange(pars);

                    try
                    {
                        if (con.State != ConnectionState.Open)
                        {
                            con.Open();
                        }

                        result = cmd.ExecuteNonQuery();
                    }
                    catch
                    {
                        throw;
                    }
                }
                return (result > 0);
            }


        }

        public bool ExecuteNonQuery(string queryString, string db)
        {
            int result = 0;
            using (SqlConnection con = new SqlConnection(constring(db)))
            {
                SqlCommand command = new SqlCommand(queryString, con);
                command.Connection.Open();
                result = command.ExecuteNonQuery();
            }
            return (result > 0);

        }

        // This function will be used to execute R(CRUD) operation of parameterized commands
        public System.Data.DataTable ExecuteParamerizedSelectCommand(string CommandName, System.Data.CommandType cmdType, System.Data.SqlClient.SqlParameter[] param, string db)
        {
            DataTable table = new DataTable();

            using (SqlConnection con = new SqlConnection(constring(db)))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandType = cmdType;
                    cmd.CommandText = CommandName;
                    cmd.Parameters.AddRange(param);

                    try
                    {
                        if (con.State != ConnectionState.Open)
                        {
                            con.Open();
                        }

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(table);
                        }
                    }
                    catch
                    {
                        throw;
                    }
                }
            }

            return table;
        }

        public System.Data.DataTable ExecuteSelectCommands(DbCommand command)
         {
            //The DataTable to be returned
            DataTable table;
            //Execute the command making sure the connection gets closed in the end
            try
            {
                //Open the data connection
                command.Connection.Open();


                //Execute the command and save the results in a DataTable

                DbDataReader reader = command.ExecuteReader();

                table = new DataTable();
                table.Load(reader);

                //Close the reader
                reader.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                command.Connection.Close();
            }
            return table;
        }

        // This function will be used to execute R(CRUD) operation of parameterless commands
        public System.Data.DataTable ExecuteSelectCommand(string CommandName, System.Data.CommandType cmdType, string db)
        {
            DataTable table = null;
            using (SqlConnection con = new SqlConnection(constring(db)))
            {
                using (SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandType = cmdType;
                    cmd.CommandText = CommandName;
                    cmd.CommandTimeout = 0;
                    try
                    {
                        if (con.State != ConnectionState.Open)
                        {
                            con.Open();
                        }
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            table = new DataTable();
                            da.Fill(table);
                        }
                    }
                    catch
                    {

                        throw;
                    }
                }
            }
            return table;
        }

        public dynamic ExecuteScalarCommand(DbCommand command)
        {
            try
            {
                dynamic result;
                command.Connection.Open();
                result = command.ExecuteScalar();
                command.Connection.Close();
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
