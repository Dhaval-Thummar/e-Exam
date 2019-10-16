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
    public partial class test_details : System.Web.UI.Page
    {
        static int a = 1, count = 0, check = 0;
        static Teacher_test t1;
        protected void Page_Load(object sender, EventArgs e)
        {
            a = 1;
            count = 0;
            if (!IsPostBack)
            {
                int tid = Convert.ToInt32(Session["teacherID"].ToString());
                t1 = new Teacher_test(tid);
                if (!t1.test_list.Contains(Convert.ToInt32(Request.QueryString["tid"])))
                {
                    MultiView1.ActiveViewIndex = 2;
                }
                else
                {
                    getTestData();
                    MultiView1.ActiveViewIndex = 0;
                }
            }
            if (check == 1)
            {
                MultiView1.ActiveViewIndex = 1;
                check = 0;
            }
        }

        private void getTestData()
        {
            try
            {
                DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                DataRowView drv = dv[0];
                Label1.Text = drv["name"].ToString();
                test_subject.Text = "Subject: " + drv["subject"].ToString();
                if (drv["duration"].ToString().Equals("0"))
                {
                    duration.Text = "No duration";
                }
                else
                {
                    duration.Text = "Duration: " + drv["duration"].ToString() + " min";
                }
                marks.Text = "Total Marks: " + drv["total_marks"].ToString();
                nmarks.Text = "Negative Marks: " + drv["negative_marks"].ToString();
                added_date.Text = "Added Date: " + drv["added_date"].ToString();
                times_taken.Text = " times taken";
                desc.Text = "Descriptoin: " + drv["description"].ToString();
            }
            catch (Exception)
            {
                MultiView1.ActiveViewIndex = 2;
                no_details.Visible = true;
            }
        }

        protected void view_question_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        private void getQuestion(int tid)
        {
            string consString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(consString))
            {
                SqlCommand cmd = new SqlCommand("SELECT Question.test_id, Question.section_no, Question.q_id, Question.question, Question.type, mcq.A, mcq.B, mcq.C, mcq.D, mcq.answer, fill_in_blank.answer AS blank_answer, Test_Section.marks_per_question, Test_Section.negative_marks, Question.has_image, mcq.has_image AS Expr1 FROM Question INNER JOIN Test_Section ON Question.test_id = Test_Section.test_id AND Question.section_no = Test_Section.section_no LEFT OUTER JOIN mcq ON Question.test_id = mcq.test_id AND Question.section_no = mcq.section_no AND Question.q_id = mcq.q_id LEFT OUTER JOIN fill_in_blank ON Question.test_id = fill_in_blank.test_id AND Question.section_no = fill_in_blank.section_no AND Question.q_id = fill_in_blank.q_id WHERE (Question.test_id =" + tid, con);
                // SqlCommand cmd = new SqlCommand("select * from mcq where test_id=" + tid + " order by section_no", con);
                cmd.CommandType = CommandType.Text;
                try
                {
                    con.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    if (rd.HasRows)
                    {
                        Repeater1.DataSource = rd;
                        Repeater1.DataBind();
                    }
                    else
                    {
                        MultiView1.ActiveViewIndex = 2;
                        no_details.Visible = true;
                    }
                }
                catch (Exception ex)
                {
                    no_details.Visible = true;
                    no_details.Text = "Something went wrong. Please try after sometime later.</br> Contact you developer for this problem";
                }
            }

        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Label l = (Label)e.Item.FindControl("section");
            Panel mcq_pnl = (Panel)e.Item.FindControl("mcq_panel");
            Panel fill_pnl = (Panel)e.Item.FindControl("fill_in_blank_panel");
            Panel p1 = (Panel)e.Item.FindControl("Panel1");
            Panel p2 = (Panel)e.Item.FindControl("Panel2");
            HiddenField type = (HiddenField)e.Item.FindControl("q_type");
            HiddenField q_image = (HiddenField)e.Item.FindControl("hidden_q_image");
            HiddenField section = (HiddenField)e.Item.FindControl("hidden_section");
            HiddenField qid = (HiddenField)e.Item.FindControl("hidden_qid");

            if ((e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem))
            {
                if (l.Text.Equals("Section " + a) && count == 1)
                {
                    p1.Visible = false;
                }
                else if (!l.Text.Equals("Section " + a))
                {
                    Response.Write("<br/>");
                    a++;
                    l.Visible = true;
                    count = 1;
                }
                else
                {
                    Response.Write("<br/>");
                    count = 1;
                    p1.Visible = true;
                }

                //mcq or fill_in_blank
                if (type.Value.ToString().Equals("0"))
                {
                    HiddenField mcq_image = (HiddenField)e.Item.FindControl("mcq_image");
                    if (mcq_image.Value.ToString().Equals("1"))
                    {
                        int section_no = Convert.ToInt32(section.Value.ToString());
                        int q_id = Convert.ToInt32(qid.Value.ToString());
                        Image a_image = (Image)e.Item.FindControl("optImg1");
                        Image b_image = (Image)e.Item.FindControl("optImg2");
                        Image c_image = (Image)e.Item.FindControl("optImg3");
                        Image d_image = (Image)e.Item.FindControl("optImg4");

                        Image image = retrieve_image(section_no, q_id, "a_image");
                        if (image != null)
                        {
                            a_image.ImageUrl = image.ImageUrl;
                            Panel a = (Panel)e.Item.FindControl("optPnl1");
                            a.Visible = true;
                        }

                        image = retrieve_image(section_no, q_id, "b_image");
                        if (image != null)
                        {
                            b_image.ImageUrl = image.ImageUrl;
                            Panel b = (Panel)e.Item.FindControl("optPnl2");
                            b.Visible = true;
                        }

                        image = retrieve_image(section_no, q_id, "c_image");
                        if (image != null)
                        {
                            c_image.ImageUrl = image.ImageUrl;
                            Panel c = (Panel)e.Item.FindControl("optPnl3");
                            c.Visible = true;
                        }

                        image = retrieve_image(section_no, q_id, "d_image");
                        if (image != null)
                        {
                            d_image.ImageUrl = image.ImageUrl;
                            Panel d = (Panel)e.Item.FindControl("optPnl4");
                            d.Visible = true;
                        }
                    }
                    mcq_pnl.Visible = true;
                    fill_pnl.Visible = false;
                }
                else
                {
                    mcq_pnl.Visible = false;
                    fill_pnl.Visible = true;
                }

                //question_image
                if (q_image.Value.ToString().Equals("1"))
                {

                    Image image = (Image)e.Item.FindControl("q_image");
                    string consString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(consString))
                    {
                        SqlCommand cmd = new SqlCommand("select image from question_image where test_id=@tid and section_no=@section and q_id=@qid", con);
                        cmd.Parameters.AddWithValue("@tid", Request.QueryString["tid"]);
                        cmd.Parameters.AddWithValue("@section", section.Value.ToString());
                        cmd.Parameters.AddWithValue("@qid", qid.Value.ToString());
                        cmd.CommandType = CommandType.Text;
                        try
                        {
                            con.Open();
                            byte[] bytes = (byte[])cmd.ExecuteScalar();
                            if (bytes != null)
                            {
                                string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                                image.ImageUrl = "data:image/png;base64," + base64String;
                                p2.Visible = true;
                            }
                        }
                        catch (Exception ex)
                        {
                            no_details.Visible = true;
                            no_details.Text = "Something went wrong. Please try after sometime later.</br> Contact you developer for this problem";
                        }
                    }
                }

            }

        }

        private Image retrieve_image(int section, int qid, string opt_image)
        {
            Image image = null;
            string consString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(consString))
            {
                SqlCommand cmd = new SqlCommand("select " + opt_image + " from mcq_image where test_id=@tid and section_no=@section and q_id=@qid", con);
                cmd.Parameters.AddWithValue("@tid", Request.QueryString["tid"]);
                cmd.Parameters.AddWithValue("@section", section);
                cmd.Parameters.AddWithValue("@qid", qid);
                cmd.CommandType = CommandType.Text;
                try
                {
                    con.Open();
                    byte[] bytes = (byte[])cmd.ExecuteScalar();
                    if (bytes != null)
                    {
                        string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                        image = new Image();
                        image.ImageUrl = "data:image/png;base64," + base64String;
                    }
                }
                catch (Exception ex)
                {
                    no_details.Visible = true;
                    no_details.Text = "Something went wrong. Please try after sometime later.</br> Contact you developer for this problem";
                }
            }

            return image;
        }


        protected void Repeater1_ItemCreated(object sender, RepeaterItemEventArgs e)
        {

        }

        protected void OnEdit(object sender, EventArgs e)
        {
            //Find the reference of the Repeater Item.
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            this.ToggleElements(item, true);
            MultiView1.ActiveViewIndex = 1;
        }

        private void ToggleElements(RepeaterItem item, bool isEdit)
        {
            HiddenField type = (HiddenField)item.FindControl("q_type");
            //Toggle Buttons.
            item.FindControl("btn_edit").Visible = !isEdit;
            item.FindControl("btn_update").Visible = isEdit;
            item.FindControl("btn_cancel").Visible = isEdit;
            item.FindControl("btn_delete").Visible = !isEdit;

            //Toggle Labels.
            item.FindControl("lblQuestion").Visible = !isEdit;
            item.FindControl("txtQuestion").Visible = isEdit;

            if (type.Value.ToString().Equals("0"))
            {
                item.FindControl("opt1").Visible = !isEdit;
                item.FindControl("opt2").Visible = !isEdit;
                item.FindControl("opt3").Visible = !isEdit;
                item.FindControl("opt4").Visible = !isEdit;

                //Toggle TextBoxes.

                item.FindControl("txtopt1").Visible = isEdit;
                item.FindControl("txtopt2").Visible = isEdit;
                item.FindControl("txtopt3").Visible = isEdit;
                item.FindControl("txtopt4").Visible = isEdit;
                item.FindControl("rdo_correctanswer").Visible = isEdit;
            }
            else
            {
                item.FindControl("lblBlank").Visible = !isEdit;
                item.FindControl("txtBlank").Visible = isEdit;
            }
        }

        protected void OnUpdate(object sender, EventArgs e)
        {
            //Find the reference of the Repeater Item.
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;

            int tid = Convert.ToInt32(Request.QueryString["tid"]);
            int section = Convert.ToInt32((item.FindControl("hidden_section") as HiddenField).Value.ToString());
            int qid = Convert.ToInt32((item.FindControl("hidden_qid") as HiddenField).Value.ToString());

            string question = (item.FindControl("txtQuestion") as TextBox).Text.Trim();

            int type = Convert.ToInt32((item.FindControl("q_type") as HiddenField).Value.ToString());
            string constr = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;

            //mcd_update
            if (type == 0)
            {
                string opt1 = (item.FindControl("txtopt1") as TextBox).Text.Trim();
                string opt2 = (item.FindControl("txtopt2") as TextBox).Text.Trim();
                string opt3 = (item.FindControl("txtopt3") as TextBox).Text.Trim();
                string opt4 = (item.FindControl("txtopt4") as TextBox).Text.Trim();
                string ans = (item.FindControl("rdo_correctanswer") as RadioButtonList).SelectedItem.Text;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("Question_edit"))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@action", "mcq_update");
                        cmd.Parameters.AddWithValue("@tid", tid);
                        cmd.Parameters.AddWithValue("@section", section);
                        cmd.Parameters.AddWithValue("@qid", qid);
                        cmd.Parameters.AddWithValue("@question", question);
                        cmd.Parameters.AddWithValue("@opt1", opt1);
                        cmd.Parameters.AddWithValue("@opt2", opt2);
                        cmd.Parameters.AddWithValue("@opt3", opt3);
                        cmd.Parameters.AddWithValue("@opt4", opt4);
                        cmd.Parameters.AddWithValue("@mcq_ans", ans);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            //fill_in_blank_update
            else
            {
                string ans = (item.FindControl("txtBlank") as TextBox).Text.Trim();
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("Question_edit"))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@action", "blank_update");
                        cmd.Parameters.AddWithValue("@tid", tid);
                        cmd.Parameters.AddWithValue("@section", section);
                        cmd.Parameters.AddWithValue("@qid", qid);
                        cmd.Parameters.AddWithValue("@question", question);
                        cmd.Parameters.AddWithValue("@blank_ans", ans);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            check = 1;
            Response.Redirect(Request.RawUrl);
        }

        protected void OnCancel(object sender, EventArgs e)
        {
            //Find the reference of the Repeater Item.
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            this.ToggleElements(item, false);
            MultiView1.ActiveViewIndex = 1;
        }
        protected void OnDelete(object sender, EventArgs e)
        {
            //Find the reference of the Repeater Item.
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;

            int tid = Convert.ToInt32(Request.QueryString["tid"]);
            int section = Convert.ToInt32((item.FindControl("hidden_section") as HiddenField).Value.ToString());
            int qid = Convert.ToInt32((item.FindControl("hidden_qid") as HiddenField).Value.ToString());

            int type = Convert.ToInt32((item.FindControl("q_type") as HiddenField).Value.ToString());
            string constr = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;

            if (type == 0)
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("Question_edit"))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@action", "del_mcq");
                        cmd.Parameters.AddWithValue("@tid", tid);
                        cmd.Parameters.AddWithValue("@section", section);
                        cmd.Parameters.AddWithValue("@qid", qid);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            else
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("Question_edit"))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@action", "del_fill");
                        cmd.Parameters.AddWithValue("@tid", tid);
                        cmd.Parameters.AddWithValue("@section", section);
                        cmd.Parameters.AddWithValue("@qid", qid);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            check = 1;
            Response.Redirect(Request.RawUrl);
        }
    }
}