using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;
using System.Configuration;
using System.Drawing;

namespace Electronic_Health_Record
{
    public partial class edit_prescription : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> GetUsers(string prefixText)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from patient_signup_table where fname like @Name+'%' OR mname like @Name+ '%' OR lname like @Name+ '%'", con);
            cmd.Parameters.AddWithValue("@Name", prefixText);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            List<string> PatientName = new List<string>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {

                //CountryNames.Add(dt.Rows[i][1].ToString());
                string name = null;
                name = dt.Rows[i][1].ToString() + " ";
                name += dt.Rows[i][2].ToString() + " ";
                name += dt.Rows[i][3].ToString() + " Patient ID:";
                name += dt.Rows[i][0].ToString();
                PatientName.Add(name);
            }
            return PatientName;
        }
    }
}