using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Configuration;
namespace Electronic_Health_Record.admin
{
    public partial class managedoctor : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            bindDataList();
        }
        protected void OnItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            string evt_id = (lstProduct.Items[e.ItemIndex].FindControl("lblID") as Label).Text;
            Session["dID"] = evt_id;
            Response.Redirect("updatedoctor.aspx");
        }
        protected void OnItemDeleting(object source, ListViewDeleteEventArgs e)
        {
            int e_id = Convert.ToInt32((lstProduct.Items[e.ItemIndex].FindControl("lblID") as Label).Text);
            con.Close();
            con.Open();
            SqlCommand cmdselect = new SqlCommand();
            cmdselect.CommandTimeout = 0;
            cmdselect.CommandType = CommandType.StoredProcedure;
            cmdselect.Connection = con;
            cmdselect.CommandText = "dbo.Delete_Doctor";
            cmdselect.Parameters.AddWithValue("@pid", e_id);
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
        public void bindDataList()
        {
            con.Close();
            string query = "SELECT d_id, fname, lname, dob, phoneno, email, imagename,licenceno,degree,speciality, username FROM doctor_signup_table";
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            lstProduct.DataSource = ds;
            lstProduct.DataBind();
        }
    }
}