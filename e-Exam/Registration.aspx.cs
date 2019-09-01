using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace e_Exam
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
           if(Qualification_drop_down.SelectedValue == "Secondary" || Qualification_drop_down.SelectedValue == "Primary" || Qualification_drop_down.SelectedValue == "Higher Secondary")
            {
                standard_label.Visible = true;
                standard_label.Text = "Standard";
                standard_input.Visible = true;
            }
           else if(Qualification_drop_down.SelectedValue == "Under Graduate")
            {
                standard_label.Visible = true;
                standard_label.Text = "Degree";
                standard_drop_down.Visible = true;
                standard_input.Visible = false;
            }
            else
            {
                standard_drop_down.Visible = false;
                standard_input.Visible = false;
                standard_label.Visible = false;
            }
           
        }

        protected void standard_drop_down_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(standard_drop_down.SelectedValue == "B.E/B.Tech")
            {
                be_drop_down.Visible = true;
                department_label.Visible = true;
                bsc_drop_down.Visible = false;
            }
            else if(standard_drop_down.SelectedValue =="B.Sc")
            {
                bsc_drop_down.Visible = true;
                department_label.Visible = true;
                be_drop_down.Visible = false;
            }
            else
            {
                department_label.Visible = false;
                be_drop_down.Visible = false;
                bsc_drop_down.Visible = false;
            }
        }
    }
}