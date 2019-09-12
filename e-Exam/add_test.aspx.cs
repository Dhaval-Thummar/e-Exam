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
    public partial class add_test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;

                SqlCommand cmd = new SqlCommand("select sub_name from Subject order by sub_name", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet dt = new DataSet();
                da.Fill(dt);
                sub_list.DataTextField = dt.Tables[0].Columns["sub_name"].ToString();
                //sub_list.DataValueField = dt.Tables[0].Columns["sub_id"].ToString();
                sub_list.DataSource = dt.Tables[0];
                sub_list.DataBind();
                sub_list.Items.Add(new ListItem("Other", "-1"));
                sub_list.Items.Insert(0, new ListItem("-Select--", "0"));
            }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if(CheckBox1.Checked == true)
            {
                duration.Enabled = true;
            }
            else
            {
                duration.Text = "";
                duration.Enabled = false;
            }
        }

        protected void test_next_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/add_question.aspx");
        }
    }
}