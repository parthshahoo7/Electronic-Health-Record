﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;
using System.IO;
using System.Drawing;
using System.Web.Security;
using System.Drawing.Drawing2D;

namespace Electronic_Health_Record.Doctor
{
    public partial class EditProfile : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {            
            BindData();
        }

        protected void BindData()
        {
            SqlCommand Cmd = new SqlCommand("select * from doctor_signup_table where username= '" + Session["name"] + "'", conn);

            conn.Open();
            SqlDataReader reader = Cmd.ExecuteReader();


            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    image1.ImageUrl = "" + reader["imagename"].ToString();
                    
                    txtfname.Text = reader["fname"].ToString();
                    txtmname.Text = reader["mname"].ToString();
                    txtlname.Text = reader["lname"].ToString();
                    txtdob.Text = reader["dob"].ToString();
                    txtphone.Text = reader["phoneno"].ToString();
                    txtemail.Text = reader["email"].ToString();
                    rbgender.Text = reader["gender"].ToString();
                    txtusername.Text = reader["username"].ToString();
                    txtadd.Text = reader["address"].ToString();
                    country.Text = reader["country_id"].ToString();
                    state.Text = reader["state_id"].ToString();
                    city.Text = reader["city_id"].ToString();
                    drpdegree.SelectedItem.Text=reader["degree"].ToString();
                    drpspeciality.SelectedItem.Text=reader["speciality"].ToString();
                    txtlicense.Text = reader["licenceno"].ToString();
                }
            }
            conn.Close();
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            SqlCommand cmdselect = new SqlCommand();
            cmdselect.CommandTimeout = 0;
            cmdselect.CommandType = CommandType.StoredProcedure;
            cmdselect.Connection = conn;
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
            phoneno.Value = txtphone.Text.Trim().ToString();
            cmdselect.Parameters.Add(phoneno);

            SqlParameter email = new SqlParameter("@email", SqlDbType.VarChar, 50);
            email.Value = txtemail.Text.Trim().ToString();
            cmdselect.Parameters.Add(email);

            string img = null;
            if (photoupload.HasFile)
            {
                // lblupdate.Text = "***";
                img = photoupload.PostedFile.FileName;
                photoupload.SaveAs(Server.MapPath("~/Upload/") + img);
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
            licenceno.Value = txtlicense.Text.Trim().ToString();
            cmdselect.Parameters.Add(licenceno);

            SqlParameter degree = new SqlParameter("@degree", SqlDbType.VarChar, 50);
            degree.Value = drpdegree.Text.Trim().ToString();
            cmdselect.Parameters.Add(degree);

            SqlParameter speciality = new SqlParameter("@speciality", SqlDbType.VarChar, 50);
            speciality.Value = drpspeciality.Text.Trim().ToString();
            cmdselect.Parameters.Add(speciality);


            SqlParameter username = new SqlParameter("@username", SqlDbType.VarChar, 1000);
            username.Value = txtusername.Text.Trim().ToString();
            cmdselect.Parameters.Add(username);
            try
            {
                conn.Open();
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
                conn.Close();
            }
            catch (Exception ex)
            {
                lblupdate.Text = ex.ToString();
            }
        }

    }
}