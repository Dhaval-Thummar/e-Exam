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
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Qualification_drop_down.SelectedValue == "Secondary" || Qualification_drop_down.SelectedValue == "Primary" || Qualification_drop_down.SelectedValue == "Higher Secondary")
            {
                standard_label.Text = "Standard";
                standard_input.Visible = true;
                be_drop_down.Enabled = false;
                year_drop_down.Enabled = false;
                standard_drop_down.Visible = false;
            }
            else if (Qualification_drop_down.SelectedValue == "Diploma")
            {
                standard_input.Visible = false;
                standard_drop_down.Enabled = false;
                standard_drop_down.Visible = true;
                be_drop_down.Enabled = true;
                standard_drop_down.SelectedIndex = 1;
                year_drop_down.Enabled = true;
                year_drop_down.Items[3].Enabled = false;
            }
            else if (Qualification_drop_down.SelectedValue == "Under Graduate")
            {
                standard_label.Text = "Degree";
                standard_drop_down.Visible = true;
                standard_drop_down.Enabled = true;
                standard_input.Visible = false;
                standard_drop_down.SelectedIndex = 0;
            }
            else
            {
                standard_drop_down.Visible = false;
                bsc_drop_down.Enabled = false;
                year_drop_down.Enabled = false;
                standard_input.Visible = true;
                standard_drop_down.SelectedIndex = 0;
            }

        }

        protected void standard_drop_down_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (standard_drop_down.SelectedValue == "B.E/B.Tech")
            {
                year_drop_down.Items[3].Enabled = true;
                be_drop_down.Visible = true;
                bsc_drop_down.Visible = false;
                be_drop_down.Enabled = true;
                year_drop_down.Enabled = true;
            }

            else if (standard_drop_down.SelectedValue == "B.Sc")
            {
                year_drop_down.Items[3].Enabled = false;
                bsc_drop_down.Visible = true;
                be_drop_down.Visible = false;
                year_drop_down.Enabled = true;
                bsc_drop_down.Enabled = true;
            }
            else
            {
                be_drop_down.Visible = true;
                be_drop_down.Enabled = false;
                bsc_drop_down.Visible = false;
                year_drop_down.Items[3].Enabled = false;
            }
        }

        protected void cancel_btn_Click(object sender, EventArgs e)
        {
            name_input.Text = "";
            roll_no_input.Text = "";
            mobile_input.Text = "";
            email_input.Text = "";
            Qualification_drop_down.SelectedIndex = 0;
            standard_drop_down.SelectedIndex = 0;
            standard_input.Text = "";
            be_drop_down.SelectedIndex = 0;
            bsc_drop_down.SelectedIndex = 0;
            year_drop_down.SelectedIndex = 0;
            address_input.Text = "";
        }

        protected void submit_btn_Click(object sender, EventArgs e)
        {
            String std = "", dept = "", year = "";
            if (standard_drop_down.Visible == true)
            {
                std = standard_drop_down.SelectedValue;
            }
            else
            {
                std = standard_input.Text;
            }
            if (be_drop_down.Visible == true && be_drop_down.Enabled == true)
            {
                dept = be_drop_down.SelectedValue;
            }
            if (bsc_drop_down.Visible == true && bsc_drop_down.Enabled == true)
            {
                dept = bsc_drop_down.SelectedValue;
            }
            if (year_drop_down.Enabled == true)
            {
                year = year_drop_down.SelectedValue;
            }

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;

            if (check_email(email_input.Text, con))
            {

                SqlCommand cmd = new SqlCommand("student_registration", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@roll_no", roll_no_input.Text);
                cmd.Parameters.AddWithValue("@name", name_input.Text);
                cmd.Parameters.AddWithValue("@mobile", mobile_input.Text);
                cmd.Parameters.AddWithValue("@qualification", Qualification_drop_down.SelectedValue);
                cmd.Parameters.AddWithValue("@email", email_input.Text);
                cmd.Parameters.AddWithValue("@std", std);
                cmd.Parameters.AddWithValue("@dept", dept);
                cmd.Parameters.AddWithValue("@year", year);
                cmd.Parameters.AddWithValue("@address", address_input.Text);
                cmd.Parameters.AddWithValue("@dob", dob_input.Text);
                cmd.Parameters.AddWithValue("@pswd", confirm_pswd_input.Text);

                con.Open();
                int k = cmd.ExecuteNonQuery();
                if (k != 0)
                {
                    //Display success message.
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('User details saved sucessfully');window.location ='login.aspx';", true);
                }
                con.Close();
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
    }
}