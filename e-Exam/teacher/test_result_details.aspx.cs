using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace e_Exam.teacher
{
    public partial class test_result_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["teacherID"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
            if (!IsPostBack)
            {
                Label1.Text = "Test ID : " + Request.QueryString["tid"];
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["examDB"].ConnectionString;
                SqlCommand cmd = new SqlCommand("select subject,total_marks from Test where test_id=" + Request.QueryString["tid"], con);
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                Label2.Text = "Subject : " + dt.Rows[0][0].ToString();
                Label3.Text = "Total Marks : " + dt.Rows[0][1].ToString();
                cmd = new SqlCommand("select AVG(marks),MAX(marks),MIN(marks) from student_result where test_id=" + Request.QueryString["tid"], con);
                da.SelectCommand = cmd;
                dt = new DataTable();
                da.Fill(dt);
                Label4.Text = "Subject : " + dt.Rows[0][0].ToString();
                Label5.Text = "maximum marks:" + dt.Rows[0][1].ToString();
                Label6.Text = "minimum:" + dt.Rows[0][2].ToString();
                cmd = new SqlCommand("select count(*) from test_taken where test_id=" + Request.QueryString["tid"], con);
                da.SelectCommand = cmd;
                dt = new DataTable();
                da.Fill(dt);
                Label7.Text = "No of student was test given:" + dt.Rows[0][0].ToString();


            }
        }

        protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
        {

        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void onrowcommand(object sender, GridViewCommandEventArgs e)
        {
            string index = (string)e.CommandArgument;
            Session["studentID"] = index;
            Response.Redirect("~/teacher/student_result_details.aspx");
        }
    }
}