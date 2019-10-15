<%@ Page Title="" Language="C#" MasterPageFile="~/test.Master" AutoEventWireup="true" CodeBehind="take_test.aspx.cs" Inherits="e_Exam.take_test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
    background-image: url('bg4.jpg');
    background-size: cover;
        }
       
         .auto-style1 {
            width: 40%;
            text-align:center;
            margin: 150px auto;
            border-radius: 10px;
            background: rgba(169,169,169,0.7);
           
        }

         .auto-style7{
            width: 100%;
            text-align:center;
           
            
            
           
        }
        .auto-style5,#Button1 {
            text-align: center;
            height: 60px;
        }
         .auto-style6 {
            height: 29px;
        }
        
        .div1 {
            text-align: center;
        }

        .div2 {
            background-color: #e3f2fd;
            text-align: center;
            vertical-align: middle;
            padding-right: 40px;
            padding-top: 10px;
            height: 50pxs
            position: fixed;
            width: 100%;
            top: 0;
        }

        .div3 {
            min-height: 200px;
        }

        .table1 {
            margin-left: 20px;
            margin-top: 20px;
        }

        .sidenav {
            height: 100%;
            width: 300px;
            position: fixed;
            z-index: 1;
            top: 50px;
            right: 0;
            background-color: #c5d1ae;
            overflow-x: hidden;
            padding-top: 20px;
            text-align: center;
        }

        .button1 {
            border-color: black;
            color: white;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            text-align:center;
            text-decoration: none;
            display: inline-block;
            cursor: pointer;
        }
        .table2{
            margin-bottom:300px;
        }
    </style>
    <script type="text/javascript">
        function DisableBackButton() {
            window.history.forward()
        }
        DisableBackButton();
        window.onload = DisableBackButton();
        window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
        window.onload = function () {void (0)}
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" Visible="False">
        <div class="sidenav">
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            <asp:Table ID="Table1"  HorizontalAlign="Center" runat="server" CssClass="table2">
            </asp:Table>

            <asp:Button ID="submitbtn" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="submitbtn_Click" />
        </div>
    </asp:Panel>


    <asp:Panel ID="timer_pnl" runat="server" Visible="False">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
        <div class="div2">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <%--            <asp:Literal ID="Literal1" runat="server"></asp:Literal>--%>
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="tick" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>

    <asp:MultiView ID="MultiView1" runat="server">
     
        <asp:View ID="View1" runat="server">
            <div class="div1">
                <table class="auto-style7">
                 <td class="auto-style2"> 
                            <br />
                            <asp:Label ID="Label4" runat="server" Text="INSTRUCTION" Font-Bold="True" Font-Size="XX-Large" ForeColor="#3333FF"></asp:Label>
                            <br />
                     PLEASE READ GIVEN INSTRUCTION BRFORE STRATING EXAM.
                     <br />
                     There are total <asp:Label ID="Label5" runat="server" Text="SECTION NO"></asp:Label> section avalible.
                     <br />
                     Total Time is for exam is <asp:Label ID="Label6" runat="server" Text="TIME"></asp:Label>HH:MM:SS.
                         <br />
                    There are <asp:Label ID="Label7" runat="server" Text="YES/NO"></asp:Label> Nagative marking  for wrong answer.
                      <br />
          White colour show that use not visited question yet.Green colour show that you sumbit answer for this Question.
                     If you want mark any Question there is mark button is avalible.its look in Yellow colour.
                     <br />
                  </td>

                </table>
               
                <asp:Button ID="Button1" runat="server"   class="btn btn-primary" Text="START EXAM" OnClick="Button1_Click" />
            </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <br />
            <br />
            <table class="table1">
                <tr>
                    <td>
                        <asp:Label ID="qlbl" runat="server" Text=""></asp:Label>
                        <asp:Panel ID="qPnl" runat="server" Visible="False">
                            <asp:Image ID="qImg" runat="server" Width="200" Height="200" />
                        </asp:Panel>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="div3">
                            <br />
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                <asp:ListItem Text="A" Value="1"></asp:ListItem>
                                <asp:ListItem Text="B" Value="2"></asp:ListItem>
                                <asp:ListItem Text="C" Value="3"></asp:ListItem>
                                <asp:ListItem Text="D" Value="4"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:Label ID="anslbl" runat="server" Text="Ans. "></asp:Label>
                            <asp:TextBox ID="anstxt" runat="server" AutoPostBack="True" OnTextChanged="anstxt_TextChanged"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="prevbtn" runat="server" Text="Previous" Enabled="False" OnClick="prevbtn_Click" CssClass="btn btn-primary" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="nextbtn" runat="server" Text="Next" OnClick="nextbtn_Click" CssClass="btn btn-primary" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="markbtn" runat="server" Text="Mark/Unmark" CssClass="btn btn-warning" OnClick="markbtn_Click" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View3" runat="server">
         <div>
       
      <table class="auto-style1">
                    <tr>
                        <td class="auto-style6"> 
                        </td>
                         
                    <tr>
                        <td class="auto-style2"> 
                            <br />
                            <asp:Label ID="Label3" runat="server" Text="THANK YOU!!!" Font-Bold="True" Font-Size="XX-Large" ForeColor="#3333FF"></asp:Label>
                            <br />
                        </td>
                        
                    </tr>
                   
                        </tr>
                   
             <tr>

                 <td class="auto-style5">
                     <asp:Button ID="Button2" runat="server"   class="btn btn-primary" Text="OK" />
                     <br />
                     <br />
                     <br />
                 </td>
                 
             </tr>
                        
                </table>

   </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
