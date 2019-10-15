
﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_login.aspx.cs" Inherits="e_Exam.admin_login" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align:center;
            width: 25%;
           margin:150px auto;
        }
        .auto-style2{
            text-align:center;
        }
         .auto-style3{
            text-align:right;
        }
        .auto-style4 {
            text-align: right;
            height: 26px;
        }
        .auto-style5 {
            height: 26px;
        }

        .auto-style6 {
            text-align:center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1" style=" filter: alpha(opacity=40); opacity: 0.95;border:5px orange solid;">
            <tr>
                <td colspan="2" class="auto-style2">
                    <asp:Label ID="admin_label" runat="server" Text="Admin Login"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label1" runat="server" Text="User id:" ></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="user_textbox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">    
                    <asp:Label ID="password_label" runat="server" Text="Password:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="password_textbox" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6" colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                    <br />
                    <asp:Label ID="valid1" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style6"></td>
            </tr>
            <tr>
                <td class="auto-style6" colspan="2">
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" >forgot password</asp:LinkButton>
                    <br />
                    <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
