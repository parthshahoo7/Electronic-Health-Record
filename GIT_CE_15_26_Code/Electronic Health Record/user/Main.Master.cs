using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electronic_Health_Record
{
    public partial class Main : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        SqlDataAdapter da = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            string query = "select fname,lname from patient_signup_table where username= '" + Session["name"] + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                lbluser.Text = "Hello " + reader["fname"].ToString() + " " + reader["lname"].ToString();
            }

            else
            {
                lbluser.Text = "Hello " + reader["fname"].ToString() + " " + reader["lname"].ToString();
            }
            con.Close();
           // lbluser.Text = "Hello " + Session["name"].ToString();
        }

        protected void logbutton_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Default/Home.aspx");
        }
    }
}