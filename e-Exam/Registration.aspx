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
            height: 40px;
            text-align:right;
        }
        .auto-style3 {
            width:60%;
            padding-left:5px;
            height: 40px;
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="name_input" ErrorMessage="*" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="roll_no_label" runat="server" Text="Roll No:"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="roll_no_input" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="roll_no_input" Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="mobile_label" runat="server" Text="Mobile Number:"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="mobile_input" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="mobile_input" ErrorMessage="*" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="mobile_input" Display="Dynamic" ErrorMessage="Invalid Mobile Number" Font-Bold="True" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="email_label" runat="server" Text="Email ID:"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="email_input" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="email_input" Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="email_input" Display="Dynamic" ErrorMessage="Invalid Email ID" Font-Bold="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="qualification_label" runat="server" Text="Qualification:"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:DropDownList ID="Qualification_drop_down" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem>Select </asp:ListItem>
                    <asp:ListItem>Primary</asp:ListItem>
                    <asp:ListItem>Secondary</asp:ListItem>
                    <asp:ListItem>Higher Secondary</asp:ListItem>
                    <asp:ListItem>Diploma</asp:ListItem>
                    <asp:ListItem>Under Graduate</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Qualification_drop_down" Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="standard_label" runat="server" Text="Standard" Visible="False"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="standard_input" runat="server" Visible="False"></asp:TextBox>
                <asp:DropDownList ID="standard_drop_down" runat="server" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="standard_drop_down_SelectedIndexChanged">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>B.E/B.Tech</asp:ListItem>
                    <asp:ListItem>B.Sc</asp:ListItem>
                    <asp:ListItem>B.Com</asp:ListItem>
                    <asp:ListItem>B.C.A</asp:ListItem>
                    <asp:ListItem>B.A</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="department_label" runat="server" Text="Department" Visible="False"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:DropDownList ID="be_drop_down" runat="server" Visible="False">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>Computer Science and Engineering</asp:ListItem>
                    <asp:ListItem>Mechanical Engineering</asp:ListItem>
                    <asp:ListItem>Chemical Engineering</asp:ListItem>
                    <asp:ListItem>Civil Engineering</asp:ListItem>
                    <asp:ListItem>Textile Engineering</asp:ListItem>
                    <asp:ListItem>Electrical Engineering</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="bsc_drop_down" runat="server" Visible="False">
                    <asp:ListItem>Physics</asp:ListItem>
                    <asp:ListItem>Chemistry</asp:ListItem>
                    <asp:ListItem>Mathematics</asp:ListItem>
                    <asp:ListItem>Statistics</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    </form>
    </body>
</html>
