<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="e_Exam.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style type="text/css">
        .auto-style1 {
            width: 50%;
            margin:60px auto;
        }
        .auto-style2 {
            width: 44%;
            height: 40px;
            padding-left:200px;
            text-align: left;
        }
        .auto-style3 {
            padding-left:5px;
            height: 40px;
            text-align:left;
        }
      
        .auto-style5 {
            text-align: center;
            height: 40px;
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
    <table class="auto-style1" style="background-color: #ffffff; filter: alpha(opacity=40); opacity: 0.95;">
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
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="roll_no_input" ErrorMessage="Numbers only" Font-Bold="True" ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="mobile_label" runat="server" Text="Mobile Number:"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="mobile_input" runat="server"></asp:TextBox>
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
                <asp:Label ID="dob_label" runat="server" Text="Date of Birth"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="dob_input" runat="server" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="dob_input" ErrorMessage="*" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="qualification_label" runat="server" Text="Qualification:"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:DropDownList ID="Qualification_drop_down" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Selected="True">Select </asp:ListItem>
                    <asp:ListItem>Primary</asp:ListItem>
                    <asp:ListItem>Secondary</asp:ListItem>
                    <asp:ListItem>Higher Secondary</asp:ListItem>
                    <asp:ListItem>Diploma</asp:ListItem>
                    <asp:ListItem>Under Graduate</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Qualification_drop_down" Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="standard_label" runat="server" Text="Standard"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="standard_input" runat="server"></asp:TextBox>
                <asp:DropDownList ID="standard_drop_down" runat="server" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="standard_drop_down_SelectedIndexChanged">
                    <asp:ListItem Selected="True">Select</asp:ListItem>
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
                <asp:Label ID="department_label" runat="server" Text="Department"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:DropDownList ID="be_drop_down" runat="server" AutoPostBack="True" Enabled="False">
                    <asp:ListItem Selected="True">Select</asp:ListItem>
                    <asp:ListItem>Computer Science and Engineering</asp:ListItem>
                    <asp:ListItem>Mechanical Engineering</asp:ListItem>
                    <asp:ListItem>Chemical Engineering</asp:ListItem>
                    <asp:ListItem>Civil Engineering</asp:ListItem>
                    <asp:ListItem>Textile Engineering</asp:ListItem>
                    <asp:ListItem>Electrical Engineering</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="bsc_drop_down" runat="server" Visible="False" AutoPostBack="True" Enabled="False">
                    <asp:ListItem Selected="True">Select</asp:ListItem>
                    <asp:ListItem>Physics</asp:ListItem>
                    <asp:ListItem>Chemistry</asp:ListItem>
                    <asp:ListItem>Mathematics</asp:ListItem>
                    <asp:ListItem>Statistics</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="current_year_label" runat="server" Text="Current Year"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:DropDownList ID="year_drop_down" runat="server" Enabled="False">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="address_label" runat="server" Text="Address:"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="address_input" runat="server" Height="100px" TextMode="MultiLine" Width="350px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="pswd_label" runat="server" Text="Password "></asp:Label>
            &nbsp;</td>
            <td class="auto-style3">
                <asp:TextBox ID="pswd_input" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="pswd_input" Display="Dynamic" ErrorMessage="*" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="pswd_input" ErrorMessage="Password length must be between 5 to 16 characters" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9'@&amp;#.\s]{5,16}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="confirm_pswd_label" runat="server" Text="Confirm Password"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="confirm_pswd_input" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="pswd_input" ControlToValidate="confirm_pswd_input" Display="Dynamic" ErrorMessage="Password doesn't match" Font-Bold="True" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>    
            <td class="auto-style5" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>    
            <td class="auto-style5" colspan="2">
                <asp:Button ID="submit_btn" class="btn btn-success" runat="server" Text="Submit" OnClick="submit_btn_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:Button ID="cancel_btn" class="btn btn-danger" runat="server" Text="Cancel" OnClick="cancel_btn_Click" OnClientClick="return confirm('Are you sure you wish to Cancel?');"/>
                <br />
                <br />
            </td>
        </tr>
    </table>
    </form>
     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
