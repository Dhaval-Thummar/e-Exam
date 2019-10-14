
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
        .div1{
            text-align:center;
        }
        .auto-style1 {
            height: 30px;
            width: 110px;
        }

        .auto-style2 {
            width: 220px;
        }
        .div2{
            margin-top:40px;
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
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-sm"  DataKeyNames="test_id" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand">
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
            <asp:Repeater ID="Repeater1" runat="server"  OnItemDataBound="Repeater1_ItemDataBound" Visible="True">

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
                        <asp:Image ID="q_image" runat="server" CssClass="opt-image" />
                    </asp:Panel>
                    <asp:HiddenField ID="hidden_section" runat="server" Value='<%# Eval("section_no") %>' />
                    <asp:HiddenField ID="hidden_qid" runat="server" Value='<%# Eval("q_id") %>' />
                    <asp:HiddenField ID="q_type" Value='<%#Eval("type") %>' runat="server" />
                    <asp:HiddenField ID="hidden_q_image" Value='<%#Eval("has_image") %>' runat="server" />
                    <asp:HiddenField ID="mcq_image" Value='<%#Eval("mcq_image") %>' runat="server" />
                    <br />
                    <asp:Label ID="lbl1" runat="server" Text=""></asp:Label>
                    <asp:Panel ID="mcq_panel" runat="server">
                        <asp:Label ID="Label4" runat="server" Text="A "></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="#FF0001" ControlToValidate="txtopt1"></asp:RequiredFieldValidator>
                        <asp:Label ID="opt1" Text='<%#Eval("A") %>' runat="server" />

                        <asp:Panel ID="optPnl1" runat="server" Visible="False">
                            <asp:Image ID="optImg1" runat="server" CssClass="opt-image" />
                        </asp:Panel>

                        <asp:TextBox ID="txtopt1" runat="server" Text='<%# Eval("A") %>' CssClass="form-control" Visible="False"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label8" runat="server" Text="B "></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="#FF0001" ControlToValidate="txtopt2"></asp:RequiredFieldValidator>
                        <asp:Label ID="opt2" Text='<%# Eval("B") %>' runat="server" />

                        <asp:Panel ID="optPnl2" runat="server" Visible="False">
                            <asp:Image ID="optImg2" runat="server" CssClass="opt-image"/>
                        </asp:Panel>

                        <asp:TextBox ID="txtopt2" runat="server" Text='<%# Eval("B") %>' CssClass="form-control" Visible="False"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label9" runat="server" Text="C "></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="#FF0001" ControlToValidate="txtopt3"></asp:RequiredFieldValidator>
                        <asp:Label ID="opt3" Text='<%# Eval("C") %>' runat="server" />

                        <asp:Panel ID="optPnl3" runat="server" Visible="False">
                            <asp:Image ID="optImg3" runat="server" CssClass="opt-image"/>
                        </asp:Panel>

                        <asp:TextBox ID="txtopt3" runat="server" Text='<%# Eval("C") %>' CssClass="form-control" Visible="False"></asp:TextBox>
                        <br />
                        <asp:Label ID="Label10" runat="server" Text="D "></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="#FF0001" ControlToValidate="txtopt4"></asp:RequiredFieldValidator>
                        <asp:Label ID="opt4" Text='<%#Eval("D") %>' runat="server" />

                        <asp:Panel ID="optPnl4" runat="server" Visible="False">
                            <asp:Image ID="optImg4" runat="server" CssClass="opt-image"/>
                        </asp:Panel>

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
                    <hr />
                </ItemTemplate>
            </asp:Repeater>
        </asp:View>
    </asp:MultiView>
</asp:Content>
