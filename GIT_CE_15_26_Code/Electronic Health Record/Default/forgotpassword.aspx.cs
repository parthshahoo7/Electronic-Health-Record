using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.Data;
using System.IO;

namespace Electronic_Health_Record
{
    public partial class forgotpassword : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["EHRConnectionString"].ConnectionString);
        string gownermail, gownerpsd;
        string Email, ConString, ActivationUrl;
        static string seqresetCode = null, user_email = null, username;
        MailMessage message;
        SmtpClient smtp;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usrname"] == null && Session["usrmail"] == null || Session["usrname"] == "" && Session["usrmail"] == "")
            {
                searchuname.Visible = true;
                mailauthen.Visible = false;
            }
            else
            {
                searchuname.Visible = false;
                mailauthen.Visible = true;
            }
        }

        protected void btnforgotpswd_Click(object sender, EventArgs e)
        {
            
            SqlCommand Cmd = new SqlCommand("select email from patient_signup_table where username='"+txtuname.Text+"'", con);
            con.Open();
            SqlDataReader reader = Cmd.ExecuteReader();
            string umail = null;
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    
                    umail = reader["email"].ToString();
                }
            }
            con.Close();
            if (umail != null)
            {
                //lblmsg.Text = umail;
                Session["usrname"] = txtuname.Text;
                Session["usrmail"] = umail;
                getSeqcode();
                SendMail();
                
            }
            else
            {
                lblmsg.Text = "UserName Not Found, please try Again.";
            }
        }

        protected void btnreset_Click(object sender, EventArgs e)
        {
            checkcode();
        }
        protected void SendMail()
        {
            getAccountDetails();
            try
            {
                var fromAddress = gownermail;
                // any address where the email will be sending
                var toAddress = Session["usrmail"].ToString();// this is member email address.
                //Password of your gmail address
                string fromPassword = gownerpsd;
                // Passing the values and make a email formate to display

                string subject = "You requested for new password in EHR!";
                string body = "Hi " + username + "  ,\nYou recently asked to reset your EHR account password. \nyou can enter the following password reset code:\n\n" + Session["seqresetCode"].ToString() + "\n\n\n Thank You.";
                // body += "Question: \n" + Comments.Text + "\n";
                // smtp settings
                var smtp = new System.Net.Mail.SmtpClient();
                {
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                    smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                    smtp.Timeout = 20000;
                }
                // Passing values to smtp object
                smtp.Send(fromAddress, toAddress, subject, body);
                lblreset.Text = "plz check your mail " + Session["usrmail"].ToString() + ".";
            }
            catch (Exception ex)
            {
                lblreset.Text = "Mail Authentication Failed..<br>" + ex.Message;

            }
        }
        protected void getAccountDetails()
        {
            con.Close();
            SqlCommand Cmd = new SqlCommand("select * from GmailAccountDetails where ID=1", con);
            con.Open();
            SqlDataReader reader = Cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    gownermail = reader["Gmail"].ToString();
                    gownerpsd = reader["gpsd"].ToString();
                }
            }
            con.Close();
        }
        private void getSeqcode()
        {
            Random rnd = new Random();
            seqresetCode = rnd.Next(111111, 999999).ToString();
            Session["seqresetCode"] = seqresetCode;
        }
        protected void checkcode()
        {
           
            if (txtseccode.Text == "" || txtseccode.Text == null)
            {
                lblreset.Text = "plz enter code";
            }
            else
            {
                int num1, num2;
                num1 = Convert.ToInt32(txtseccode.Text);
                num2 = Convert.ToInt32(Session["seqresetCode"].ToString());
                if (num1 == num2)
                {
                    //Session.Abandon();
                    Session["usersetID"] = Session["usrmail"].ToString();
                    Response.Redirect("resetpassword.aspx");
                }
                else
                {
                    lblreset.Text = "plz check your code ...!";
                }
            }
        }
        protected void resendmail()
        {
            getSeqcode();
            SendMail();
            lblreset.Text = "Resend Code sent. plz check your mail " + Session["usrmail"].ToString() + ".";
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            resendmail();
        }
       }
   }
