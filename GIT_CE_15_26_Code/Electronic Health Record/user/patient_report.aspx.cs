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
    public partial class patient_report1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        int a, b,c,d,e,f;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindPatientId();
                bindpatientdata();
                history.Visible = true;
                report.Visible = false;
                if (Session["rt_id"] != null)
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
            string query = "Select * from report_table WHERE p_id='" + lblpid.Text + "'";
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
           // con.Close();

        }

       
        protected void viewdata()
        {
           
            history.Visible = false;
           report.Visible = true;
           SqlCommand Cmd = new SqlCommand("select * from report_table where rt_id= '" + Session["rt_id"]+ "' ", con);



           try
           {
               con.Open();
               SqlDataReader reader = Cmd.ExecuteReader();
               if (reader.HasRows)
               {

                   while (reader.Read())
                   {
                       lbldate.Text = reader["report_date"].ToString();
                       lblpname.Text = reader["p_name"].ToString();
                       lblage.Text = reader["p_age"].ToString();
                       lblstatus.Text = reader["marital_status"].ToString();
                       lbladmitdate.Text = reader["admit_date"].ToString();
                       lbladmittime.Text = reader["admit_time"].ToString();
                       lbldischargedate.Text = reader["discharge_date"].ToString();
                       lbldischargetime.Text = reader["discharge_time"].ToString();
                       lbldiseases.Text = reader["deaseas_name"].ToString();
                       lbldescription.Text = reader["deaseas_note"].ToString();
                       lblroom.Text = reader["room_type"].ToString();
                       lbldays.Text = reader["noofdays"].ToString();
                       lblcharge.Text = reader["charge_room"].ToString();
                       lbldcharge.Text = reader["doctor_charge"].ToString();
                       lblncharge.Text = reader["nursing_charge"].ToString();
                       lblmedicinecharge.Text = reader["medicine_charge"].ToString();
                       lblothercharge.Text = reader["other_charge"].ToString();

                       a = Convert.ToInt32(lblcharge.Text);
                       b = a + Convert.ToInt32(lbldcharge.Text);
                       c = b + Convert.ToInt32(lblncharge.Text);
                       d = c + Convert.ToInt32(lblmedicinecharge.Text);
                       e = d + Convert.ToInt32(lblothercharge.Text);
                       f = e;
                       lbltotal.Text = f.ToString();
                   }

               }
              // con.Close();

           }
           catch (SqlException ex)
           {
               con.Close();
           }
           finally
           {
               con.Close();
           }
        }

        protected void gridview_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = gridview.SelectedRow.Cells[0].Text;
            Session["rt_id"] = id;
            viewdata();
        }

     

       
       
    }
}