using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace e_Exam.teacher
{
    public partial class test_result_teacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["teacherID"] == null)
            {
                Response.Redirect("~/login.aspx");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
        protected void onrowcommand(object sender, GridViewCommandEventArgs e)
        {
            string index = (string)e.CommandArgument;
            Session["test_id"] = index;
            int tid = Convert.ToInt32(index);
            Response.Redirect("~/teacher/test_result_details.aspx?tid=" + tid);
        }
    }
}