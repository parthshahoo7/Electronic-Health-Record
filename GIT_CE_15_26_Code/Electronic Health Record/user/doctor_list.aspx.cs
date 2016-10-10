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
    public partial class doctor_list : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        SqlDataAdapter da;
        SqlDataAdapter da1;
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand();
        DataTable dt;
        //Label label1 = new Label();
        // private Dictionary<string, Control> fDynamicControls = new Dictionary<string, Control>();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                bindDataList();
            }
        }

        protected void bindDataList()
        {
            //string p = "select (fname+' '+mname+' '+lname) AS FullName from  doctor_signup_table";
            string q = Session["speciality"].ToString();
            string r = Session["location"].ToString();
            string[] s = Session["searchdoctor"].ToString().Split(' ');
            //string t = "<--Select Speciality-->";
            dt = new DataTable();
            if (Session["searchdoctor"].ToString() != "" && Session["location"].ToString() != "" && Session["speciality"].ToString() != "<--Select Speciality-->")
            {
                string query = "select imagename,(fname+' '+mname+' '+lname) AS FullName,speciality,degree,phoneno from doctor_signup_table inner join state_table on state_table.state_id=doctor_signup_table.state_id inner join city_table on city_table.city_id=doctor_signup_table.city_id inner join country_table on country_table.country_id=doctor_signup_table.country_id where (fname='" + s[0] + "' and mname ='" + s[1] + "' and lname ='" + s[2] + "') or speciality='" + q + "' or state_table.statename='" + r + "' or city_table.cityname='" + r + "'or country_table.countryname='" + r + "'";
                //label1 = (Label)FindControl("docname");
                // label1.Text = Session["searchdoctor"].ToString();
                da = new SqlDataAdapter(query, conn);
            }
            else if (Session["searchdoctor"].ToString() != "")
            {
                string query = "select imagename,(fname+' '+mname+' '+lname) AS FullName,speciality,degree,phoneno from doctor_signup_table where fname='" + s[0] + "' and mname ='" + s[1] + "' and lname ='" + s[2] + "'";
                //string name = "select (fname+' '+mname+' '+lname) AS FullName from doctor_signup_table where fname='" + s[0] + "' and mname ='" + s[1] + "' and lname ='" + s[2] + "'";
                //da = new SqlDataAdapter(name, conn);
                //da.Fill(dt);
                // fDynamicControls.Add(label1.ID, ); 

                // label1 = (Label)Control.FindControl("docname");
                // label1 = FindControlRecursive(Page, "docname") as Label;
                // if (label1 != null)                  
                //label1.Text = Session["searchdoctor"].ToString();
                da = new SqlDataAdapter(query, conn);
            }

            else if (Session["location"].ToString() != "")
            {
                string query = "select imagename,(fname+' '+mname+' '+lname) AS FullName,speciality,degree,phoneno from doctor_signup_table inner join state_table on state_table.state_id=doctor_signup_table.state_id inner join city_table on city_table.city_id=doctor_signup_table.city_id inner join country_table on country_table.country_id=doctor_signup_table.country_id where state_table.statename='" + r + "' or city_table.cityname='" + r + "'or country_table.countryname='" + r + "'";
                //string name = "SELECT (fname+' '+mname+' '+lname) AS FullName FROM doctor_signup_table inner join state_table on state_table.state_id=doctor_signup_table.state_id inner join city_table on city_table.city_id=doctor_signup_table.city_id inner join country_table on country_table.country_id=doctor_signup_table.country_id where state_table.statename='" + r + "' or city_table.cityname='" + r + "'or country_table.countryname='" + r + "'";

                //da = new SqlDataAdapter(name, conn);
                //da.Fill(dt);
                da = new SqlDataAdapter(query, conn);

            }
            else if (Session["speciality"].ToString() != "<--Select Speciality-->")
            {
                string query = "select imagename,(fname+' '+mname+' '+lname) AS FullName,speciality,degree,phoneno from doctor_signup_table where speciality='" + q + "'";
               // string name = "select (fname+' '+mname+' '+lname) AS FullName FROM doctor_signup_table where speciality='" + q + "'";
                //label1 = (Label)FindControl("docname");
                //label1.Text = name;
                da = new SqlDataAdapter(query, conn);
            }


            da.Fill(dt);

            //string url = ResolveUrl(dt.Rows[0]["imagename"].ToString());

            dt.Rows[0]["FullName"].ToString();
            dt.Rows[0]["speciality"].ToString();
            dt.Rows[0]["degree"].ToString();
            dt.Rows[0]["phoneno"].ToString();
            Session["image"] = dt.Rows[0]["imagename"].ToString();
            DataList1.DataSource = dt;
            DataList1.DataBind();

            //DataList1.DataSource = dt;
            //DataList1.DataBind();
            //Session["image"]=dt.Columns["imagename"].ToString();
            //DataList1.DataSource = dt;
            ////DataList1.DataBind();
            //return dt;



        }
        protected void datalist1_SelectedIndexChanged(object sender, EventArgs e)
        {


        }

        protected void bookappointment_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Doctor/ConfirmAppointment.aspx");
        }
        //private Control FindControlRecursive(Control root, string id)
        //{
        //    if (root.ID == id) return root;
        //    foreach (Control c in root.Controls)
        //    {
        //        Control t = FindControlRecursive(c, id);
        //        if (t != null) return t;
        //    }
        //    return null;
        //}



    }
}