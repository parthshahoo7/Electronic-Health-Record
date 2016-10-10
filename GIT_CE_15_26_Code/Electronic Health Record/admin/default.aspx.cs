using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Electronic_Health_Record.admin
{
    public partial class _default : System.Web.UI.Page
    {
        
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtlogin_Click(object sender, EventArgs e)
        {
            if (txtusername.Text.Trim() != "" && txtpassword.Text.Trim() != "")
            {
                string UserName = txtusername.Text.Trim();
                string Password = txtpassword.Text.Trim();
                SqlCommand cmdselect = new SqlCommand();
                cmdselect.CommandTimeout = 0;
                cmdselect.CommandType = CommandType.StoredProcedure;
                cmdselect.Connection = con;
                cmdselect.CommandText = "dbo.ValidateAdmin";
                SqlParameter username = new SqlParameter("@username", SqlDbType.VarChar, 50);
                username.Value = UserName;
                cmdselect.Parameters.Add(username);
                SqlParameter password = new SqlParameter("@password", SqlDbType.VarChar, 50);
                password.Value = Password;
                cmdselect.Parameters.Add(password);
                cmdselect.Parameters.Add("@Results", SqlDbType.Int, 4);
                cmdselect.Parameters["@Results"].Direction = ParameterDirection.Output;
                int AdminID;
                con.Open();
                cmdselect.ExecuteNonQuery();
                AdminID = (int)cmdselect.Parameters["@Results"].Value;

                if (AdminID > 0)
                {
                    Session["AdminID"] = UserName;
                    Response.Redirect("dashboard.aspx");
                }
                else
                {
                    errorBlog.Visible = true;
                }
            }
            else
            {
                Response.Write("<script>alert('Login Name & Password can not be blank.')</script>");
            }
        }
      
    }
}