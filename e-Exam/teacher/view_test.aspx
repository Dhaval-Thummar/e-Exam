<%@ Page Title="" Language="C#" MasterPageFile="~/teacher.Master" AutoEventWireup="true" CodeBehind="view_test.aspx.cs" Inherits="e_Exam.view_test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .div1{
            padding:10px 20px 0px 10px; 
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12">
        <div class="card">

        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExamDB %>" SelectCommand="SELECT [test_id], [name], [subject], [duration], [sections], [total_marks], [negative_marks], [added_date], [description] FROM [Test] WHERE ([teacher_id] = @teacher_id)">
        <SelectParameters>
            <asp:SessionParameter Name="teacher_id" SessionField="teacherID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="div1">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-sm" DataKeyNames="test_id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="test_id" HeaderText="test_id" ReadOnly="True" SortExpression="test_id" />
            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
            <asp:BoundField DataField="subject" HeaderText="Subject" SortExpression="subject" />
            <asp:BoundField DataField="duration" HeaderText="Duration" SortExpression="duration" />
            <asp:BoundField DataField="sections" HeaderText="Total Sections" SortExpression="sections" />
            <asp:BoundField DataField="total_marks" HeaderText="Total Marks" SortExpression="total_marks" />
            <asp:BoundField DataField="negative_marks" HeaderText="Negative Marks" SortExpression="negative_marks" />
            <asp:BoundField DataField="added_date" HeaderText="Added Date" SortExpression="added_date" DataFormatString="{0:d}" />
            <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
        </Columns>
    </asp:GridView>
    </div>
</asp:Content>
