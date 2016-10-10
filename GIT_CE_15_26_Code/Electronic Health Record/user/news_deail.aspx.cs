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
    public partial class news_deail : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRepeaterData();
            }


        }
        protected void BindRepeaterData()
        {
            //Request.QueryString["btnreadmore"];
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from news where n_id=" + Convert.ToInt16(Request.QueryString["n_id"]), con);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            da.Fill(ds);
            datalist1.DataSource = ds.Tables[0];
            datalist1.DataBind();
            //datalist2.DataSource = ds.Tables[0];
            //datalist2.DataBind();
            con.Close();
        }
    }
}