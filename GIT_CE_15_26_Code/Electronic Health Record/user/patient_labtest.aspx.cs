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
using System.Collections.Specialized;
using System.Text;
using System.Drawing;
using System.IO;

namespace Electronic_Health_Record
{
    public partial class patient_labtest : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindPatientId();
                binddata();
                history.Visible = true;
               
                
            }
        }

        protected void BindPatientId()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            con.Open();
            SqlCommand cmd = new SqlCommand("select p_id from patient_signup_table WHERE username= '" + Session["name"] + "'", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            lblpid.Text = ds.Tables[0].Rows[0]["p_id"].ToString();

            con.Close();
        }
    

        protected void lnkDownload_Click(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            Response.ContentType = "application/octet-stream";
           // string name = "/Doctor";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            Response.WriteFile(filePath);
            Response.End();
        }

        protected void binddata()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();



            con.Open();
            //string query = "Select report_date AS Date, p_name AS patient_Name, deaseas_name AS Deaseas_Name from report_table WHERE p_id='" + lblsearch.Text + "'";
            string query = "Select * from labtest1 WHERE p_id='" + lblpid.Text + "'";
            SqlCommand cmd = new SqlCommand(query, con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            dt.Clear();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                gridview.Visible = true;
                gridview.DataSource = dt;
                gridview.DataBind();
            }
            else
            {
                gridview.Visible = false;
                lblerror.ForeColor = Color.Red;
                lblerror.Text = "No Data Found...";

            }
        }

       
    }
}