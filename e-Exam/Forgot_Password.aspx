<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forgot_Password.aspx.cs" Inherits="e_Exam.Forgot_Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <style type="text/css">
        body{
            background-color:#84A3FF;
        }
        .auto-style1 {
            width: 35%;
            margin :50px auto;
            background-color:white;
            border-radius:12px;
        }
        .auto-style2 {
            height: 85px;
            text-align: center;
        }
        .auto-style3 {
            height: 30px;
            text-align:center;
        }
        .auto-style4 {
            height: 87px;
            text-align:center;
        }
        .auto-style5 {
            height: 63px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

    <table class="auto-style1">
        <tr>
            <td class="auto-style2">
                
                <asp:Label ID="Label3" runat="server" Text="Forgot Password" Font-Bold="True" ForeColor="#3366FF"></asp:Label>
                
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                
                <asp:Label ID="Label4" runat="server" Text="enter email to reset your password "></asp:Label>
                
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                &nbsp;<asp:TextBox ID="email_input" runat="server" Height="40px" Width="430px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Button ID="Button1" runat="server" Text="Reset My Password" class="btn btn-primary" OnClick="Button1_Click"  />
                <br />
                <br />
                <asp:Label ID="Label5" runat="server"></asp:Label>
     
                <br />
            </td>
        </tr>
    </table>
   
    </form>
   
</body>
</html>
