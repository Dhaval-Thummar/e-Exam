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
    public partial class teacher_dashboard : System.Web.UI.Page
    {
        static int teacher_id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["teacherID"] != null)
            {
                teacher_id = Convert.ToInt32(Session["teacherID"].ToString());
            }
            else
            {
               // Response.Redirect("~/login.aspx");
            }
            gettotalexam();
            gettotalquestion();
        }

        String s = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
        //method for getting all the exam 
        public void gettotalexam()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select count(test_id) from Test where teacher_id ="+teacher_id, con);
                try
                {
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    lbltotalexam.Text = i.ToString();

                }
                catch (Exception ex)
                {
                    panel_index_warning.Visible = true;
                    lbl_indexwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }
            }
        }
        //method for getting all the question 
        public void gettotalquestion()
        {
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select count(q_id) from Question where test_id in (select test_id from Test where teacher_id =" + teacher_id + ")", con);
                try
                {
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    lbltotalquestion.Text = i.ToString();

                }
                catch (Exception ex)
                {
                    panel_index_warning.Visible = true;
                    lbl_indexwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }
            }
        }
    }
}