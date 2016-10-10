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
using System.Drawing;

namespace Electronic_Health_Record
{
    public partial class edit_report : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                lblsearch.Text=Request.QueryString["p_id"];
               
            }
            

        }
        protected void binddata()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            
            //con.Open();
            //string query = "Select * from report_table WHERE p_id='"+lblsearch.Text+"' ";
            //SqlCommand cmd = new SqlCommand(query,con);
            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            //da.Fill(ds);
            //datalist1.DataSource = ds.Tables[0];
            //datalist1.DataBind();

            con.Open();
            //string query = "Select report_date AS Date, p_name AS patient_Name, deaseas_name AS Deaseas_Name from report_table WHERE p_id='" + lblsearch.Text + "'";
            string query = "Select * from report_table WHERE p_id='" + lblsearch.Text + "'";
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
                lblerror.Text = "No Data Found...";
            }
        }

       

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> GetUsers(string prefixText)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from patient_signup_table where fname like @Name+'%' OR mname like @Name+ '%' OR lname like @Name+ '%'", con);
            cmd.Parameters.AddWithValue("@Name", prefixText);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            List<string> PatientName = new List<string>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {

                //CountryNames.Add(dt.Rows[i][1].ToString());
                string name = null;
                name = dt.Rows[i][1].ToString() + " ";
                name += dt.Rows[i][2].ToString() + " ";
                name += dt.Rows[i][3].ToString() + " ";
                PatientName.Add(name);
            }
            return PatientName;
        }

        protected void BindPatientId()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            string[] name = txtsearch.Text.Split(' ');
            con.Open();
            SqlCommand cmd = new SqlCommand("select p_id from patient_signup_table WHERE fname='" + name[0] + "' AND mname ='" + name[1] + "' AND lname='" + name[2] + "' ", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            lblsearch.Text = ds.Tables[0].Rows[0]["p_id"].ToString();

            con.Close();
        }

        protected void txtsearch_TextChanged(object sender, EventArgs e)
        {
            BindPatientId();
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            binddata();
        }

        protected void lnkedit_Click(object sender, EventArgs e)
        {
           // int index = gridview1.SelectedIndex;
           ////string report = (gridview1.Rows[index].Cells[0].Text).ToString();
           // GridViewRow row = gridview1.Rows[index];

           // String s = row.Cells[0].Text; 


           // Session["ReportId"] = s;
            
           // Response.Redirect("update_report.aspx");
        }

        protected void gridview1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridview1.EditIndex = e.NewEditIndex;
            Session["rt_id"] = gridview1.DataKeys[e.NewEditIndex].Value;
            Response.Redirect("update_report.aspx");
            this.binddata();
        }

        //protected void gridview1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    int rtid = Convert.ToInt32(gridview1.DataKeys[e.RowIndex].Values["rt_id"].ToString());
        //    Session["rt_id"] = rtid;
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("delete from report_table where rt_id="+Session["rt_id"] , con);
        //    int result = cmd.ExecuteNonQuery();
        //    con.Close();
        //    if (result == 1)
        //    {
        //        binddata();
        //        lblerror.ForeColor = Color.Red;
        //        lblerror.Text = "Report Deleted Successfully";
        //    }
        //}
    }
}