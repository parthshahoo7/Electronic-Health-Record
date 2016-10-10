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
using System.IO;
namespace Electronic_Health_Record
    
{
    public partial class edit_labtest : System.Web.UI.Page
    {


        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BindPatientId()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            string[] name = txtpname.Text.Split(' ');
            con.Open();
            SqlCommand cmd = new SqlCommand("select p_id from patient_signup_table WHERE fname='" + name[0] + "' AND mname ='" + name[1] + "' AND lname='" + name[2] + "' ", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            lblpid.Text = ds.Tables[0].Rows[0]["p_id"].ToString();

            con.Close();
        }

        protected void binddata()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

      

            con.Open();
            //string query = "Select report_date AS Date, p_name AS patient_Name, deaseas_name AS Deaseas_Name from report_table WHERE p_id='" + lblsearch.Text + "'";
            string query = "Select * from labtest1 WHERE p_id='" + lblpid.Text + "'";
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
                lblsearcherror.ForeColor = Color.Red;
                lblsearcherror.Text = "No Data Found...";
                
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
                name += dt.Rows[i][3].ToString();
                PatientName.Add(name);
            }
            return PatientName;
        }

        protected void txtpname_TextChanged(object sender, EventArgs e)
        {
            BindPatientId();
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            binddata();
        }

        protected void gridview1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridview1.EditIndex = e.NewEditIndex;
            Session["lab_id"] = gridview1.DataKeys[e.NewEditIndex].Value;
            Response.Redirect("update_labtest.aspx");
            this.binddata();
        }

        //protected void gridview1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    int labid = Convert.ToInt32(gridview1.DataKeys[e.RowIndex].Values["lab_id"].ToString());
        //    Session["lab_id"] = labid;
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("delete from labtest1 where lab_id=" + Session["lab_id"], con);
        //    int result = cmd.ExecuteNonQuery();
        //    con.Close();
        //    if (result == 1)
        //    {
        //        binddata();
        //        lblsearcherror.ForeColor = Color.Red;
        //        lblsearcherror.Text = "Report Deleted Successfully";
        //    }
        //}

      

        //protected void gridview1_SelectedIndexChanged1(object sender, EventArgs e)
        //{
        //   //<----------------With Binary Data Start--------------> 
        //    //con.Open();
        //    //SqlCommand cmd = new SqlCommand("Select name_file,file_type,data from labtest where lab_id=@lab_id", con);
        //    //int d_id = Convert.ToInt16(2);
        //    //cmd.Parameters.AddWithValue("lab_id", d_id);
        //    //SqlDataReader dr = cmd.ExecuteReader();
        //    //if (dr.Read())
        //    //{
        //    //    //  Response.Clear();
        //    //    Response.Buffer = true;
        //    //    Response.ContentType = dr["file_type"].ToString();


        //    //    int index = Convert.ToInt16(1);
        //    //    GridViewRow row = gridview1.Rows[index];

        //    //    FileUpload fp = (FileUpload)row.FindControl("uploadtest");
        //    //    string file_ext = System.IO.Path.GetExtension(fp.FileName);
        //    //    if (file_ext == ".pdf" || file_ext == ".PDF")
        //    //    {
        //    //        Response.ContentType = "application/pdf";
        //    //        Response.AddHeader("content-disposition", "attachment:filename=" + dr["name_file"].ToString());
        //    //    }
        //    //    //  Response.AddHeader("content-disposition", "attachment:filename=" + dr["name_file"].ToString());
        //    //    Response.Charset = "";
        //    //    Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //    //    Response.BinaryWrite((byte[])dr["data"]);
        //    //    Response.End();
        //    //<----------------With Binary Data End-------------->
            
        //    //<---------------With sucessfull binary data start------->

        //    con.Open();
        //    SqlCommand com =new SqlCommand("select name_file,file_type,data from  labtest where lab_id=@id", con);
        //    com.Parameters.AddWithValue("@id", gridview1.SelectedRow.Cells[1].Text);
        //    SqlDataReader dr = com.ExecuteReader();

 
        //    if (dr.Read())
        //    {
        //        string[] array = Session["bytes"] as string[];
        //        Response.Clear();
        //        Response.Buffer =true;
        //        Response.ContentType = dr["file_type"].ToString();
        //        Response.AddHeader("content-disposition", "attachment;filename=" + dr["name_file"].ToString());     // to open file prompt Box open or Save file         
        //        Response.Charset = "";
        //        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //        Response.BinaryWrite((byte[])dr["data"]);
        //        Response.End();
        //    }
        //    //<---------------With sucessfull binary data End------->
        //    }
        //<------------aspx page download issue----------->
        //protected void gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    Response.Clear();
        //    Response.ContentType = "application/octet-stream";
        //    Response.AppendHeader("Content-Disposition", "file_name=" + e.CommandArgument);
        //    Response.TransmitFile(Server.MapPath("~/labtest/") + e.CommandArgument);
        //    Response.End(); 

            
        //}
        //<------------aspx page download issue End----------->

        protected void lnkDownload_Click(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            Response.ContentType = "application/octet-stream";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));            
            Response.WriteFile(filePath);
            Response.End();
        }
        }

       

        //protected void gridview1_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    if (e.CommandName == "Download")
        //    {

        //        //string v=Session["bytes"].ToString();
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand("Select name_file,file_type,data from labtest where lab_id=@lab_id", con);
        //        int d_id = Convert.ToInt16(e.CommandArgument);
        //        cmd.Parameters.AddWithValue("lab_id", d_id);
        //        SqlDataReader dr = cmd.ExecuteReader();
        //        if (dr.Read())
        //        {
        //          //  Response.Clear();
        //            Response.Buffer = true;
        //            Response.ContentType = dr["file_type"].ToString();


        //            int index=Convert.ToInt16(1);
        //            GridViewRow row=gridview1.Rows[index];

        //            FileUpload fp = (FileUpload)row.FindControl("uploadtest");
        //            string file_ext =System.IO.Path.GetExtension(fp.FileName);
        //            if (file_ext == ".pdf" || file_ext == ".PDF")
        //            {
        //                Response.ContentType = "application/pdf";
        //                Response.AddHeader("content-disposition", "attachment:filename=" + dr["name_file"].ToString());
        //            }
        //          //  Response.AddHeader("content-disposition", "attachment:filename=" + dr["name_file"].ToString());
        //            Response.Charset = "";
        //            Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //            Response.BinaryWrite((byte[])dr["data"]);
        //            Response.End();
        //        }
        //    }
        //}
        }
 