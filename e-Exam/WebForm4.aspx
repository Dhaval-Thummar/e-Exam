<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="e_Exam.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .center {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="center">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>
        <div>
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            <asp:Panel ID="Panel1" runat="server">
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server">
                <asp:Image ID="q_image" runat="server" Height="500px" Width="500px" />
            </asp:Panel>
        </div>
        <div>
            <asp:Panel ID="Panel3" runat="server">
                <div>
                    <asp:RadioButton ID="opt1" runat="server" GroupName="mcq" />
                    <asp:Image ID="Image1" runat="server" Height="400px" Width="400px" />
                </div>
                <div>
                    <asp:RadioButton ID="opt2" runat="server" GroupName="mcq" />
                    <asp:Image ID="Image2" runat="server" Height="400px" Width="400px" />
                </div>
                <div>
                    <asp:RadioButton ID="opt3" runat="server" GroupName="mcq" />
                    <asp:Image ID="Image3" runat="server" Height="400px" Width="400px" />
                </div>
                <div>
                    <asp:RadioButton ID="opt4" runat="server" GroupName="mcq" />
                    <asp:Image ID="Image4" runat="server" Height="400px" Width="400px" />
                </div>
            </asp:Panel>
            <asp:Panel ID="Panel4" runat="server">
                <asp:TextBox ID="TextBox1" runat="server" ReadOnly="false"></asp:TextBox>
            </asp:Panel>
        </div>
        <div>
            <asp:Button ID="Button2" runat="server" Text="previous" OnClick="Button2_Click" />
            <asp:Button ID="Button1" runat="server" Text="next" OnClick="Button1_Click" />
        </div>
        <div>
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>
