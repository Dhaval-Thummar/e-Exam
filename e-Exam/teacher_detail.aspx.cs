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
    public partial class teacher_detail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label13.Visible = false;
            if (!IsPostBack)
            {
                ViewState["filter"] = "ALL";
                MultiView1.SetActiveView(View1);
                binddropdown(dddepartment);
                binddata();

            }
        }
        protected void detail(object sender, GridViewCommandEventArgs e)
        {
            Session["teacher_id"] = (string)e.CommandArgument;

            MultiView1.SetActiveView(View2);
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            SqlCommand cmd = new SqlCommand("get_teacher_test_detail", con);
            cmd.Parameters.Add(new SqlParameter("@teacher_id", (string)e.CommandArgument));
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataTable dt = new DataTable();
            da.Fill(dt);
            cmd = new SqlCommand("select name from teacher_info where teacher_id=" + Session["teacher_id"].ToString(), con);
            con.Open();
            Label10.Text = cmd.ExecuteScalar().ToString();
            con.Close();
            if (dt.Rows.Count == 0)
            {
                Label13.Visible = true;
                Label13.ForeColor = System.Drawing.Color.Red;
                Label13.Text = "No data found";
            }
            else
            {
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }

        }

        protected void department_changed(object sender, EventArgs e)
        {
            DropDownList dddepartment = (DropDownList)sender;
            ViewState["filter"] = dddepartment.SelectedValue;
            this.binddata();
        }
        private void binddata()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            SqlCommand cmd = new SqlCommand("get_teacher_name", con);
            cmd.Parameters.AddWithValue("@filter", ViewState["filter"].ToString());
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();

            // DropDownList dddepartment = ; //(DropDownList)GridView1.HeaderRow.Cells[2].FindControl("dddepartment");//FindControl("dddepartment");
            //this.binddropdown(dddepartment);
        }
        private void binddropdown(DropDownList dddepartment)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            SqlCommand cmd = new SqlCommand("select * from Department", con);
            cmd.CommandType = CommandType.Text;
            con.Open();
            dddepartment.DataSource = cmd.ExecuteReader();
            dddepartment.DataTextField = "dept_name";
            dddepartment.DataValueField = "dept_id";
            dddepartment.DataBind();
            con.Close();
            dddepartment.Items.Insert(0, new ListItem("ALL", "ALL"));
            // dddepartment.Items.FindByValue(ViewState["filter"].ToString()).Selected = true;
            dddepartment.SelectedValue = ViewState["filter"].ToString();
        }
    }
}