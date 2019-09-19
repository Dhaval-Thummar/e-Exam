using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace e_Exam
{
    public class Test
    {
        public int test_id;
        public String name;
        public String subject;
        public bool has_duration;
        public int duration;
        public int sections;
        public int total_marks;
        public int negative_marks;
        public String descripetion;
        public int teacher_id;

        public Test()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            SqlCommand cmd = new SqlCommand("select max(test_id) from Test", con);
            con.Open();
            object result = cmd.ExecuteScalar();
            con.Close();
            result = (result == DBNull.Value) ? null : result;
            test_id = Convert.ToInt32(result);
            test_id++;
            has_duration = false;
        }
    }
}