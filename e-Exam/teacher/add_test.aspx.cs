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
            if(Session["teacherID"]==null)
            {
                Response.Redirect("~/login.aspx");
            }
            if(!IsPostBack)
            {
                bind_drop_down();
                Session["section_no"] = 1;
            }
        }

        protected void bind_drop_down()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            SqlCommand cmd = new SqlCommand("select * from Department order by dept_name", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet dt = new DataSet();
            dt.Clear();
            da.Fill(dt);
            dept_list.DataTextField = dt.Tables[0].Columns["dept_name"].ToString();
            dept_list.DataValueField = dt.Tables[0].Columns["dept_id"].ToString();
            dept_list.DataSource = dt.Tables[0];
            dept_list.DataBind();
            dept_list.Items.Add(new ListItem("Other","-1"));
            dept_list.Items.Insert(0, new ListItem("--Select--", "none"));

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
            Test t1 = new Test();
            t1.name = TextBox1.Text;
            t1.dept_id = Int16.Parse(dept_list.SelectedValue);
            t1.subject = sub_list.Text;
            t1.has_duration = CheckBox1.Checked;
            if(t1.has_duration)
            {
                t1.duration = Int32.Parse(duration.Text);
            }
            t1.sections = Int32.Parse(section_list.Text);
            t1.descripetion = test_desc.Text;
            if(Session["teacherID"]==null)
            {
                Response.Redirect("~/login.aspx");
            }
            t1.teacher_id = Int32.Parse(Session["teacherID"].ToString());
            Session["test"] = t1;
            TextBox1.Text = " " + t1.teacher_id;
            Server.Transfer("~/teacher/add_question.aspx");
        }

        protected void section_list_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["section_no"] = section_list.SelectedValue;
        }

        protected void sub_list_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            string qry = "select sub_id from Subject where sub_name = '" + sub_list.SelectedItem.ToString() + "'";
            SqlCommand cmd = new SqlCommand(qry, con);
            con.Open();
            object result = cmd.ExecuteScalar();
            con.Close();
            result = (result == DBNull.Value) ? null : result;
            Session["subject_id"] = Convert.ToInt32(result);
        }

        protected void dept_list_SelectedIndexChanged(object sender, EventArgs e)
        {
            String dept = dept_list.Text;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            SqlCommand cmd = new SqlCommand("select sub_name from Subject  where dept_id = (select dept_id from Department where dept_id="+ dept_list.SelectedValue +" ) order by sub_name", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet dt = new DataSet();
            da.Fill(dt);
            sub_list.DataTextField = dt.Tables[0].Columns["sub_name"].ToString();
            sub_list.DataSource = dt.Tables[0];
            sub_list.DataBind();
            sub_list.Items.Add(new ListItem("Other", "-1"));
            sub_list.Items.Insert(0, new ListItem("--Select--", "none"));
        }
    }
}