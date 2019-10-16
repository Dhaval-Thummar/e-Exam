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
    public partial class admin_home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            gettotalexam();
            gettotalquestion();
        }
        String s = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
        //method for getting all the exam 
        public void gettotalexam()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select COUNT(student_id) from Student_info", con);
                try
                {
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    lbltotalexam.Text = i.ToString();

                }
                catch (Exception ex)
                {
                }
            }
        }
        //method for getting all the question 
        public void gettotalquestion()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select COUNT(teacher_id) from teacher_info", con);
                try
                {
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    lbltotalquestion.Text = i.ToString();

                }
                catch (Exception ex)
                {
                }
            }
        }
    }
}