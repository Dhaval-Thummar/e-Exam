<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="e_Exam.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 50%;
            margin:60px auto;
        }
        .auto-style2 {
            width:40%;
            height: 50px;
            text-align:right;
        }
        .auto-style3 {
            width:60%;
            height: 50px;
            text-align:left;
        }
      
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <div align ="center">
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Registration Page" Font-Bold="True" Font-Size="XX-Large" ForeColor="#6699FF"></asp:Label>
            </div>
    <table class="auto-style1" style="background-color: #ffffff; filter: alpha(opacity=40); opacity: 0.95;border:2px black dashed;">
        <tr>
            <td class="auto-style2">
                <asp:Label ID="name_label" runat="server" Text="Name:"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="name_input" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </form>
    </body>
</html>
