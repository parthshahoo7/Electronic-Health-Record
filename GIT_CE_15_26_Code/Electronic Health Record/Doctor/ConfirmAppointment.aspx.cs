using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Electronic_Health_Record.Doctor
{

    public partial class ConfirmAppointment : System.Web.UI.Page
    {
        string time;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        SqlCommand cmd = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            conn.Open();
            string query = "insert into doc_appointment_table values(@d_id,@available_date,@Eight,@Eightthirty,@Nine,@Ninethiry,@Ten,@Tenthirty,@Eleven,@Eleventhirty,@Twelve,@Twelvethirty,@Thirteen,@Thirteenhalf,@Fourteen,@Fourteenhalf,@Fifteen,@Fifteenhalf,@Sixteen,@Sixteenhalf,@Seventeen,@Seventeenhalf,@Eighteen,@Eighteenhalf,@Nineteen,@Nineteenhalf,@Twenty,@Twentyhalf,@8_status,@830_status,@9_status,@930_status,@10_status,@1030_status,@11_status,@1130_status,@12_status,@1230_status,@13_status,@1330_status,@14_status,@1430_status,@15_status,@1530_status,@16_status,@1630_status,@17_status,@1730_status,@18_status,@1830_status,@19_status,@1930_status,@20_status,@2030_status)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@d_id",Convert.ToInt32( Session["doc_id"]));
            cmd.Parameters.AddWithValue("@available_date", Calendar1.SelectedDate);
           // List<ListItem> selected=new List<ListItem>();
            foreach (ListItem li in CheckBoxList1.Items)
            {
                //if (li.Selected)
                //{
                    time += li.Text + " ";
                //}

              
            }
            //for (int i = 0; i < CheckBoxList1.Items.Count; i++)
            //{
            //    if(CheckBoxList1.)
            //}
            string[] new_time = time.Split(' ');
            //for (int i = 0; i < new_time.Length; i++)
            //{
                
            //}
            if (new_time[0] == "8:00-8:30" && CheckBoxList1.Items.FindByText("8:00-8:30").Selected==true)
            {
                cmd.Parameters.AddWithValue("@Eight",1);
                cmd.Parameters.AddWithValue("@8_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Eight", 0);
                cmd.Parameters.AddWithValue("@8_status","Not-Available");                
            }
            if (new_time[1] == "8:30-9:00" && CheckBoxList1.Items.FindByText("8:30-9:00").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Eightthirty", 1);
                cmd.Parameters.AddWithValue("@830_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Eightthirty", 0);
                cmd.Parameters.AddWithValue("@830_status", "Not-Available");
            }
            if (new_time[2] == "9:00-9:30" && CheckBoxList1.Items.FindByText("9:00-9:30").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Nine", 1);
                cmd.Parameters.AddWithValue("@9_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Nine", 0);
                cmd.Parameters.AddWithValue("@9_status", "Not-Available");
            }
            if (new_time[3] == "9:30-10:00" && CheckBoxList1.Items.FindByText("9:30-10:00").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Ninethiry", 1);
                cmd.Parameters.AddWithValue("@930_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Ninethiry", 0);
                cmd.Parameters.AddWithValue("@930_status", "Not-Available");
            }
            if (new_time[4] == "10:00-10:30" && CheckBoxList1.Items.FindByText("10:00-10:30").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Ten",1);
                cmd.Parameters.AddWithValue("@10_status", "free");

            }
            else
            {
                cmd.Parameters.AddWithValue("@Ten", 0);
                cmd.Parameters.AddWithValue("@10_status", "Not-Available");
            }
            if (new_time[5] == "10:30-11:00" && CheckBoxList1.Items.FindByText("10:30-11:00").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Tenthirty",1);
                cmd.Parameters.AddWithValue("@1030_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Tenthirty", 0);
                cmd.Parameters.AddWithValue("@1030_status", "Not-Available");
            }
            if (new_time[6] == "11:00-11:30" && CheckBoxList1.Items.FindByText("11:00-11:30").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Eleven", 1);
                cmd.Parameters.AddWithValue("@11_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Eleven", 0);
                cmd.Parameters.AddWithValue("@11_status", "Not-Available");
            }
            if (new_time[7] == "11:30-12:00" && CheckBoxList1.Items.FindByText("11:30-12:00").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Eleventhirty", 1);
                cmd.Parameters.AddWithValue("@1130_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Eleventhirty", 0);
                cmd.Parameters.AddWithValue("@1130_status", "Not-Available");
            }
            if (new_time[8] == "12:00-12:30" && CheckBoxList1.Items.FindByText("12:00-12:30").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Twelve", 1);
                cmd.Parameters.AddWithValue("@12_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Twelve", 0);
                cmd.Parameters.AddWithValue("@12_status", "Not-Available");
            }
            if (new_time[9] == "12:30-13:00" && CheckBoxList1.Items.FindByText("12:30-13:00").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Twelvethirty", 1);
                cmd.Parameters.AddWithValue("@1230_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Twelvethirty", 0);
                cmd.Parameters.AddWithValue("@1230_status", "Not-Available");
            }
            if (new_time[10] == "13:00-13:30" && CheckBoxList1.Items.FindByText("13:00-13:30").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Thirteen", 1);
                cmd.Parameters.AddWithValue("@13_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Thirteen", 0);
                cmd.Parameters.AddWithValue("@13_status", "Not-Available");
            }
            if (new_time[11] == "13:30-14:00" && CheckBoxList1.Items.FindByText("13:30-14:00").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Thirteenhalf", 1);
                cmd.Parameters.AddWithValue("@1330_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Thirteenhalf", 0);
                cmd.Parameters.AddWithValue("@1330_status", "Not-Available");
            }
            if (new_time[12] == "14:00-14:30" && CheckBoxList1.Items.FindByText("14:00-14:30").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Fourteen", 1);
                cmd.Parameters.AddWithValue("@14_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Fourteen", 0);
                cmd.Parameters.AddWithValue("@14_status", "Not-Available");
            }
            if (new_time[13] == "14:30-15:00" && CheckBoxList1.Items.FindByText("14:30-15:00").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Fourteenhalf", 1);
                cmd.Parameters.AddWithValue("@1430_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Fourteenhalf", 0);
                cmd.Parameters.AddWithValue("@1430_status", "Not-Available");
            }
            if (new_time[14] == "15:00-15:30" && CheckBoxList1.Items.FindByText("15:00-15:30").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Fifteen", 1);
                cmd.Parameters.AddWithValue("@15_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Fifteen", 0);
                cmd.Parameters.AddWithValue("@15_status", "Not-Available");
            }
            if (new_time[15] == "15:30-16:00" && CheckBoxList1.Items.FindByText("15:30-16:00").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Fifteenhalf", 1);
                cmd.Parameters.AddWithValue("@1530_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Fifteenhalf", 0);
                cmd.Parameters.AddWithValue("@1530_status", "Not-Available");
            }
            if (new_time[16] == "16:00-16:30" && CheckBoxList1.Items.FindByText("16:00-16:30").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Sixteen", 1);
                cmd.Parameters.AddWithValue("@16_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Sixteen", 0);
                cmd.Parameters.AddWithValue("@16_status", "Not-Available");
            }
            if (new_time[17] == "16:30-17:00" && CheckBoxList1.Items.FindByText("16:30-17:00").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Sixteenhalf", 1);
                cmd.Parameters.AddWithValue("@1630_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Sixteenhalf", 0);
                cmd.Parameters.AddWithValue("@1630_status", "Not-Available");
            }
            if (new_time[18] == "17:00-17:30" && CheckBoxList1.Items.FindByText("17:00-17:30").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Seventeen", 1);
                cmd.Parameters.AddWithValue("@17_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Seventeen", 0);
                cmd.Parameters.AddWithValue("@17_status", "Not-Available");
            }
            if (new_time[19] == "17:30-18:00" && CheckBoxList1.Items.FindByText("17:30-18:00").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Seventeenhalf", 1);
                cmd.Parameters.AddWithValue("@1730_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Seventeenhalf", 0);
                cmd.Parameters.AddWithValue("@1730_status", "Not-Available");
            }
            if (new_time[20] == "18:00-18:30" && CheckBoxList1.Items.FindByText("18:00-18:30").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Eighteen", 1);
                cmd.Parameters.AddWithValue("@18_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Eighteen", 0);
                cmd.Parameters.AddWithValue("@18_status", "Not-Available");
            }
            if (new_time[21] == "18:30-19:00" && CheckBoxList1.Items.FindByText("18:30-19:00").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Eighteenhalf", 1);
                cmd.Parameters.AddWithValue("@1830_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Eighteenhalf", 0);
                cmd.Parameters.AddWithValue("@1830_status", "Not-Available");
            }
            if (new_time[22] == "19:00-19:30" && CheckBoxList1.Items.FindByText("19:00-19:30").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Nineteen", 1);
                cmd.Parameters.AddWithValue("@19_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Nineteen", 0);
                cmd.Parameters.AddWithValue("@19_status", "Not-Available");
            }
            if (new_time[23] == "19:30-20:00" && CheckBoxList1.Items.FindByText("19:30-20:00").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Nineteenhalf", 1);
                cmd.Parameters.AddWithValue("@1930_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Nineteenhalf", 0);
                cmd.Parameters.AddWithValue("@1930_status", "Not-Available");
            }
            if (new_time[24] == "20:00-20:30" && CheckBoxList1.Items.FindByText("20:00-20:30").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Twenty", 1);
                cmd.Parameters.AddWithValue("@20_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Twenty", 0);
                cmd.Parameters.AddWithValue("@20_status", "Not-Available");
            }
            if (new_time[25] == "20:30-21:00" && CheckBoxList1.Items.FindByText("20:30-21:00").Selected == true)
            {
                cmd.Parameters.AddWithValue("@Twentyhalf", 1);
                cmd.Parameters.AddWithValue("@2030_status", "free");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Twentyhalf", 0);
                cmd.Parameters.AddWithValue("@2030_status", "Not-Available");
            }
            cmd.ExecuteNonQuery();
            conn.Close();
            lblapp_doc.Text = "You Completed Appointment!!";
            lblapp_doc.ForeColor = Color.Green;
            Response.Redirect("ConfirmAppointment.aspx");
           



            //if (CheckBoxList1.SelectedItem.Text == "8:30-9:00")
            //{
            //    cmd.Parameters.AddWithValue("@Eight", true);
            //}
            //}
            // cmd.Parameters.AddWithValue("@Eight",);

        }

       

       
    }
}