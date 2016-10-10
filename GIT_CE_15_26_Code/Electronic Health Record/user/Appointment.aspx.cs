using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace Electronic_Health_Record
{
    public partial class Appointment1 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        SqlCommand cmd = null;
        SqlCommand cmd1 = null;
        string time;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
               
                bindDoctor();
                //bindAvailDate();
            }


            //appointment.Visible = false;
            //BinddoctorName();

        }

        //private void bindAvailDate()
        //{
        //    DataSet ds = new DataSet();
        //    DataTable dt = new DataTable();
        //    conn.Open();
        //    string p = "select time from appointment_table  where d_id=" + Session["docapp_id"];
        //    cmd = new SqlCommand(p, conn);
        //    SqlDataAdapter da = new SqlDataAdapter(cmd);
        //    da.Fill(ds);
        //    Session["docapp_status"] = ds.Tables[0].Rows[0]["time"].ToString();
        //    conn.Close();

        //}

        private void bindDoctor()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            conn.Open();
            string[] s = Session["searchdoctor"].ToString().Split(' ');
            string name = "select d_id from doctor_signup_table where fname='" + s[0] + "' and mname='" + s[1] + "' and lname='" + s[2] + "'";
            cmd = new SqlCommand(name, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            Session["docapp_id"] = ds.Tables[0].Rows[0]["d_id"].ToString();
            // lbl_docid.Text = ds.Tables[0].Rows[0]["d_id"].ToString();
            conn.Close();
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();



        }

        private void BindCheckBoxList()
        {
            try
            {
                DataTable dt = new DataTable();
                conn.Open();
                //int id = Convert.ToInt32(name);
                //cmd=new SqlCommand(name,conn);

                string query = "select * from doc_appointment_table where d_id=" + Session["docapp_id"];
                cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    //bind_doctor_time.RepeatColumns = 4;
                    //bind_doctor_time.DataSource = dt;
                    //bind_doctor_time.DataTextField = "Eight_Eightthirty";
                    ////bind_doctor_time.DataTextField = "Eightthirty_Nine";
                    //bind_doctor_time.DataValueField = "d_id";
                    //bind_doctor_time.DataBind();

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        //CheckBoxList c1 = new CheckBoxList();
                        //if (dt.Rows[0][3].ToString()=="True")
                        //{

                        //    c1.ID = "bind_doctor_time";
                        //    c1.DataSource = dt;
                        //    c1.DataTextField = "Eight_Eightthirty";
                        //    c1.DataBind();
                        //    bind_doctor_time.Controls.Add(c1);
                        //}
                        string q = "insert into appointment_table values(@p_id,@d_id,@AppointmentStart,@AppointmentStatus,@problem,@time)";
                        SqlCommand cmd1 = new SqlCommand(q, conn);

                        foreach (ListItem li in bind_doc_time.Items)
                        {
                            //if (li.Selected)
                            //{
                            //    time += li.Text + " ";
                            //}
                            //string[] new_time = time.Split(' ');

                            //}
                            //for (int j = 29; j <= 54; j++)
                            //{
                            if (dt.Rows[i][29].ToString() == "free" && bind_doc_time.Items.FindByText("8:00-8:30").Selected == true)
                            {
                                //Session["waiting"] = "waiting";
                                //cmd.Parameters.AddWithValue("Eight_Status", "waiting");
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor=System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][30].ToString() == "free" && bind_doc_time.Items.FindByText("8:30-9:00").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][31].ToString() == "free" && bind_doc_time.Items.FindByText("9:00-9:30").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][32].ToString() == "free" && bind_doc_time.Items.FindByText("9:30-10:00").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][33].ToString() == "free" && bind_doc_time.Items.FindByText("10:00-10:30").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][34].ToString() == "free" && bind_doc_time.Items.FindByText("10:30-11:00").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][35].ToString() == "free" && bind_doc_time.Items.FindByText("11:00-11:30").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][36].ToString() == "free" && bind_doc_time.Items.FindByText("11:30-12:00").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][37].ToString() == "free" && bind_doc_time.Items.FindByText("12:00-12:30").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][38].ToString() == "free" && bind_doc_time.Items.FindByText("12:30-13:00").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][39].ToString() == "free" && bind_doc_time.Items.FindByText("13:00-13:30").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][40].ToString() == "free" && bind_doc_time.Items.FindByText("13:30-14:00").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][41].ToString() == "free" && bind_doc_time.Items.FindByText("14:00-14:30").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][42].ToString() == "free" && bind_doc_time.Items.FindByText("14:30-15:00").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][43].ToString() == "free" && bind_doc_time.Items.FindByText("15:00-15:30").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][44].ToString() == "free" && bind_doc_time.Items.FindByText("15:30-16:00").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][45].ToString() == "free" && bind_doc_time.Items.FindByText("16:00-16:30").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][46].ToString() == "free" && bind_doc_time.Items.FindByText("16:30-17:00").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][47].ToString() == "free" && bind_doc_time.Items.FindByText("17:00-17:30").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][48].ToString() == "free" && bind_doc_time.Items.FindByText("17:30-18:00").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][49].ToString() == "free" && bind_doc_time.Items.FindByText("18:00-18:30").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][50].ToString() == "free" && bind_doc_time.Items.FindByText("18:30-19:00").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][51].ToString() == "free" && bind_doc_time.Items.FindByText("19:00-19:30").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][52].ToString() == "free" && bind_doc_time.Items.FindByText("19:30-20:00").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][53].ToString() == "free" && bind_doc_time.Items.FindByText("20:00-20:30").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }
                            if (dt.Rows[i][54].ToString() == "free" && bind_doc_time.Items.FindByText("20:30-21:00").Selected == true)
                            {
                                cmd1.Parameters.AddWithValue("@p_id", Convert.ToInt32(Session["patient_id"]));
                                cmd1.Parameters.AddWithValue("@d_id", Convert.ToInt32(Session["docapp_id"]));
                                cmd1.Parameters.AddWithValue("@AppointmentStart", Calendar1.SelectedDate);
                                cmd1.Parameters.AddWithValue("@AppointmentStatus", "waiting");
                                cmd1.Parameters.AddWithValue("@problem", patient_problem.Text);
                                cmd1.Parameters.AddWithValue("@time", bind_doc_time.SelectedItem.Value);
                                cmd1.ExecuteNonQuery();
                                lbl_docid.ForeColor = System.Drawing.Color.Green;
                                lbl_docid.Text = "Appointment Confirm Successfully!!!";
                                conn.Close();
                                break;
                            }
                            else
                            {
                                Response.Write("Selected slot not available!!");
                            }

                        }

                    }
                }
            }
            //catch (System.Data.SqlClient.SqlException ex)
            //{
            //    string msg = "Fetch Error";
            //    msg += ex.Message;
            //    throw new Exception(msg);
            //}
            finally
            {

               
                Response.Redirect("~/user/Appointment.aspx");
                lbl_docid.Text = "Your Appointment has been booked!!";
                lbl_docid.ForeColor = Color.Green;
                conn.Close();
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            BindCheckBoxList();
        }

        //private void BinddoctorName()
        //{
        //    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        //    SqlCommand cmd = new SqlCommand("SELECT (fname"+' '+"mname"+' '+"lname) AS FullName , ");
        //    SqlDataAdapter da = new SqlDataAdapter();
        //    DataSet ds = new DataSet();
        //}

        //protected void btnsearch_Click(object sender, EventArgs e)
        //{
        //    search.Visible = false;
        //    appointment.Visible = true;
        //}
    }
}