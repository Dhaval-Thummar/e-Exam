<%@ Page Title="" Language="C#" MasterPageFile="~/teacher.Master" AutoEventWireup ="true" CodeBehind="test_result_teacher.aspx.cs" Inherits="e_Exam.teacher.test_result_teacher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .div1 {
            padding: 10px 20px 0px 10px;
        }
        .auto-style1 {
            font-size: xx-large;
            color: #0099CC;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <span class="auto-style1"><center><strong>RESULT</strong></center></span><br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExamDB %>" SelectCommand="SELECT test_id, name, subject, total_marks FROM Test WHERE (teacher_id = @teacher_id)" DeleteCommand="DELETE FROM [Test] WHERE [test_id] = @test_id" InsertCommand="INSERT INTO [Test] ([test_id], [name], [subject], [duration], [sections], [total_marks], [added_date]) VALUES (@test_id, @name, @subject, @duration, @sections, @total_marks, @added_date)" UpdateCommand="UPDATE [Test] SET [name] = @name, [subject] = @subject, [duration] = @duration, [sections] = @sections, [total_marks] = @total_marks, [added_date] = @added_date WHERE [test_id] = @test_id">
        
        <SelectParameters>
            <asp:SessionParameter Name="teacher_id" SessionField="teacherID" Type="String" DefaultValue="0" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="div1">
        <center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="onrowcommand" CssClass="table table-striped table-sm" DataKeyNames="test_id" DataSourceID="SqlDataSource1" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" Width="576px">
            <Columns>
                <asp:BoundField DataField="test_id" HeaderText="Test ID" ReadOnly="True" SortExpression="test_id" ItemStyle-Width="5%">
                </asp:BoundField>
                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                <asp:BoundField DataField="subject" HeaderText="Subject" SortExpression="subject" />
                <asp:BoundField DataField="total_marks" HeaderText="Total Marks" SortExpression="total_marks" />
                <asp:TemplateField HeaderText="Details" ItemStyle-Width="10%">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("test_id") %>' >Details</asp:LinkButton>   
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataRowStyle CssClass="alert alert-primary" VerticalAlign="Middle" />
            <EmptyDataTemplate>
                <div class="alert alert-danger" role="alert">
                    No any test found!
                </div>
            </EmptyDataTemplate>
        </asp:GridView>
        </center>
    </div>
</asp:Content>
