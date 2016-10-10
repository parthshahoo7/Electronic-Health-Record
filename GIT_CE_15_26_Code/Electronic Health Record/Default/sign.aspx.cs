using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
namespace Electronic_Health_Record.Default
{
    public partial class sign : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        SqlCommand cmd = null;
        protected void Page_Load(object sender, EventArgs e)
       {
            this.Form.Enctype = "multipart/form-data";
            txtpswd.Attributes["type"] = "Password";
            if (!Page.IsPostBack)
            {
                country();
            }

            if (Dropbutton1.SelectedIndex == 0)
            {
                nextbutton1.Text = "SignUp";
                fudiv.Visible = true;
            }
            else
            {
                nextbutton1.Text = "NEXT";
            }

        }
        protected void txtusername_TextChanged(object sender, EventArgs e)
        {
            if (Dropbutton1.SelectedValue == "Patient")
            {
                conn.Open();
                cmd = new SqlCommand("select username from patient_signup_table where username=@UName", conn);
                cmd.Parameters.AddWithValue("@UName", txtusername.Text);
                SqlDataReader da = cmd.ExecuteReader();
                if (da.Read())
                {
                    label1.Text = "User Name Is Already Exist!";
                    this.label1.ForeColor = Color.Red;
                }
                else
                {
                    label1.Text = "User Name Is Available";
                    this.label1.ForeColor = Color.Green;
                }
                conn.Close();
            }

            else if (Dropbutton1.SelectedValue == "Doctor")
            {
                conn.Open();
                cmd = new SqlCommand("select username from doctor_signup_table where username=@UName", conn);
                cmd.Parameters.AddWithValue("@UName", txtusername.Text);
                SqlDataReader da = cmd.ExecuteReader();
                if (da.Read())
                {
                    label1.Text = "User Name Is Already Exist!";
                    this.label1.ForeColor = Color.Red;
                }
                else
                {
                    label1.Text = "User Name Is Available";
                    this.label1.ForeColor = Color.Green;
                }
                conn.Close();
            }
            else if (Dropbutton1.SelectedValue == "insurance")
            {
                conn.Open();
                cmd = new SqlCommand("select username from insurance_signup_table where username=@UName", conn);
                cmd.Parameters.AddWithValue("@UName", txtusername.Text);
                SqlDataReader da = cmd.ExecuteReader();
                if (da.Read())
                {
                    label1.Text = "User Name Is Already Exist!";
                    this.label1.ForeColor = Color.Red;
                }
                else
                {
                    label1.Text = "User Name Is Available";
                    this.label1.ForeColor = Color.Green;
                }
                conn.Close();
            }
        }
        protected void nextbutton_Click(object sender, EventArgs e)
        {
            multiview.ActiveViewIndex = 1;
            fudiv.Visible = false;
        }
        public void country()
        {
            cmd = new SqlCommand("Select * from [country_table]");
            cmd.Connection = conn;
            conn.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            conn.Close();
            drpcountry.DataSource = dt;
            //drpcountry.DataTextField = "countryname";
            //drpcountry.DataValueField = "country_id";
            drpcountry.DataBind();
            ListItem li = new ListItem();
            li.Text = "<--select country-->";
            li.Value = "0";
            drpcountry.Items.Insert(0, li);
        }
        protected void drpcountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            int CountryId = Convert.ToInt32(drpcountry.SelectedValue);
            cmd = new SqlCommand("select * from state_table where country_id=" + CountryId, conn);
            cmd.Connection = conn;
            //select all state coresponding to selected country
            conn.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            conn.Close();
            drpstate.DataSource = dt;
            drpstate.DataBind();
            ListItem li = new ListItem();
            li.Text = "<--select state-->";
            li.Value = "0";
            drpstate.Items.Insert(0, li);


            ////int CountryId= Convert.ToInt32(drpcountry.SelectedValue);
            ////select all state coresponding to selected country
            ////dr = new SqlDataAdapter("select * from state_table where country_id=" + CountryId,conn);



            //DataTable dt = new DataTable();
            //dt.Load(cmd.ExecuteReader());
            //conn.Close();
            ////drpcountry.DataTextField = "countryname";
            ////drpcountry.DataValueField = "country_id";
            //drpstate.DataBind();


        }

        protected void drpstate_SelectedIndexChanged(object sender, EventArgs e)
        {
            int StateId = Convert.ToInt32(drpstate.SelectedValue);
            cmd = new SqlCommand("select * from city_table where state_id=" + StateId, conn);
            cmd.Connection = conn;
            //select all city coresponding to selected state
            conn.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            conn.Close();
            drpcity.DataSource = dt;
            drpcity.DataBind();
            ListItem li = new ListItem();
            li.Text = "<--select city-->";
            li.Value = "0";
            drpcity.Items.Insert(0, li);


            //int StateId = Convert.ToInt32(drpstate.SelectedValue);
            //SqlCommand cmd = new SqlCommand("select * from city_table where state_id =" + StateId, conn);
            //cmd.Connection = conn;
            ////select city corsponding to state
            //conn.Open();              
            //DataSet ds = new DataSet();
            //dr.Fill(ds);
            //conn.Close();
            //drpcity.DataSource = ds;
            //drpcity.DataTextField = "City";
            //drpcity.DataValueField = "CityId";
            //drpcity.DataBind();
            //drpcity.Items.Insert(0, new ListItem("--Select--", "0"));

        }
        protected void nextbutton1_Click(object sender, EventArgs e)
        {
            if (Dropbutton1.SelectedIndex == 1)
            {
                multiview.ActiveViewIndex = 2;
            }
            if (Dropbutton1.SelectedIndex == 2)
            {
                multiview.ActiveViewIndex = 3;
            }
            if (nextbutton1.Text == "SignUp")
            {

                if (photoupload.HasFile)
                {
                    string strname = "~/Upload/" + photoupload.PostedFile.FileName;
                    photoupload.SaveAs(Server.MapPath(strname));
                    //photoupload.PostedFile.SaveAs(Server.MapPath("~/Upload/") + strname);
                    // conn.Open();
                    string query = "insert into patient_signup_table VALUES('" + txtfname.Text + "' ,'" + txtmname.Text + "','" + txtlname.Text + "','" + txtdob.Text + "'," + Convert.ToInt32(txtphone.Text) + ",'" + txtemail.Text + "','" + strname + "','" + dpgender.SelectedItem.Text + "','" + txtusername.Text + "','" + txtpswd.Text + "','" + txtadd.Text + "'," + Convert.ToInt32(drpcountry.SelectedIndex.ToString()) + "," + Convert.ToInt32(drpstate.SelectedIndex.ToString()) + "," + Convert.ToInt32(drpcity.SelectedIndex.ToString()) + ")";
                    conn.Open();
                    cmd = new SqlCommand(query, conn);

                    cmd.ExecuteNonQuery();


                    conn.Close();
                    Response.Redirect("Home.aspx");
                }
            }

        }
        protected void previousbutton_Click(object sender, EventArgs e)
        {
            multiview.ActiveViewIndex = 0;
        }
        protected void Dropbutton1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Dropbutton1.SelectedIndex == 1)
            {
                nextbutton1.Text = "SignUp";
            }
            else
            {
                nextbutton1.Text = "NEXT";
            }

        }
        protected void nextbutton2_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string strname = "~/Upload/" + FileUpload1.PostedFile.FileName;
                FileUpload1.SaveAs(Server.MapPath(strname));
                //conn.Open();
                //string query = "insert into doctor_signup_table VALUES('" + txtfname.Text + "' ,'" + txtmname.Text + "','" + txtlname.Text + "','" + txtdob.Text + "'," + Convert.ToInt32(txtphone.Text) + ",'" + txtemail.Text + "'," + strname + ",'" + dpgender.SelectedItem.Text + "','" +txtlicense.Text +"','" +degree.SelectedItem.Text +"','" + drpspeciality.SelectedItem.Text + "','" + txtusername.Text + "','" + txtpswd.Text + "','" + txtadd.Text + "'," + Convert.ToInt32(drpcountry.SelectedItem.Value) + "," + Convert.ToInt32(drpstate.SelectedItem.Value) + "," + Convert.ToInt32(drpcity.SelectedItem.Value) + ")";
                //SqlCommand cmd = new SqlCommand(query, conn);
                //cmd.ExecuteNonQuery();
                //conn.Close();
                conn.Open();
                SqlCommand cmd = new SqlCommand("insert into doctor_signup_table values(@fname,@mname,@lname,@dob,@phone,@email,@image,@gender,@licence,@degree,@speciality,@username,@password,@address,@country,@state,@city)", conn);
                cmd.Parameters.AddWithValue("@fname", txtfname.Text);
                cmd.Parameters.AddWithValue("@mname",txtmname.Text);
                cmd.Parameters.AddWithValue("@lname", txtlname.Text);
                cmd.Parameters.AddWithValue("@dob", txtdob.Text);
                cmd.Parameters.AddWithValue("@phone",Convert.ToInt32(txtphone.Text));
                cmd.Parameters.AddWithValue("@email",txtemail.Text);
                cmd.Parameters.AddWithValue("@image",strname);
                cmd.Parameters.AddWithValue("@gender",dpgender.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@licence",txtlicense.Text);
                cmd.Parameters.AddWithValue("@degree",degree.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@speciality",drpspeciality.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@username",txtusername.Text);
                cmd.Parameters.AddWithValue("@password",txtpswd.Text);
                cmd.Parameters.AddWithValue("@address",txtadd.Text);
                cmd.Parameters.AddWithValue("@country",Convert.ToInt32(drpcountry.SelectedItem.Value));
                cmd.Parameters.AddWithValue("@state",Convert.ToInt32(drpstate.SelectedItem.Value));
                cmd.Parameters.AddWithValue("@city",Convert.ToInt32(drpcity.SelectedItem.Value));
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("login.aspx");
            }

        }
        protected void previousbutton1_Click1(object sender, EventArgs e)
        {
            multiview.ActiveViewIndex = 1;
        }
        protected void nextbutton3_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("insert into insurance_signup_table values(@fname,@mname,@lname,@dob,@phone,@email,@image,@gender,@licence,@company,@username,@password,@address,@country,@state,@city)", conn);
            //string query = "insert into insurance_signup_table VALUES('" + txtfname.Text + "' ,'" + txtmname.Text + "','" + txtlname.Text + "','" + txtdob.Text + "'," + Convert.ToInt32(txtphone.Text) + ",'" + txtemail.Text + "','" + photoupload.FileName + "','" + dpgender.SelectedItem.Text + "','" + txtlicense.Text + "'," + Convert.ToString(drpcompany.SelectedIndex) + ",'" + txtusername.Text + "','" + txtpswd.Text + "','" + txtadd.Text + "'," + Convert.ToInt32(drpcountry.SelectedIndex.ToString()) + "," + Convert.ToInt32(drpstate.SelectedIndex.ToString()) + "," + Convert.ToInt32(drpcity.SelectedIndex.ToString()) + ")";

            //SqlCommand cmd = new SqlCommand(query, conn);
            //cmd.Parameters.AddWithValue("",);
            string strname = "~/Upload/" + FileUpload1.PostedFile.FileName;
            FileUpload1.SaveAs(Server.MapPath(strname));
            cmd.Parameters.AddWithValue("@fname", txtfname.Text);
            cmd.Parameters.AddWithValue("@mname", txtmname.Text);
            cmd.Parameters.AddWithValue("@lname", txtlname.Text);
            cmd.Parameters.AddWithValue("@dob", txtdob.Text);
            cmd.Parameters.AddWithValue("@phone", Convert.ToInt32(txtphone.Text));
            cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cmd.Parameters.AddWithValue("@image", strname);
            cmd.Parameters.AddWithValue("@gender", dpgender.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@licence", txtlicense.Text);
            cmd.Parameters.AddWithValue("@company", drpcompany.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@speciality", drpspeciality.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@username", txtusername.Text);
            cmd.Parameters.AddWithValue("@password", txtpswd.Text);
            cmd.Parameters.AddWithValue("@address", txtadd.Text);
            cmd.Parameters.AddWithValue("@country", Convert.ToInt32(drpcountry.SelectedItem.Value));
            cmd.Parameters.AddWithValue("@state", Convert.ToInt32(drpstate.SelectedItem.Value));
            cmd.Parameters.AddWithValue("@city", Convert.ToInt32(drpcity.SelectedItem.Value));
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("login.aspx");

            //string a = cmd.ExecuteNonQuery().ToString();

            //Response.Write(a);

            //conn.Close();
            //Response.Redirect("login.aspx");
        }
        protected void previousbutton2_Click(object sender, EventArgs e)
        {
            multiview.ActiveViewIndex = 1;
        }
    }
}