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

        .body {
            background-image: url('bg4.jpg');
            background-size: cover;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExamDB %>" SelectCommand="showtestdata" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="stdid" SessionField="studentID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" Width="100%" OnRowCommand="onrowcommand" CssClass="table table-striped table-sm" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="subject" HeaderText="subject" SortExpression="subject" />
                    <asp:TemplateField HeaderText="Options" ItemStyle-Width="6%">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("subject") %>'>Tests</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="#33CCFF" />
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
