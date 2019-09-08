using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace e_Exam
{
    public partial class student_dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            user_name_label.Text = Request.QueryString["name"];
          // string n=((TextBox)PreviousPage.FindControl("u_input")).Text;
            //user_name_label.Text = n;
        }

        protected void history_button_Click(object sender, EventArgs e)
        {

        }

        protected void logout_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx");
        }
    }
}
