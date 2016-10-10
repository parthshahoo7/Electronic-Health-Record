using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Electronic_Health_Record.user
{
    public partial class app : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        SqlCommand cmd = null;
        protected void Page_Load(object sender, EventArgs e)
        {
           // speciality();
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/teapp.aspx");
        }

        //private void speciality()
        //{
        //    cmd = new SqlCommand("Select speciality from [doctor_signup_table]");
        //    cmd.Connection = conn;
        //    conn.Open();
        //    DataTable dt = new DataTable();
        //    dt.Load(cmd.ExecuteReader());
        //    conn.Close();
        //    docspeciality.DataSource = dt;
        //    docspeciality.DataTextField = "speciality";
        //    docspeciality.DataValueField = "speciality";
        //    docspeciality.DataBind();
        //    ListItem li = new ListItem();
        //    li.Text = "<--select Speciality-->";
        //    li.Value = "0";
        //    docspeciality.Items.Insert(0, li);
        //}




        //protected void docspeciality_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //    cmd = new SqlCommand("Select speciality from [doctor_signup_table]");
        //    cmd.Connection = conn;
        //    conn.Open();
        //    DataTable dt = new DataTable();
        //    dt.Load(cmd.ExecuteReader());
        //    conn.Close();
        //    docspeciality.DataSource = dt;
        //    docspeciality.DataTextField = "speciality";
        //    docspeciality.DataValueField = "speciality";
        //    docspeciality.DataBind();
        //    //ListItem li = new ListItem();
        //    //li.Text = "<--select Speciality-->";
        //    //li.Value = "0";
        //    //docspeciality.Items.Insert(0, li);
        //}
    }
}