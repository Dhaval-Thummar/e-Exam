using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.ComponentModel;
using System.Drawing;

namespace e_Exam
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        static int i = -1;
        static DataTable dt = new DataTable();
        static DataTable result = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                int id = 0;
                dt.Rows.Clear();
                if (Session["t_id"] != null)
                    id = Convert.ToInt32(Session["t_id"].ToString());
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["examDB"].ConnectionString;


                string q = "select q.section_no,q.q_id,q.question,q.type,q.has_image as q_image,qi.image,m.A,m.B,m.C,m.D,m.answer,m.has_image as m_image,mi.a_image,mi.b_image,mi.c_image,mi.d_image as m_image from Question as q left outer join mcq as m on q.test_id = m.test_id and q.section_no = m.section_no and q.q_id = m.q_id left outer join mcq_image as mi on q.test_id = mi.test_id and q.section_no = mi.section_no and q.q_id = mi.q_id left outer join  fill_in_blank as f on q.test_id = f.test_id and q.q_id = f.q_id and q.section_no = f.section_no and q.q_id = f.q_id left outer join question_image as qi on q.test_id = qi.test_id and q.q_id = qi.q_id and q.section_no = qi.section_no and q.q_id = qi.q_id where q.test_id =" + id + "order by section_no,q_id";
                SqlCommand cmd = new SqlCommand(q, con);
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(dt);
                result.Columns.Clear();
                result.Columns.Add("s_id", typeof(int));
                result.Columns.Add("test_id", typeof(int));
                result.Columns.Add("q_id", typeof(int));
                result.Columns.Add("section_no", typeof(int));
                result.Columns.Add("type", typeof(int));
                result.Columns.Add("answer_mcq", typeof(int));
                result.Columns.Add("answer_fill", typeof(string));
                result.Columns.Add("visited", typeof(int));
                DataRow r;
                for (int k = 0; k < dt.Rows.Count; k++)
                {
                    r = result.NewRow();
                    r["s_id"] = Convert.ToInt32(Session["student"].ToString());
                    r["test_id"] = Convert.ToInt32(Session["t_id"].ToString());
                    r["q_id"] = Convert.ToInt32(dt.Rows[k]["q_id"].ToString());
                    r["section_no"] = Convert.ToInt32(dt.Rows[k]["section_no"].ToString());
                    r["type"] = Convert.ToInt32(dt.Rows[k]["type"].ToString());
                    r["answer_mcq"] = -1;
                    r["answer_fill"] = null;
                    r["visited"] = 0;
                    result.Rows.Add(r);

                }
                GridView1.DataSource = result;
                GridView1.DataBind();
                Button1_Click(sender, e);
            }
        }

        public void Button1_Click(object sender, EventArgs e)
        {
            store_data();
            if (i == dt.Rows.Count - 1)
            {
                if (dt.Rows.Count > 0)
                {
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["examDB"].ConnectionString))
                    {
                        using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                        {
                            sqlBulkCopy.DestinationTableName = "[dbo].[result]";
                            con.Open();
                            sqlBulkCopy.WriteToServer(result);
                            con.Close();
                            return;
                        }
                    }
                }
            }
            i++;
            set_paper();
            load_data();
            if (i == dt.Rows.Count - 1)
            {
                Button1.Text = "submitt";
            }

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (i == dt.Rows.Count - 1)
            {
                Button1.Text = "next";
            }
            if (i > 0)
            {
                i--;
                set_paper();
                load_data();
            }
        }
        protected void set_paper()
        {
            if (i < dt.Rows.Count)
            {
                Label1.Text = "SECTION NO:" + dt.Rows[i]["section_no"].ToString();

                //Label1.Text = dt.Rows.Count.ToString();
                Label2.Text = "QUESTION NO:" + dt.Rows[i]["q_id"].ToString();
                // set question from database
                opt1.Checked = false;
                opt2.Checked = false;
                opt3.Checked = false;
                opt4.Checked = false;
                if (result.Rows[i]["visited"].ToString().Equals("0"))
                    TextBox1.Text = null;
                if (Int32.Parse(dt.Rows[i]["q_image"].ToString()) > 0)
                {
                    Panel2.Visible = true;
                    Panel1.Visible = true;

                    Label3.Text = dt.Rows[i]["question"].ToString();
                    SqlConnection con = new SqlConnection();
                    con.ConnectionString = ConfigurationManager.ConnectionStrings["examDB"].ConnectionString;
                    SqlCommand cmd = new SqlCommand("select image from question_image where test_id=" + Int32.Parse(Session["t_id"].ToString()) + " and q_id=" + Int32.Parse(dt.Rows[i]["q_id"].ToString()) + " and section_no=" + Int32.Parse(dt.Rows[i]["section_no"].ToString()), con);
                    cmd.CommandType = CommandType.Text;
                    con.Open();
                    byte[] b = (byte[])cmd.ExecuteScalar();
                    if (b == null)
                        Label1.Text = "not found";
                    string strbase64 = Convert.ToBase64String(b, 0, b.Length);
                    q_image.ImageUrl = "data:image/png;base64," + strbase64;
                }
                else
                {
                    Panel1.Visible = true;
                    Panel2.Visible = false;
                    Label3.Text = dt.Rows[i]["question"].ToString();
                }
                if (dt.Rows[i]["type"].Equals("0"))
                {
                    Panel4.Visible = false;
                    Panel3.Visible = true;
                    if (dt.Rows[i]["m_image"].ToString().Equals("1"))
                    {
                        SqlConnection con = new SqlConnection();
                        con.ConnectionString = ConfigurationManager.ConnectionStrings["examDB"].ConnectionString;
                        SqlCommand cmd = new SqlCommand("select a_image from mcq_image where test_id=" + Int32.Parse(Session["t_id"].ToString()) + " and q_id=" + Int32.Parse(dt.Rows[i]["q_id"].ToString()) + " and section_no=" + Int32.Parse(dt.Rows[i]["section_no"].ToString()), con);
                        con.Open();
                        byte[] b = (byte[])cmd.ExecuteScalar();
                        string strbase64 = Convert.ToBase64String(b, 0, b.Length);
                        Image1.ImageUrl = "data:image/png;base64," + strbase64;
                        cmd = new SqlCommand("select b_image from mcq_image where test_id=" + Int32.Parse(Session["t_id"].ToString()) + " and q_id=" + Int32.Parse(dt.Rows[i]["q_id"].ToString()) + " and section_no=" + Int32.Parse(dt.Rows[i]["section_no"].ToString()), con);
                        //con.Open();
                        b = (byte[])cmd.ExecuteScalar();
                        strbase64 = Convert.ToBase64String(b, 0, b.Length);
                        Image2.ImageUrl = "data:image/png;base64," + strbase64;
                        cmd = new SqlCommand("select c_image from mcq_image where test_id=" + Int32.Parse(Session["t_id"].ToString()) + " and q_id=" + Int32.Parse(dt.Rows[i]["q_id"].ToString()) + " and section_no=" + Int32.Parse(dt.Rows[i]["section_no"].ToString()), con);
                        // con.Open();
                        b = (byte[])cmd.ExecuteScalar();
                        strbase64 = Convert.ToBase64String(b, 0, b.Length);
                        Image3.ImageUrl = "data:image/png;base64," + strbase64;
                        cmd = new SqlCommand("select d_image from mcq_image where test_id=" + Int32.Parse(Session["t_id"].ToString()) + " and q_id=" + Int32.Parse(dt.Rows[i]["q_id"].ToString()) + " and section_no=" + Int32.Parse(dt.Rows[i]["section_no"].ToString()), con);
                        //con.Open();
                        b = (byte[])cmd.ExecuteScalar();
                        strbase64 = Convert.ToBase64String(b, 0, b.Length);
                        Image4.ImageUrl = "data:image/png;base64," + strbase64;
                    }
                    opt1.Text = dt.Rows[i]["A"].ToString();
                    opt2.Text = dt.Rows[i]["B"].ToString();
                    opt3.Text = dt.Rows[i]["C"].ToString();
                    opt4.Text = dt.Rows[i]["D"].ToString();
                }
                else
                {
                    Panel4.Visible = true;
                    Panel3.Visible = false;
                }

                // end of set question
            }
        }
        protected void store_data()
        {
            if (i < dt.Rows.Count)
            {
                if (i >= 0)
                {
                    if (result.Rows[i]["type"].ToString().Equals("0"))
                    {
                        if (opt1.Checked == true)
                            result.Rows[i]["answer_mcq"] = 0;
                        else if (opt2.Checked == true)
                            result.Rows[i]["answer_mcq"] = 1;
                        else if (opt3.Checked == true)
                            result.Rows[i]["answer_mcq"] = 2;
                        else if (opt4.Checked)
                            result.Rows[i]["answer_mcq"] = 3;
                        else
                        { }
                        result.Rows[i]["visited"] = 1;
                    }
                    else
                    {
                        if (TextBox1.Text != null)
                        {
                            TextBox1.Text.Trim();
                            result.Rows[i]["answer_fill"] = TextBox1.Text;
                            result.Rows[i]["visited"] = 1;
                        }
                    }
                    GridView1.DataSource = result;
                    GridView1.DataBind();
                }
            }
        }
        protected void load_data()
        {
            if (i < dt.Rows.Count)
            {
                if (i >= 0)
                {
                    if (result.Rows[i]["visited"].ToString().Equals("1"))
                    {
                        if (result.Rows[i]["type"].ToString().Equals("0"))
                        {
                            if (result.Rows[i]["answer_mcq"].ToString().Equals("0"))
                                opt1.Checked = true;
                            else if (result.Rows[i]["answer_mcq"].ToString().Equals("1"))
                                opt2.Checked = true;
                            else if (result.Rows[i]["answer_mcq"].ToString().Equals("2"))
                                opt3.Checked = true;
                            else if (result.Rows[i]["answer_mcq"].ToString().Equals("3"))
                                opt4.Checked = true;
                            else
                            {
                                opt1.Checked = false;
                                opt2.Checked = false;
                                opt3.Checked = false;
                                opt4.Checked = false;
                            }
                        }
                        else
                        {
                            TextBox1.Text = result.Rows[i]["answer_fill"].ToString();
                        }
                    }
                }
            }
        }
    }
}