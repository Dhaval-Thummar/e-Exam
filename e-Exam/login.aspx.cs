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

            SqlCommand cmd = new SqlCommand("user_verify",con);
            //cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@uname", u_input.Text));
            cmd.Parameters.Add(new SqlParameter("@pass", p_input.Text));

           
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataTable dt = new DataTable();
            da.Fill(dt);

            if(dt.Rows.Count > 0)
            {
                if(is_student)
                {
                    //Student Login
                }
                else
                {
                    //Teacher Login
                }
               
            }
            else
            {
                valid.Text = "Invalid Username or Password";
            }
            //con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            student_tab.CssClass = "btn btn-light";
            teacher_tab.CssClass = "btn btn-dark";
            student_tab.Font.Underline = true;
            teacher_tab.Font.Underline = false;
            is_student = true;
        }

        protected void teacher_tab_Click(object sender, EventArgs e)
        {
            student_tab.CssClass = "btn btn-dark";
            teacher_tab.CssClass = "btn btn-light";
            student_tab.Font.Underline = false;
            teacher_tab.Font.Underline = true;
            is_student = false;
        }
    }
}