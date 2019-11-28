using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace e_Exam
{
    public partial class Registration2 : System.Web.UI.Page
    {
        static int sid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind_department();
            }
        }


        protected void cancel_btn_Click(object sender, EventArgs e)
        {
            name_input.Text = "";
            roll_no_input.Text = "";
            mobile_input.Text = "";
            email_input.Text = "";
            year_drop_down.SelectedIndex = 0;
            address_input.Text = "";
        }

        protected void submit_btn_Click(object sender, EventArgs e)
        {
            String year = year_drop_down.SelectedValue;
            String dept_id = DropDownList1.SelectedValue;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;

            if (check_email(email_input.Text, con))
            {

                SqlCommand cmd = new SqlCommand("student_registration", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@roll_no", roll_no_input.Text);
                cmd.Parameters.AddWithValue("@name", name_input.Text);
                cmd.Parameters.AddWithValue("@mobile", mobile_input.Text);
                cmd.Parameters.AddWithValue("@email", email_input.Text);
                cmd.Parameters.AddWithValue("@dept_id", dept_id);
                cmd.Parameters.AddWithValue("@year", year);
                cmd.Parameters.AddWithValue("@address", address_input.Text);
                cmd.Parameters.AddWithValue("@dob", dob_input.Text);
                cmd.Parameters.AddWithValue("@pswd", confirm_pswd_input.Text);
                cmd.Parameters.Add("@sid", SqlDbType.Int);
                cmd.Parameters["@sid"].Direction = ParameterDirection.Output;
                con.Open();
                int k = cmd.ExecuteNonQuery();
                con.Close();
                sid = Int16.Parse(cmd.Parameters["@sid"].Value.ToString());
                if (k != 0)
                {
                    add_name_to_test(Convert.ToInt32(dept_id));
                    //Display success message.
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('User details saved sucessfully');window.location ='login.aspx';", true);
                }
                
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('email already registered');window.location ='registration.aspx';", true);
            }


        }
        public Boolean check_email(String email, SqlConnection con)
        {
            Boolean userstatus;
            string myqry;

            myqry = "Select uname from Login_info where uname='" + email + "'";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myqry;
            cmd.Connection = con;

            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                userstatus = false;
            }
            else
            {
                userstatus = true;
            }
            con.Close();

            return userstatus;
        }
        private void bind_department()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            SqlCommand cmd = new SqlCommand("select * from Department order by dept_name", con);
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataTable dt = new DataTable();
            da.Fill(dt);
            DropDownList1.DataSource = dt;
            DropDownList1.DataTextField = "dept_name";
            DropDownList1.DataValueField = "dept_id";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("--Select--", "none"));
            DropDownList1.Items.Add(new ListItem("Other", "-1"));
        }
        private void add_name_to_test(int dept_id)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            SqlCommand cmd = new SqlCommand("select test_id from Test where dept_id = '" + dept_id + "'", con);
            cmd.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataTable t1 = new DataTable();
            da.Fill(t1);

            t1.Columns.Add(new DataColumn("student_id", typeof(int)));
            for (int i = 0; i < t1.Rows.Count; i++)
            {
                t1.Rows[i]["student_id"] = sid;
            }
            using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
            {
                //Set the database table name
                sqlBulkCopy.DestinationTableName = "dbo.test_taken";

                //[OPTIONAL]: Map the DataTable columns with that of the database table

                sqlBulkCopy.ColumnMappings.Add("test_id", "Test_id");
                sqlBulkCopy.ColumnMappings.Add("student_id", "student_id");
                con.Open();
                sqlBulkCopy.WriteToServer(t1);
                con.Close();
            }
        }
    }
}