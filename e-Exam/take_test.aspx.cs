using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
namespace e_Exam
{
    public partial class take_test : System.Web.UI.Page
    {
        static DataTable qtable = new DataTable();
        static DataTable ans_table = new DataTable();
        static int qno = 1, tid = 0, total_q = 0;
        string yellow = "#FFD500", white = "#F8F9FA", green = "#42D127";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                qno = 1;
                ViewState["section"] = 1;
                int section = Convert.ToInt32(ViewState["section"]);
                Session["Timer"] = DateTime.Now.AddMinutes(5).ToString();
                MultiView1.ActiveViewIndex = 0;
                tid = Convert.ToInt32(Request.QueryString["tid"]);
                qtable = Questiosns(tid, section);
                ViewState["total_section"] = count_section(tid);
                total_q = qtable.Rows.Count;
                ans_table = generate_ans_table(total_q);
                Label2.Text = "Section " + section;
            }

        }

        protected void Page_Init()
        {
            add_button(total_q);
        }
        private DataTable generate_ans_table(int rows)
        {
            ans_table.Rows.Clear();
            DataTable t1 = new DataTable();
            DataRow r1;
            t1.Columns.Add(new DataColumn("t_id", typeof(int)));
            t1.Columns.Add(new DataColumn("section_no", typeof(int)));
            t1.Columns.Add(new DataColumn("q_id", typeof(int)));
            t1.Columns.Add(new DataColumn("student_id", typeof(int)));
            t1.Columns.Add(new DataColumn("type", typeof(char)));
            t1.Columns.Add(new DataColumn("mcq", typeof(char)));
            t1.Columns.Add(new DataColumn("blank", typeof(string)));
            t1.Columns.Add(new DataColumn("correct", typeof(char)));
            t1.Columns.Add(new DataColumn("attempt", typeof(char)));
            for (int i = 0; i < rows; i++)
            {
                r1 = t1.NewRow();
                t1.Rows.Add(r1);
            }
            return t1;
        }
        private DataTable Questiosns(int tid, int section)
        {
            qtable.Rows.Clear();
            DataTable q1 = new DataTable();
            String conStr = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            String qry = "select q.test_id,q.section_no,q.q_id,q.question,q.type,m.A,m.B,m.C,m.D,m.answer,f.answer as blank, q.has_image from Question as q " +
                "left outer join mcq as m on q.test_id = m.test_id and q.section_no = m.section_no and q.q_id = m.q_id " +
                "left outer join fill_in_blank as f on q.test_id = f.test_id and q.section_no = f.section_no and q.q_id = f.q_id where q.test_id =" + tid + " and q.section_no=" + section;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(qry, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(q1);
            }
            ViewState["total_q"] = q1.Rows.Count;
            return q1;
        }
        private void add_button(decimal number)
        {
            Table1.Rows.Clear();
            int i, j;
            int total_rows = Decimal.ToInt32(Math.Ceiling(number / 5));
            TableRow row;
            TableCell cell;
            for (i = 1; i <= total_rows; i++)
            {
                row = new TableRow();
                for (j = 1; j <= 5; j++)
                {
                    cell = new TableCell();
                    row.Cells.Add(cell);
                }
                Table1.Rows.Add(row);
            }
            i = 0;
            foreach (TableRow row1 in Table1.Rows)
            {
                foreach (TableCell cell1 in row1.Cells)
                {
                    i++;
                    Button btn = new Button();
                    btn.ID = i.ToString();
                    btn.Text = i.ToString();
                    btn.CssClass = "button1 btn btn-light";
                    btn.ForeColor = System.Drawing.ColorTranslator.FromHtml("#003300");
                    btn.Click += new EventHandler(navigate_q);
                    cell1.Controls.Add(btn);
                    if (i == total_q)
                        return;
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            timer_pnl.Visible = true;
            if (qtable.Rows.Count != 0)
            {
                View view = new View();
                Label question = new Label();
                question.Text = qtable.Rows[0][3].ToString();
                view.Controls.Add(question);
                MultiView1.Views.Add(view);
                MultiView1.ActiveViewIndex = 1;

                get_question(qno);
            }
            if (qno == total_q)
            {
                nextbtn.Enabled = false;
            }
        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            if (DateTime.Compare(DateTime.Now, DateTime.Parse(Session["Timer"].ToString())) < 0)
            {
                Label1.Text = ((Int32)DateTime.Parse(Session["Timer"].ToString()).Subtract(DateTime.Now).TotalHours).ToString() + ":" +
                    ((Int32)DateTime.Parse(Session["Timer"].ToString()).Subtract(DateTime.Now).TotalMinutes % 60).ToString() + ":" +
                    ((Int32)DateTime.Parse(Session["Timer"].ToString()).Subtract(DateTime.Now).TotalSeconds % 60).ToString();
            }
            //int a = Convert.ToInt32(Session["t1"].ToString());
            //a--;
            //Session["t1"] = a;
            //Label1.Text = a.ToString();
        }
        protected void save_answer(int qid)
        {
            try
            {
                ans_table.Rows[qid - 1]["student_id"] = 0;
                ans_table.Rows[qid - 1]["t_id"] = tid;
                ans_table.Rows[qid - 1]["section_no"] = Convert.ToInt32(ViewState["section"]);
                ans_table.Rows[qid - 1]["q_id"] = qid;
                if (qtable.Rows[qid - 1]["type"].ToString().Equals("0"))
                {
                    ans_table.Rows[qid - 1]["type"] = '0';
                    if (RadioButtonList1.SelectedIndex != -1)
                    {
                        ans_table.Rows[qid - 1]["mcq"] = (char)(64 + Convert.ToInt32(RadioButtonList1.SelectedItem.Value));
                        ans_table.Rows[qid - 1]["attempt"] = '1';
                    }
                }

                else
                {
                    ans_table.Rows[qid - 1]["type"] = '1';
                    if (anstxt.Text.Trim() != "")
                    {
                        ans_table.Rows[qid - 1]["blank"] = anstxt.Text.Trim();
                        ans_table.Rows[qid - 1]["attempt"] = '1';
                    }
                }
            }
            catch(Exception)
            {
                //No Question found
            }
        }
        protected void nextbtn_Click(object sender, EventArgs e)
        {
            save_answer(qno);
            qno++;
            if (qno == total_q)
            {
                nextbtn.Enabled = false;
            }
            try
            {
                if (qtable.Rows[qno - 2]["type"].ToString().Equals("0"))
                {   //mcq
                    if (RadioButtonList1.SelectedIndex != -1)
                    {
                        Button button = new Button();
                        foreach (TableRow row in Table1.Rows)
                        {
                            button = (Button)row.FindControl((qno - 1).ToString());
                        }
                        if (button.BackColor != System.Drawing.ColorTranslator.FromHtml(yellow))
                        {
                            button.BackColor = System.Drawing.ColorTranslator.FromHtml(green);
                        }
                    }
                }
            }
            catch(Exception)
            {
                //No Question found
            }
            get_question(qno);
            prevbtn.Enabled = true;
        }
        protected void prevbtn_Click(object sender, EventArgs e)
        {
            save_answer(qno);
            qno--;
            get_question(qno);
            if (qno == 1)
            {
                prevbtn.Enabled = false;
            }
            nextbtn.Enabled = true;
        }
        protected void submitbtn_Click(object sender, EventArgs e)
        {
            save_answer(qno);
            compare_answer(total_q);
            submit_question();
            int section = Convert.ToInt32(ViewState["section"]);
            section++;
            ViewState["section"] = section;
            int total_section = 1;
            if (ViewState["total_section"] != null)
            {
                total_section = Convert.ToInt32(ViewState["total_section"]);
            }
            if (section <= total_section)
            {
                qno = 1;
                qtable = Questiosns(tid, section);
                total_q = qtable.Rows.Count;
                add_button(total_q);
                ans_table = generate_ans_table(total_q);
                if (qtable.Rows.Count != 0)
                {
                    get_question(qno);
                }
                if (qno == total_q)
                {
                    nextbtn.Enabled = false;
                }
                Label2.Text = "Section " + section;
            }
            else
            {
                Panel1.Visible = false;
                timer_pnl.Visible = false;
                MultiView1.ActiveViewIndex = 2;
            }
            nextbtn.Enabled = true;
            prevbtn.Enabled = false;
        }
        private void get_question(int qno)
        {
            try
            {
                qlbl.Text = "Q." + qno + ") " + qtable.Rows[qno - 1]["question"].ToString();
                if (qtable.Rows[qno - 1]["type"].ToString().Equals("0"))
                {
                    RadioButtonList1.Visible = true;
                    anslbl.Visible = false;
                    anstxt.Visible = false;
                    RadioButtonList1.Items[0].Text = "A. " + qtable.Rows[qno - 1]["A"].ToString();
                    RadioButtonList1.Items[1].Text = "B. " + qtable.Rows[qno - 1]["B"].ToString();
                    RadioButtonList1.Items[2].Text = "C. " + qtable.Rows[qno - 1]["C"].ToString();
                    RadioButtonList1.Items[3].Text = "D. " + qtable.Rows[qno - 1]["D"].ToString();
                    if (ans_table.Rows[qno - 1]["mcq"] != DBNull.Value)
                    {
                        char ans = (char)ans_table.Rows[qno - 1]["mcq"];
                        int index = ((int)ans) % 65;
                        RadioButtonList1.SelectedIndex = index;
                    }
                    else
                    {
                        RadioButtonList1.ClearSelection();
                    }
                }
                else
                {
                    RadioButtonList1.Visible = false;
                    anslbl.Visible = true;
                    anstxt.Visible = true;
                    if (ans_table.Rows[qno - 1]["blank"] != null)
                    {
                        anstxt.Text = ans_table.Rows[qno - 1]["blank"].ToString();
                    }
                }
            }
            catch (Exception)
            {
                //No question found;
            }
        }
        protected void markbtn_Click(object sender, EventArgs e)
        {
            Button button = new Button();
            foreach (TableRow row in Table1.Rows)
            {
                button = (Button)row.FindControl((qno).ToString());
            }
            if (button.BackColor != System.Drawing.ColorTranslator.FromHtml(yellow))
            {
                button.BackColor = System.Drawing.ColorTranslator.FromHtml(yellow);
            }
            else
            {
                if (qtable.Rows[qno - 1]["type"].ToString().Equals("0"))
                {   //mcq
                    if (RadioButtonList1.SelectedIndex != -1)
                    {
                        button.BackColor = System.Drawing.ColorTranslator.FromHtml(green);
                    }

                }
                else
                {
                    if (anstxt.Text.Trim() != "")
                    {
                        button.BackColor = System.Drawing.ColorTranslator.FromHtml(green);
                    }
                    else
                    {
                        button.BackColor = System.Drawing.ColorTranslator.FromHtml(white);
                    }
                }
            }
        }
        protected void anstxt_TextChanged(object sender, EventArgs e)
        {
            Button button = new Button();
            if (anstxt.Text.Trim() != "")
            {
                foreach (TableRow row in Table1.Rows)
                {
                    button = (Button)row.FindControl((qno).ToString());
                }
                if (button.BackColor != System.Drawing.ColorTranslator.FromHtml(yellow))
                {
                    button.BackColor = System.Drawing.ColorTranslator.FromHtml(green);
                }
            }
            else
            {
                foreach (TableRow row in Table1.Rows)
                {
                    button = (Button)row.FindControl((qno).ToString());
                }
                if (button.BackColor == System.Drawing.ColorTranslator.FromHtml(green))
                {
                    button.BackColor = System.Drawing.ColorTranslator.FromHtml(white);
                }
            }
        }
        private void navigate_q(object sender, EventArgs e)
        {
            save_answer(qno);
            Button button = (Button)sender;
            qno = Convert.ToInt32(button.ID);
            get_question(qno);
            if (qno == total_q)
            {
                nextbtn.Enabled = false;
            }
            else
            {
                nextbtn.Enabled = true;
            }
            if (qno == 1)
            {
                prevbtn.Enabled = false;
            }
            else
            {
                prevbtn.Enabled = true;
            }
        }
        private int count_section(int tid)
        {
            int count = 1;
            String conStr = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            String qry = "select count(section_no) from Test_Section where test_id=" + tid;
            try
            {
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand(qry, con);
                    count = (int)cmd.ExecuteScalar();
                }
            }
            catch (Exception)
            {
                //Not found
            }
            return count;
        }
        private void compare_answer(int questions)
        {
            for (int i = 0; i < questions; i++)
            {
                if (ans_table.Rows[i]["t_id"] == DBNull.Value)
                {
                    ans_table.Rows[i]["t_id"] = tid;
                    ans_table.Rows[i]["q_id"] = i + 1;
                    ans_table.Rows[i]["section_no"] = Convert.ToInt32(ViewState["section"]);
                    ans_table.Rows[i]["student_id"] = 0;
                }
                if (qtable.Rows[i]["type"].ToString().Equals("0"))
                {
                    if (ans_table.Rows[i]["mcq"].ToString() == qtable.Rows[i]["answer"].ToString())
                    {
                        ans_table.Rows[i]["correct"] = '1';
                    }
                }
                else
                {
                    if (ans_table.Rows[i]["blank"].ToString() == qtable.Rows[i]["blank"].ToString())
                    {
                        ans_table.Rows[i]["correct"] = '1';
                    }
                }
            }
        }
        private void submit_question()
        {
            string consString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            try
            {
                using (SqlConnection con = new SqlConnection(consString))
                {
                    using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                    {
                        //Set the database table name
                        sqlBulkCopy.DestinationTableName = "dbo.student_question_answer";
                        sqlBulkCopy.ColumnMappings.Add("t_id", "test_id");
                        sqlBulkCopy.ColumnMappings.Add("section_no", "section_no");
                        sqlBulkCopy.ColumnMappings.Add("q_id", "q_id");
                        sqlBulkCopy.ColumnMappings.Add("type", "type");
                        sqlBulkCopy.ColumnMappings.Add("student_id", "student_id");
                        sqlBulkCopy.ColumnMappings.Add("mcq", "mcq");
                        sqlBulkCopy.ColumnMappings.Add("blank", "blank");
                        sqlBulkCopy.ColumnMappings.Add("correct", "correct");
                        sqlBulkCopy.ColumnMappings.Add("attempt", "attempt");
                        con.Open();
                        sqlBulkCopy.WriteToServer(ans_table);
                        con.Close();
                    }
                }
            }
            catch (Exception)
            {
                //Sql Error found
            }
        }
    }
}