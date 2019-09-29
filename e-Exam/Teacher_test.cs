using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace e_Exam
{
    public class Teacher_test
    {
        public int tid;
        public List<int> test_list;

        public Teacher_test(int tid)
        {
            test_list = new List<int>();
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ExamDB"].ConnectionString;
            SqlCommand cmd = new SqlCommand("select test_id  from Test where teacher_id="+tid, con);
            con.Open();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                   test_list.Add(reader.GetInt32(0)); // provided that first (0-index) column is int which you are looking for
                }
            }
        }
    }
}