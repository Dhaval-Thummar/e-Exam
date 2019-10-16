<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="result.aspx.cs" Inherits="e_Exam.result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .table1 {
            margin: 50px auto;
            text-align: center;
            font-size: 20px;
            margin-bottom: 1rem;
            color: #212529;
            border: 1px solid #dee2e6;
        }

        .div1 {
            text-align: center;
        }

        .auto-style1 {
            height: 30px;
            width: 110px;
        }

        .auto-style2 {
            width: 220px;
        }

        .div2 {
            margin-top: 40px;
        }

        .opt-image {
            height: 200px;
            width: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExamDB %>" SelectCommand="SELECT Test.test_id, Test.name, Test.subject, Test.duration, Test.sections, Test.total_marks, student_result.marks, student_result.date FROM Test INNER JOIN student_result ON Test.test_id = student_result.test_id WHERE (Test.test_id IN (SELECT Test_id FROM test_taken WHERE (student_id = @studentID) AND (has_taken = 1)))">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="studentID" SessionField="studentID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div class="div2">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-sm" DataKeyNames="test_id" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="test_id" HeaderText="Test ID" ReadOnly="True" SortExpression="test_id" />
                        <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                        <asp:BoundField DataField="subject" HeaderText="Subject" SortExpression="subject" />
                        <asp:BoundField DataField="duration" HeaderText="Duration" SortExpression="duration" />
                        <asp:BoundField DataField="sections" HeaderText="Sections" SortExpression="sections" />
                        <asp:BoundField DataField="total_marks" HeaderText="Total Marks" SortExpression="total_marks" />
                        <asp:BoundField DataField="marks" HeaderText="Obtain Marks" SortExpression="marks" />
                        <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" CommandArgument='<%#Eval("test_id") %>' runat="server">Details</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <br>
            <br>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ExamDB %>" SelectCommand="SELECT Question.test_id, Question.section_no, Question.q_id, Question.question, Question.type, mcq.A, mcq.B, mcq.C, mcq.D, mcq.answer, fill_in_blank.answer AS blank_answer, Test_Section.marks_per_question, Test_Section.negative_marks, Question.has_image, mcq.has_image AS mcq_image, student_question_answer.mcq, student_question_answer.blank, student_question_answer.correct, student_question_answer.attempt FROM Question INNER JOIN Test_Section ON Question.test_id = Test_Section.test_id AND Question.section_no = Test_Section.section_no INNER JOIN student_question_answer ON Question.test_id = student_question_answer.test_id AND Question.section_no = student_question_answer.section_no AND Question.q_id = student_question_answer.q_id LEFT OUTER JOIN mcq ON Question.test_id = mcq.test_id AND Question.section_no = mcq.section_no AND Question.q_id = mcq.q_id LEFT OUTER JOIN fill_in_blank ON Question.test_id = fill_in_blank.test_id AND Question.section_no = fill_in_blank.section_no AND Question.q_id = fill_in_blank.q_id WHERE (Question.test_id = @test_id) AND (student_question_answer.student_id = @sid) ORDER BY Question.section_no, Question.q_id">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="test_id" SessionField="tid" Type="Int32" />
                    <asp:SessionParameter DefaultValue="0" Name="sid" SessionField="studentID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2" OnItemDataBound="Repeater1_ItemDataBound" Visible="True">
                <ItemTemplate>
                    <div class="div1">
                        <asp:Panel ID="Panel1" runat="server">
                            <asp:Label ID="section" runat="server" Text='<%# "Section " + Eval("section_no") %>' Font-Bold="True" Font-Size="22px"></asp:Label>
                            <br />
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("marks_per_question") +" Marks Per Question ,"%>'>
                            </asp:Label><asp:Label ID="Label7" runat="server" Text='<%# "Negative Marks = " + Eval("negative_marks") %>'></asp:Label>
                        </asp:Panel>
                    </div>
                    <br />
                    <asp:Label ID="Label3" runat="server" Text='<%# "Q." + Eval("q_id") %>'></asp:Label>
                    <asp:Label ID="lblQuestion" runat="server" Text='<%# " " + Eval("question") %>'></asp:Label>

                    <asp:Panel ID="Panel2" runat="server" Visible="False">
                        <asp:Image ID="q_image" runat="server" CssClass="opt-image" />
                    </asp:Panel>
                    <asp:HiddenField ID="hidden_section" runat="server" Value='<%# Eval("section_no") %>' />
                    <asp:HiddenField ID="hidden_qid" runat="server" Value='<%# Eval("q_id") %>' />
                    <asp:HiddenField ID="q_type" Value='<%#Eval("type") %>' runat="server" />
                    <asp:HiddenField ID="hidden_q_image" Value='<%#Eval("has_image") %>' runat="server" />
                    <asp:HiddenField ID="mcq_image" Value='<%#Eval("mcq_image") %>' runat="server" />
                    <asp:HiddenField ID="correct" Value='<%#Eval("correct") %>' runat="server" />
                    <asp:HiddenField ID="attempt" Value='<%#Eval("attempt") %>' runat="server" />
                    <asp:HiddenField ID="mcq" Value='<%#Eval("answer") %>' runat="server" />
                    <asp:HiddenField ID="blank" Value='<%#Eval("blank_answer") %>' runat="server" />
                    <br />
                    <asp:Label ID="lbl1" runat="server" Text=""></asp:Label>
                    <asp:Panel ID="mcq_panel" runat="server">
                        <asp:Label ID="Label4" runat="server" Text="A. "></asp:Label>
                        <asp:Label ID="opt1" Text='<%#Eval("A") %>' runat="server" />
                        <br />
                        <asp:Panel ID="optPnl1" runat="server" Visible="False">
                            <asp:Image ID="optImg1" runat="server" CssClass="opt-image" />
                        </asp:Panel>

                        <asp:Label ID="Label8" runat="server" Text="B. "></asp:Label>
                        <asp:Label ID="opt2" Text='<%# Eval("B") %>' runat="server" />
                        <br />
                        <asp:Panel ID="optPnl2" runat="server" Visible="False">
                            <asp:Image ID="optImg2" runat="server" CssClass="opt-image" />
                        </asp:Panel>


                        <asp:Label ID="Label9" runat="server" Text="C. "></asp:Label>
                        <asp:Label ID="opt3" Text='<%# Eval("C") %>' runat="server" />
                        <br />
                        <asp:Panel ID="optPnl3" runat="server" Visible="False">
                            <asp:Image ID="optImg3" runat="server" CssClass="opt-image" />
                        </asp:Panel>

                        <asp:Label ID="Label10" runat="server" Text="D. "></asp:Label>
                        <asp:Label ID="opt4" Text='<%#Eval("D") %>' runat="server" />
                        <br />
                        <asp:Panel ID="optPnl4" runat="server" Visible="False">
                            <asp:Image ID="optImg4" runat="server" CssClass="opt-image" />
                        </asp:Panel>

                        <asp:Label ID="Label11" runat="server" Text="Your Ans: "></asp:Label>
                        <asp:Label ID="lblMcq" runat="server" Text='<%# Eval("mcq") %>'></asp:Label>
                        <br />
                        <asp:Label ID="correct_ans_mcq" runat="server" Text="" Visible="False"></asp:Label>
                        <br />
                        <asp:Label ID="correct_mcq" runat="server" Text="" Visible="false" Font-Bold="True"></asp:Label>
                    </asp:Panel>
                    <asp:Panel ID="fill_in_blank_panel" runat="server">
                        <asp:Label ID="Label12" runat="server" Text="Your Ans: "></asp:Label>
                        <asp:Label ID="lblBlank" runat="server" Text='<%# Eval("blank") %>'></asp:Label>
                        <br />
                        <asp:Label ID="correct_ans_blank" runat="server" Text="" Visible="False"></asp:Label>
                        <br />
                        <asp:Label ID="correct_blank" runat="server" Text="" Visible="false" Font-Bold="True"></asp:Label>
                    </asp:Panel>
                    <hr />
                </ItemTemplate>
            </asp:Repeater>
        </asp:View>
    </asp:MultiView>
</asp:Content>
