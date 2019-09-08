<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_dashboard.aspx.cs" Inherits="e_Exam.admin_dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 338px;
        }
        .auto-style2 {
            width: 100%;
            height: 263px;
        }
        .auto-style3 {
            text-align:center;
            height: 45px;
            width: 387px;
        }
        .auto-style4 {
            height: 45px;
        }
        .auto-style5 {
            width: 33%;
        }
    </style>
</head>
<body style="height: 346px">
    <form id="form1" runat="server" class="auto-style1">
       
        <table class="auto-style2">
            <tr>
                <td class="auto-style4"></td>
                <td class="auto-style3">
                    <asp:Label ID="admin_label" runat="server" Text="Admin" Font-Size="XX-Large"></asp:Label>
                </td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="t_count_label" runat="server" Text="Teacher count:" Font-Size="Medium"></asp:Label>
                    &nbsp;
                    <asp:Label ID="t_count_op" runat="server" Font-Size="Medium"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:Button ID="teacher_Button" runat="server" Font-Size="XX-Large" Text="Teacher" Width="388px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="s_count_label" runat="server" Text="Student count:" Font-Size="Medium"></asp:Label>
                    &nbsp;
                    <asp:Label ID="s_count_op" runat="server" Font-Size="Medium"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:Button ID="student_Button" runat="server" Font-Size="XX-Large" Text="Student" Width="385px" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
       
    </form>
</body>
</html>
