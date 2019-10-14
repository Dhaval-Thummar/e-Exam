<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_dashboard1.aspx.cs" Inherits="e_Exam.admin_dashboard11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .class1 {
            text-align: center;
        }

        .class2 {
            text-align: right;
        }

        .class3 {
            text-align: left;
        }
        .table1{
            margin:20px auto;

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div>
        <table class="table1">
            <tr>
                <td class="class2">
                    <asp:Label ID="Label1" runat="server" Text="Name:"></asp:Label>
                </td>
                <td class="class3">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox1" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="class2">
                    <asp:Label ID="Label4" runat="server" Text="Department:"></asp:Label>
                </td>
                <td class="class3">
                    <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td></td>
                <td class="class3">
                    <asp:TextBox ID="TextBox6" runat="server" Text="department"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="class2">
                    <asp:Label ID="Label6" runat="server" Text="Email id:"></asp:Label>
                </td>
                <td class="class3">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TextBox2" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Invalid Email ID" Font-Bold="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    &nbsp;
            <asp:Button ID="Button1" runat="server" Text="Verify" OnClick="Button1_Click"/>
                    <asp:Label ID="Label2" runat="server" ForeColor="#009900"></asp:Label>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" Text="OTP" Width="50%"></asp:TextBox>
                    <asp:Button ID="Button2" runat="server" Text="Verify" OnClick="Button2_Click" />
                    <asp:Label ID="Label7" runat="server" ForeColor="#009900"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="class2">
                    <asp:Label ID="Label3" runat="server" Text="Mobile no:"></asp:Label>
                </td>
                <td class="class3">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Invalid Mobile Number" Font-Bold="True" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            
            <tr>
                <td class="class2">
                    <asp:Label ID="Label5" runat="server" Text="password:"></asp:Label>
                </td>
                <td class="class3">
                    <asp:TextBox ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="class2">
                    <br />
                    <br />
                    <asp:Button ID="Button3" runat="server" Text="cancle" OnClick="Button3_Click"/>
                </td>
                <td class="class3">
                    <br />
                    <br />
                    <asp:Button ID="Button4" runat="server" Text="submitt" OnClick="Button4_Click" />
                    <asp:Label ID="Label8" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
