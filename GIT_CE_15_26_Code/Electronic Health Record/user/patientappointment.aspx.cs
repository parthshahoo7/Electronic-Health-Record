using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electronic_Health_Record.user
{
    public partial class patientappointment : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        SqlCommand cmd = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void search_Click(object sender, EventArgs e)
        {
            Session["searchdoctor"] = docname.Text;
            Session["speciality"] = docspeciality.SelectedItem.Value;
            Session["location"] = location.Text;
            Response.Redirect("~/user/doctor_list.aspx");
        }

        
    }
}