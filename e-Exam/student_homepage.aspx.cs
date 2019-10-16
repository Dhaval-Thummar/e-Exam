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
    public partial class student_homepage : System.Web.UI.Page
    {
        static int student_id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["studentID"] != null)
            {
                student_id = Convert.ToInt32(Session["studentID"].ToString());
            }
            getgiventest();
            getpendingtest();
        }
        public void getgiventest()
        {
            String s = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select count(test_id) from test_taken where student_id =" + student_id + " and has_taken = 1", con);
                try
                {
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    lbltotaltest.Text = i.ToString();
                }
                catch (Exception ex)
                {

                }
            }
        }
        //method for getting all the question 
        public void getpendingtest()
        {
            String s = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(s))
            {
                SqlCommand cmd = new SqlCommand("select count(test_id) from test_taken where student_id = " + student_id + " and has_taken = 0", con);
                try
                {
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    lbltestpending.Text = i.ToString();
                }
                catch (Exception ex)
                {

                }
            }
        }
    }
}