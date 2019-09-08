<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="e_Exam.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Login</title>
    <link href="style.css" rel="stylesheet" />
  
</head>
<body>
    <div class="loginbox">
        <img src="bg5.png" alt="Alternate Text" class="user"/>
        <h2>Student LogIn</h2>

    <form id="form1" runat="server" >
        
         <br />
         <br />
 
         <asp:Label ID="uname" runat="server" Text="User Name" ></asp:Label>

         <br />

         <asp:TextBox ID="u_input" runat="server" Height="40px" ></asp:TextBox>

        <asp:Label ID="pswd" runat="server" Text="Password" ></asp:Label>
  
         <br />

         <asp:TextBox ID="p_input" runat="server" TextMode="Password" Height="40px"  ></asp:TextBox>

         <br />
         <br />
         <br />

         <asp:Button ID="btn_login" runat="server" Text="Log In"  OnClick="btn_login_Click" CssClass="btn btn-primary"/>

         <asp:Label ID="valid" runat="server"></asp:Label>
        
         <br />
         <br />

         <asp:HyperLink ID="register" runat="server" NavigateUrl="~/Registration.aspx">Doesn't Have Account </asp:HyperLink>
              
         <br />
         <br />
              
         <asp:HyperLink ID="forgot_pswd" runat="server" NavigateUrl="~/Forgot_Password.aspx">Forget Password</asp:HyperLink>
             
         <br />
        
    </form>  
        </div>
</body>
</html>