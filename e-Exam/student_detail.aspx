<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="student_detail.aspx.cs" Inherits="e_Exam.student_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .class1 {
            text-align: left;
            width: 50%;
        }

        .class2 {
            text-align: right;
            width: 50%;
        }

        .class3 {
            text-align: center;
            width: 10%;
        }

        .class4 {
            text-align: center;
            width: 100%;
        }
        .auto-style1 {
            padding-right: 10px;
        }
        .auto-style2 {
            width: 70%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <br />
                <table>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label12" runat="server" Text="Department" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                        </td>
                        <td class="auto-style2">
                            <asp:DropDownList ID="dddepartment" runat="server" AutoPostBack="true" CssClass="form-control" AppendDataBoundItems="false" OnSelectedIndexChanged="department_changed">
                                <asp:ListItem Text="All" Value="All"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="name" Width="100%" OnRowCommand="detail" CssClass="table table-striped table-sm" AllowPaging="True" AllowSorting="True">
                    <Columns>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Department">
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%#Eval("dept_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Option">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("student_id") %>'>detail</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        No data found
                    </EmptyDataTemplate>
                </asp:GridView>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <br />
                <asp:Label ID="Label8" runat="server" Text="NAME:" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                <asp:Label ID="Label7" runat="server" Text="Label" Font-Size="X-Large"></asp:Label>
                <br />
                <asp:Label ID="Label11" runat="server"></asp:Label>
                <br />
                <br />
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" Width="100%" DataKeyNames="name" CssClass="table table-striped table-sm" AllowPaging="True" AllowSorting="True">
                    <Columns>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Subject">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%#Eval("subject") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total marks">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%#Eval("total_marks") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Obtained marks">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%#Eval("marks") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%#Eval("date") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        No data found
                    </EmptyDataTemplate>
                </asp:GridView>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
