<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_dashboard.aspx.cs" Inherits="e_Exam.student_dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        
        .auto-style1 {
            width: 100%;
            height: 545px;
        }
        .auto-style2 {
            text-align:center;
        }
        .auto-style3 {
            width: 40%;
            padding-left:100px;
        }
        .auto-style4 {
            text-align:left;
        }
        .auto-style5 {
            text-align:center;
            width:90%;
        }
        .auto-style6 {
            text-align:center;
            width:10%;
        }.auto-style7{
             text-align:right;
         }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <table class="auto-style1">
            <tr>
                <td class="auto-style2" colspan="2">
                    <asp:Label ID="top_label" runat="server" Text="E-exam" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" >&nbsp;</td>
                <td class="auto-style7">
                    <asp:Button ID="logout_button" runat="server" Text="Logout" />
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Image ID="Image1" runat="server" Height="175px" ImageUrl="https://image.flaticon.com/icons/svg/17/17004.svg" Width="144px" />
                </td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="user_name_label" runat="server" Text="label"></asp:Label>
                </td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style6" >
                    <asp:Button ID="Edit_button" runat="server" Text="Edit" />
                </td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" >&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" >&nbsp;</td>
                
                <td class="auto-style4">
                    <asp:Button ID="test_button" runat="server" Text="TEST" Height="66px" Width="442px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3" >&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" >&nbsp;</td>
                <td class="auto-style4">
                    <asp:Button ID="history_button" runat="server" Text="HISTORY" Height="66px" Width="442px" />
                </td>
            </tr>
        </table>
        
    </form>
</body>
</html>
