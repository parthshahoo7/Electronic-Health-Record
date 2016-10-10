using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.IO;
namespace Electronic_Health_Record.admin
{
    public partial class managecity : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        SqlCommand cmd;
        SqlDataAdapter da;
        SqlDataReader dr;

        public void bindListView()
        {
            con.Close();
            string query = "SELECT city_table.city_id, city_table.cityname, state_table.statename, country_table.countryname FROM            city_table INNER JOIN state_table ON city_table.state_id = state_table.state_id INNER JOIN                          country_table ON state_table.country_id = country_table.country_id";
            con.Open(); SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            lstSubEvent.DataSource = ds;
            lstSubEvent.DataBind();
        }

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
            if (IsPostBack)
            {
                drpCountry_SelectedIndexChanged1();
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
            cmdselect.CommandText = "dbo.Insert_City";
            cmdselect.Parameters.AddWithValue("@cityname", txtCityname.Text);
            cmdselect.Parameters.AddWithValue("@stateid", Convert.ToInt32(drpState.SelectedIndex.ToString()));
            string InsertEvent = cmdselect.ExecuteNonQuery().ToString();

            if (InsertEvent == "1")
            {
                bindListView();
                lblMsg.Visible = true;
                lblMsg.Text = "City Inserted Successfully...!";
                ClearAll();
            }
            else
            {
                bindListView();
                lblMsg.Text = "Unable Inserted City...!";
            }
            con.Close();
        }

        public void ClearAll()
        {
            txtCityname.Text = "";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtCityname.Text = "";
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
            string city_id = (lstSubEvent.Items[e.ItemIndex].FindControl("lblCityID") as Label).Text;
            string CityName = (lstSubEvent.Items[e.ItemIndex].FindControl("txtCityName") as TextBox).Text;
            string StateId = (lstSubEvent.Items[e.ItemIndex].FindControl("drpState") as DropDownList).SelectedItem.Value;
            con.Open();
            SqlCommand cmdselect = new SqlCommand();
            cmdselect.CommandTimeout = 0;
            cmdselect.CommandType = CommandType.StoredProcedure;
            cmdselect.Connection = con;
            cmdselect.CommandText = "dbo.Update_City";
            cmdselect.Parameters.AddWithValue("@cityid", Convert.ToInt32(city_id));
            cmdselect.Parameters.AddWithValue("@stateid", Convert.ToInt32(StateId));
            cmdselect.Parameters.AddWithValue("@cityname", CityName);
            string UpdateEvent = cmdselect.ExecuteNonQuery().ToString();

            if (UpdateEvent == "1")
            {
                lblMsg.Text = "Update Successfully...!";
                lstSubEvent.EditIndex = -1;
                bindListView();
            }
            else
            {
                lblMsg.Text = "Unable Update City...!";
                lstSubEvent.EditIndex = -1;
                bindListView();
            }
            con.Close();

        }

        protected void OnItemDeleting(object source, ListViewDeleteEventArgs e)
        {
            int cityid = Convert.ToInt32((lstSubEvent.Items[e.ItemIndex].FindControl("lblCityID") as Label).Text);

            con.Open();
            SqlCommand cmdselect = new SqlCommand();
            cmdselect.CommandTimeout = 0;
            cmdselect.CommandType = CommandType.StoredProcedure;
            cmdselect.Connection = con;
            cmdselect.CommandText = "dbo.Delete_City";
            cmdselect.Parameters.AddWithValue("@cityid", cityid);
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

        protected void drpCountry_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            con.Close();
            string query = "Select * from state_table where country_id = "+Convert.ToInt32(drpCountry.SelectedIndex.ToString())+"";
            con.Open();
            DataTable EventDataTable = new DataTable();
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            drpState.DataSource = ds;
            drpState.DataTextField = "statename";
            drpState.DataValueField = "state_id";
            drpState.DataBind();
            drpState.Items.Insert(0, new ListItem("Select State", "0"));
        }

        //protected void drpCountry_SelectedIndexChanged1(object sender, System.EventArgs e)
        protected void drpCountry_SelectedIndexChanged1()
        {
            con.Close();
            string query = "Select * from state_table where country_id = " + Convert.ToInt32(drpCountry.SelectedIndex.ToString()) + "";
            con.Open();
            DataTable EventDataTable = new DataTable();
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            drpState.DataSource = ds;
            drpState.DataTextField = "statename";
            drpState.DataValueField = "state_id";
            drpState.DataBind();
            drpState.Items.Insert(0, new ListItem("Select State", "0"));
        }

    }
}