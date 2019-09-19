<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forgot_Password.aspx.cs" Inherits="e_Exam.Forgot_Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>

    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    
    <style type="text/css">
        .auto-style1 {
            width: 40%;
            text-align:center;
            margin: 150px auto;
            border-radius: 10px;
            background: rgba(169,169,169,0.7);
           
        }
        .auto-style2 {
            height: 74px;
        }
        body {
    background-image: url('bg4.jpg');
    background-size: cover;
        }

        .auto-style4 {
            height: 50px;
        }
        .auto-style5 {
            text-align:center;
            height: 60px;
        }
        #email_input{
            border: none;
            border-bottom: 3px ridge black;
            outline: none;
            color: black;
            background-color: transparent;
    
        }
       
        .auto-style6 {
            height: 29px;
        }
       
    </style>
</head>
<body>
    <div>
       <form id="form1" runat="server">
      <table class="auto-style1">
                    <tr>
                        <td class="auto-style6"> 
                        </td>
                        
                    </tr>
                   
                    <tr>
                        <td class="auto-style2"> 
                            <br />
                            <asp:Label ID="Label3" runat="server" Text="Forgot Password" Font-Bold="True" Font-Size="XX-Large" ForeColor="#3333FF"></asp:Label>
                            <br />
                        </td>
                        
                    </tr>
                   
                    <tr>
                        <td class="auto-style4"> 
                              <asp:TextBox ID="email_input" runat="server" Width="50%" placeholder="enter email to reset your password" Font-Size="Large" Font-Strikeout="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5"> 
                             <asp:Button ID="Button1" runat="server" Text="Reset My Password" class="btn btn-primary" OnClick="Button1_Click"  />
                             <br />
                        </td>
                    </tr>
                    <tr>
                        <td>  
                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>  
                            &nbsp;</td>
                    </tr>
                </table>
    </form>
   </div>
</body>
</html>
