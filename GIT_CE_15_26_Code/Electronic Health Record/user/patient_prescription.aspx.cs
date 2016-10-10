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

namespace Electronic_Health_Record
{
    public partial class patient_prescription : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindPatientId();
                bindpatientdata();
                history.Visible = true;
                report.Visible = false;
                if (Session["p_pid"] != null)
                {
                    viewdata();
                }
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
        protected void bindpatientdata()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            con.Open();
            string query = "Select * from prescription_master WHERE p_id='" + lblpid.Text + "'";
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
                lblerror.Text = "No Data Found...";
            }
            //con.Close();
        }

        protected void gridview_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = gridview.SelectedRow.Cells[0].Text;
            Session["p_pid"] = id;
            viewdata();
            viewsubdata();
        }

        protected void viewdata()
        {

            history.Visible = false;
            report.Visible = true;
            SqlCommand Cmd = new SqlCommand("select * from prescription_master where p_pid= '" + Session["p_pid"] + "' ", con);



            try
            {
                con.Open();
                SqlDataReader reader = Cmd.ExecuteReader();
                if (reader.HasRows)
                {

                    while (reader.Read())
                    {
                        lbldate.Text = reader["pre_date"].ToString();
                        lblpname.Text = reader["patient_name"].ToString();
                        lblage.Text = reader["age"].ToString();
                        lbldoctor.Text = reader["doctor_name"].ToString();
                    }
                    con.Close();
                }
                //con.Close();

            }
            catch (SqlException ex)
            {
                con.Close();
            }
           // finally
            //{
            //    con.Close();
            //}
        }
        protected void viewsubdata()
        {
            history.Visible = false;
            report.Visible = true;
           
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();


            try
            {
           
                    con.Open();
                    string query = "Select * from prescription_sub WHERE p_id='" + Session["p_pid"] + "'";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    
                    da.Fill(ds);
                    
                    dt.Clear();
                    da.Fill(dt);
                
                
                if (dt.Rows.Count > 0)
                {
                    gridsub.Visible = true;
                    gridsub.DataSource = dt;
                    gridsub.DataBind();
                    
                }
                else
                {
                    gridsub.Visible = false;
                    lblerror.Text = "No Data Found...";
                    
                }
            }
            catch (SqlException ex)
            {
                lblerror.Text = "Error occured While insertion";
                con.Close();
            }
            finally
            {
                con.Close();
            }

        }
    }
}