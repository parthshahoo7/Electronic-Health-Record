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
    public partial class view_patient_report : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        int a, b, c, d, e, f;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
               // BindPatientId();
                //bindpatientdata();
                div1.Visible = true;
                report.Visible = false;
                if (Session["rt_id"] != null)
                {
                    viewdata();
                }
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

        protected void txtsearch_TextChanged(object sender, EventArgs e)
        {
            BindPatientId();
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            binddata();
        }

        protected void gridview1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = gridview1.SelectedRow.Cells[0].Text;
            Session["rt_id"] = id;
            viewdata();
        }
        protected void bindpatientdata()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            con.Open();
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

        protected void viewdata()
        {

            div1.Visible = false;
            report.Visible = true;
            SqlCommand Cmd = new SqlCommand("select * from report_table where rt_id= '" + Session["rt_id"] + "' ", con);



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
                //con.Close();

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
    }
}