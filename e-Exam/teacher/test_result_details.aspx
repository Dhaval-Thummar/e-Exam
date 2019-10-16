<%@ Page Title="TEST RESULT DETAILS" Language="C#" MasterPageFile="~/teacher.Master" AutoEventWireup="true" CodeBehind="test_result_details.aspx.cs" Inherits="e_Exam.teacher.test_result_details" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <center>
    <p class="auto-style1">
        <strong><span class="auto-style2"><span class="bg-white">TEST RESULT DETAILS</span></span></strong></p>
    </center>
    <br />

    <br />
    <table class="w-100">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" ></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" ></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label4" runat="server" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" ></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label6" runat="server" ></asp:Label>
            </td>
        </tr>
    </table>
    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExamDB %>" SelectCommand="SELECT [student_id], [marks], [date] FROM [student_result] WHERE ([test_id] = @test_id)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="test_id" QueryStringField="tid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <br />
    <center>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Width="542px">
        <Columns>
            <asp:BoundField DataField="student_id" HeaderText="student_id" SortExpression="student_id" />
            <asp:BoundField DataField="marks" HeaderText="marks" SortExpression="marks" />
            <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
            <asp:TemplateField HeaderText="Details" ItemStyle-Width="10%">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl='<%#"~/teacher/student_result_details.aspx?tid=" + Eval("student_id")%>'>Details</asp:LinkButton>   
                    </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </center>
        <br />
    <br />
    <br />
    <br />
    </asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
    .auto-style1 {
        font-size: xx-large;
    }
        .auto-style2 {
            color: #0099CC;
        }
    </style>
</asp:Content>


