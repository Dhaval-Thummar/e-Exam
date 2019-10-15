<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_login.aspx.cs" Inherits="e_Exam.admin_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
    margin: auto;
    background-image: url('bg4.jpg');
    background-size: cover;
    font-family: sans-serif;
}
        
        #Label1, #H_forgot,#password_label{
    font-weight: bold;
    color: black;
}
          #Button1, #user_textbox, #password_textbox{
   
width:100%;
margin-bottom:20px;
}
        #user_textbox, #password_textbox
        {
    border: none;
    border-bottom: 3px solid black;
    outline: none;
    color: black;
    font-size: 16px;
    background-color: transparent;
}
    
           .auto-style1{
          height:100%;
          width:35%;

            margin :150px auto;
            border-radius: 10px;
            background: rgba(169,169,169,0.7);
           
        }

        .auto-style2{
            text-align:center;
             height:74px;
}
        .auto-style3 {
            text-align:center;
            padding:10px;
        }
        .auto-style4 {
            text-align:center;
            padding:10px;
        }
        #admin_label{
          
             font-size:40px;
             font-weight: bold;
             color: black;

        }
        .auto-style7 {
            padding: 0px 15px 0px 15px;
            height: 40px;
        }
        .auto-style8 {
            padding: 0px 15px 0px 15px;
            height: 40px;
        }
        
         
        .auto-style6 {
            text-align: center;
            height: 50px;
        }
         .auto-style9 {
            text-align: center;

        }



        #valid1 {
    font-weight: bold;
    color: red;
    padding-left:30%;
    text-align: center;
}
        #Button1 {
    border: none;
    outline: none;
    height: 40px;
    width: 50%;
    text-align: center ;
    font-size: 16px;
    color: #fff;
    font-weight: bolder;
    background-color: black;
    cursor: pointer;
    border-radius: 15px;
    transition: .3s ease-in-out;
}
    #Button1:hover {
        background-color: green;
    }
        .auto-style10 {
            height: 22px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td colspan="2" class="auto-style2">
                    <asp:Label ID="admin_label" runat="server" Text="Admin Login"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label1" runat="server" Text="User id" ></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="user_textbox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="password_label" runat="server" Text="Password"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="password_textbox" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6" colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style9" colspan="2">
                    <asp:Label ID="valid1" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style9" colspan="2">
                    <asp:HyperLink ID="H_forgot" runat="server" NavigateUrl="~/Forgot_Password.aspx">Forgot Password</asp:HyperLink>
                </td>
            </tr>
            <tr>
               <td>
                   </br>
               </td>
            </tr>
        </table>
    </form>
</body>
</html>
