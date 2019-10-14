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
    public partial class student_dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int s = Int32.Parse(Session["Student"].ToString());
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["examDB"].ConnectionString;
                SqlCommand cmd = new SqlCommand("showtestdata", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@stdid", s));
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet dt = new DataSet();
                da.Fill(dt);
                MultiView1.SetActiveView(View1);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            
            }
        }

        protected void onrowcommand(object sender, GridViewCommandEventArgs e)
        {
                string index = (string)e.CommandArgument;

                Session["s_sub"] = index;
            if (index!=null)
            {
                MultiView1.SetActiveView(View2);
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["examDB"].ConnectionString;
                SqlCommand cmd = new SqlCommand("showtestdata_name",con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@s_sub",index));
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet dt = new DataSet();
                da.Fill(dt);
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
        }
        protected void onrowcommand1(object sender,GridViewCommandEventArgs e)
        {
            Session["t_id"]=Int32.Parse(e.CommandArgument.ToString());
            if((int)Session["t_id"]>0)
            {
                Server.Transfer("~/Webform4.aspx");
            }
        }
    }
}