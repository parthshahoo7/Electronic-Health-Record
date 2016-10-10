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
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Text;
using System.Data.OleDb;
namespace Electronic_Health_Record
{
    public partial class add_prescription1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        SqlCommand com = new SqlCommand();
        SqlDataAdapter sqlda;
        string p_pid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AddDefaultFirstRecord();
            }
        }
        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> GetUsers(string prefixText)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from patient_signup_table where fname like @Name+'%' OR mname like @Name+ '%' OR lname like @Name+ '%'", con);
            cmd.Parameters.AddWithValue("@Name", prefixText);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            List<string> CountryNames = new List<string>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {

                //CountryNames.Add(dt.Rows[i][1].ToString());
                string name = null;
                name = dt.Rows[i][1].ToString() + " ";
                name += dt.Rows[i][2].ToString() + " ";
                name += dt.Rows[i][3].ToString() + " ";
                //name += dt.Rows[i][0].ToString();
                CountryNames.Add(name);
            }
            return CountryNames;
        }
        protected void BindPatientId()
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            string[] name = txtprename.Text.Split(' ');
            con.Open();
            SqlCommand cmd = new SqlCommand("select p_id from patient_signup_table WHERE fname='" + name[0] + "' AND mname ='" + name[1] + "' AND lname='" + name[2] + "' ", con);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            lblpid.Text = ds.Tables[0].Rows[0]["p_id"].ToString();

            con.Close();
        }

        protected void txtprename_TextChanged(object sender, EventArgs e)
        {
            BindPatientId();
        }
        private void AddDefaultFirstRecord()
        {
            //creating dataTable 
            DataTable dt = new DataTable();
            DataRow dr;
            dt.TableName = "prescriptionMaster";

            dt.Columns.Add(new DataColumn("MediName", typeof(string)));
            dt.Columns.Add(new DataColumn("Time", typeof(string)));
            dt.Columns.Add(new DataColumn("Schedule", typeof(string)));
            dt.Columns.Add(new DataColumn("Advice", typeof(string)));
            //dt.Columns.Add(new DataColumn("p_pid", typeof(string)));
            dr = dt.NewRow();
            dt.Rows.Add(dr);
            //saving databale into viewstate 
            ViewState["prescriptionMaster"] = dt;
            //bind Gridview
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        private void AddNewRecordRowToGrid()
        {
            // check view state is not null
            if (ViewState["prescriptionMaster"] != null)
            {
                //get datatable from view state 
                DataTable dtCurrentTable = (DataTable)ViewState["prescriptionMaster"];
                DataRow drCurrentRow = null;

                if (dtCurrentTable.Rows.Count > 0)
                {

                    for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                    {
                        string val = "";
                        foreach (ListItem item in CheckBoxList1.Items)
                        {
                            if (item.Selected)
                                val += item.Text + ", ";
                        }
                        //add each row into data table
                        drCurrentRow = dtCurrentTable.NewRow();
                        drCurrentRow["MediName"] = TextBox1.Text;
                        drCurrentRow["Time"] = val;
                        drCurrentRow["Schedule"] = RadioButtonList1.SelectedValue.ToString();
                        drCurrentRow["Advice"] = TextBox4.Text;
                        //drCurrentRow["p_pid"] = p_pid;


                    }
                    //Remove initial blank row
                    if (dtCurrentTable.Rows[0][0].ToString() == "")
                    {
                        dtCurrentTable.Rows[0].Delete();
                        dtCurrentTable.AcceptChanges();

                    }

                    //add created Rows into dataTable
                    dtCurrentTable.Rows.Add(drCurrentRow);
                    //Save Data table into view state after creating each row
                    ViewState["prescriptionMaster"] = dtCurrentTable;
                    //Bind Gridview with latest Row
                    GridView1.DataSource = dtCurrentTable;
                    GridView1.DataBind();
                }
            }
        }



        protected void AddMedicine_Click1(object sender, EventArgs e)
        {
            AddNewRecordRowToGrid();
        }
        private void BulkInsertToDataBase()
        {
            //try
            //{
            //    con.Open();
            //    string query = "SELECT p_pid from prescription_master where p_pid =(SELECT  MAX(p_pid) FROM prescription_master)";
            //    SqlCommand cmd = new SqlCommand(query, con);

            //    p_pid = cmd.ExecuteScalar().ToString();
            //}
            //catch (Exception)
            //{
            //    con.Close();
            //}
            con.Open();
            DataTable dtCurrentTable = (DataTable)ViewState["prescriptionMaster"];
            //con.Open();
            //creating object of SqlBulkCopy  
            SqlBulkCopy objbulk = new SqlBulkCopy(con);
            SqlCommand command = new SqlCommand("SELECT p_pid from prescription_master where p_pid =(SELECT  MAX(p_pid) FROM prescription_master)", con);
            // p_pid = command.ExecuteScalar().ToString();
            //DataTable dtCurrentTable = (DataTable)ViewState["prescriptionMaster"];
            dtCurrentTable.Columns.Add("p_pid", typeof(string));
            string p_id = command.ExecuteScalar().ToString();
            foreach (DataRow row in dtCurrentTable.Rows)
            {
                row["p_pid"] = p_id;
            }
            //assigning Destination table name  
            objbulk.DestinationTableName = "prescription_sub";
            //Mapping Table column
            objbulk.ColumnMappings.Add("p_pid", "p_id");
            objbulk.ColumnMappings.Add("MediName", "medicine_name");
            objbulk.ColumnMappings.Add("Time", "schedule");
            objbulk.ColumnMappings.Add("Schedule", "meal_schedule");
            objbulk.ColumnMappings.Add("Advice", "unit");
            // objbulk.ColumnMappings.Add("p_id", "");
            //inserting bulk Records into DataBase   
            objbulk.WriteToServer(dtCurrentTable);

        }
        private void InsertMasterTabelData()
        {
            //con.Open();
            string query = "insert into prescription_master (p_id,pre_date,patient_name,age,doctor_name)Values('" + lblpid.Text + "','" + txtpredate.Text + "','" + txtprename.Text + "','" + txtpreage.Text + "','" + txtmadeby.Text + "')";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void btnprscription_Click(object sender, EventArgs e)
        {
            con.Open();
            InsertMasterTabelData();
            //GetRowData();
            BulkInsertToDataBase();
            con.Close();
        }

    }
}