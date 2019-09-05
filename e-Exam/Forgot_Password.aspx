<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forgot_Password.aspx.cs" Inherits="e_Exam.Forgot_Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>
     <link href="style2.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
</head>
<body>
    <div class="forgotbox">
    <form id="form1" runat="server">

                <asp:Label ID="Label3" runat="server" Text="Forgot Password"></asp:Label>
               
                <br /><br /><br /><br /><br />
               
                <asp:Label ID="Label4" runat="server" Text="enter email to reset your password "></asp:Label>
                

                <asp:TextBox ID="email_input" runat="server"></asp:TextBox>
       
                <asp:Button ID="Button1" runat="server" Text="Reset My Password" class="btn btn-primary" OnClick="Button1_Click"  />
           
                <asp:Label ID="Label5" runat="server"></asp:Label>
   
    </form>
   </div>
   
</body>
</html>
