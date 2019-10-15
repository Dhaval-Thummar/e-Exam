<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="student_dashboard.aspx.cs" Inherits="e_Exam.student_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .class1 {
            text-align: left;
            width: 100%;
        }

        .class2 {
            text-align: right;
            top: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="100%" DataKeyNames="subject" OnRowCommand="onrowcommand" HeaderStyle-Height="0px">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td class="class1">
                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("subject") %>'></asp:Label>
                                    </td>
                                    <td class="class2">
                                        <asp:LinkButton ID="Button1" runat="server" Text="Tests" CommandArgument='<%#Eval("subject") %>' />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataRowStyle CssClass="alert alert-primary" VerticalAlign="Middle" />
                <EmptyDataTemplate>
                    <div class="alert alert-danger" role="alert">
                        No any test found!
                    </div>
                </EmptyDataTemplate>
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
                                        <asp:LinkButton ID="Button2" runat="server" Text="Start Test" CommandArgument='<%#Eval("test_id") %>'></asp:LinkButton>
                                    </td>
                                </tr>
                              
                            </tabel>

                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataRowStyle CssClass="alert alert-primary" VerticalAlign="Middle" />
                <EmptyDataTemplate>
                    <div class="alert alert-danger" role="alert">
                        No any test found!
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </asp:View>
    </asp:MultiView>
</asp:Content>
