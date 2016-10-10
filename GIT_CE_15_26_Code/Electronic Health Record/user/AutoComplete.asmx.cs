using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace Electronic_Health_Record.user
{
    /// <summary>
    /// Summary description for AutoComplete
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class AutoComplete : System.Web.Services.WebService
    {

        [WebMethod]
        public string[] AutoCompleteAjaxRequest(string prefixText, int count)
        {
            List<string> ajaxDataCollection = new List<string>();
            DataTable _objdt = new DataTable();
            _objdt = GetDataFromDataBase(prefixText);
            if (_objdt.Rows.Count > 0)
            {
                for (int i = 0; i < _objdt.Rows.Count; i++)
                {
                    ajaxDataCollection.Add(_objdt.Rows[i]["FullName"].ToString());
                }
            }
            return ajaxDataCollection.ToArray();
        }
        public DataTable GetDataFromDataBase(string prefixText)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
            //string connectionstring = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\\bookstore.mdb;Persist Security Info=False;";
            DataTable _objdt = new DataTable();
            string s = "SELECT (fname+' '+mname+' '+lname) AS FullName FROM doctor_signup_table where fname like '%" + prefixText + "%';";
            //string s = "select * from doctor_signup_table where"+ c +"like '%" + prefixText + "%';";
            //OleDbConnection _objcon = new OleDbConnection(connectionstring);
            SqlDataAdapter da = new SqlDataAdapter(s, conn);
            //OleDbDataAdapter _objda = new OleDbDataAdapter(s, conn);
            conn.Open();
            da.Fill(_objdt);
            conn.Close();
            return _objdt;
        }
    }
}
