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
    public partial class changepassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            txtoldpswd.Attributes["type"] = "Password";
            txtnewpswd.Attributes["type"] = "Password";
            
        }

        protected void btnchangepswd_Click(object sender, EventArgs e)
        {
            //con.Open();
            //string query = "select * from patient_signup_table where pswd ='" + txtoldpswd.Text + "'";
            //SqlCommand cmd = new SqlCommand(query, con);
            //SqlDataReader dr = cmd.ExecuteReader();
            //if (dr.Read())
            //{
            //    dr.Close();
            //    //SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
            //    //con1.Open();
            //    string str = "update patient_signup_table set pswd='" + txtnewpswd.Text + "'where pswd= '" + txtoldpswd.Text + "'";
            //    SqlCommand cmd1 = new SqlCommand(str, con);
            //    cmd1.ExecuteNonQuery();
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Your Password Change successfully');window.location ='default1.aspx';",true);
            //    //Response.Write("<script>alert('Your Password Change successfully')</script>");
            //    //con1.Close();
            //    con.Close();

            //}
            //else
            //{
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Your Old Password is incorrect try again...');window.location ='changepassword.aspx';", true);
            //    //Response.Write("<script>alert('Old Password is incorrect try again...')</script>");
            //}
            SqlCommand Cmd = new SqlCommand("select * from doctor_signup_table where password='" + txtoldpswd.Text + "' COLLATE SQL_Latin1_General_CP1_CS_AS and username='" + Session["name"].ToString() + "'", con);
            con.Open();
            SqlDataReader reader = Cmd.ExecuteReader();

            if (reader.HasRows)
            {
                reader.Close();
                SqlCommand cmd1 = new SqlCommand("update doctor_signup_table set password='" + txtnewpswd.Text + "' where username='" + Session["name"].ToString() + "'", con);
                cmd1.ExecuteNonQuery();
                lblchangepswd.Text = "Password Change Successfully..!";
                txtoldpswd.Text = null;
                txtnewpswd.Text = null;
            }
            else
            {
                lblchangepswd.Text = "Current Password Incorrect...!";
            }
            con.Close();


        }
    }
}