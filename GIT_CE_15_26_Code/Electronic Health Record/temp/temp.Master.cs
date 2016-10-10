using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data;
using System.Configuration;
using System.Drawing;

namespace Electronic_Health_Record.temp
{
    public partial class temp : System.Web.UI.MasterPage
    {
        Class1 c = new Class1();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        SqlDataAdapter da = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}