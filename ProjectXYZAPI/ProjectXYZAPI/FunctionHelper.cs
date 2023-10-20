using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace ProjectXYZAPI
{
    public class FunctionHelper
    {
        public static List<T> ConvertDataTable<T>(DataTable dt)
        {
            List<T> data = new List<T>();
            foreach (DataRow row in dt.Rows)
            {
                T item = GetItem<T>(row);
                data.Add(item);
            }
            return data;
        }

        public static T GetItem<T>(DataRow dr)
        {
            Type temp = typeof(T);
            T obj = Activator.CreateInstance<T>();

            foreach (DataColumn column in dr.Table.Columns)
            {
                foreach (PropertyInfo pro in temp.GetProperties())
                {
                    if (pro.Name == column.ColumnName)
                        pro.SetValue(obj, dr[column.ColumnName], null);
                    else
                        continue;
                }
            }
            return obj;
        }

        public static Dictionary<string, object> ConvertDataTableToDictionarySingle(DataTable data, string detailtagname)
        {
            Dictionary<string, object> parentRow = new Dictionary<string, object>();
          

            if (data != null)
            {
                List<Dictionary<string, object>> childs = new List<Dictionary<string, object>>();
                Dictionary<string, object> childRow = new Dictionary<string, object>();

                foreach (DataRow row in data.Rows)
                {
                    childRow = new Dictionary<string, object>();
                    foreach (DataColumn col in data.Columns)
                    {
                        childRow.Add(col.ColumnName, row[col]);
                    }
                    childs.Add(childRow);
                }

                parentRow.Add(detailtagname, childs);
            }

            return parentRow;
        }

        public static string Encrypt(string encryptString)
        {
            string EncryptionKey = "BluePOS";
            byte[] clearBytes = Encoding.Unicode.GetBytes(encryptString);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] {
                    0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76
                });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    encryptString = Convert.ToBase64String(ms.ToArray());
                }
            }
            return encryptString;
        }
        public static string Decrypt(string cipherText)
        {
            if (cipherText != "")
            {
                string EncryptionKey = "BluePOS";
                cipherText = cipherText.Replace(" ", "+");
                byte[] cipherBytes = Convert.FromBase64String(cipherText);
                using (Aes encryptor = Aes.Create())
                {
                    Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] {
                    0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76
                });
                    encryptor.Key = pdb.GetBytes(32);
                    encryptor.IV = pdb.GetBytes(16);
                    using (MemoryStream ms = new MemoryStream())
                    {
                        using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                        {
                            cs.Write(cipherBytes, 0, cipherBytes.Length);
                            cs.Close();
                        }
                        cipherText = Encoding.Unicode.GetString(ms.ToArray());
                    }
                }
            }
            return cipherText;
        }

        [Table("PWO0103200500")]
        public class RequestLog
        {
            public string url { get; set; }
            public string user { get; set; }
            public string db { get; set; }
            public string Body { get; set; } = "";
            public string apiresult { get; set; } = "";
            public string msg { get; set; } = "";
            public DateTime logdate { get; } = DateTime.Now.Date;
            public DateTime logtime { get; } = new DateTime(1900, 1, 1, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);
        }

        public static bool IsBase64String(string base64)
        {
            base64 = base64.Trim();
            return (base64.Length % 4 == 0) && Regex.IsMatch(base64, @"^[a-zA-Z0-9\+/]*={0,3}$", RegexOptions.None);
        }
        public static List<String> GetSubfoldersAndFiles(DirectoryInfo di, int deep)
        {
            List<string> myContent = new List<string>();
            foreach (FileInfo fi in di.GetFiles())
            {
                myContent.Add(fi.FullName);
            }

            if (deep > 0)
            {
                foreach (DirectoryInfo subDi in di.GetDirectories())
                {
                    myContent.AddRange(GetSubfoldersAndFiles(subDi, deep - 1).ToArray());
                }
            }

            return myContent;
        }

        public static void Insert_Request_Logs(RequestLog log)
        {
            try
            {
                string rootpath = Startup._contentPath;
                string logfolder = Path.Combine(rootpath, "LogError");

                if (!Directory.Exists(logfolder))
                    Directory.CreateDirectory(logfolder);

                if (IsBase64String(log.apiresult))
                {
                    log.apiresult = "";
                }
                else if (log.apiresult.Length > 1000000)
                {
                    log.apiresult = "";
                }

                string modellog = JsonConvert.SerializeObject(log);
                string msg = $"infolog: {modellog}";

                string filepath = Path.Combine(logfolder, $"{DateTime.Now.ToString("yyyyMMdd_HH")}.txt");
                string strlog = $"[{DateTime.Now.ToString("u").Substring(11, 8)}] {msg}";
                StreamWriter writer = new StreamWriter(filepath, true);
                writer.WriteLine(strlog);
                writer.Close();

                if (Directory.Exists(logfolder))
                {
                    List<String> files = GetSubfoldersAndFiles(new DirectoryInfo(logfolder), 3);

                    foreach (string file in files)
                    {
                        FileInfo fi = new FileInfo(file);
                        if (fi.LastWriteTime < DateTime.Now.AddDays(-14))
                            //if (fi.LastAccessTime < DateTime.Now.AddMonths(-1))
                            fi.Delete();
                    }
                }
            }
            catch (Exception ex)
            {
                //throw ex;
            }
        }
    }
}
