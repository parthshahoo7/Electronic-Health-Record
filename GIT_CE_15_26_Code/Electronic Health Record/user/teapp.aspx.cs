using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Electronic_Health_Record.user
{
    public partial class teapp : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        SqlDataAdapter da;
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand();
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                bindDataList();
            }
            //string[] filePaths = Directory.GetFiles(Server.MapPath("~/Upload/"));
            //List<ListItem> files = new List<ListItem>();
            //foreach (string filePath in filePaths)
            //{
            //    string fileName = Path.GetFileName(filePath);
            //    files.Add(new ListItem(fileName, "~/Upload/" + fileName));
            //}
            //DataList1.DataSource = files;
            //DataList1.DataBind();


            //dt.rows[0]["imagename"].ToString()
        }

        protected void bindDataList()
        {
            //string p = "select (fname+' '+mname+' '+lname) AS FullName from  doctor_signup_table";
            string q = Session["speciality"].ToString();
            string r = Session["location"].ToString();
            string[] s = Session["searchdoctor"].ToString().Split(' ');
            //string t = "<--Select Speciality-->";
            if (Session["searchdoctor"].ToString() != "" && Session["location"].ToString() != "" && Session["speciality"].ToString() != "<--Select Speciality-->")
            {
                string query = "select imagename from doctor_signup_table inner join state_table on state_table.state_id=doctor_signup_table.state_id inner join city_table on city_table.city_id=doctor_signup_table.city_id inner join country_table on country_table.country_id=doctor_signup_table.country_id where (fname='" + s[0] + "' and mname ='" + s[1] + "' and lname ='" + s[2] + "') or speciality='" + q + "' or state_table.statename='"+r +"' or city_table.cityname='"+r+"'or country_table.countryname='"+r+"'";
                da = new SqlDataAdapter(query, conn);
            }
            else if (Session["searchdoctor"].ToString() != "")
            {
                string query = "select imagename from doctor_signup_table where fname='" + s[0] + "' and mname ='" + s[1] + "' and lname ='" + s[2] + "'";
                da = new SqlDataAdapter(query, conn);
            }
            
            else if (Session["location"].ToString() != "")
            {
                string query = "select imagename from doctor_signup_table inner join state_table on state_table.state_id=doctor_signup_table.state_id inner join city_table on city_table.city_id=doctor_signup_table.city_id inner join country_table on country_table.country_id=doctor_signup_table.country_id where state_table.statename='" + r + "' or city_table.cityname='"+r+"'or country_table.countryname='"+r+"'";
                da = new SqlDataAdapter(query, conn);
            }
            else if (Session["speciality"].ToString() != "<--Select Speciality-->")
            {
                string query = "select imagename from doctor_signup_table where speciality='" + q + "'";
                da = new SqlDataAdapter(query, conn);
            }
        
            dt = new DataTable();
            da.Fill(dt);

            //string url = ResolveUrl(dt.Rows[0]["imagename"].ToString());

            Session["image"] = dt.Rows[0]["imagename"].ToString();
            DataList1.DataSource = dt;
            DataList1.DataBind();
            //Session["image"]=dt.Columns["imagename"].ToString();
            //DataList1.DataSource = dt;
            ////DataList1.DataBind();
            //return dt;
           


        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}