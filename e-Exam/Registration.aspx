﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="e_Exam.Registration2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
    <link href="style1.css" rel="stylesheet" />

    <style type="text/css">
        .auto-style7 {
            height: 89px;
            width: 469px;
            margin-left: 100px;
            margin-bottom: 30px;
        }

        .auto-style8 {
            margin-left: 0px;
        }

        .auto-style9 {
            padding-left: 5px;
            height: 40px;
            text-align: left;
            width: 358px;
        }

        .dropdown {
            border: 2px solid black;
            border-radius: 4px;
            outline: none;
            box-sizing: border-box;
            border-color: dodgerblue;
            height: 30px;
            font-size: 20px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style8">
            &nbsp;<img src="lg1.jpg" class="auto-style7" />
        </div>
        <table class="auto-style1" style="background-color: #ffffff; filter: alpha(opacity=40); opacity: 0.95;">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="name_label" runat="server" Text="Name"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="name_input" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="name_input" ErrorMessage="*" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="roll_no_label" runat="server" Text="Roll No."></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="roll_no_input" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="roll_no_input" Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="roll_no_input" ErrorMessage="Numbers only" Font-Bold="True" ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="mobile_label" runat="server" Text="Mobile Number"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="mobile_input" runat="server" Width="300px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="mobile_input" Display="Dynamic" ErrorMessage="Invalid Mobile Number" Font-Bold="True" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="email_label" runat="server" Text="Email ID"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="email_input" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="email_input" Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="email_input" Display="Dynamic" ErrorMessage="Invalid Email ID" Font-Bold="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="dob_label" runat="server" Text="Date of Birth"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="dob_input" runat="server" TextMode="Date" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="dob_input" ErrorMessage="*" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="department_label" runat="server" Text="Department"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:DropDownList ID="DropDownList1" CssClass="dropdown" runat="server" AutoPostBack="True"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="DropDownList1" ErrorMessage="*" Font-Bold="True" ForeColor="Red" InitialValue="none"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="current_year_label" runat="server" Text="Current Year"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:DropDownList ID="year_drop_down" runat="server" Width="100px">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="address_label" runat="server" Text="Address"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="address_input" runat="server" Height="74px" TextMode="MultiLine" Width="320px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="pswd_label" runat="server" Text="Password "></asp:Label>
                    &nbsp;</td>
                <td class="auto-style9">
                    <asp:TextBox ID="pswd_input" runat="server" TextMode="Password" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="pswd_input" Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="pswd_input" ErrorMessage="Password length must be between 5 to 16 characters" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9'@&amp;#.\s]{5,16}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="confirm_pswd_label" runat="server" Text="Confirm Password"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="confirm_pswd_input" runat="server" TextMode="Password" Width="300px"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="pswd_input" ControlToValidate="confirm_pswd_input" Display="Dynamic" ErrorMessage="Password doesn't match" Font-Bold="True" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5" colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5" colspan="2">

                    <asp:Button ID="submit_btn" runat="server" Text="Submit" OnClick="submit_btn_Click" CssClass="auto-style8" Height="40px" Width="217px" />
                    <asp:Button ID="cancel_btn" runat="server" Text="Cancel" OnClick="cancel_btn_Click" OnClientClick="return confirm('Are you sure you wish to Cancel?');" CssClass="auto-style8" Height="40px" Width="217px" CausesValidation="False" />
                    <br />
                    <br />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
