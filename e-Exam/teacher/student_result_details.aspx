<%@ Page Title="" Language="C#" MasterPageFile="~/teacher.Master" AutoEventWireup="true" CodeBehind="student_result_details.aspx.cs" Inherits="e_Exam.teacher.student_result_details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <br>
            <br>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ExamDB %>" SelectCommand="SELECT Question.test_id, Question.section_no, Question.q_id, Question.question, Question.type, mcq.A, mcq.B, mcq.C, mcq.D, mcq.answer, fill_in_blank.answer AS blank_answer, Test_Section.marks_per_question, Test_Section.negative_marks, Question.has_image, mcq.has_image AS mcq_image, student_question_answer.mcq, student_question_answer.blank, student_question_answer.correct, student_question_answer.attempt FROM Question INNER JOIN Test_Section ON Question.test_id = Test_Section.test_id AND Question.section_no = Test_Section.section_no INNER JOIN student_question_answer ON Question.test_id = student_question_answer.test_id AND Question.section_no = student_question_answer.section_no AND Question.q_id = student_question_answer.q_id LEFT OUTER JOIN mcq ON Question.test_id = mcq.test_id AND Question.section_no = mcq.section_no AND Question.q_id = mcq.q_id LEFT OUTER JOIN fill_in_blank ON Question.test_id = fill_in_blank.test_id AND Question.section_no = fill_in_blank.section_no AND Question.q_id = fill_in_blank.q_id WHERE (Question.test_id = @test_id) AND (student_question_answer.student_id = @sid) ORDER BY Question.section_no, Question.q_id">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="test_id" SessionField="test_id" Type="Int32" />
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
</asp:Content>
