using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Xml;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace Electronic_Health_Record.user
{
    public partial class news : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //GetRSS();
            if (!IsPostBack)
            {
                BindRepeaterData();
            }


        }

        protected void BindRepeaterData()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from news Order By date desc", con);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            da.Fill(ds);
            datalist1.DataSource = ds.Tables[0];
            datalist1.DataBind();
            datalist2.DataSource = ds.Tables[0];
            datalist2.DataBind();
            con.Close();
        }



        protected void btnreadmore_Click(object sender, EventArgs e)
        {

        }

        protected void btnnewssearch_Click(object sender, EventArgs e)
        {
            Bindsearchdata();

        }
        protected void Bindsearchdata()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from news WHERE news_catagory like'%' +@catagory+ '%'", con);
            cmd.Parameters.Add("@catagory", SqlDbType.VarChar).Value = txtsearch.Text;
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            da.Fill(ds);
            datalist1.DataSource = ds.Tables[0];
            datalist1.DataBind();

            con.Close();
        }

        protected void datalist1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "SwitchViewByID")
            {
                Response.Redirect("news_deail.aspx?n_id=" + e.CommandArgument);
            }
        }
    }
}