using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace e_Exam
{
    public partial class add_question : System.Web.UI.Page
    {
        static private int q_no = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                q_no = 1;
                if(Session["section_no"]==null)
                {
                    Response.Redirect("~/add_test.aspx");
                }
                MultiView2.ActiveViewIndex = 0;
                Session["section"] = 1;
                if (Session["section"].ToString().Equals(Session["section_no"].ToString()))
                {
                    next_section_btn.Enabled = false;
                    next_section_btn.CssClass="btn btn-warning disabled";
                }
            }
        }

        protected void qtype_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(qtype.SelectedItem.Value == "1")
            {
                MultiView1.ActiveViewIndex = 0;
            }
            else if(qtype.SelectedItem.Value=="2")
            {
                MultiView1.ActiveViewIndex = 1; 
            }
        }

        protected void image_upload_check(object sender, EventArgs e)
        {
            if(q_image_checkbox.Checked==true)
            {
                image_upload.Visible = true;
            }
            else
            {
                image_upload.Visible = false;
            }
        }

        protected void optACheck_CheckedChanged(object sender, EventArgs e)
        {
            if (optACheck.Checked == true)
            {
                optAimg.Visible = true;
            }
            else
            {
                optAimg.Visible = false;
            }
        }

        protected void optBCheck_CheckedChanged(object sender, EventArgs e)
        {
            if (optBCheck.Checked == true)
            {
                optBimg.Visible = true;
            }
            else
            {
                optBimg.Visible = false;
            }
        }

        protected void optCCheck_CheckedChanged(object sender, EventArgs e)
        {
            if (optCCheck.Checked == true)
            {
                optCimg.Visible = true;
            }
            else
            {
                optCimg.Visible = false;
            }
        }

        protected void optDCheck_CheckedChanged(object sender, EventArgs e)
        {
            if (optDCheck.Checked == true)
            {
                optDimg.Visible = true;
            }
            else
            {
                optDimg.Visible = false;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Session["marks"] = marks_input.Text;
            Session["negative"] = negative_list.Text;
            section_no.Text = section_no_outer.Text;
            MultiView2.ActiveViewIndex = 1;
        }

        protected void next_section_btn_Click(object sender, EventArgs e)
        {
            q_no = 1;
            question_no_label.Text = "Question " + q_no;
            Session["section"] = int.Parse(Session["section"].ToString()) + 1;
            if (Session["section"].ToString().Equals(Session["section_no"].ToString()))
            {
                next_section_btn.Enabled = false;
                next_section_btn.CssClass = "btn btn-warning disabled";
            }
            section_no_outer.Text = "Section " + Session["section"].ToString();
            MultiView2.ActiveViewIndex = 0;
        }

        protected void next_question_btn_Click(object sender, EventArgs e)
        {
            q_no++;
            question_no_label.Text = "Question " + q_no;
            //set question to datatable
        }

        protected void test_submit_btn_Click(object sender, EventArgs e)
        {
            //submit test
        }
    }
}