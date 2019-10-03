<%@ Page Title="" Language="C#" MasterPageFile="~/teacher.Master" AutoEventWireup="true" CodeBehind="view_test.aspx.cs" Inherits="e_Exam.view_test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .div1 {
            padding: 10px 20px 0px 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExamDB %>" SelectCommand="SELECT [test_id], [name], [subject], [duration], [sections], [total_marks], [added_date] FROM [Test] WHERE ([teacher_id] = @teacher_id)" DeleteCommand="DELETE FROM [Test] WHERE [test_id] = @test_id" InsertCommand="INSERT INTO [Test] ([test_id], [name], [subject], [duration], [sections], [total_marks], [added_date]) VALUES (@test_id, @name, @subject, @duration, @sections, @total_marks, @added_date)" UpdateCommand="UPDATE [Test] SET [name] = @name, [subject] = @subject, [duration] = @duration, [sections] = @sections, [total_marks] = @total_marks, [added_date] = @added_date WHERE [test_id] = @test_id">
        <DeleteParameters>
            <asp:Parameter Name="test_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="test_id" Type="Int32" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="subject" Type="String" />
            <asp:Parameter Name="duration" Type="Int16" />
            <asp:Parameter Name="sections" Type="Byte" />
            <asp:Parameter Name="total_marks" Type="Int16" />
            <asp:Parameter Name="added_date" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="teacher_id" SessionField="teacherID" Type="String" DefaultValue="0" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="subject" Type="String" />
            <asp:Parameter Name="duration" Type="Int16" />
            <asp:Parameter Name="sections" Type="Byte" />
            <asp:Parameter Name="total_marks" Type="Int16" />
            <asp:Parameter Name="added_date" Type="DateTime" />
            <asp:Parameter Name="test_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="div1">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-sm" DataKeyNames="test_id" DataSourceID="SqlDataSource1" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="test_id" HeaderText="Test ID" ReadOnly="True" SortExpression="test_id" ItemStyle-Width="5%">
                    <ItemStyle Width="5%"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                <asp:BoundField DataField="subject" HeaderText="Subject" SortExpression="subject" />
                <asp:BoundField DataField="duration" HeaderText="Duration" SortExpression="duration" />
                <asp:BoundField DataField="sections" HeaderText="Sections" SortExpression="sections" />
                <asp:BoundField DataField="total_marks" HeaderText="Marks" SortExpression="total_marks" />
                <asp:BoundField DataField="added_date" HeaderText="Added Date" SortExpression="added_date" DataFormatString="{0:d}" />
                <asp:TemplateField HeaderText="Options" ItemStyle-Width="6%">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl='<%#"~/test_details.aspx?tid=" + Eval("test_id")%>'>Details</asp:LinkButton>
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
    </div>
</asp:Content>
