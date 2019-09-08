<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="e_Exam.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style type="text/css">
        body {
            background: url('https://www.pixelstalk.net/wp-content/uploads/2016/08/Free-Chalkboard-Backgrounds.jpg');
            background-size: cover;
        }
        .auto-style1 {
            height: 50px;
            width:60%;
            text-align: left;
        }
        .auto-style2 {
            margin:150px auto;
            width:25%;
        }
        .auto-style5 {  
            height: 50px;
            width:40%;
            text-align: center;
            padding-right:5px;

        }
        .auto-style7 {
            height: 100px;
            width:50%;
            text-align: center;
        }
        .auto-style8 {
            height: 75px;
            width:50%;
            text-align: center;
        }
        .auto-style9 {
            height: 1058px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="auto-style2" style=" filter: alpha(opacity=40); opacity: 0.95;border:5px orange solid;">
        <tr>
            <td colspan="2" class="auto-style8">
                <br />
                <br />
                <asp:Label ID="s_login" runat="server" Text="Student Login" Font-Bold="True" Font-Overline="False" Font-Size="X-Large" ForeColor="#0099FF"></asp:Label>
                <br />
                <br />
            </td>
        </tr>

        <tr>
            <td class="auto-style5">
                <asp:Label ID="uname" runat="server" Text="User Name :" ForeColor="White"></asp:Label>
            </td>
            <td class="auto-style1">
                <asp:TextBox ID="u_input" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="pswd" runat="server" Text="Password :" ForeColor="White"></asp:Label>
            </td>
            <td class="auto-style1">
                <asp:TextBox ID="p_input" runat="server" TextMode="Password" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style7">
                <br />
                <asp:Button ID="btn_login" runat="server" Text="Login" Height="35px" Width="75px" OnClick="btn_login_Click" class="btn btn-primary"/>
               
                <br />
                <asp:HyperLink ID="register" runat="server" NavigateUrl="~/Registration.aspx">Registration for new user?</asp:HyperLink>
                <br />
                <asp:HyperLink ID="forgot_pswd" runat="server" NavigateUrl="~/Forgot_Password.aspx">Forgot Password</asp:HyperLink>
                <br />
                <br />
                <asp:Label ID="valid" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        
    </table>
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
