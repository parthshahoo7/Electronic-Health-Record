using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;
using System.Configuration;
using System.Collections.Specialized;
using System.Text;
using System.IO;

namespace Electronic_Health_Record
{
    public partial class update_labtest : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();

        }
        protected void BindData()
        {
            SqlCommand Cmd = new SqlCommand("select * from labtest where lab_id= " + Session["lab_id"], con);

            con.Open();
            SqlDataReader reader = Cmd.ExecuteReader();


            if (reader.HasRows)
            {

                while (reader.Read())
                {
                    txtlabadd.Text = reader["lab_address"].ToString();
                    txtlabdate.Text = reader["test_date"].ToString();
                    txtpname.Text = reader["patient_name"].ToString();
                    txtpatientage.Text = reader["patient_age"].ToString();
                    txtdocname.Text = reader["doc_name"].ToString();
                    txttestname.Text = reader["test_name"].ToString();
                    
                }
            }
            con.Close();
        }
    }
}