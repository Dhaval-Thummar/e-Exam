<%@ Page Title="" Language="C#" MasterPageFile="~/teacher.Master" AutoEventWireup="true" CodeBehind="test_details.aspx.cs" Inherits="e_Exam.test_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .div1 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExamDB %>" SelectCommand="SELECT * FROM [Test] WHERE ([test_id] = @test_id)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="test_id" QueryStringField="tid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <br />
            <div class="card mx-auto w-50" style="width: 18rem">
                <div class="card-header">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="25px"></asp:Label>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <asp:Label ID="test_subject" runat="server" Text=""></asp:Label>
                    </li>
                    <li class="list-group-item">
                        <asp:Label ID="duration" runat="server" Text=""></asp:Label>
                    </li>
                    <li class="list-group-item">
                        <asp:Label ID="marks" runat="server" Text=""></asp:Label>
                    </li>
                    <li class="list-group-item">
                        <asp:Label ID="nmarks" runat="server" Text=""></asp:Label>
                    </li>
                    <li class="list-group-item">
                        <asp:Label ID="added_date" runat="server" Text=""></asp:Label>
                    </li>
                    <li class="list-group-item">
                        <asp:Label ID="times_taken" runat="server" Text=""></asp:Label>
                    </li>
                    <li class="list-group-item">
                        <asp:Label ID="desc" runat="server" Text=""></asp:Label>
                    </li>
                    <li class="list-group-item div1">
                        <asp:Button ID="view_question" runat="server" Text="Questions" CssClass="btn btn-outline-primary" OnClick="view_question_Click" />
                    </li>
                </ul>
            </div>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ExamDB %>" SelectCommand="SELECT Question.test_id, Question.section_no, Question.q_id, Question.question, Question.type, mcq.A, mcq.B, mcq.C, mcq.D, mcq.answer, fill_in_blank.answer AS blank_answer, Test_Section.marks_per_question, Test_Section.negative_marks, Question.has_image, mcq.has_image AS Expr1 FROM Question INNER JOIN Test_Section ON Question.test_id = Test_Section.test_id AND Question.section_no = Test_Section.section_no LEFT OUTER JOIN mcq ON Question.test_id = mcq.test_id AND Question.section_no = mcq.section_no AND Question.q_id = mcq.q_id LEFT OUTER JOIN fill_in_blank ON Question.test_id = fill_in_blank.test_id AND Question.section_no = fill_in_blank.section_no AND Question.q_id = fill_in_blank.q_id WHERE (Question.test_id = @test_id)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="test_id" QueryStringField="tid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" GridLines="None">
            </asp:GridView>
            <asp:Repeater ID="Repeater1" runat="server" OnItemCreated="Repeater1_ItemCreated" OnItemDataBound="Repeater1_ItemDataBound" DataSourceID="SqlDataSource2" Visible="True">

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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="#FF0001" ControlToValidate="txtQuestion"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblQuestion" runat="server" Text='<%# " " + Eval("question") %>'></asp:Label>
                    <asp:TextBox ID="txtQuestion" runat="server" Text='<%# Eval("question") %>' Visible="False" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                    <asp:Panel ID="Panel2" runat="server" Visible="False">
                        <asp:Image ID="q_image" runat="server" Height="400px" Width="400px" />
                    </asp:Panel>
                    <asp:HiddenField ID="hidden_section" runat="server" Value='<%# Eval("section_no") %>' />
                    <asp:HiddenField ID="hidden_qid" runat="server" Value='<%# Eval("q_id") %>' />
                    <asp:HiddenField ID="q_type" Value='<%#Eval("type") %>' runat="server" />
                    <asp:HiddenField ID="hidden_q_image" Value='<%#Eval("has_image") %>' runat="server" />
                    <br />
                    <asp:Label ID="lbl1" runat="server" Text=""></asp:Label>
                    <asp:Panel ID="mcq_panel" runat="server">
                        <asp:Label ID="Label4" runat="server" Text="A "></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="#FF0001" ControlToValidate="txtopt1"></asp:RequiredFieldValidator>
                        <asp:Label ID="opt1" Text='<%#Eval("A") %>' runat="server" />
                        <asp:TextBox ID="txtopt1" runat="server" Text='<%# Eval("A") %>' CssClass="form-control" Visible="False"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label8" runat="server" Text="B "></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="#FF0001" ControlToValidate="txtopt2"></asp:RequiredFieldValidator>
                        <asp:Label ID="opt2" Text='<%# Eval("B") %>' runat="server" />
                        <asp:TextBox ID="txtopt2" runat="server" Text='<%# Eval("B") %>' CssClass="form-control" Visible="False"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label9" runat="server" Text="C "></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="#FF0001" ControlToValidate="txtopt3"></asp:RequiredFieldValidator>
                        <asp:Label ID="opt3" Text='<%# Eval("C") %>' runat="server" />
                        <asp:TextBox ID="txtopt3" runat="server" Text='<%# Eval("C") %>' CssClass="form-control" Visible="False"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label10" runat="server" Text="D "></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="#FF0001" ControlToValidate="txtopt4"></asp:RequiredFieldValidator>
                        <asp:Label ID="opt4" Text='<%#Eval("D") %>' runat="server" />
                        <asp:TextBox ID="txtopt4" runat="server" Text='<%# Eval("D") %>' CssClass="form-control" Visible="False"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label11" runat="server" Text="Ans: "></asp:Label>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("answer") %>'></asp:Label>
                        <asp:RequiredFieldValidator ID="mcq_required" runat="server" ErrorMessage="*" ControlToValidate="rdo_correctanswer" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RadioButtonList ID="rdo_correctanswer" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="10" Visible="False">
                            <asp:ListItem Text="A" Value="1"></asp:ListItem>
                            <asp:ListItem Text="B" Value="2"></asp:ListItem>
                            <asp:ListItem Text="C" Value="3"></asp:ListItem>
                            <asp:ListItem Text="D" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:Panel>
                    <asp:Panel ID="fill_in_blank_panel" runat="server">
                        <asp:Label ID="Label12" runat="server" Text="Ans: "></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="#FF3300" ControlToValidate="txtBlank"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblBlank" runat="server" Text='<%# Eval("blank_answer") %>'></asp:Label>
                        <asp:TextBox ID="txtBlank" runat="server" Text='<%#  Eval("blank_answer") %>' CssClass="form-control" Visible="False"></asp:TextBox>
                    </asp:Panel>

                    <asp:LinkButton ID="btn_edit" runat="server" OnClick="OnEdit">Edit</asp:LinkButton>
                    <asp:LinkButton ID="btn_update" runat="server" OnClick="OnUpdate" Visible="False">Update</asp:LinkButton>
                    <asp:LinkButton ID="btn_cancel" runat="server" OnClick="OnCancel" Visible="False">Cancel</asp:LinkButton>
                    <asp:LinkButton ID="btn_delete" runat="server" OnClick="OnDelete" OnClientClick="return confirm('Do you want to delete this row?');">Delete</asp:LinkButton>
                    <hr />
                </ItemTemplate>
            </asp:Repeater>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <br />
            <div class="alert alert-danger" role="alert">
                <asp:Label ID="no_details" runat="server" Text="No details found!"></asp:Label>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
