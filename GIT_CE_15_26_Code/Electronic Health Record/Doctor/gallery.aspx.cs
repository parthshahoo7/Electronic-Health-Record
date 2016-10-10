using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electronic_Health_Record.Doctor
{
    public partial class gallery : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindDataList();
            }
        }
        protected void bindDataList()
        {
            string query = "select * from event_master";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
            conn.Close();

        }


        protected void DataList1_EditCommand1(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                Label lbname = (Label)e.Item.FindControl("txtID");
                Session["event_id"] = lbname.Text;
                Response.Redirect("galleryi.aspx");
            }
        }
    }
}