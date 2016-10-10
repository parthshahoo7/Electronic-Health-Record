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
    public partial class update_report : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }
        
        protected void BindData()
        {
            SqlCommand Cmd = new SqlCommand("select * from report_table where rt_id= "+ Session["rt_id"] , con);

            con.Open();
            SqlDataReader reader = Cmd.ExecuteReader();
            

            if (reader.HasRows)
            {
                
                while (reader.Read())
                {
                    string atime = reader["admit_time"].ToString();
                    atime.Split(' ');
                    string dtime = reader["discharge_time"].ToString();
                    dtime.Split(' ');
                    txtdate.Text = reader["report_date"].ToString();
                    txtpname.Text = reader["p_name"].ToString();
                    txtage.Text = reader["p_age"].ToString();
                    drpmarrige.SelectedValue = reader["marital_status"].ToString();
                    txtpadmit.Text = reader["admit_date"].ToString();
                    txtpadmittimeh.Text = atime[0].ToString();
                    txtpadmittimeh.Text = txtpadmittimeh.Text+ atime[1].ToString();
                    txtpadmittimem.Text = atime[3].ToString();
                    txtpadmittimem.Text = txtpadmittimem.Text+ atime[4].ToString();
                    drppadmittime.Text = atime[6].ToString();
                    drppadmittime.Text = drppadmittime.Text+ atime[7].ToString();
                    txtpdischarge.Text = reader["discharge_date"].ToString();
                    txtpdischargetimeh.Text = dtime[0].ToString();
                    txtpdischargetimeh.Text = txtpdischargetimeh.Text+ dtime[1].ToString();
                    txtpdischargetimem.Text = dtime[3].ToString();
                    txtpdischargetimem.Text = txtpdischargetimem.Text + dtime[4].ToString();
                    drppdischargetime.Text = dtime[6].ToString();
                    drppdischargetime.Text = drppdischargetime.Text + dtime[7].ToString();
                    txtpdeseasename.Text = reader["deaseas_name"].ToString();
                    txtpdescription.Text = reader["deaseas_note"].ToString();
                    drproomtype.SelectedValue = reader["room_type"].ToString();
                    txtdays.Text = reader["noofdays"].ToString();
                    txtcharge.Text= reader["charge_room"].ToString();
                    txtdoctorcharge.Text= reader["doctor_charge"].ToString();
                    txtnursecharge.Text= reader["nursing_charge"].ToString();
                    txtmedicalcharge.Text = reader["medicine_charge"].ToString();
                    txtothercharge.Text = reader["other_charge"].ToString();
                }
            }
            con.Close();
        }

        protected void updateprofile()
        {
            con.Open();
            if (txtpadmittimeh.Text.Length != 2)
            {
                String temp = txtpadmittimeh.Text;
                txtpadmittimeh.Text = "0" + txtpadmittimeh.Text;
            }
           if(txtpadmittimem.Text.Length != 2)
            {
                string temp = txtpadmittimem.Text;
                txtpadmittimem.Text = "0" + txtpadmittimem.Text;
            }
           if (txtpdischargetimeh.Text.Length != 2)
           {
               string temp = txtpdischargetimeh.Text;
               txtpdischargetimeh.Text = "0" + txtpdischargetimeh.Text;
           }
           if (txtpdischargetimem.Text.Length != 2)
           {
               string temp = txtpdischargetimeh.Text;
               txtpdischargetimem.Text = "0" + txtpdischargetimem.Text;
           }
            string a = txtpadmittimeh.Text.ToString() + ":" + txtpadmittimem.Text.ToString() + ":" + drppadmittime.Text.ToString();
            string b = txtpdischargetimeh.Text.ToString() + ":" + txtpdischargetimem.Text.ToString() + ":" + drppdischargetime.Text.ToString();
            string query = @"UPDATE report_table set report_date='" + txtdate.Text.ToString() + "',p_name='" + txtpname.Text + "',p_age='" + txtage.Text.ToString() + "',marital_status='" + drpmarrige.SelectedValue.ToString() + "',admit_date='" + txtpadmit.Text + "',admit_time='" + a + "',discharge_date='" + txtpdischarge.Text + "',discharge_time='" + b + "',deaseas_name='" + txtpdeseasename.Text + "',deaseas_note='" + txtpdescription.Text + "',room_type='" + drproomtype.SelectedValue.ToString() + "',noofdays=" + Convert.ToString(txtdays.Text) + ",charge_room=" + Convert.ToString(txtcharge.Text) + ",doctor_charge=" + Convert.ToString(txtdoctorcharge.Text) + ",nursing_charge=" + Convert.ToString(txtnursecharge.Text) + ",medicine_charge="+Convert.ToString(txtmedicalcharge.Text)+",other_charge="+Convert.ToString(txtothercharge.Text)+" WHERE rt_id= @reportid";
            
            SqlCommand cmd = new SqlCommand(query,con);
            cmd.Parameters.AddWithValue("@reportid",Session["rt_id"]);
            cmd.ExecuteNonQuery();
            con.Close();
            lblnotofication.Text = "Report Updated Successfully";
        }
        protected void btnreport_Click(object sender, EventArgs e)
        {
            updateprofile();
        }
    }
}