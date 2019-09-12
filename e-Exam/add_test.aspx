<%@ Page Title="" Language="C#" MasterPageFile="~/teacher.Master" AutoEventWireup="true" CodeBehind="add_test.aspx.cs" Inherits="e_Exam.add_test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
        .div1 {
           
        }
        .table1 {
            margin: 150px auto;
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
            width: 280px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="div1">
        <table class="table1">
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label1" runat="server" Text="Test Name"></asp:Label>
            </td>
            <td class="auto-style1">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>   
         <tr>
             <td class="auto-style3">
                 <asp:Label ID="Subject" runat="server" Text="Subject"></asp:Label>
             </td>
             <td class="auto-style1">
                 <asp:DropDownList ID="sub_list" runat="server">
                 </asp:DropDownList>
             </td>
         </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label2" runat="server" Text="Test Duration"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="True" />
                    <asp:Label ID="Label3" runat="server" Text="check if you want to add test duration"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">

                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="duration" runat="server" TextMode="Number" placeholder="in minute" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="description" runat="server" Text="Description"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="test_desc" runat="server" TextMode="MultiLine" Height="70px" Width="280px"></asp:TextBox>
                </td>
            </tr>
            <tr>
               <td colspan="2" class="auto-style2">
                   &nbsp;</td>
            </tr>
            <tr>
               <td colspan="2" class="auto-style2">
                   <asp:Button ID="test_next" runat="server" Text="next >>" class="btn btn-primary" OnClick="test_next_Click"/>
               </td>
            </tr>
            </table>
    </div>
</asp:Content>
