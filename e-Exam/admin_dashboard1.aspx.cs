using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Net;
using System.Net.Mail;
namespace e_Exam
{
    public partial class admin_dashboard11 : System.Web.UI.Page
    {
        static bool autho = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Label2.Visible = false;
                TextBox4.Visible = false;
                Button2.Visible = false;
                TextBox6.Visible = false;
                Label7.Visible = false;
                Label8.Visible = false;
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
                SqlCommand cmd = new SqlCommand("select distinct department from teacher_info order by department", con);
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    DropDownList1.DataSource = dt;
                    DropDownList1.DataTextField = "department";
                    DropDownList1.DataBind();
                    DropDownList1.Items.Insert(dt.Rows.Count, new ListItem("other", ""));
                }
            }
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue != null)
            {
                string s = DropDownList1.SelectedItem.Text;
                if (s == "other")
                    TextBox6.Visible = true;
                else
                    TextBox6.Visible = false;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Label8.Text = null;
            TextBox1.Text = null;
            TextBox2.Text = null;
            TextBox3.Text = null;
            TextBox4.Text = null;
            TextBox5.Text = null;
            TextBox6.Text = null;
            TextBox4.Visible = false;
            Button2.Visible = false;
            TextBox6.Visible = false;
            Label2.Visible = false;
            Label7.Visible = false;
            Label8.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TextBox4.Visible = true;
            Button2.Visible = true;
            string email = TextBox2.Text.Trim();
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            SqlCommand cmd;
            cmd = new SqlCommand("auth", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@email", email);
            var returnParam = new SqlParameter
            {
                ParameterName = "@return",
                Direction = ParameterDirection.ReturnValue
            };

            cmd.Parameters.Add(returnParam);
            con.Open();
            cmd.ExecuteNonQuery();

            var ReturnCode = (int)returnParam.Value;
            if (ReturnCode == 1)
            {
                Label2.ForeColor = System.Drawing.Color.Red;
                Label2.Text = "email id is already exist";
                Label2.Visible = true;
            }
            else
            {
                Random rnd = new Random();
                int otp = rnd.Next(1000, 9999);
                ViewState["msgotp"] = otp;
                string msg = "your otp from e-Exam is :" + otp;
                bool f = SendOTP("help.eexam@gmail.com", TextBox2.Text.Trim(), "Subjected to OTP", msg);
                if (f)
                {
                    Label2.Text = "otp is sent";
                    Label2.Visible = true;
                }
                else
                {
                    Label2.Text = "otp not sent";
                    Label2.Visible = false;
                }
            }
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox4.Text == ViewState["msgotp"].ToString())
            {
                autho = true;
                Label7.Visible = true;
                Label7.Text = "authontication successful";
                Response.Write("authontication successful");
                /////authorized person  
            }
            else
            {
                autho = false;
                Label7.Visible = true;
                Label7.Text = "authontication failed";
                //// user entered wrong otp  
                Response.Write("authpntication failed");
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (autho == true)
            {
                string department;
                string name = TextBox1.Text.Trim();
                if (DropDownList1.SelectedItem.Text != "other")
                    department = DropDownList1.SelectedItem.Text;
                else
                    department = TextBox6.Text.Trim();
                string email = TextBox2.Text.Trim();
                string mobilno = TextBox3.Text.Trim();
                string password = TextBox5.Text.Trim();
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
                SqlCommand cmd= new SqlCommand("insert into teacher_info(name,department,email_id,[mobile no],password) values('" + name + "','" + department + "','" + email + "','" + mobilno + "','" + password + "')", con);
                cmd.CommandType = CommandType.Text;
                con.Open();
                cmd.ExecuteReader();
                con.Close();
                Label8.ForeColor = System.Drawing.Color.Green;
                Label8.Text = "your response are successfuly submitted";
                Label8.Visible = true;

            }
            else
            {
                Response.Write("Email verification is required");
            }
        }
       
    }
}