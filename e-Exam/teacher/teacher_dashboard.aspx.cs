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
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["teacherID"] != null)
            {
                Label1.Text = Session["teacherID"].ToString();
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            SqlCommand cmd = new SqlCommand("select image from question_image where q_id = 2", con);
            cmd.CommandType = CommandType.Text;
            con.Open();
            byte[] bytes = (byte[])cmd.ExecuteScalar();
            con.Close();

            string str = Convert.ToBase64String(bytes);
            Image2.ImageUrl = "data:Image/png;base64," + str;
        }
    }
}