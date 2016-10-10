using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;
using System.IO;
using System.Drawing;
using System.Web.Security;
using System.Drawing.Drawing2D;

namespace Electronic_Health_Record
{
    public partial class resetpassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            txtnewpswd.Attributes["Type"] = "Password";
            if (Session["usersetID"] == null && Session["usersetID"] == null || Session["usersetID"] == "" && Session["usersetID"] == "")
            {
                Response.Redirect("forgotpassword.aspx");
            }
            else
            {
                
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            con.Open();
            string query = "select pswd from patient_signup_table where username ='" + Session["usrname"] + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
                con1.Open();
                string str = "update patient_signup_table set pswd='" + txtnewpswd.Text + "'where username= '" + Session["usrname"] + "'";
                SqlCommand cmd1 = new SqlCommand(str, con1);
                cmd1.ExecuteNonQuery();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Your Password Reset successfully');window.location ='login.aspx';", true);
                //Response.Write("<script>alert('Your Password Change successfully')</script>");
                con1.Close();
                con.Close();
                Session.Abandon();

            }            
        }
    }
}