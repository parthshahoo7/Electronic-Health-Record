using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.Data;
using System.IO;

namespace Electronic_Health_Record
{
    public partial class managenews : System.Web.UI.Page
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
        public void ClearAll()
        {
            txtnewsdate.Text = "";
            txtnewsauthor.Text = "";
            txtnewstitle.Text = "";
            txtnewspoint.Text = "";
            txtnewsdescription.Text = "";
            txtnewscatagory.Text = "";

        }

        public void bindDataList()
        {
            con.Close();
            string query = "select * from news";
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            lstEvent.DataSource = ds;
            lstEvent.DataBind();
            con.Close();
        }
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            con.Close();
            con.Open();
            SqlCommand cmdselect = new SqlCommand();
            cmdselect.CommandTimeout = 0;
            cmdselect.CommandType = CommandType.StoredProcedure;
            cmdselect.Connection = con;
            cmdselect.CommandText = "dbo.Insert_News";
            cmdselect.Parameters.AddWithValue("@date", txtnewsdate.Text);
            cmdselect.Parameters.AddWithValue("@author", txtnewsauthor.Text);
            cmdselect.Parameters.AddWithValue("@title", txtnewstitle.Text);
            cmdselect.Parameters.AddWithValue("@point", txtnewspoint.Text);
            cmdselect.Parameters.AddWithValue("@description", txtnewsdescription.Text);
            cmdselect.Parameters.AddWithValue("@catagory", txtnewscatagory.Text);
            string InsertEvent = cmdselect.ExecuteNonQuery().ToString();

            if (InsertEvent == "1")
            {
                bindDataList();
                lblMsg.Visible = true;
                lblMsg.Text = "News Inserted Successfully...!";
                ClearAll();
            }
            else
            {
                bindDataList();
                lblMsg.Text = "Unable Inserted News...!";
            }
            con.Close();
        }

        protected void lstEvent_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            lstEvent.EditIndex = -1;
            bindDataList();
        }

        protected void lstEvent_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            lstEvent.EditIndex = e.NewEditIndex;
            lstEvent.DataBind();
            bindDataList();
        }

        protected void lstEvent_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            int e_id = Convert.ToInt32((lstEvent.Items[e.ItemIndex].FindControl("lblnewsid") as Label).Text);

            con.Open();
            SqlCommand cmdselect = new SqlCommand();
            cmdselect.CommandTimeout = 0;
            cmdselect.CommandType = CommandType.StoredProcedure;
            cmdselect.Connection = con;
            cmdselect.CommandText = "dbo.Delete_news";
            cmdselect.Parameters.AddWithValue("@id", e_id);
            string DeleteEvent = cmdselect.ExecuteNonQuery().ToString();
            if (DeleteEvent == "1")
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
            con.Close();
        }

        protected void lstEvent_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            string e_id = (lstEvent.Items[e.ItemIndex].FindControl("lblnewsid") as Label).Text;
            string date = (lstEvent.Items[e.ItemIndex].FindControl("lblnewsdate") as TextBox).Text;
            string author = (lstEvent.Items[e.ItemIndex].FindControl("lblnewsauthor") as TextBox).Text;
            string title = (lstEvent.Items[e.ItemIndex].FindControl("lblnewstitle") as TextBox).Text;
            string point = (lstEvent.Items[e.ItemIndex].FindControl("lblnewspoint") as TextBox).Text;
            string description = (lstEvent.Items[e.ItemIndex].FindControl("lblnewsdescription") as TextBox).Text;
            string catagory = (lstEvent.Items[e.ItemIndex].FindControl("lblnewscatagory") as TextBox).Text;
            

            con.Open();
            SqlCommand cmdselect = new SqlCommand();
            cmdselect.CommandTimeout = 0;
            cmdselect.CommandType = CommandType.StoredProcedure;
            cmdselect.Connection = con;
            cmdselect.CommandText = "dbo.Update_news";
            cmdselect.Parameters.AddWithValue("@id", e_id);
            cmdselect.Parameters.AddWithValue("@date", date);
            cmdselect.Parameters.AddWithValue("@author", author);
            cmdselect.Parameters.AddWithValue("@title", title);
            cmdselect.Parameters.AddWithValue("@point", point);
            cmdselect.Parameters.AddWithValue("@description", description);
            cmdselect.Parameters.AddWithValue("@catagory", catagory);
            string InsertEvent = cmdselect.ExecuteNonQuery().ToString();

            if (InsertEvent == "1")
            {
                lblMsg.Text = "Update Successfully...!";
                lstEvent.EditIndex = -1;
                bindDataList();
            }
            else
            {
                lblMsg.Text = "Unable Update News...!";
                lstEvent.EditIndex = -1;
                bindDataList();
            }
            con.Close();
        }
    }
}