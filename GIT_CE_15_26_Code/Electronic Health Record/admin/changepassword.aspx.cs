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

namespace Electronic_Health_Record.admin
{
    public partial class changepassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            SqlCommand Cmd = new SqlCommand("select * from adminLogin where password='" + txtOldPassword.Text + "' COLLATE SQL_Latin1_General_CP1_CS_AS and username='" + Session["AdminID"].ToString() + "'", con);
            con.Open();
            SqlDataReader reader = Cmd.ExecuteReader();

            if (reader.HasRows)
            {
                reader.Close();
                SqlCommand cmd1 = new SqlCommand("update adminLogin set password='" + txtNewPassword.Text + "' where username='" + Session["AdminID"].ToString() + "'", con);
                cmd1.ExecuteNonQuery();
                Response.Redirect("changepasswordsuccess.aspx");
                //lblnotification.Text = "Password Change Successfully..!";
                
                
            }
            else
            {
                lblnotification.Text = "Current Password Incorrect...!";
            }
            con.Close();
        }
    }
}