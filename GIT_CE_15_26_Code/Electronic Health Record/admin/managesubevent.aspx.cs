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
    public partial class managesubevent : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        SqlCommand cmd;
        SqlDataAdapter da;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblInsert.Visible = false;
            lblMsg.Visible = false;
            if (!IsPostBack)
            {
                bindListView();
                bindDropDownList();
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {


            if (FUImageInsert.HasFile)
            {
                
                //Default Date
                string CreateDate = DateTime.Now.ToString("dd/MM/yyyy");

                //Image will store in database with perticular following format
                string EventImage = "SE_" + DateTime.Now.ToString("ddMMyy") + Path.GetFileName(FUImageInsert.PostedFile.FileName);
                GenerateThumbnailSingleFile(FUImageInsert);
                con.Close();
                con.Open();
                SqlCommand cmdselect = new SqlCommand();
                cmdselect.CommandTimeout = 0;
                cmdselect.CommandType = CommandType.StoredProcedure;
                cmdselect.Connection = con;
                cmdselect.CommandText = "dbo.Insert_SubEvent";
                cmdselect.Parameters.AddWithValue("@evtid", Convert.ToInt32(drpEvent.SelectedIndex.ToString()));
                cmdselect.Parameters.AddWithValue("@evtimage", EventImage);
                cmdselect.Parameters.AddWithValue("@desc", txtEventDesc.Text);
                string InsertEvent = cmdselect.ExecuteNonQuery().ToString();

                if (InsertEvent == "1")
                {
                    bindListView();
                    lblMsg.Visible = true;
                    lblMsg.Text = "Album Image Inserted Successfully...!";
                    ClearAll();
                }
                else
                {
                    bindListView();
                    lblMsg.Text = "Unable Inserted Album Image...!";
                }
                con.Close();
            }

        }
        public void ClearAll()
        {
            txtEventDesc.Text = "";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtEventDesc.Text = "";
        }

        protected void OnItemEditing(object sender, ListViewEditEventArgs e)
        {
            con.Close();
            lstSubEvent.EditIndex = e.NewEditIndex;
            lstSubEvent.DataBind();
            bindListView();
            con.Close();
            DropDownList drpEvent = (lstSubEvent.Items[e.NewEditIndex].FindControl("drpEvent") as DropDownList);
            cmd = new SqlCommand("Select * from event_master");
            cmd.Connection = con;
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            drpEvent.DataSource = ds;
            drpEvent.DataTextField = "evt_name";
            drpEvent.DataValueField = "evt_id";
            drpEvent.DataBind();
        }

        protected void OnItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            string se_id = (lstSubEvent.Items[e.ItemIndex].FindControl("lblSubEventID") as Label).Text;
            string detail = (lstSubEvent.Items[e.ItemIndex].FindControl("txtSubEventDesc") as TextBox).Text;
            string EventId = (lstSubEvent.Items[e.ItemIndex].FindControl("drpEvent") as DropDownList).SelectedItem.Value;
            string Image_Name = (lstSubEvent.Items[e.ItemIndex].FindControl("image_name") as Label).Text;
            string EventImage = null;
            if (FUImageInsert.HasFile)
            {
                System.IO.File.Delete(Request.PhysicalApplicationPath + "gimage/" + Image_Name);
                EventImage = "SE_" + DateTime.Now.ToString("ddMMyy") + Path.GetFileName(FUImageInsert.PostedFile.FileName);
                GenerateThumbnailSingleFile(FUImageInsert);
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
            cmdselect.CommandText = "dbo.Update_SubEvent";
            cmdselect.Parameters.AddWithValue("@desc", detail);
            cmdselect.Parameters.AddWithValue("@image", EventImage);
            cmdselect.Parameters.AddWithValue("@evtid", Convert.ToInt32(drpEvent.SelectedIndex.ToString()));
            cmdselect.Parameters.AddWithValue("@subevtid", Convert.ToInt32(se_id));
            string InsertEvent = cmdselect.ExecuteNonQuery().ToString();

            if (InsertEvent == "1")
            {
                lblMsg.Text = "Update Successfully...!";
                lstSubEvent.EditIndex = -1;
                bindListView();
            }
            else
            {
                lblMsg.Text = "Unable Update Event...!";
                lstSubEvent.EditIndex = -1;
                bindListView();
            }


        }

        protected void OnItemDeleting(object source, ListViewDeleteEventArgs e)
        {
            int se_id = Convert.ToInt32((lstSubEvent.Items[e.ItemIndex].FindControl("lblSubEventID") as Label).Text);

            con.Close();
            con.Open();
            SqlCommand cmdselect = new SqlCommand();
            cmdselect.CommandTimeout = 0;
            cmdselect.CommandType = CommandType.StoredProcedure;
            cmdselect.Connection = con;
            cmdselect.CommandText = "dbo.Delete_SubEvent";
            cmdselect.Parameters.AddWithValue("@sevtid", se_id);
            string InsertEvent = cmdselect.ExecuteNonQuery().ToString();

            if (InsertEvent == "1")
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Delete Successfully.!";
                bindListView();
            }
            else
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Unable to Delete.!";
                bindListView();
            }
        }

        protected void OnItemCanceling(object source, ListViewCancelEventArgs e)
        {
            lstSubEvent.EditIndex = -1;
            bindListView();
        }
        public void bindListView()
        {
            con.Close();
            string query = "SELECT sub_event_master.sub_evt_id, event_master.evt_name, sub_event_master.image, sub_event_master.description FROM sub_event_master INNER JOIN event_master ON sub_event_master.evt_id = event_master.evt_id";
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            lstSubEvent.DataSource = ds;
            lstSubEvent.DataBind();
        }

        /// <summary>
        /// Bind DropDoen List
        /// </summary>
        public void bindDropDownList()
        {
            con.Close();
            string query = "Select * from event_master";
            con.Open();
            DataTable EventDataTable = new DataTable();
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            drpEvent.DataSource = ds;
            drpEvent.DataTextField = "evt_name";
            drpEvent.DataValueField = "evt_id";
            drpEvent.DataBind();
            drpEvent.Items.Insert(0, new ListItem("Select Event", "0"));
        }

        private void GenerateThumbnailSingleFile(FileUpload FUImage)
        {
            string filename ="SE_" + DateTime.Now.ToString("ddMMyy") + Path.GetFileName(FUImage.PostedFile.FileName);
            string directory = Server.MapPath(@"~\gallery\");
            // Create a bitmap of the content of the fileUpload control in memory
            Bitmap originalBMP = new Bitmap(FUImage.FileContent);
            originalBMP.Save(directory + filename);
            originalBMP.Dispose();
        }
    }
}