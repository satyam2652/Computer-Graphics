using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.IO;

namespace EmployeeLogin
{
    public static class LogManager
    {
        public static void Log(Exception exceptions) 
        {
            StringBuilder errorMsg = new StringBuilder();
            errorMsg.AppendFormat("Time: {0}", DateTime.Now.ToString("dd/mm/yyyy hh:mm:ss tt"));
            errorMsg.Append(Environment.NewLine);
            errorMsg.Append("---------------------------------------");
            errorMsg.Append(Environment.NewLine);
            errorMsg.AppendFormat("Message: {0}", exceptions.Message);
            errorMsg.Append(Environment.NewLine);
            var path = ConfigurationManager.AppSettings["logFilePath"];
            if (!File.Exists(path))
            {
                File.Create(path);
            }
            StreamWriter writeData = new StreamWriter(path,true);
            writeData.WriteLine(errorMsg);
            writeData.Close();
        }
    }
}
