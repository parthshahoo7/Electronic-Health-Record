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
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Text;
using System.Drawing;
using System.IO;
namespace Electronic_Health_Record
{
    public partial class View_labtest : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            BindPatientId();
            bindpatientdata();
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

        protected void bindpatientdata()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            con.Open();
            string query = "Select * from labtest1 WHERE p_id='" + lblpid.Text + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            dt.Clear();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                gridview1.Visible = true;
                gridview1.DataSource = dt;
                gridview1.DataBind();
            }
            else
            {
                gridview1.Visible = false;
                lblsearcherror.ForeColor = Color.Red;
                lblsearcherror.Text = "No Data Found...";
            }
        }

        protected void lnkDownload_Click(object sender, EventArgs e)
        {
          
            string filePath = (sender as LinkButton).CommandArgument;
            Response.ContentType = "application/octet-stream";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));            
            Response.WriteFile(filePath);
            Response.End();
        
        }
      }
    }
