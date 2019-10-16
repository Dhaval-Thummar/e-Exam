
using System;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;

namespace e_Exam
{
    public partial class admin_login : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //valid.Text = "";
            }
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            SqlCommand cmd = new SqlCommand("admin_login", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@uname", user_textbox.Text));
            cmd.Parameters.Add(new SqlParameter("@upass", password_textbox.Text));
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                valid1.Text = dt.Rows[0][0].ToString();
                Session["admin_id"] = user_textbox.Text.Trim();
                Server.Transfer("~/admin_home.aspx");
            }
            else
            {
                valid1.Text = "Invaid Username or Password";
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Forgot_Password.aspx?admin=1");
            /*  SqlConnection con = new SqlConnection();
              con.ConnectionString = ConfigurationManager.ConnectionStrings["examDB"].ConnectionString;
              SqlCommand cmd = new SqlCommand("select id from admin_info", con);
              cmd.CommandType = CommandType.Text;
              // SqlDataAdapter da = new SqlDataAdapter();
              //da.SelectCommand = cmd;
              con.Open();
              string email = cmd.ExecuteScalar().ToString();
              con.Close();
              cmd = new SqlCommand("select password from admin_info", con);
              con.Open();
              string password = cmd.ExecuteScalar().ToString();
              con.Close();
              string msg = "your id is:" + email + "\npassword is:" + password;
              bool f = SendOTP("help.eexam@gmail.com", email.Trim(), "password and id", msg);
              if (f)
              {
                  Label2.Text = "passwor and id is sent on mail id";
                  Label2.Visible = true;
              }
              else
              {
                  Label2.Text = "retry";
                  Label2.Visible = false;

          }
          */
        }
        public bool SendOTP(string from, string to, string subject, string body)
        {
            bool f = false;
            try
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(to);
                mailMessage.From = new MailAddress(from);
                mailMessage.Subject = subject;
                mailMessage.Body = body;
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com");
                NetworkCredential ntwd = new NetworkCredential();
                ntwd.UserName = from;
                ntwd.Password = "exam@123";
                smtpClient.UseDefaultCredentials = true;
                smtpClient.Credentials = ntwd;
                smtpClient.Port = 587;
                smtpClient.EnableSsl = true;
                smtpClient.Send(mailMessage);
                f = true;
            }
            catch (Exception ex)
            {
                f = false;
            }
            return f;
        }
    }
}
