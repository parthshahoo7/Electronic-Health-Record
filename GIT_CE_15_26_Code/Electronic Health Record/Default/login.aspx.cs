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


namespace Electronic_Health_Record.Default
{
    public partial class login : System.Web.UI.Page
    {
        Class1 c = new Class1();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        SqlDataAdapter da = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_Click(object sender, EventArgs e)
        {
            if(role.SelectedValue=="patient")
            {
                conn.Open();
                string s = "select p_id,username,pswd from patient_signup_table where  username=@username and pswd=@pswd";
                da = new SqlDataAdapter(s, conn);               
                da.SelectCommand.Parameters.AddWithValue("@username",txtuname.Text);
                da.SelectCommand.Parameters.AddWithValue("@pswd",txtpswd.Text);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Session["patient_id"] = dt.Rows[0]["p_id"];
                    Session["name"] = txtuname.Text;
                    Response.Redirect("~/user/Home.aspx");

                }
                {

                    lblerror.Text = "invalid username or password";
                    lblerror.ForeColor = Color.White;

                }

            }
            else if (role.SelectedValue == "doctor")
            {
                conn.Open();
                string s = "select d_id,username,password from doctor_signup_table where username=@username and password=@pswd";
                da = new SqlDataAdapter(s, conn);
                da.SelectCommand.Parameters.AddWithValue("@username", txtuname.Text);
                da.SelectCommand.Parameters.AddWithValue("@pswd", txtpswd.Text);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Session["name"] = txtuname.Text;
                    Session["doc_id"] = dt.Rows[0]["d_id"];
                    Response.Redirect("~/Doctor/default.aspx");

                }
                {

                    lblerror.Text = "invalid username or password";
                    lblerror.ForeColor = Color.White;

                }

            }
            else if (role.SelectedValue == "insurance")
            {
                conn.Open();
                string s = "select username,password from insurance_signup_table where username=@username and password=@pswd";
                da = new SqlDataAdapter(s, conn);
                da.SelectCommand.Parameters.AddWithValue("@username", txtuname.Text);
                da.SelectCommand.Parameters.AddWithValue("@pswd", txtpswd.Text);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Session["name"] = txtuname.Text;
                    Response.Redirect("~/user/Home.aspx");

                }
                {

                    lblerror.Text = "invalid username or password";
                    lblerror.ForeColor = Color.White;

                }

            }
            //c.username = txtuname.Text;
            //c.pswd = txtpswd.Text;
            //conn.Open();

            //da = new SqlDataAdapter("check_login", conn);
            //da.SelectCommand.CommandType = CommandType.StoredProcedure;
            //da.SelectCommand.Parameters.AddWithValue("@username", c.username);
            //da.SelectCommand.Parameters.AddWithValue("@pswd", c.pswd);


            //DataTable dt = new DataTable();
            //da.Fill(dt);

            //if (dt.Rows.Count > 0)
            //{
            //    Session["name"] = txtuname.Text;
            //    Response.Redirect("~/Home.aspx");
            //    //Control co = this.Master.FindControl("logindiv");
            //    //co.Visible = false;
            //    //logindiv.Visible = false;

            //}

            //else
            //{

            //    lblerror.Text = "invalid username or password";
            //    lblerror.ForeColor = Color.Red;

            //}
        }

        
    }
}