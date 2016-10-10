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
namespace Electronic_Health_Record.admin
{
    public partial class managecountry : System.Web.UI.Page
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
            txtCountryName.Text = "";
           
        }
       

        public void bindDataList()
        {
            con.Close();
            string query = "select * from country_table";
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
            cmdselect.CommandText = "dbo.Insert_Country";
            cmdselect.Parameters.AddWithValue("@countryname", txtCountryName.Text);
            string InsertEvent = cmdselect.ExecuteNonQuery().ToString();
           
                if (InsertEvent == "1")
                {
                    bindDataList();
                    lblMsg.Visible = true;
                    lblMsg.Text = "Country Inserted Successfully...!";
                    ClearAll();
                }
                else
                {
                    bindDataList();
                    lblMsg.Text = "Unable Inserted Country...!";
                }
                con.Close();
            
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


            string e_id = (lstEvent.Items[e.ItemIndex].FindControl("txtID") as Label).Text;
            string name = (lstEvent.Items[e.ItemIndex].FindControl("txtCountryName") as TextBox).Text;

            con.Open();
            SqlCommand cmdselect = new SqlCommand();
            cmdselect.CommandTimeout = 0;
            cmdselect.CommandType = CommandType.StoredProcedure;
            cmdselect.Connection = con;
            cmdselect.CommandText = "dbo.Update_Country";
            cmdselect.Parameters.AddWithValue("@id", e_id);
            cmdselect.Parameters.AddWithValue("@countryname", name);
            string InsertEvent = cmdselect.ExecuteNonQuery().ToString();

            if (InsertEvent == "1")
            {
                lblMsg.Text = "Update Successfully...!";
                lstEvent.EditIndex = -1;
                bindDataList();
            }
            else
            {
                lblMsg.Text = "Unable Update Country...!";
                lstEvent.EditIndex = -1;
                bindDataList();
            }
            con.Close();
        }

        protected void OnItemDeleting(object source, ListViewDeleteEventArgs e)
        {
            int e_id = Convert.ToInt32((lstEvent.Items[e.ItemIndex].FindControl("txtID") as Label).Text);

            con.Open();
            SqlCommand cmdselect = new SqlCommand();
            cmdselect.CommandTimeout = 0;
            cmdselect.CommandType = CommandType.StoredProcedure;
            cmdselect.Connection = con;
            cmdselect.CommandText = "dbo.Delete_Country";
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

        protected void OnItemCanceling(object source, ListViewCancelEventArgs e)
        {
            lstEvent.EditIndex = -1;
            bindDataList();
        }
    }
}