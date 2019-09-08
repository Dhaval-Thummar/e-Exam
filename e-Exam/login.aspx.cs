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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                valid.Text = "";
            }
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
                valid.Text = dt.Rows[0][0].ToString();
                Response.Redirect("~/student_dashboard.aspx?name="+u_input.Text);
            }
            else
            {
                valid.Text = "Invaid Username or Password";
            }
            //con.Close();
        }
    }
}