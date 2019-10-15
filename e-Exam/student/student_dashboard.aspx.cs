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
    public partial class student_dashboard : System.Web.UI.Page
    {
        static int student_id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["StudentID"] != null)
                {
                    student_id = Int32.Parse(Session["StudentID"].ToString());
                }
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["examDB"].ConnectionString;
                SqlCommand cmd = new SqlCommand("showtestdata", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@stdid", student_id));
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet dt = new DataSet();
                da.Fill(dt);
                MultiView1.SetActiveView(View1);
                GridView1.DataSource = dt;
                GridView1.DataBind();

            }
        }

        protected void onrowcommand(object sender, GridViewCommandEventArgs e)
        {
            string index = (string)e.CommandArgument;

            Session["s_sub"] = index;
            if (index != null)
            {
                MultiView1.SetActiveView(View2);
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["examDB"].ConnectionString;
                SqlCommand cmd = new SqlCommand("showtestdata_name", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@s_sub", index));
                cmd.Parameters.Add(new SqlParameter("@student_id", student_id));
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet dt = new DataSet();
                da.Fill(dt);
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
        }
        protected void onrowcommand1(object sender, GridViewCommandEventArgs e)
        {
            Session["t_id"] = Int32.Parse(e.CommandArgument.ToString());
            int tid = Int32.Parse(e.CommandArgument.ToString());
            if (tid > 0)
            {
                Response.Redirect("~/take_test.aspx");
            }
        }
    }
}