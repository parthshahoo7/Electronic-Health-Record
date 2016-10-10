using System;
using System.Collections.Generic;
using System.IO;
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
using System.Net;
using System.Drawing;
namespace Electronic_Health_Record
{
    public partial class add_labtest : System.Web.UI.Page
    {
        //public object lab_id {get; set;}Property_service ps =new Property_service();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
             //Property_service ps = new Property_service();   
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
            DataTable dt = new DataTable();
            string[] name = txtpname.Text.Split(' ');
            con.Open();
            SqlCommand cmd = new SqlCommand("select p_id from patient_signup_table WHERE fname='" + name[0] + "' AND mname ='" + name[1] + "' AND lname='" + name[2] + "' ", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            lblpid.Text = ds.Tables[0].Rows[0]["p_id"].ToString();

            con.Close();
        }

        protected void addtest_Click(object sender, EventArgs e)
        {

            //{
            //    lblnotification.Visible = true;
            //    string filePath = uploadtest.PostedFile.FileName;          // getting the file path of uploaded file
            //    string filename1 = Path.GetFileName(filePath);               // getting the file name of uploaded file
            //    string ext = Path.GetExtension(filename1);                      // getting the file extension of uploaded file
            //    string type = String.Empty;

            //    if (!uploadtest.HasFile)
            //    {
            //        lblnotification.Text = "Please Select File";                          //if file uploader has no file selected
            //    }
            //    else
            //        if (uploadtest.HasFile)
            //        {
            //            try
            //            {

            //                switch (ext)                                         // this switch code validate the files which allow to upload only PDF  file 
            //                {
            //                    case ".pdf":
            //                        type = "application/pdf";
            //                        break;

            //                }

            //                if (type != String.Empty)
            //                {
            //                    con.Open();
            //                    Stream fs = uploadtest.PostedFile.InputStream;
            //                    BinaryReader br = new BinaryReader(fs);                                 //reads the   binary files
            //                    Byte[] bytes = br.ReadBytes((Int32)fs.Length);                           //counting the file length into bytes
            //                    string query = "insert into labtest (p_id,test_date,lab_address,patient_name,patient_age,test_name,doc_name,name_file,file_type,data)" + " values (@id,@date,@add,@pname,@age,@test,@dname,@Name, @type, @Data)";   //insert query
            //                    SqlCommand cmd = new SqlCommand(query, con);
            //                    cmd.Parameters.Add("@id", SqlDbType.Int).Value = lblpid.Text;
            //                    cmd.Parameters.Add("@date", SqlDbType.VarChar).Value = txtlabdate.Text;
            //                    cmd.Parameters.Add("@add", SqlDbType.VarChar).Value = txtlabadd.Text;
            //                    cmd.Parameters.Add("@pname", SqlDbType.VarChar).Value = txtpname.Text;
            //                    cmd.Parameters.Add("@age", SqlDbType.VarChar).Value = txtpatientage.Text;
            //                    cmd.Parameters.Add("@test", SqlDbType.VarChar).Value = txttestname.Text;
            //                    cmd.Parameters.Add("dname", SqlDbType.VarChar).Value = txtdocname.Text;
            //                    cmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = filename1;
            //                    cmd.Parameters.Add("@type", SqlDbType.VarChar).Value = type;
            //                    cmd.Parameters.Add("@Data", SqlDbType.Binary).Value = bytes;
            //                    Session["bytes"] = bytes;
            //                    cmd.ExecuteNonQuery();
            //                    lblnotification.ForeColor = System.Drawing.Color.Green;
            //                    lblnotification.Text = "Lab Test Uploaded Successfully";
            //                }
            //                else
            //                {
            //                    lblnotification.ForeColor = System.Drawing.Color.Red;
            //                    lblnotification.Text = "Select Only PDF Files  ";                              // if file is other than speified extension 
            //                }
            //            }
            //            catch (Exception ex)
            //            {
            //                lblnotification.Text = "Error: " + ex.Message.ToString();
            //            }
            //        }
            //}

            if (uploadtest.PostedFile != null)
            {
                if (uploadtest.HasFile)
                {
                    string fileExt = System.IO.Path.GetExtension(uploadtest.FileName);
                    string FileName = Path.GetFileName(uploadtest.PostedFile.FileName);
                    try
                    {
                        if (fileExt == ".pdf" || fileExt == ".PDF")
                        {
                            con.Open();
                            string strname = "/user/labtest/" + uploadtest.PostedFile.FileName;
                            uploadtest.SaveAs(Server.MapPath(strname));

                            //Add Entry to DataBase

                            //string strQuery = "insert into tblFiles (FileName, FilePath)" +
                            //    " values(@FileName, @FilePath)";

                            string query = "insert into labtest1 (p_id,test_date,lab_address,patient_name,patient_age,test_name,doc_name,file_name,file_path)" + " values (@id,@date,@add,@pname,@age,@test,@dname,@file, @path)";   //insert query
                            SqlCommand cmd = new SqlCommand(query, con);
                            cmd.Parameters.Add("@id", SqlDbType.Int).Value = lblpid.Text;
                            cmd.Parameters.Add("@date", SqlDbType.VarChar).Value = txtlabdate.Text;
                            cmd.Parameters.Add("@add", SqlDbType.VarChar).Value = txtlabadd.Text;
                            cmd.Parameters.Add("@pname", SqlDbType.VarChar).Value = txtpname.Text;
                            cmd.Parameters.Add("@age", SqlDbType.VarChar).Value = txtpatientage.Text;
                            cmd.Parameters.Add("@test", SqlDbType.VarChar).Value = txttestname.Text;
                            cmd.Parameters.Add("dname", SqlDbType.VarChar).Value = txtdocname.Text;
                            cmd.Parameters.AddWithValue("@file", FileName);
                            cmd.Parameters.AddWithValue("@path", "labtest/" + FileName);
                            cmd.CommandType = CommandType.Text;
                            cmd.Connection = con;
                            cmd.ExecuteNonQuery();
                            lblnotification.Text = "Report inserted Successfully";
                            lblnotification.ForeColor = Color.Green;
                        }
                        else
                        {
                            lblnotification.Text = "Only pdf files are allowed";
                            lblnotification.ForeColor = Color.Red;
                          
                        }
                    }
                   
                    catch (Exception ex)
                        {
                            Response.Write(ex.Message);
                        }
                }


            }
                    
        }

        protected void txtpname_TextChanged(object sender, EventArgs e)
        {
            BindPatientId();
        }
    }
}