<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_dashboard1.aspx.cs" Inherits="e_Exam.admin_dashboard11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .class1 {
            text-align: center;
        }

        .class2 {
            width: 44%;
            height: 40px;
            padding-left: 200px;
            text-align: center;
        }

        .labal1 {
            font-weight: bolder;
            font-family: sans-serif;
            color: limegreen;
            font-size: medium;
        }

        .texbox {
            border: 2px solid black;
            border-radius: 4px;
            outline: none;
            box-sizing: border-box;
            border-color: dodgerblue;
            height: 35px;
            font-size: 20px;
        }

        .class4 {
            text-align: center;
        }

        .class3 {
            padding-left: 5px;
            height: 40px;
            text-align: left;
            width: 358px;
        }

        .table1 {
            margin: 100px auto;
            width: 50%;
        }

        .auto-style4 {
            width: 25%;
            height: 54px;
            text-align: left;
            padding-left: 25px;
        }

        .auto-style5 {
            height: 54px;
            width: 75%;
            padding-left: 35px;
        }

        .texbox1 {
            height: calc(1.5em + 0.75rem + 2px);
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            min-width: 180px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div>
        <table class="table1">
            <tr>
                <td colspan="2" class="class4">
                    <asp:Label ID="Label9" runat="server" Text="Add Teacher" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label1" runat="server" Text="Name:"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox1" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control texbox2" Width="80%" AutoCompleteType="Disabled"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label4" Class="labal" runat="server" Text="Department:"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" Font-Bold="True" ForeColor="Red" InitialValue="none" ControlToValidate="DropDownList1"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style5">
                    <asp:DropDownList ID="DropDownList1" CssClass="form-control texbox2" Width="80%" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true">
                    </asp:DropDownList>
                </td>
            </tr>
            <asp:Panel runat="server" Visible="False" ID="panel1">
                <tr>
                    <td></td>
                    <td class="auto-style5">
                        <asp:TextBox ID="TextBox6" CssClass="form-control texbox2" Width="80%" runat="server" placeholder="Enter new department name"></asp:TextBox>
                    </td>
                </tr>
            </asp:Panel>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label6" Class="labal" runat="server" Text="Email id:"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TextBox2" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox2" Width="80%" CssClass="texbox1" runat="server" AutoCompleteType="Disabled" autocomplete="off"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="Verify" OnClick="Button1_Click" CausesValidation="False" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Invalid Email ID" Font-Bold="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <asp:Label ID="Label2" runat="server" ForeColor="#009900"></asp:Label>
                </td>
            </tr>
            <asp:Panel runat="server" ID="panel2" Visible="false">
                <tr>
                    <td></td>
                    <td class="auto-style5">
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="texbox1" placeholder="OTP" Width="50%"></asp:TextBox>
                        <asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="Verify" OnClick="Button2_Click" CausesValidation="False" />
                        <br />
                        <asp:Label ID="Label7" runat="server" ForeColor="#009900"></asp:Label>
                    </td>
                </tr>
            </asp:Panel>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label3" runat="server" Text="Mobile no:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox CssClass="form-control texbox2" Width="80%" ID="TextBox3" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Invalid Mobile Number" Font-Bold="True" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label5" Class="labal" runat="server" Text="Password:"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style5">
                    <asp:TextBox CssClass="form-control texbox2" Width="80%" ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
                        <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label10" Class="labal" runat="server" Text="Confirm Password:"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ControlToValidate="TextBox7"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style5">
                    <asp:TextBox CssClass="form-control texbox2" Width="80%" ID="TextBox7" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox7" ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="Password must be same" Font-Bold="True" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2" class="class4">
                    <asp:Button ID="Button3" class="btn btn-danger" runat="server" Text="Cancel" OnClick="Button3_Click" CausesValidation="False" />
                    &nbsp;
                    <asp:Button ID="Button4" class="btn btn-success" runat="server" Text="Submit" OnClick="Button4_Click" />
                    <br />
                    <asp:Label ID="Label8" Class="labal1" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
