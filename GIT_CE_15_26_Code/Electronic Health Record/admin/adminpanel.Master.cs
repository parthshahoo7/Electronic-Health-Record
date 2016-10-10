using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.Data;
using System.IO;

namespace Electronic_Health_Record.admin
{
    public partial class adminpanel : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] == "" || Session["AdminID"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            if (!IsPostBack)
            {
                BindData();
            }
        }
        public void BindData()
        {
            SqlCommand Cmd = new SqlCommand("select * from adminLogin where username='" + Session["AdminID"].ToString() + "'", con);
            con.Open();
            SqlDataReader reader = Cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    AdminImage.ImageUrl = "~/admin/img/" + reader["imagename"].ToString();
                    lblAdminName.Text = reader["displayname"].ToString();
                }
            }
            con.Close();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("default.aspx");
        }
    }
}