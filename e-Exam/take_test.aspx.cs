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
        static int qno = 1,total_q = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                qno = 1;
                Session["Timer"] = DateTime.Now.AddMinutes(5).ToString();
                MultiView1.ActiveViewIndex = 0;
                int tid = Convert.ToInt32(Request.QueryString["tid"]);
                qtable = Questiosns(13);
            }

        }

        protected void Page_Init()
        {
            add_button(total_q);
        }

        private DataTable Questiosns(int tid)
        {
            DataTable q1 = new DataTable();
            String conStr = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            String qry = "select q.test_id,q.section_no,q.q_id,q.question,q.type,m.A,m.B,m.C,m.D,m.answer,f.answer as blank, q.has_image from Question as q " +
                "left outer join mcq as m on q.test_id = m.test_id and q.section_no = m.section_no and q.q_id = m.q_id " +
                "left outer join fill_in_blank as f on q.test_id = f.test_id and q.section_no = f.section_no and q.q_id = f.q_id where q.test_id =" + tid;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(qry, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(q1);
            }
            total_q = q1.Rows.Count;
            return q1;
        }


        private void add_button(decimal number)
        {
            int i,j;
            int total_rows = Decimal.ToInt32(Math.Ceiling(number/5));
            TableRow row;
            TableCell cell;
            for(i=1;i<=total_rows;i++)
            {
                row = new TableRow();
                for(j=1;j<=5;j++)
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
                    btn.ID =i.ToString();
                    btn.Text = i.ToString();
                    btn.CssClass = "button1 btn btn - light";
                    btn.ForeColor = System.Drawing.ColorTranslator.FromHtml("#003300");
                    btn.Click += new EventHandler(navigate_q);
                    cell1.Controls.Add(btn);
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
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

        protected void nextbtn_Click(object sender, EventArgs e)
        {
            qno++;
            get_question(qno);
            if(qno == total_q)
            {
                nextbtn.Enabled = false;
            }
            prevbtn.Enabled = true;
        }

        protected void prevbtn_Click(object sender, EventArgs e)
        {
            qno--;
            get_question(qno);
            if (qno == 1)
            {
                prevbtn.Enabled = false;
            }
            nextbtn.Enabled = true;
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
                }
                else
                {
                    RadioButtonList1.Visible = false;
                    anslbl.Visible = true;
                    anstxt.Visible = true;
                }
            }
            catch (Exception)
            {
                //No question found;
            }
        }

        private void navigate_q(object sender , EventArgs e)
        {
            Button button = (Button)sender;
            int qn0 = Convert.ToInt32(button.ID);
            get_question(qn0);
        }
    }
}