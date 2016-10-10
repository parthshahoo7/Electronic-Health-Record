using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
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
    public partial class managestate : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        SqlCommand cmd;
        SqlDataAdapter da;
        SqlDataReader dr;
       public void bindListView()
        {
            con.Close();
            string query = "SELECT state_table.state_id, country_table.countryname, state_table.statename FROM state_table INNER JOIN country_table ON state_table.country_id = country_table.country_id";
            con.Open(); SqlCommand cmd = new SqlCommand(query, con);
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
            string query = "Select * from country_table";
            con.Open();
            DataTable EventDataTable = new DataTable();
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            drpCountry.DataSource = ds;
            drpCountry.DataTextField = "countryname";
            drpCountry.DataValueField = "country_id";
            drpCountry.DataBind();
            drpCountry.Items.Insert(0, new ListItem("Select Country", "0"));
            
        }

      

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
            con.Close();
            con.Open();
            SqlCommand cmdselect = new SqlCommand();
            cmdselect.CommandTimeout = 0;
            cmdselect.CommandType = CommandType.StoredProcedure;
            cmdselect.Connection = con;
            cmdselect.CommandText = "dbo.Insert_State";
            cmdselect.Parameters.AddWithValue("@statename", txtStatename.Text);
            cmdselect.Parameters.AddWithValue("@countryid", Convert.ToInt32(drpCountry.SelectedIndex.ToString()));
            string InsertEvent = cmdselect.ExecuteNonQuery().ToString();

            if (InsertEvent == "1")
            {
                bindListView();
                lblMsg.Visible = true;
                lblMsg.Text = "State Inserted Successfully...!";
                ClearAll();
            }
            else
            {
                bindListView();
                lblMsg.Text = "Unable Inserted State...!";
            }
            con.Close();
        }
        public void ClearAll()
        {
            txtStatename.Text = "";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtStatename.Text = "";
        }

        protected void OnItemEditing(object sender, ListViewEditEventArgs e)
        {
            con.Close();
            lstSubEvent.EditIndex = e.NewEditIndex;
            lstSubEvent.DataBind();
            bindListView();
            con.Close();
            DropDownList drpCountry = (lstSubEvent.Items[e.NewEditIndex].FindControl("drpCountry") as DropDownList);
            cmd = new SqlCommand("Select * from country_table");
            cmd.Connection = con;
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            drpCountry.DataSource = ds;
            drpCountry.DataTextField = "countryname";
            drpCountry.DataValueField = "country_id";
            drpCountry.DataBind();
            
        }

        protected void OnItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            string state_id = (lstSubEvent.Items[e.ItemIndex].FindControl("lblStateID") as Label).Text;
            string StateName = (lstSubEvent.Items[e.ItemIndex].FindControl("txtStateName") as TextBox).Text;
            string CountryId = (lstSubEvent.Items[e.ItemIndex].FindControl("drpCountry") as DropDownList).SelectedItem.Value;
            con.Open();
            SqlCommand cmdselect = new SqlCommand();
            cmdselect.CommandTimeout = 0;
            cmdselect.CommandType = CommandType.StoredProcedure;
            cmdselect.Connection = con;
            cmdselect.CommandText = "dbo.Update_State";
            cmdselect.Parameters.AddWithValue("@stateid", Convert.ToInt32(state_id));
            cmdselect.Parameters.AddWithValue("@countryid", Convert.ToInt32(CountryId));
            cmdselect.Parameters.AddWithValue("@statename", StateName);
            string UpdateEvent = cmdselect.ExecuteNonQuery().ToString();
            
            if (UpdateEvent == "1")
            {
                lblMsg.Text = "Update Successfully...!";
                lstSubEvent.EditIndex = -1;
                bindListView();
            }
            else
            {
                lblMsg.Text = "Unable Update State...!";
                lstSubEvent.EditIndex = -1;
                bindListView();
            }
            con.Close();

        }
        
        protected void OnItemDeleting(object source, ListViewDeleteEventArgs e)
        {
            int stateid = Convert.ToInt32((lstSubEvent.Items[e.ItemIndex].FindControl("lblStateID") as Label).Text);

            con.Open();
            SqlCommand cmdselect = new SqlCommand();
            cmdselect.CommandTimeout = 0;
            cmdselect.CommandType = CommandType.StoredProcedure;
            cmdselect.Connection = con;
            cmdselect.CommandText = "dbo.Delete_State";
            cmdselect.Parameters.AddWithValue("@stateid", stateid);
            string DeleteEvent = cmdselect.ExecuteNonQuery().ToString();
            if (DeleteEvent == "1")
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

    }
}