using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electronic_Health_Record.user
{
    public partial class galleryi : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand();
        PagedDataSource pds = new PagedDataSource();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["event_id"] == null || Session["event_id"] == "")
            {
                Response.Redirect("~/user/gallery.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    bindDataList();
                }
            }
        }
        protected void bindDataList()
        {
            string query = "select * from sub_event_master where evt_id=" + Convert.ToInt32(Session["event_id"]) + "";
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
            pds.DataSource = ds.Tables[0].DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 21;
            pds.CurrentPageIndex = CurrentPage;
            lnkbtnNext.Enabled = !pds.IsLastPage;
            lnkbtnPrevious.Enabled = !pds.IsFirstPage;
            DataList1.DataSource = pds;
            DataList1.DataBind();
            doPaging();
            con.Close();
        }
        protected void lnkbtnPrevious_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;
            bindDataList();
        }
        protected void lnkbtnNext_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            bindDataList();
        }
        protected void dlPaging_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("lnkbtnPaging"))
            {
                CurrentPage = Convert.ToInt16(e.CommandArgument.ToString());
                bindDataList();
            }
        }
        protected void dlPaging_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            LinkButton lnkbtnPage = (LinkButton)e.Item.FindControl("lnkbtnPaging");
            if (lnkbtnPage.CommandArgument.ToString() == CurrentPage.ToString())
            {
                lnkbtnPage.Enabled = false;
                lnkbtnPage.Font.Bold = true;
            }
        }

        public int CurrentPage
        {
            get
            {
                if (this.ViewState["CurrentPage"] == null)
                    return 0;
                else
                    return Convert.ToInt16(this.ViewState["CurrentPage"].ToString());
            }
            set
            {
                this.ViewState["CurrentPage"] = value;
            }
        }
        private void doPaging()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("PageIndex");
            dt.Columns.Add("PageText");
            for (int i = 0; i < pds.PageCount; i++)
            {
                DataRow dr = dt.NewRow();
                dr[0] = i;
                dr[1] = i + 1;
                dt.Rows.Add(dr);
            }
            dlPaging.DataSource = dt;
            dlPaging.DataBind();
        }

    }
}