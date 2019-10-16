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
    public partial class result : System.Web.UI.Page
    {
        static int a = 1, count = 0, tid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            a = 1;
            count = 0;
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            tid = Int32.Parse(e.CommandArgument.ToString());
            Session["tid"] = tid;
            MultiView1.ActiveViewIndex = 1;

            //bind_repeater(tid);
        }

        private void bind_repeater(int tid1)
        {
            string constr = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            string qry = "SELECT Question.test_id, Question.section_no, Question.q_id, Question.question, Question.type, mcq.A, mcq.B, mcq.C, mcq.D, mcq.answer, " +
                "fill_in_blank.answer AS blank_answer, Test_Section.marks_per_question, Test_Section.negative_marks, Question.has_image, mcq.has_image AS mcq_image " +
                "FROM Question INNER JOIN Test_Section ON Question.test_id = Test_Section.test_id AND Question.section_no = Test_Section.section_no " +
                "LEFT OUTER JOIN mcq ON Question.test_id = mcq.test_id AND Question.section_no = mcq.section_no AND Question.q_id = mcq.q_id " +
                "LEFT OUTER JOIN fill_in_blank ON Question.test_id = fill_in_blank.test_id AND Question.section_no = fill_in_blank.section_no AND Question.q_id = fill_in_blank.q_id " +
                "WHERE (Question.test_id =" + tid1 + ")";
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
        }
        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Label l = (Label)e.Item.FindControl("section");
            Label mcq_ans = (Label)e.Item.FindControl("correct_mcq");
            Label blank_ans = (Label)e.Item.FindControl("correct_blank");
            Label lblmcq = (Label)e.Item.FindControl("correct_ans_mcq");
            Label lblblank = (Label)e.Item.FindControl("correct_ans_blank");
            Panel mcq_pnl = (Panel)e.Item.FindControl("mcq_panel");
            Panel fill_pnl = (Panel)e.Item.FindControl("fill_in_blank_panel");
            Panel p1 = (Panel)e.Item.FindControl("Panel1");
            Panel p2 = (Panel)e.Item.FindControl("Panel2");
            HiddenField type = (HiddenField)e.Item.FindControl("q_type");
            HiddenField q_image = (HiddenField)e.Item.FindControl("hidden_q_image");
            HiddenField section = (HiddenField)e.Item.FindControl("hidden_section");
            HiddenField qid = (HiddenField)e.Item.FindControl("hidden_qid");
            HiddenField correct = (HiddenField)e.Item.FindControl("correct");
            HiddenField attempt = (HiddenField)e.Item.FindControl("attempt");
            HiddenField mcq = (HiddenField)e.Item.FindControl("mcq");
            HiddenField blank = (HiddenField)e.Item.FindControl("blank");

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
                    mcq_ans.Visible = true;
                    blank_ans.Visible = false;
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
                    if (attempt.Value.ToString().Equals("1"))
                    {
                        if (correct.Value.ToString().Equals("1"))
                        {
                            mcq_ans.Text = "Correct";
                            mcq_ans.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            lblmcq.Visible = true;
                            lblmcq.Text = "Correct answer is " + mcq.Value.ToString();
                            mcq_ans.Text = "Wrong";
                            mcq_ans.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        lblmcq.Visible = true;
                        lblmcq.Text = "Correct answer is " + mcq.Value.ToString();
                        mcq_ans.Text = "Not Attempted";
                        mcq_ans.ForeColor = System.Drawing.Color.Chocolate;
                    }
                    mcq_pnl.Visible = true;
                    fill_pnl.Visible = false;
                }
                else
                {
                    blank_ans.Visible = true;
                    mcq_ans.Visible = false;
                    if (attempt.Value.ToString().Equals("1"))
                    {
                        if (correct.Value.ToString().Equals("1"))
                        {
                            blank_ans.Text = "Correct";
                            blank_ans.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            lblblank.Visible = true;
                            lblblank.Text = "Correct answer is " + blank.Value.ToString();
                            blank_ans.Text = "Wrong";
                            blank_ans.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        lblblank.Visible = true;
                        lblblank.Text = "Correct answer is " + blank.Value.ToString();
                        blank_ans.Text = "Not Attempted";
                        blank_ans.ForeColor = System.Drawing.Color.Chocolate;
                    }
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
                            //Error
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
                cmd.Parameters.AddWithValue("@tid", tid);
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
                    //Error
                }
            }

            return image;
        }
    }
}