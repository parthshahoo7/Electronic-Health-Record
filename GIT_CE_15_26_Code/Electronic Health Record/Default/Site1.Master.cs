using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data;
using System.Configuration;
using System.Drawing;

namespace Electronic_Health_Record
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        //Class1 c = new Class1();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        SqlDataAdapter da = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //    protected void Login_Click(object sender, EventArgs e)
        //    {

        //        c.username = txtuname.Text;
        //        c.pswd = txtpassword.Text;
        //        conn.Open();

        //        da = new SqlDataAdapter("check_login", conn);
        //        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        //        da.SelectCommand.Parameters.AddWithValue("@username", c.username);
        //        da.SelectCommand.Parameters.AddWithValue("@pswd", c.pswd);


        //        DataTable dt = new DataTable();
        //        da.Fill(dt);

        //        if (dt.Rows.Count > 0)
        //        {
        //            Session["name"] = txtuname.Text;
        //            Response.Redirect("~/Home.aspx");
        //            //Control co = this.Master.FindControl("logindiv");
        //            //co.Visible = false;
        //            //logindiv.Visible = false;

        //        }

        //        else
        //        {

        //            lblerror.Text = "invalid username or password";
        //            lblerror.ForeColor = Color.Red;

        //        }
        //        //int obj = Convert.ToInt32(cmd.ExecuteScalar());
        //        //if (obj > 0)
        //        //{

        //        //}
        //        //else
        //        //{
        //        //    lblerror.Text = "invalid username or password";
        //        //    lblerror.ForeColor = Color.Red;

        //        //}
        //    }

        //}
    }
}