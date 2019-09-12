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
        protected void Page_Load(object sender, EventArgs e)
        {

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
    }
}