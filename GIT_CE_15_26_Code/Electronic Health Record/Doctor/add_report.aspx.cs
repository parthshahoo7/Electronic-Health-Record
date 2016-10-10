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
    public partial class add_report : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            txtdate.Text = System.DateTime.Now.ToString("dd-MM-yyyy");
            
            
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
            List<string> CountryNames = new List<string>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {

                //CountryNames.Add(dt.Rows[i][1].ToString());
                string name = null;
                name = dt.Rows[i][1].ToString() + " ";
                name += dt.Rows[i][2].ToString() + " ";
                name += dt.Rows[i][3].ToString() + " ";
                //name += dt.Rows[i][0].ToString();
                CountryNames.Add(name);
            }
            return CountryNames;
        }
        protected void BindPatientId()
        {
            DataSet ds = new DataSet();
            DataTable dt= new DataTable();
            string[] name = txtpname.Text.Split(' ');
            con.Open();
            SqlCommand cmd = new SqlCommand("select p_id from patient_signup_table WHERE fname='" + name[0] + "' AND mname ='" + name[1] + "' AND lname='" + name[2] + "' ", con);
            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            lblpatient.Text= ds.Tables[0].Rows[0]["p_id"].ToString();

            con.Close();
        }
        protected void txtpname_TextChanged(object sender, EventArgs e)
        {
            BindPatientId();
        }
        protected void btnreport_Click(object sender, EventArgs e)
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
               string temp = txtpdischargetimem.Text;
               txtpdischargetimem.Text = "0" + txtpdischargetimem.Text;
           }
            string a = txtpadmittimeh.Text.ToString() + ":" + txtpadmittimem.Text.ToString() + ":" + drppadmittime.Text.ToString();
            string b = txtpdischargetimeh.Text.ToString() + ":" + txtpdischargetimem.Text.ToString() + ":" + drppdischargetime.Text.ToString();
            string query = "insert into report_table VALUES('" +lblpatient.Text+ "','" + txtdate.Text.ToString() + "' ,'" + txtpname.Text + "','" + txtage.Text.ToString() + "','" + drpmarrige.SelectedValue.ToString() + "','" + txtpadmit.Text + "','" + a + "','" + txtpdischarge.Text + "','" + b + "','" + txtpdeseasename.Text + "','" + txtpdescription.Text + "','" + drproomtype.SelectedValue.ToString() + "','" + Convert.ToString(txtdays.Text) + "','" + Convert.ToString(txtcharge.Text) + "','" + Convert.ToString(txtdoctorcharge.Text) + "','" + Convert.ToString(txtnursecharge.Text) + "','"+Convert.ToString(txtmedicalcharge.Text)+"','"+Convert.ToString(txtothercharge.Text)+"')";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery().ToString();
            con.Close();
            lblnotification.Text = "Report Inserted Succssfully...";
        }

       
    }
}