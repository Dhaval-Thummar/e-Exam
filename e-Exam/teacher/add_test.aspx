<%@ Page Title="" Language="C#" MasterPageFile="~/teacher.Master" AutoEventWireup="true" CodeBehind="add_test.aspx.cs" Inherits="e_Exam.add_test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
        .table1 {
            margin: 0px auto;
            width:50%;
        }
        .auto-style1 {
            height: 40px;
            width:75%;  
            padding-left:35px;
        }
        .auto-style2 {
            height: 40px;
            text-align:center;
        }
        .auto-style3 {
            width:25%;
            height: 40px;
            text-align:left;
            padding-left:25px;
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
            .auto-style6 {
                width: 25%;
                height: 50px;
                text-align: left;
                padding-left: 25px;
            }
            .auto-style7 {
                height: 50px;
                width: 75%;
                padding-left: 35px;
            }
            .auto-style8 {
                width: 25%;
                height: 25px;
                text-align: left;
                padding-left: 25px;
            }
            .auto-style9 {
                height: 25px;
                width: 75%;
                padding-left: 35px;
            }
            .auto-style10 {
                font-size: xx-large;
                color: #0099FF;
            }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="div1">
            <center>
            <strong><span class="auto-style10">ADD TEST</span></strong>
            </center>    
        <table class="table1">
            
            <tr>
               <td class="auto-style4">
                   <asp:Label ID="Label1" runat="server" Text="Test Name"></asp:Label>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox1" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                
               </td>
               <td class="auto-style5">
                   <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Width="80%"></asp:TextBox>
                
            </td>
        </tr>   
         <tr>
             <td class="auto-style4">
                 <asp:Label ID="Label4" runat="server" Text="Department"></asp:Label>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="dept_list" ErrorMessage="*" Font-Bold="True" ForeColor="Red" InitialValue="none"></asp:RequiredFieldValidator>
             </td>
             <td class="auto-style5">
                 <asp:DropDownList ID="dept_list" runat="server" CssClass="form-control"  Width="80%" AutoPostBack="True" OnSelectedIndexChanged="dept_list_SelectedIndexChanged">
                 </asp:DropDownList>
             </td>
         </tr>
         <tr>
             <td class="auto-style4">
                 <asp:Label ID="Subject" runat="server" Text="Subject"></asp:Label>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="sub_list" ErrorMessage="*" Font-Bold="True" ForeColor="Red" InitialValue="none"></asp:RequiredFieldValidator>
             </td>
             <td class="auto-style5">
                 <asp:DropDownList ID="sub_list" runat="server" CssClass="form-control" OnSelectedIndexChanged="sub_list_SelectedIndexChanged" Width="80%">
                 </asp:DropDownList>
             </td>
         </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label2" runat="server" Text="Test Duration"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="True" />
                    <asp:Label ID="Label3" runat="server" Text="check if you want to add test duration"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">

                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="duration" runat="server" TextMode="Number" placeholder="in minute" Enabled="False" CssClass="form-control" Width="80%"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="duration" Display="Dynamic" ErrorMessage="Invalid Duration" ForeColor="Red" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="section_label" runat="server" Text="No. of sections"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:DropDownList ID="section_list" runat="server" AutoPostBack="True" CssClass="form-control" OnSelectedIndexChanged="section_list_SelectedIndexChanged" Width="80%" >
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
     
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="description" runat="server" Text="Description"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="test_desc" runat="server" TextMode="MultiLine" CssClass="form-control" Width="80%"></asp:TextBox>
                </td>
            </tr>
     
            <tr>
                <td class="auto-style8">
                </td>
                <td class="auto-style9">
                </td>
            </tr>
            <tr>
               <td>

               </td>
            </tr>
            <tr>
               <td colspan="2" class="auto-style2">

                   <asp:Button ID="test_next" runat="server" Text="next >>" class="btn btn-primary" OnClick="test_next_Click" />
               </td>
            </tr>
        </table>
    </div>
</asp:Content>
