<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="student_dashboard.aspx.cs" Inherits="e_Exam.student_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .class1 {
            text-align: left;
            width: 100%;
        }

        .class2 {
            text-align: right;
            width: 100%;
            top:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="100%" DataKeyNames="subject" OnRowCommand="onrowcommand">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td class="class1">
                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("subject") %>'></asp:Label>
                                    </td>
                                    <td class="class2">
                                        <asp:Button ID="Button1" runat="server" Text="take test" CommandArgument='<%#Eval("subject") %>' />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" GridLines="None" OnRowCommand="onrowcommand1">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <tabel>
                                <tr>
                                    <td  class="class1">
                                      <table >
                                          <tr>
                                              <td>
                                                  <asp:Label ID="Label2" runat="server" Text='<%#"Name: " + Eval("name") %>'></asp:Label>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td>
                                                   <asp:Label ID="Label3" runat="server" Text='<%#"Duration: " + Eval("duration") +" min"%>'></asp:Label>
                                              </td>
                                          </tr>
                                          <tr>
                                              <td>
                                                  <asp:Label ID="Label4" runat="server" Text='<%#"Description: " + Eval("description") %>'></asp:Label>                                                
                                              </td>
                                          </tr>
                                      </table>
                               <hr />
                                    </td>
                                    <td class="class2">
                                        <asp:Button ID="Button2" runat="server" Text="take test" CommandArgument='<%#Eval("test_id") %>'></asp:Button>
                                    </td>
                                </tr>
                              
                            </tabel>
                            
                        </ItemTemplate> 
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </asp:View>
    </asp:MultiView>
</asp:Content>
