using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
namespace e_Exam
{
    public partial class add_question  : System.Web.UI.Page
    {
        static private int q_no = 1, total_q = 0;
        static int test_id, marks = 0;
        static float nmarks = 0;
        static DataTable qtable = new DataTable();
        static DataTable mcq_table = new DataTable();
        static DataTable fill_blank = new DataTable();
        static DataTable q_image = new DataTable();
        static DataTable mcq_image = new DataTable();
        static DataTable test_table = new DataTable();
        static DataTable test_section = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                q_no = 1;
                if (Session["section_no"] == null)
                {
                    Server.Transfer("~/teacher/add_test.aspx");
                }
                MultiView2.ActiveViewIndex = 0;
                Session["section"] = 1;
                if (Session["section"].ToString().Equals(Session["section_no"].ToString()))
                {
                    next_section_btn.Enabled = false;
                    next_section_btn.CssClass = "btn btn-warning disabled";
                }
                if (Session["test"] != null)
                {
                    Test t1 = (Test)Session["test"];
                    test_id = t1.test_id;
                }
                //question_table
                qtable.Columns.Add(new DataColumn("test_id", typeof(int)));
                qtable.Columns.Add(new DataColumn("section_no", typeof(int)));
                qtable.Columns.Add(new DataColumn("q_id", typeof(int)));
                qtable.Columns.Add(new DataColumn("subject_id", typeof(int)));
                qtable.Columns.Add(new DataColumn("question", typeof(string)));
                qtable.Columns.Add(new DataColumn("type", typeof(int)));
                qtable.Columns.Add(new DataColumn("has_image", typeof(int)));

                //mcq_table
                mcq_table.Columns.Add(new DataColumn("test_id", typeof(int)));
                mcq_table.Columns.Add(new DataColumn("section_no", typeof(int)));
                mcq_table.Columns.Add(new DataColumn("q_id", typeof(int)));
                mcq_table.Columns.Add(new DataColumn("A", typeof(string)));
                mcq_table.Columns.Add(new DataColumn("B", typeof(string)));
                mcq_table.Columns.Add(new DataColumn("C", typeof(string)));
                mcq_table.Columns.Add(new DataColumn("D", typeof(string)));
                mcq_table.Columns.Add(new DataColumn("answer", typeof(char)));
                mcq_table.Columns.Add(new DataColumn("has_image", typeof(int)));

                //fill_in_blank_table
                fill_blank.Columns.Add(new DataColumn("test_id", typeof(int)));
                fill_blank.Columns.Add(new DataColumn("section_no", typeof(int)));
                fill_blank.Columns.Add(new DataColumn("q_id", typeof(int)));
                fill_blank.Columns.Add(new DataColumn("answer", typeof(string)));

                //q_image
                q_image.Columns.Add(new DataColumn("test_id", typeof(int)));
                q_image.Columns.Add(new DataColumn("section_no", typeof(int)));
                q_image.Columns.Add(new DataColumn("q_id", typeof(int)));
                q_image.Columns.Add(new DataColumn("image", typeof(byte[])));

                //mcq_image
                mcq_image.Columns.Add(new DataColumn("test_id", typeof(int)));
                mcq_image.Columns.Add(new DataColumn("section_no", typeof(int)));
                mcq_image.Columns.Add(new DataColumn("q_id", typeof(int)));
                mcq_image.Columns.Add(new DataColumn("a_image", typeof(byte[])));
                mcq_image.Columns.Add(new DataColumn("b_image", typeof(byte[])));
                mcq_image.Columns.Add(new DataColumn("c_image", typeof(byte[])));
                mcq_image.Columns.Add(new DataColumn("d_image", typeof(byte[])));

                //test_table
                test_table.Columns.Add(new DataColumn("test_id", typeof(int)));
                test_table.Columns.Add(new DataColumn("name", typeof(string)));
                test_table.Columns.Add(new DataColumn("subject", typeof(string)));
                test_table.Columns.Add(new DataColumn("duration", typeof(int)));
                test_table.Columns.Add(new DataColumn("sections", typeof(int)));
                test_table.Columns.Add(new DataColumn("total_marks", typeof(int)));
                test_table.Columns.Add(new DataColumn("-ve marks", typeof(float)));
                test_table.Columns.Add(new DataColumn("added_date", typeof(DateTime)));
                test_table.Columns.Add(new DataColumn("description", typeof(string)));
                test_table.Columns.Add(new DataColumn("teacher_id", typeof(int)));

                //test_section
                test_section.Columns.Add(new DataColumn("test_id", typeof(int)));
                test_section.Columns.Add(new DataColumn("section_no", typeof(int)));
                test_section.Columns.Add(new DataColumn("marks_per_q", typeof(int)));
                test_section.Columns.Add(new DataColumn("nmarks", typeof(float)));

            }
        }

        protected void qtype_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (qtype.SelectedItem.Value == "1")
            {
                MultiView1.ActiveViewIndex = 0;
            }
            else if (qtype.SelectedItem.Value == "2")
            {
                MultiView1.ActiveViewIndex = 1;
            }
        }

        protected void image_upload_check(object sender, EventArgs e)
        {
            if (q_image_checkbox.Checked == true)
            {
                q_image_upload.Visible = true;
            }
            else
            {
                q_image_upload.Visible = false;
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

        protected void Button3_Click(object sender, EventArgs e)
        {
            Session["marks"] = marks_input.Text;
            Session["negative"] = negative_list.Text;
            section_no.Text = section_no_outer.Text;
            MultiView2.ActiveViewIndex = 1;
        }

        protected void next_section_btn_Click(object sender, EventArgs e)
        {
            int a = Convert.ToInt32(marks_input.Text);
            marks = marks + a * (q_no - 1);
            nmarks = nmarks + float.Parse(negative_list.SelectedItem.Value) * (q_no - 1) * a;
            q_no = 1;
            question_no_label.Text = "Question " + q_no;


            //entry for test_section table
            DataRow ts1 = test_section.NewRow();
            ts1["test_id"] = test_id;
            ts1["section_no"] = int.Parse(Session["section"].ToString());
            ts1["marks_per_q"] = Convert.ToInt32(marks_input.Text);
            ts1["nmarks"] = float.Parse(negative_list.SelectedItem.Value);
            test_section.Rows.Add(ts1);

            Session["section"] = int.Parse(Session["section"].ToString()) + 1;
            if (Session["section"].ToString().Equals(Session["section_no"].ToString()))
            {
                next_section_btn.Enabled = false;
                next_section_btn.CssClass = "btn btn-warning disabled";
            }
            section_no_outer.Text = "Section " + Session["section"].ToString();
            MultiView2.ActiveViewIndex = 0;


            string consString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(consString))
            {
                using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                {
                    //Set the database table name
                    sqlBulkCopy.DestinationTableName = "dbo.Question";

                    //[OPTIONAL]: Map the DataTable columns with that of the database table
                    sqlBulkCopy.ColumnMappings.Add("test_id", "test_id");
                    sqlBulkCopy.ColumnMappings.Add("section_no", "section_no");
                    sqlBulkCopy.ColumnMappings.Add("q_id", "q_id");
                    sqlBulkCopy.ColumnMappings.Add("subject_id", "subject_id");
                    sqlBulkCopy.ColumnMappings.Add("question", "question");
                    sqlBulkCopy.ColumnMappings.Add("type", "type");
                    sqlBulkCopy.ColumnMappings.Add("has_image", "has_image");
                    con.Open();
                    sqlBulkCopy.WriteToServer(qtable);
                    con.Close();
                }
            }
            using (SqlConnection con = new SqlConnection(consString))
            {
                using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                {
                    //Set the database table name
                    sqlBulkCopy.DestinationTableName = "dbo.mcq";

                    //[OPTIONAL]: Map the DataTable columns with that of the database table

                    sqlBulkCopy.ColumnMappings.Add("test_id", "test_id");
                    sqlBulkCopy.ColumnMappings.Add("section_no", "section_no");
                    sqlBulkCopy.ColumnMappings.Add("q_id", "q_id");
                    sqlBulkCopy.ColumnMappings.Add("A", "A");
                    sqlBulkCopy.ColumnMappings.Add("B", "B");
                    sqlBulkCopy.ColumnMappings.Add("C", "C");
                    sqlBulkCopy.ColumnMappings.Add("D", "D");
                    sqlBulkCopy.ColumnMappings.Add("answer", "answer");
                    sqlBulkCopy.ColumnMappings.Add("has_image", "has_image");
                    con.Open();
                    sqlBulkCopy.WriteToServer(mcq_table);
                    con.Close();
                }
            }
            using (SqlConnection con = new SqlConnection(consString))
            {
                using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                {
                    //Set the database table name
                    sqlBulkCopy.DestinationTableName = "dbo.fill_in_blank";

                    //[OPTIONAL]: Map the DataTable columns with that of the database table

                    sqlBulkCopy.ColumnMappings.Add("test_id", "test_id");
                    sqlBulkCopy.ColumnMappings.Add("section_no", "section_no");
                    sqlBulkCopy.ColumnMappings.Add("q_id", "q_id");
                    sqlBulkCopy.ColumnMappings.Add("answer", "answer");
                    con.Open();
                    sqlBulkCopy.WriteToServer(fill_blank);
                    con.Close();
                }
            }
            using (SqlConnection con = new SqlConnection(consString))
            {
                using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                {
                    //Set the database table name
                    sqlBulkCopy.DestinationTableName = "dbo.question_image";

                    //[OPTIONAL]: Map the DataTable columns with that of the database table

                    sqlBulkCopy.ColumnMappings.Add("test_id", "test_id");
                    sqlBulkCopy.ColumnMappings.Add("section_no", "section_no");
                    sqlBulkCopy.ColumnMappings.Add("q_id", "q_id");
                    sqlBulkCopy.ColumnMappings.Add("image", "image");
                    con.Open();
                    sqlBulkCopy.WriteToServer(q_image);
                    con.Close();
                }
            }
            //mcq_image
            using (SqlConnection con = new SqlConnection(consString))
            {
                using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                {
                    //Set the database table name
                    sqlBulkCopy.DestinationTableName = "dbo.mcq_image";

                    //[OPTIONAL]: Map the DataTable columns with that of the database table

                    sqlBulkCopy.ColumnMappings.Add("test_id", "test_id");
                    sqlBulkCopy.ColumnMappings.Add("section_no", "section_no");
                    sqlBulkCopy.ColumnMappings.Add("q_id", "q_id");
                    sqlBulkCopy.ColumnMappings.Add("a_image", "a_image");
                    sqlBulkCopy.ColumnMappings.Add("b_image", "b_image");
                    sqlBulkCopy.ColumnMappings.Add("c_image", "c_image");
                    sqlBulkCopy.ColumnMappings.Add("d_image", "d_image");
                    con.Open();
                    sqlBulkCopy.WriteToServer(mcq_image);
                    con.Close();
                }
            }
            qtable.Rows.Clear();
            mcq_table.Clear();
            fill_blank.Clear();
            q_image.Clear();
            mcq_image.Clear();
            Label1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/teacher/teacher_dashboard.aspx");
        }

        protected void next_question_btn_Click(object sender, EventArgs e)
        {
            if (q_image_checkbox.Checked)
            {
                HttpPostedFile httpPostedFile = q_image_upload.PostedFile;
                string filename = Path.GetFileName(httpPostedFile.FileName);
                string fileextension = Path.GetExtension(filename);
                int filesize = httpPostedFile.ContentLength;

                if (fileextension.ToLower() == ".jpg" || fileextension.ToLower() == ".bmp" || fileextension.ToLower() == ".gif" || fileextension.ToLower() == ".png" || fileextension.ToLower() == ".jpeg")
                {
                    Stream stream = httpPostedFile.InputStream;
                    BinaryReader binaryReader = new BinaryReader(stream);
                    byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

                    //new row to q_image table
                    DataRow i1 = q_image.NewRow();
                    i1["test_id"] = test_id;
                    i1["section_no"] = Convert.ToInt32(Session["section"].ToString());
                    i1["q_id"] = q_no;
                    i1["image"] = bytes;
                    q_image.Rows.Add(i1);
                }
                else
                {
                    image_errror_lbl.Visible = true;
                    image_errror_lbl.Text = "Only images (.jpg, .png, .bmp, .jpeg) can be uploaded";
                    image_errror_lbl.ForeColor = System.Drawing.Color.Red;
                    return;
                }
            }

            //mcq_image
            if (optACheck.Checked | optBCheck.Checked | optCCheck.Checked | optDCheck.Checked)
            {
                //new row to q_image table
                DataRow i1 = mcq_image.NewRow();
                i1["test_id"] = test_id;
                i1["section_no"] = Convert.ToInt32(Session["section"].ToString());
                i1["q_id"] = q_no;
                i1["a_image"] = null;
                i1["b_image"] = null;
                i1["c_image"] = null;
                i1["d_image"] = null;

                if (optACheck.Checked)
                {

                    HttpPostedFile a_img = optAimg.PostedFile;

                    string a_filename = Path.GetFileName(a_img.FileName);
                    string a_fileextension = Path.GetExtension(a_filename);
                    int a_filesize = a_img.ContentLength;

                    if (a_fileextension.ToLower() == ".jpg" || a_fileextension.ToLower() == ".bmp" || a_fileextension.ToLower() == ".gif" || a_fileextension.ToLower() == ".png" || a_fileextension.ToLower() == ".jpeg")
                    {
                        Stream stream = a_img.InputStream;
                        BinaryReader binaryReader = new BinaryReader(stream);
                        byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                        i1["a_image"] = bytes;
                    }
                    else
                    {
                        image_errror_lbl0.Visible = true;
                        image_errror_lbl0.Text = "Only images (.jpg, .png, .bmp, .jpeg) can be uploaded";
                        image_errror_lbl0.ForeColor = System.Drawing.Color.Red;
                        return;
                    }
                }
                if (optBCheck.Checked)
                {
                    HttpPostedFile b_img = optBimg.PostedFile;

                    string b_filename = Path.GetFileName(b_img.FileName);
                    string b_fileextension = Path.GetExtension(b_filename);
                    int b_filesize = b_img.ContentLength;
                    if (b_fileextension.ToLower() == ".jpg" || b_fileextension.ToLower() == ".bmp" || b_fileextension.ToLower() == ".gif" || b_fileextension.ToLower() == ".png" || b_fileextension.ToLower() == ".jpeg")
                    {
                        Stream stream = b_img.InputStream;
                        BinaryReader binaryReader = new BinaryReader(stream);
                        byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                        i1["b_image"] = bytes;
                    }
                    else
                    {
                        image_errror_lbl1.Visible = true;
                        image_errror_lbl1.Text = "Only images (.jpg, .png, .bmp, .jpeg) can be uploaded";
                        image_errror_lbl1.ForeColor = System.Drawing.Color.Red;
                        return;
                    }
                }
                if (optCCheck.Checked)
                {
                    HttpPostedFile c_img = optCimg.PostedFile;

                    string c_filename = Path.GetFileName(c_img.FileName);
                    string c_fileextension = Path.GetExtension(c_filename);
                    int c_filesize = c_img.ContentLength;
                    if (c_fileextension.ToLower() == ".jpg" || c_fileextension.ToLower() == ".bmp" || c_fileextension.ToLower() == ".gif" || c_fileextension.ToLower() == ".png" || c_fileextension.ToLower() == ".jpeg")
                    {
                        Stream stream = c_img.InputStream;
                        BinaryReader binaryReader = new BinaryReader(stream);
                        byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                        i1["c_image"] = bytes;
                    }
                    else
                    {
                        image_errror_lbl2.Visible = true;
                        image_errror_lbl2.Text = "Only images (.jpg, .png, .bmp, .jpeg) can be uploaded";
                        image_errror_lbl2.ForeColor = System.Drawing.Color.Red;
                        return;
                    }
                }
                if (optDCheck.Checked)
                {
                    HttpPostedFile d_img = optDimg.PostedFile;

                    string d_filename = Path.GetFileName(d_img.FileName);
                    string d_fileextension = Path.GetExtension(d_filename);
                    int d_filesize = d_img.ContentLength;
                    if (d_fileextension.ToLower() == ".jpg" || d_fileextension.ToLower() == ".bmp" || d_fileextension.ToLower() == ".gif" || d_fileextension.ToLower() == ".png" || d_fileextension.ToLower() == ".jpeg")
                    {
                        Stream stream = d_img.InputStream;
                        BinaryReader binaryReader = new BinaryReader(stream);
                        byte[] bytes = binaryReader.ReadBytes((int)stream.Length);
                        i1["d_image"] = bytes;
                    }
                    else
                    {
                        image_errror_lbl3.Visible = true;
                        image_errror_lbl3.Text = "Only images (.jpg, .png, .bmp, .jpeg) can be uploaded";
                        image_errror_lbl3.ForeColor = System.Drawing.Color.Red;
                        return;
                    }
                }
                mcq_image.Rows.Add(i1);
            }
            //set question to datatable

            //question
            DataRow q1 = qtable.NewRow();
            q1["test_id"] = test_id;
            q1["section_no"] = Convert.ToInt32(Session["section"].ToString());
            q1["q_id"] = q_no;
            q1["subject_id"] = Convert.ToInt32(Session["subject_id"].ToString()); ;
            q1["question"] = question.Text;
            q1["type"] = (qtype.SelectedItem.Text == "MCQ") ? 0 : 1;
            q1["has_image"] = q_image_checkbox.Checked ? 1 : 0;
            qtable.Rows.Add(q1);

            if (qtype.SelectedItem.Value.Equals("1"))
            {
                //mcq
                DataRow m1 = mcq_table.NewRow();
                m1["test_id"] = test_id;
                m1["section_no"] = Convert.ToInt32(Session["section"].ToString());
                m1["q_id"] = q_no;
                m1["A"] = txt_optionone.Text;
                m1["B"] = txt_optiontwo.Text;
                m1["C"] = txt_optionthree.Text;
                m1["D"] = txt_optionfour.Text;
                m1["answer"] = 64 + Convert.ToInt32(rdo_correctanswer.SelectedItem.Value);
                m1["has_image"] = 0;
                mcq_table.Rows.Add(m1);
            }
            else
            {
                //fill in blank
                DataRow f1 = fill_blank.NewRow();
                f1["test_id"] = test_id;
                f1["section_no"] = Convert.ToInt32(Session["section"].ToString());
                f1["q_id"] = q_no;
                f1["answer"] = blank_ans.Text;
                fill_blank.Rows.Add(f1);
            }

            Label1.Text = "Question no. " + q_no + " added...";
            q_no++;
            question_no_label.Text = "Question " + q_no;
            Label1.Visible = true;
            total_q++;
        }

        protected void test_submit_btn_Click(object sender, EventArgs e)
        {
            //submit test
            int a = Convert.ToInt32(marks_input.Text);
            marks = marks + a * (q_no - 1);
            nmarks = nmarks + float.Parse(negative_list.SelectedItem.Value) * (q_no - 1) * a;
            Test test = (Test)Session["test"];

            DataRow t1 = test_table.NewRow();
            t1["test_id"] = test_id;
            t1["name"] = test.name;
            t1["subject"] = test.subject;
            t1["duration"] = test.duration;
            t1["sections"] = test.sections;
            t1["total_marks"] = marks;
            t1["-ve marks"] = nmarks;
            t1["added_date"] = DateTime.Now;
            t1["description"] = test.descripetion;
            t1["teacher_id"] = test.teacher_id;
            test_table.Rows.Add(t1);

            //entry for test_section table
            DataRow ts1 = test_section.NewRow();
            ts1["test_id"] = test_id;
            ts1["section_no"] = int.Parse(Session["section"].ToString());
            ts1["marks_per_q"] = Convert.ToInt32(marks_input.Text);
            ts1["nmarks"] = float.Parse(negative_list.SelectedItem.Value);
            test_section.Rows.Add(ts1);

            string consString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            //question
            using (SqlConnection con = new SqlConnection(consString))
            {
                using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                {
                    //Set the database table name
                    sqlBulkCopy.DestinationTableName = "dbo.Question";

                    //[OPTIONAL]: Map the DataTable columns with that of the database table
                    sqlBulkCopy.ColumnMappings.Add("test_id", "test_id");
                    sqlBulkCopy.ColumnMappings.Add("section_no", "section_no");
                    sqlBulkCopy.ColumnMappings.Add("q_id", "q_id");
                    sqlBulkCopy.ColumnMappings.Add("subject_id", "subject_id");
                    sqlBulkCopy.ColumnMappings.Add("question", "question");
                    sqlBulkCopy.ColumnMappings.Add("type", "type");
                    sqlBulkCopy.ColumnMappings.Add("has_image", "has_image");
                    con.Open();
                    sqlBulkCopy.WriteToServer(qtable);
                    con.Close();
                }
            }
            //mcq
            using (SqlConnection con = new SqlConnection(consString))
            {
                using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                {
                    //Set the database table name
                    sqlBulkCopy.DestinationTableName = "dbo.mcq";

                    //[OPTIONAL]: Map the DataTable columns with that of the database table

                    sqlBulkCopy.ColumnMappings.Add("test_id", "test_id");
                    sqlBulkCopy.ColumnMappings.Add("section_no", "section_no");
                    sqlBulkCopy.ColumnMappings.Add("q_id", "q_id");
                    sqlBulkCopy.ColumnMappings.Add("A", "A");
                    sqlBulkCopy.ColumnMappings.Add("B", "B");
                    sqlBulkCopy.ColumnMappings.Add("C", "C");
                    sqlBulkCopy.ColumnMappings.Add("D", "D");
                    sqlBulkCopy.ColumnMappings.Add("answer", "answer");
                    sqlBulkCopy.ColumnMappings.Add("has_image", "has_image");
                    con.Open();
                    sqlBulkCopy.WriteToServer(mcq_table);
                    con.Close();
                }
            }
            //fill_in_blank
            using (SqlConnection con = new SqlConnection(consString))
            {
                using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                {
                    //Set the database table name
                    sqlBulkCopy.DestinationTableName = "dbo.fill_in_blank";

                    //[OPTIONAL]: Map the DataTable columns with that of the database table

                    sqlBulkCopy.ColumnMappings.Add("test_id", "test_id");
                    sqlBulkCopy.ColumnMappings.Add("section_no", "section_no");
                    sqlBulkCopy.ColumnMappings.Add("q_id", "q_id");
                    sqlBulkCopy.ColumnMappings.Add("answer", "answer");
                    con.Open();
                    sqlBulkCopy.WriteToServer(fill_blank);
                    con.Close();
                }
            }
            //test
            using (SqlConnection con = new SqlConnection(consString))
            {
                using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                {
                    //Set the database table name
                    sqlBulkCopy.DestinationTableName = "dbo.Test";

                    //[OPTIONAL]: Map the DataTable columns with that of the database table

                    sqlBulkCopy.ColumnMappings.Add("test_id", "test_id");
                    sqlBulkCopy.ColumnMappings.Add("name", "name");
                    sqlBulkCopy.ColumnMappings.Add("subject", "subject");
                    sqlBulkCopy.ColumnMappings.Add("duration", "duration");
                    sqlBulkCopy.ColumnMappings.Add("sections", "sections");
                    sqlBulkCopy.ColumnMappings.Add("total_marks", "total_marks");
                    sqlBulkCopy.ColumnMappings.Add("-ve marks", "negative_marks");
                    sqlBulkCopy.ColumnMappings.Add("added_date", "added_date");
                    sqlBulkCopy.ColumnMappings.Add("description", "description");
                    sqlBulkCopy.ColumnMappings.Add("teacher_id", "teacher_id");
                    con.Open();
                    sqlBulkCopy.WriteToServer(test_table);
                    con.Close();
                }
            }
            //test_section
            using (SqlConnection con = new SqlConnection(consString))
            {
                using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                {
                    //Set the database table name
                    sqlBulkCopy.DestinationTableName = "dbo.Test_Section";

                    //[OPTIONAL]: Map the DataTable columns with that of the database table

                    sqlBulkCopy.ColumnMappings.Add("test_id", "test_id");
                    sqlBulkCopy.ColumnMappings.Add("section_no", "section_no");
                    sqlBulkCopy.ColumnMappings.Add("marks_per_q", "marks_per_question");
                    sqlBulkCopy.ColumnMappings.Add("nmarks", "negative_marks");
                    con.Open();
                    sqlBulkCopy.WriteToServer(test_section);
                    con.Close();
                }
            }
            //question_image
            using (SqlConnection con = new SqlConnection(consString))
            {
                using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                {
                    //Set the database table name
                    sqlBulkCopy.DestinationTableName = "dbo.question_image";

                    //[OPTIONAL]: Map the DataTable columns with that of the database table

                    sqlBulkCopy.ColumnMappings.Add("test_id", "test_id");
                    sqlBulkCopy.ColumnMappings.Add("section_no", "section_no");
                    sqlBulkCopy.ColumnMappings.Add("q_id", "q_id");
                    sqlBulkCopy.ColumnMappings.Add("image", "image");
                    con.Open();
                    sqlBulkCopy.WriteToServer(q_image);
                    con.Close();
                }
            }
            //mcq_image
            using (SqlConnection con = new SqlConnection(consString))
            {
                using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                {
                    //Set the database table name
                    sqlBulkCopy.DestinationTableName = "dbo.mcq_image";

                    //[OPTIONAL]: Map the DataTable columns with that of the database table

                    sqlBulkCopy.ColumnMappings.Add("test_id", "test_id");
                    sqlBulkCopy.ColumnMappings.Add("section_no", "section_no");
                    sqlBulkCopy.ColumnMappings.Add("q_id", "q_id");
                    sqlBulkCopy.ColumnMappings.Add("a_image", "a_image");
                    sqlBulkCopy.ColumnMappings.Add("b_image", "b_image");
                    sqlBulkCopy.ColumnMappings.Add("c_image", "c_image");
                    sqlBulkCopy.ColumnMappings.Add("d_image", "d_image");
                    con.Open();
                    sqlBulkCopy.WriteToServer(mcq_image);
                    con.Close();
                }
            }
            //test summary
            MultiView2.ActiveViewIndex = 2;
            test_id_lbl.Text = test_id.ToString();
            test_name_lbl.Text = test.name;
            no_of_q_lbl.Text = total_q.ToString();
            total_marks_lbl.Text = marks.ToString();
            duration_lbl.Text = test.duration.ToString();
            desc_lbl.Text = test.descripetion;
        }
    }
}