using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace e_Exam
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        static Boolean is_student = true;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
          
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            SqlCommand cmd;

            //student login
            if (is_student)
            {

                 cmd = new SqlCommand("user_verify", con);
                 cmd.CommandType = CommandType.StoredProcedure;
                 cmd.Parameters.Add(new SqlParameter("@uname", u_input.Text));
                 cmd.Parameters.Add(new SqlParameter("@pass", p_input.Text));
                 da.SelectCommand = cmd;
                 da.Fill(dt);

                 if(dt.Rows.Count > 0)
                 {
                     cmd.CommandText = "select id from Student_info where email ='" + u_input.Text + "'";
                     cmd.CommandType = CommandType.Text;
                     Session["studentID"] = dt.Rows[0][0].ToString();
                     da.SelectCommand = cmd;
                     DataTable dt1 = new DataTable();
                     da.Fill(dt1);
                     Session["student"] = dt1.Rows[0][0].ToString();
                     Server.Transfer("~/student/student_dashboard.aspx");
                 }
                 else
                 {
                     valid.Text = "Invalid Username or Password";
                 }
            }
            //teacher login
            else
            {
                
                 cmd = new SqlCommand("teacher_login", con);
                 cmd.CommandType = CommandType.StoredProcedure;
                 cmd.Parameters.Add(new SqlParameter("@uname", u_input.Text));
                 cmd.Parameters.Add(new SqlParameter("@pass", p_input.Text));
                 da.SelectCommand = cmd;
                 da.Fill(dt);

                 if(dt.Rows.Count > 0)
                 {
                     Session["teacherID"] = dt.Rows[0][0].ToString();
                    Server.Transfer("~/teacher/teacher_dashboard.aspx");
                 }
                 else
                 {
                     valid.Text = "Invalid Username or Password";
                 }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            student_tab.CssClass = "btn btn-light";
            student_tab.BackColor = System.Drawing.ColorTranslator.FromHtml("#C3C3C3");
            teacher_tab.BackColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            teacher_tab.CssClass = "btn btn-dark";
            student_tab.Font.Underline = true;
            teacher_tab.Font.Underline = false;
            is_student = true;
        }

        protected void teacher_tab_Click(object sender, EventArgs e)
        {
            student_tab.CssClass = "btn btn-dark";
            teacher_tab.CssClass = "btn btn-light";
            teacher_tab.BackColor = System.Drawing.ColorTranslator.FromHtml("#C3C3C3");
            student_tab.BackColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            student_tab.Font.Underline = false;
            teacher_tab.Font.Underline = true;
            is_student = false;
        }
    }
}