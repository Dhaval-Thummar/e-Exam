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
    public partial class Forgot_Password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = "";
            string password = "";

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;

            SqlCommand cmd = new SqlCommand("select uname, pswd from Login_info where uname=@email", con);
            cmd.Parameters.AddWithValue("email",email_input.Text);


            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                username = dt.Rows[0][0].ToString();
                password = dt.Rows[0][1].ToString();
                try
                {
                    MailMessage msg = new MailMessage();
                    msg.From = new MailAddress("help.eexam@gmail.com");//Your Email ID  
                    msg.To.Add(email_input.Text);
                    msg.Subject = " Recover your Password";
                    msg.Body = ("Your Username is: " + username + "<br/><br/>" + "Your Password is: " + password);
                    msg.IsBodyHtml = true;

                    SmtpClient smt = new SmtpClient();
                    smt.Host = "smtp.gmail.com";
                    System.Net.NetworkCredential ntwd = new NetworkCredential();
                    ntwd.UserName = "help.eexam@gmail.com"; //Your Email ID  
                    ntwd.Password = "exam@123"; // Your Password  
                    smt.UseDefaultCredentials = true;
                    smt.Credentials = ntwd;
                    smt.Port = 587;
                    smt.EnableSsl = true;
                    smt.Send(msg);
                }
                catch(Exception)
                {
                    Response.Redirect("Erroe 404!");
                }
                Label5.Text = dt.Rows[0][0].ToString();
                Label5.ForeColor = System.Drawing.Color.ForestGreen;
                Label5.Text = "Password sent to your email.";
            }
            else
            {
                Label5.ForeColor = System.Drawing.Color.Red;
                Label5.Text = "No email Found!";
            }

        }
    }
}