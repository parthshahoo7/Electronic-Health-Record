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
    public partial class manageevent : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMsg.Visible = false;
            if (!IsPostBack)
            {
                bindDataList();
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            if (FUImageInsert.HasFile)
            {
                
                //Default Date
                string CreateDate = DateTime.Now.ToString("dd/MM/yyyy");

                //Image will store in database with perticular following format
                string EventImage = img_id.Text + "E_" + DateTime.Now.ToString("ddMMyy") + Path.GetFileName(FUImageInsert.PostedFile.FileName);
                GenerateThumbnails(FUImageInsert);
                con.Close();
                con.Open();
                SqlCommand cmdselect = new SqlCommand();
                cmdselect.CommandTimeout = 0;
                cmdselect.CommandType = CommandType.StoredProcedure;
                cmdselect.Connection = con;
                cmdselect.CommandText = "dbo.Insert_Event";
                cmdselect.Parameters.AddWithValue("@evtname", txtEventName.Text);
                cmdselect.Parameters.AddWithValue("@evtimage", EventImage);
                string InsertEvent = cmdselect.ExecuteNonQuery().ToString();

                if (InsertEvent == "1")
                {
                    bindDataList();
                    lblMsg.Visible = true;
                    lblMsg.Text = "Album Inserted Successfully...!";
                    ClearAll();
                }
                else
                {
                    bindDataList();
                    lblMsg.Text = "Unable Inserted Album...!";
                }
                con.Close();
            }
        }

        protected void OnItemEditing(object sender, ListViewEditEventArgs e)
        {
            lstEvent.EditIndex = e.NewEditIndex;
            lstEvent.DataBind();
            bindDataList();
        }

       

        protected void OnItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            //Find controls of Edit Template


            string evt_id = (lstEvent.Items[e.ItemIndex].FindControl("txtID") as Label).Text;
            string name = (lstEvent.Items[e.ItemIndex].FindControl("txtEventName") as TextBox).Text;
            FileUpload FUImage = (lstEvent.Items[e.ItemIndex].FindControl("FUImage") as FileUpload);

            string Image_Name = (lstEvent.Items[e.ItemIndex].FindControl("image_name") as Label).Text;

            string EventImage = null;

            if (FUImage.HasFile)
            {
                System.IO.File.Delete(Request.PhysicalApplicationPath + "gimage/" + Image_Name);
                EventImage = img_id.Text + "E_" + DateTime.Now.ToString("ddMMyy") +
                             Path.GetFileName(FUImage.PostedFile.FileName);
                GenerateThumbnails(FUImage);
            }
            else
            {
                EventImage = Image_Name;
            }
            con.Close();
            con.Open();
            SqlCommand cmdselect = new SqlCommand();
            cmdselect.CommandTimeout = 0;
            cmdselect.CommandType = CommandType.StoredProcedure;
            cmdselect.Connection = con;
            cmdselect.CommandText = "dbo.Update_Event";
            cmdselect.Parameters.AddWithValue("@evtname", name);
            cmdselect.Parameters.AddWithValue("@evtimage", EventImage);
            cmdselect.Parameters.AddWithValue("@evtid", Convert.ToInt32(evt_id));
            string InsertEvent = cmdselect.ExecuteNonQuery().ToString();

            if (InsertEvent == "1")
            {
                lblMsg.Text = "Update Successfully...!";
                lstEvent.EditIndex = -1;
                bindDataList();
            }
            else
            {
                lblMsg.Text = "Unable Update Album...!";
                lstEvent.EditIndex = -1;
                bindDataList();
            }
            con.Close();
        }

        protected void OnItemDeleting(object source, ListViewDeleteEventArgs e)
        {
            int e_id = Convert.ToInt32((lstEvent.Items[e.ItemIndex].FindControl("txtID") as Label).Text);
            con.Close();
            con.Open();
            SqlCommand cmdselect = new SqlCommand();
            cmdselect.CommandTimeout = 0;
            cmdselect.CommandType = CommandType.StoredProcedure;
            cmdselect.Connection = con;
            cmdselect.CommandText = "dbo.Delete_Event";
            cmdselect.Parameters.AddWithValue("@evtid", e_id);
            string InsertEvent = cmdselect.ExecuteNonQuery().ToString();

            if (InsertEvent == "1")
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Delete Successfully.!";
                bindDataList();
            }
            else
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Unable to Delete.!";
                bindDataList();
            }
        }

        protected void OnItemCanceling(object source, ListViewCancelEventArgs e)
        {
            lstEvent.EditIndex = -1;
            bindDataList();
        }
        public void ClearAll()
        {
            txtEventName.Text = "";
            
        }

        public void bindDataList()
        {
            con.Close();
            string query = "select * from event_master";
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            lstEvent.DataSource = ds;
            lstEvent.DataBind();
        }

        private void GenerateThumbnails(FileUpload FUImage)
        {
            string filename = img_id.Text + "E_" + DateTime.Now.ToString("ddMMyy") + Path.GetFileName(FUImage.PostedFile.FileName);
            string directory = Server.MapPath(@"~\gallery\");
            // Create a bitmap of the content of the fileUpload control in memory
            Bitmap originalBMP = new Bitmap(FUImage.FileContent);
            originalBMP.Save(directory + filename);
            originalBMP.Dispose();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearAll();
            bindDataList();
        }
    }
}