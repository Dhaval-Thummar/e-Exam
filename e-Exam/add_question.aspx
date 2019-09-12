<%@ Page Title="" Language="C#" MasterPageFile="~/teacher.Master" AutoEventWireup="true" CodeBehind="add_question.aspx.cs" Inherits="e_Exam.add_question" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .div1 {
            text-align:center;
            font-weight:bold;
        }
        .div2 {
            text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <div class="div1">
        <asp:Label ID="question_no" runat="server" Text="Question 1"></asp:Label>
    </div>
    <div class="card-body">
        <div class="row form-group">
            <label class="col-md-2 col-form-label ">Qusetion Name</label>
            <div class="col-md-9"> 
                <asp:TextBox ID="question" runat="server" TextMode="MultiLine" CssClass="form-control" Height="150px"></asp:TextBox>
                <asp:CheckBox ID="q_image_checkbox" runat="server" Text="Image" AutoPostBack="True" OnCheckedChanged="image_upload_check" />
                <asp:RequiredFieldValidator ID="question_require" runat="server" ErrorMessage="Enter Question" ControlToValidate="question" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:FileUpload ID="image_upload" runat="server" Visible="False" />
            </div>
     </div>   
            <div class="row form-group">
                 <label class="col-md-2 col-form-label ">Question Type</label>
                <div class="row form-group">
                    <asp:RadioButtonList ID="qtype" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="10" OnSelectedIndexChanged="qtype_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem Text="MCQ" Value=1></asp:ListItem>
                        <asp:ListItem Text="Fill in Blank" Value=2></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="mcq_question" runat="server">
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Option A</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txt_optionone" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:CheckBox ID="optACheck" runat="server" Text="Image" AutoPostBack="True" OnCheckedChanged="optACheck_CheckedChanged" />
                        <asp:FileUpload ID="optAimg" runat="server" Visible="False" />
                        <asp:RequiredFieldValidator ID="require_op1" runat="server" ErrorMessage="Enter option one" ControlToValidate="txt_optionone" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Option B</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txt_optiontwo" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:CheckBox ID="optBCheck" runat="server" Text="Image" AutoPostBack="True" OnCheckedChanged="optBCheck_CheckedChanged" />
                        <asp:FileUpload ID="optBimg" runat="server" Visible="False" />                        
                        <asp:RequiredFieldValidator ID="require_op2" runat="server" ErrorMessage="Enter option two" ControlToValidate="txt_optiontwo" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Option C</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txt_optionthree" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:CheckBox ID="optCCheck" runat="server" Text="Image" AutoPostBack="True" OnCheckedChanged="optCCheck_CheckedChanged" />
                        <asp:FileUpload ID="optCimg" runat="server" Visible="False" />
                        <asp:RequiredFieldValidator ID="require_op3" runat="server" ErrorMessage="Enter option three" ControlToValidate="txt_optionthree" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Option D</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txt_optionfour" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:CheckBox ID="optDCheck" runat="server" Text="Image" AutoPostBack="True" OnCheckedChanged="optDCheck_CheckedChanged" />
                        <asp:FileUpload ID="optDimg" runat="server" Visible="False" />
                        <asp:RequiredFieldValidator ID="require_op4" runat="server" ErrorMessage="Enter option four" ControlToValidate="txt_optionfour" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label text-center">Correct Answer</label>
                        <div class="col-md-4">
                            <asp:RadioButtonList ID="rdo_correctanswer" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="10">
                                <asp:ListItem Text="A" Value=1></asp:ListItem>
                                <asp:ListItem Text="B" Value=2></asp:ListItem>
                                <asp:ListItem Text="C" Value=3></asp:ListItem>
                                <asp:ListItem Text="D" Value=4></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="req_rdo_correctanswer" runat="server" ErrorMessage="Select a correct answer" ControlToValidate="rdo_correctanswer" ForeColor="red"></asp:RequiredFieldValidator>
                        </div>
                </div>
            </asp:View>
            <asp:View ID="fill_in_blank" runat="server">
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Answer</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="blank_ans" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter answer" ControlToValidate="blank_ans" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>
    <div>
        <asp:Label ID="Label1" runat="server" Text="Marks"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </div>
    <div class="div2">
        <asp:Button ID="Button1" runat="server" Text="Add next Question" class="btn btn-info"/>
        <asp:Button ID="Button2" runat="server" Text="Submit" class="btn btn-success"/>
    </div>
</asp:Content>
