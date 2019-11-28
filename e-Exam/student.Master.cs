using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace e_Exam
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["student"] != null)
            {
                user_name_label.Text = Session["student"].ToString();
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        }

        protected void logout_button_Click(object sender, EventArgs e)
        {
            Session["student"] = null;
            clear_cache();
            Response.Redirect("~/login.aspx");
        }
        private void clear_cache()
        {
            //Used for disabling page caching
            HttpContext.Current.Response.Cache.SetExpires(DateTime.UtcNow.AddDays(-1));
            HttpContext.Current.Response.Cache.SetValidUntilExpires(false);
            HttpContext.Current.Response.Cache.SetRevalidation(HttpCacheRevalidation.AllCaches);
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.Cache.SetNoStore();
        }
    }
}