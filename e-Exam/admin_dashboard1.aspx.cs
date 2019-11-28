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
                panel1.Visible = false;
                Label7.Visible = false;
                Label8.Visible = false;
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
                SqlCommand cmd = new SqlCommand("select * from Department order by dept_name", con);
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList1.DataSource = dt;
                DropDownList1.DataTextField = "dept_name";
                DropDownList1.DataValueField = "dept_id";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("--Select--", "none"));
                DropDownList1.Items.Add(new ListItem("Other", "-1"));
            }
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue != null)
            {
                string s = DropDownList1.SelectedItem.Text;
                if (s == "Other")
                    panel1.Visible = true;
                else
                    panel1.Visible = false;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Label8.Text = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            panel1.Visible = false;
            panel2.Visible = false;
            TextBox4.Visible = false;
            Button2.Visible = false;
            TextBox6.Visible = false;
            Label2.Visible = false;
            Label7.Visible = false;
            Label8.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            panel2.Visible = true;
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
                string msg = "your OTP for email verification is :" + otp;
                bool f = SendOTP("help.eexam@gmail.com", TextBox2.Text.Trim(), "Verify your mail", msg);
                if (f)
                {
                    Label2.ForeColor = System.Drawing.Color.Green;
                    Label2.Text = "OTP sent";
                    Label2.Visible = true;
                }
                else
                {
                    Label2.ForeColor = System.Drawing.Color.Red;
                    Label2.Text = "OTP not sent";
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
                Label7.ForeColor = System.Drawing.Color.Green;
                Label7.Text = "authentication successful";
                //Response.Write("authentication successful");
                /////authorized person  
            }
            else
            {
                autho = false;
                Label7.Visible = true;
                Label7.ForeColor = System.Drawing.Color.Red;
                Label7.Text = "authentication failed";
                //// user entered wrong otp  
                //Response.Write("authentication failed");
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (autho == true)
            {
                int id = -1;
                string department;
                string name = TextBox1.Text.Trim();
                if (DropDownList1.SelectedItem.Text != "Other")
                {
                    department = DropDownList1.Text;
                    id = Int16.Parse(DropDownList1.SelectedItem.Value);
                }
                    
                else
                {
                    department = TextBox6.Text.Trim();
                    id = add_department(department);
                    id++;
                }
                string email = TextBox2.Text.Trim();
                string mobilno = TextBox3.Text.Trim();
                string password = TextBox5.Text.Trim();
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
                SqlCommand cmd = new SqlCommand("insert into teacher_info(name,department,email_id,[mobile no],password,dept_id) values('" + name + "','" + department + "','" + email + "','" + mobilno + "','" + password + "','" + id + "')", con);
                cmd.CommandType = CommandType.Text;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Label8.ForeColor = System.Drawing.Color.Green;
                Label8.Text = "Record saved successfully";
                Label8.Visible = true;

                Label2.Text = "";
                Label7.Text = "";
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox6.Text = "";
                panel1.Visible = false;
                panel2.Visible = false;
            }
            else
            {
                Response.Write("Email verification required");
            }
        }
        protected int add_department(String name)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            SqlCommand cmd = new SqlCommand("add_department", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.Add("@id", SqlDbType.TinyInt);
            cmd.Parameters["@id"].Direction = ParameterDirection.Output;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            int id = Int16.Parse(cmd.Parameters["@id"].Value.ToString());
            return id;
        }

    }
}