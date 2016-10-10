using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electronic_Health_Record.admin
{
    public partial class updatedoctor : System.Web.UI.Page
    {
        private int PID;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        public void BindData()
        {
            SqlCommand Cmd = new SqlCommand("select * from doctor_signup_table where d_id=" + PID + "", con);
            con.Open();
            SqlDataReader reader = Cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    Image1.ImageUrl = "" + reader["imagename"].ToString();
                    lblimgnm.Text = reader["imagename"].ToString();
                    txtuname.Text = reader["username"].ToString();
                    txtfname.Text = reader["fname"].ToString();
                    txtmname.Text = reader["mname"].ToString();
                    txtlname.Text = reader["lname"].ToString();
                    txtdob.Text = reader["dob"].ToString();
                    txtphno.Text = reader["phoneno"].ToString();
                    txtemail.Text = reader["email"].ToString();
                    txtadd.Text = reader["address"].ToString();
                    txtlicenceno.Text = reader["licenceno"].ToString();
                    txtspeciality.Text = reader["speciality"].ToString();
                    txtdegree.Text = reader["degree"].ToString();
                    if (reader["gender"].ToString() == "male")
                    {
                        rbdmale.Checked = true;
                    }
                    else
                    {
                        rbdfemale.Checked = false;
                    }
                }
            }
            con.Close();
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["dID"] == "" || Session["dID"] == null)
            {
                Response.Redirect("managedoctor.aspx");
            }

            if (!IsPostBack)
            {
                PID = Convert.ToInt32(Session["dID"]);
                BindData();
                country();
            }
        }

        public void country()
        {
            cmd = new SqlCommand("Select * from [country_table]");
            cmd.Connection = con;
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            con.Close();
            drpCountry.DataSource = dt;
            drpCountry.DataTextField = "countryname";
            drpCountry.DataValueField = "country_id";
            drpCountry.DataBind();
            ListItem li = new ListItem();
            li.Text = "<--select country-->";
            li.Value = "0";
            drpCountry.Items.Insert(0, li);
        }
        protected void drpcountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            int CountryId = Convert.ToInt32(drpCountry.SelectedValue);
            cmd = new SqlCommand("select * from state_table where country_id=" + CountryId, con);
            cmd.Connection = con;
            //select all state coresponding to selected country
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            con.Close();
            drpState.DataSource = dt;
            drpState.DataTextField = "statename";
            drpState.DataValueField = "state_id";
            drpState.DataBind();
            ListItem li = new ListItem();
            li.Text = "<--select state-->";
            li.Value = "0";
            drpState.Items.Insert(0, li);




        }

        protected void drpstate_SelectedIndexChanged(object sender, EventArgs e)
        {
            int StateId = Convert.ToInt32(drpState.SelectedValue);
            cmd = new SqlCommand("select * from city_table where state_id=" + StateId, con);
            cmd.Connection = con;
            //select all city coresponding to selected state
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            con.Close();
            drpCity.DataSource = dt;
            drpCity.DataTextField = "cityname";
            drpCity.DataValueField = "city_id";
            drpCity.DataBind();
            ListItem li = new ListItem();
            li.Text = "<--select city-->";
            li.Value = "0";
            drpCity.Items.Insert(0, li);



        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            //update code here ....
            SqlCommand cmdselect = new SqlCommand();
            cmdselect.CommandTimeout = 0;
            cmdselect.CommandType = CommandType.StoredProcedure;
            cmdselect.Connection = con;
            cmdselect.CommandText = "dbo.doctor_personal_details";
            SqlParameter fname = new SqlParameter("@fname", SqlDbType.VarChar, 50);
            fname.Value = txtfname.Text.Trim().ToString();
            cmdselect.Parameters.Add(fname);

            SqlParameter mname = new SqlParameter("@mname", SqlDbType.VarChar, 50);
            mname.Value = txtmname.Text.Trim().ToString();
            cmdselect.Parameters.Add(mname);

            SqlParameter lname = new SqlParameter("@lname", SqlDbType.VarChar, 50);
            lname.Value = txtlname.Text.Trim().ToString();
            cmdselect.Parameters.Add(lname);

            SqlParameter dob = new SqlParameter("@dob", SqlDbType.VarChar, 50);
            dob.Value = txtdob.Text.Trim().ToString();
            cmdselect.Parameters.Add(dob);

            SqlParameter phoneno = new SqlParameter("@phoneno", SqlDbType.Int, 10);
            phoneno.Value = txtphno.Text.Trim().ToString();
            cmdselect.Parameters.Add(phoneno);

            SqlParameter email = new SqlParameter("@email", SqlDbType.VarChar, 50);
            email.Value = txtemail.Text.Trim().ToString();
            cmdselect.Parameters.Add(email);

            string img = null;
            if (FileUpload1.HasFile)
            {
                // lblupdate.Text = "***";
                img = FileUpload1.PostedFile.FileName;
                FileUpload1.SaveAs(Server.MapPath("~/Upload/") + img);
            }
            else
            {
                img = lblimgnm.Text;
            }
            SqlParameter imagename = new SqlParameter("@imagename", SqlDbType.VarChar, 200);
            imagename.Value = img;
            cmdselect.Parameters.Add(imagename);

           // if (FileUpload1.HasFile)
            //{
           // SqlParameter imagename = new SqlParameter("@imagename", SqlDbType.VarChar, 200);
           // imagename.Value = "~/Upload/" + FileUpload1.FileName;
           // cmdselect.Parameters.Add(imagename);
           //  }

            // lblupdate.Text = "***";



            SqlParameter address = new SqlParameter("@address", SqlDbType.VarChar, 1000);
            address.Value = txtadd.Text.Trim().ToString();
            cmdselect.Parameters.Add(address);

            SqlParameter licenceno = new SqlParameter("@licensenumber", SqlDbType.VarChar, 100);
            licenceno.Value = txtlicenceno.Text.Trim().ToString();
            cmdselect.Parameters.Add(licenceno);

            SqlParameter degree = new SqlParameter("@degree", SqlDbType.VarChar, 50);
            degree.Value = txtdegree.Text.Trim().ToString();
            cmdselect.Parameters.Add(degree);

            SqlParameter speciality = new SqlParameter("@speciality", SqlDbType.VarChar, 50);
            speciality.Value = txtspeciality.Text.Trim().ToString();
            cmdselect.Parameters.Add(speciality);


            SqlParameter username = new SqlParameter("@username", SqlDbType.VarChar, 1000);
            username.Value = txtuname.Text.Trim().ToString();
            cmdselect.Parameters.Add(username);
            try
            {
                con.Open();
                string a = cmdselect.ExecuteNonQuery().ToString();

                if (a == "1")
                {
                    lblupdate.ForeColor = System.Drawing.Color.Green;
                    lblupdate.Text = "Add Successfully ...!";
                    Response.Redirect("managedoctor.aspx");

                }
                else
                {
                    lblupdate.ForeColor = System.Drawing.Color.Red;
                    lblupdate.Text = "Add Fail , try again later ..!";
                }
                con.Close();
            }
            catch (Exception ex)
            {
                lblupdate.Text = ex.ToString();
            }

        }

        protected void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("managedoctor.aspx");
        }
    }
}