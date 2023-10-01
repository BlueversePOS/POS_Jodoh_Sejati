using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;

namespace CMS
{
    public class TraceLogWriterListener : System.Diagnostics.TraceListener
    {
        private string logFolder = string.Empty;

        private Hashtable bufferList = new Hashtable();

        //long MaxBufferSize = 32 * 1024; // File chunk: 32 KB
        //long MaxWriteTimeout = 3; // Make sure log is written at least in 3 second.


        public TraceLogWriterListener(string logFolder)
        {
            this.logFolder = logFolder;
            Trace.WriteLine(string.Format("LogFolder: {0}", this.logFolder));
        }

        public override void Write(string msg)
        {
        }

        public override void Write(object obj)
        {
        }

        public override void Write(string msg, string cat)
        {
        }

        public override void Write(object obj, string cat)
        {
        }

        public override void WriteLine(string msg)
        {
            this.OutputToFile(msg);
        }

        public override void WriteLine(object obj)
        {
        }

        public override void WriteLine(string msg, string cat)
        {
            this.OutputToFile(string.Format("{0}: {1}", cat, msg));
            if (cat != string.Empty)
                this.OutputToSubFile(msg, cat);
        }

        public override void WriteLine(object obj, string cat)
        {
        }

        private void OutputToFile(string msg)
        {
            try
            {
                string fileName = Path.Combine(logFolder, DateTime.Now.ToString("yyyyMMdd_HH") + ".txt");

                string temp = string.Format("[{0}] {1}", DateTime.Now.ToString("u").Substring(11, 8), msg);

                LogWriter wr = this.GetLogWriter("ALL");
                wr.WriteLog(temp, fileName);
            }
            catch (Exception)
            {
            }
        }

        private void OutputToSubFile(string msg, string cat)
        {
            try
            {
                string subFolder = Path.Combine(logFolder, "sub");
                if (!Directory.Exists(subFolder))
                    Directory.CreateDirectory(subFolder);
                string fileName = Path.Combine(subFolder, string.Format("{0}_{1}.txt"
                    , cat
                    , DateTime.Now.ToString("yyyyMMdd_HH")));
                string temp = string.Format("[{0}] {1}", DateTime.Now.ToString("u").Substring(0, 19), msg);
                LogWriter wr = this.GetLogWriter(cat);
                wr.WriteLog(temp, fileName);
            }
            catch (Exception)
            {
            }
        }

        private LogWriter GetLogWriter(string key)
        {
            if (string.IsNullOrEmpty(key))
                return null;

            LogWriter wr = (LogWriter)this.bufferList[key];
            if (wr == null)
            {
                wr = new LogWriter();
                this.bufferList.Add(key, wr);
            }

            return wr;
        }


        public void WriteAll()
        {
            foreach (LogWriter wr in this.bufferList.Values)
                wr.WriteBufferData();
        }

    }

    public class LogWriter
    {
        private string bufferFileName = null;
        private StringBuilder bufferData = null;

        public int MaxBufferSize = 16 * 1024;
        public DateTime? LastWriteTime = null;
        public double MaxWriteTimeout = 5; // 5 seconds.

        private object thisLock = new object();

        public LogWriter()
        {
            this.bufferData = new StringBuilder(MaxBufferSize);
        }

        public void WriteLog(string log, string logFileName)
        {
            lock (thisLock)
            {
                int logLength = log.Length + 2;
                if (this.bufferData.Length > 0)
                {
                    if (string.Compare(logFileName, this.bufferFileName, true) != 0
                        || (this.bufferData.Length + logLength) > this.MaxBufferSize
                        || (this.LastWriteTime != null && (DateTime.Now - this.LastWriteTime.Value).TotalSeconds >= this.MaxWriteTimeout))
                    {
                        this.WriteBufferData();
                        this.bufferFileName = logFileName;
                    }
                }

                this.bufferData.Append(log);
                this.bufferData.Append("\r\n");
                this.bufferFileName = logFileName;

                // Write this data later
                if (this.LastWriteTime == null)
                {
                    this.WriteBufferData();
                }
            }
        }

        public void WriteBufferData()
        {
            lock (thisLock)
            {
                if (this.bufferData.Length > 0)
                {
                    try
                    {
                        StreamWriter writer = new StreamWriter(this.bufferFileName, true);
                        writer.Write(this.bufferData.ToString());
                        writer.Close();
                    }
                    catch (Exception) { }

                    this.bufferData.Length = 0;
                    this.bufferFileName = string.Empty;
                }

                this.LastWriteTime = DateTime.Now;
            }
        }
    }
}