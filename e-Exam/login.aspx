<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="e_Exam.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Login</title>
    <link href="style_login.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <style type="text/css">

        .Initial
        {
            display: block;
            padding: 4px 18px 4px 18px;
            float: left;
            color: Black;
            font-weight: bold;
        }
        .Initial:hover
        {
            color: White;
        }
        .Clicked
        {
            float: left;
            display: block;
            padding: 4px 18px 4px 18px;
            color: Black;
            font-weight: bold;
            color: White;
        }
        .auto-style1 {
            width:25%;
            margin :150px auto;
            border-radius: 10px;
            background: rgba(169,169,169,0.7);
            min-width:350px;
        }
        .auto-style2 {
            text-align:center;
            height: 67px;
        }
        .auto-style3 {
            text-align:left;
            padding:10px;
        }
        .auto-style4 {
            padding:0px 15px 0px 15px;
            height:40px;
        }
         .auto-style5 {
            text-align:center;
        }
        .auto-style6 {
            text-align: center;
            height: 50px;
        }
        .auto-style7 {
            text-align: center;
            height: 23px;
        }
    </style>

</head>
<body>
    <div>
       


    <form id="form1" runat="server" >
        
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="student_tab" runat="server" Text="Student Login" Width="50%" BackColor="#C3C3C3" BorderStyle="None" Height="90%" class="btn btn-light" OnClick="Button1_Click" Font-Bold="True" Font-Overline="False" Font-Strikeout="False" Font-Underline="True" />
                    <asp:Button ID="teacher_tab" runat="server" Text="Teacher Login" Width="50%" BorderStyle="None" Height="90%" class="btn btn-dark" OnClick="teacher_tab_Click" Font-Bold="True" />
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                     &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                     <asp:Label ID="uname" runat="server" Text="User Name" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                     <asp:TextBox ID="u_input" runat="server" Width="100%" Font-Size="X-Large" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="pswd" runat="server" Text="Password"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                     <asp:TextBox ID="p_input" runat="server" TextMode="Password" Width="100%" Font-Size="X-Large" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                      &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">
                      <asp:Button ID="btn_login" runat="server" Text="Log In"  OnClick="btn_login_Click" CssClass="btn btn-primary"/>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                      <asp:Label ID="valid" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                      <asp:HyperLink ID="register" runat="server" NavigateUrl="~/Registration.aspx">Doesn't Have Account?</asp:HyperLink>
                    <br />
                     <asp:HyperLink ID="forgot_pswd" runat="server" NavigateUrl="~/Forgot_Password.aspx">Forget Password</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                      &nbsp;</td>
            </tr>
        </table>  
    </form>  
        </div>
</body>
</html>
