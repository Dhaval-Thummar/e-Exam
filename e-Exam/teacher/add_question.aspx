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
        .table1{
            margin: 20px auto;
            width:40%;
        }
        .auto-style1 {
            height: 50px;
            text-align:center;
        }
        .auto-style2 {
            width: 40%;
            padding-left:30px;
        }
        .auto-style3 {
            padding-left:30px;
        }
        .auto-style4 {
            width: 40%;
            padding-left: 30px;
            height: 19px;
        }
        .auto-style5 {
            padding-left: 30px;
            height: 19px;
        }
        .radio1 input[type="radio"]{
            margin-left: 10px;
            margin-right: 1px;

        }
        .auto-style6 {
            width:50%;
            padding-left:100px;
        }
        .auto-style7 {
            padding-left:20px;
        }
        .auto-style8 {
            font-size: xx-large;
            color: #0099CC;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <strong><span class="auto-style8">ADD TEST</span></strong></center><br />
    <br />
    <asp:MultiView ID="MultiView2" runat="server">
        <asp:View ID="View2" runat="server">
            <table class="table1">
                <tr>
                    <td colspan="2" class="auto-style1">
                        <asp:Label ID="section_no_outer" runat="server" Text="Section 1" Font-Size="Large" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        &nbsp;</td>
                    <td class="auto-style3">
                        &nbsp;</td>
                </tr>
                 <tr>
                     <td class="auto-style2">
                         <asp:Label ID="Label2" runat="server" Text="Marks per Question"></asp:Label>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="marks_input" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                     </td>
                     <td class="auto-style3">
                         <asp:TextBox ID="marks_input" runat="server" TextMode="Number" CssClass="form-control" Width="35%"></asp:TextBox>
                         
                         <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="marks_input" ErrorMessage="Marks not allowed" ForeColor="Red" MaximumValue="10" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                         
                     </td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style5"></td>
                </tr>
                 <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="Negative Marks" CssClass="form-control-plaintext"></asp:Label>
                    </td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="negative_list" runat="server" CssClass="form-control" Width="35%" AutoPostBack="True">
                            <asp:ListItem Text="0" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="-1/4" Value="-0.25"></asp:ListItem>
                            <asp:ListItem Text="-1/3" Value="-0.33"></asp:ListItem>
                            <asp:ListItem Text="-1/2" Value="-0.5"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="2">
                        <asp:Button ID="Button3" runat="server" class="btn btn-info" Text="Next&gt;&gt;" OnClick="Button3_Click" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View1" runat="server">
            <div class="div1">
                <asp:Label ID="section_no" runat="server" Text="Section 1" Font-Size="Larger"></asp:Label>
                <br />
        <asp:Label ID="question_no_label" runat="server" Text="Question 1"></asp:Label>
    </div>
    <div class="card-body">
        <div class="row form-group">
            <label class="col-md-2 col-form-label ">Qusetion Name</label>
            <div class="col-md-9"> 
                <asp:TextBox ID="question" runat="server" TextMode="MultiLine" CssClass="form-control" Height="150px"></asp:TextBox>
                <asp:CheckBox ID="q_image_checkbox" runat="server" Text="Image" AutoPostBack="True" OnCheckedChanged="image_upload_check" />
                <asp:RequiredFieldValidator ID="question_require" runat="server" ErrorMessage="Enter Question" ControlToValidate="question" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <asp:FileUpload ID="q_image_upload" runat="server" Visible="False" />
                <asp:Label ID="image_errror_lbl" runat="server" ForeColor="Red"></asp:Label>
            </div>
     </div>   
            <div class="row form-group">
                 <label class="col-md-2 col-form-label ">Question Type</label>
                <div class="col-md-4">
                    <asp:RadioButtonList ID="qtype" runat="server" class="radio1" RepeatDirection="Horizontal"  OnSelectedIndexChanged="qtype_SelectedIndexChanged" AutoPostBack="True" CellSpacing="100" CellPadding="1">
                        <asp:ListItem Text="MCQ" Value=1></asp:ListItem>
                        <asp:ListItem Text="Fill in Blank" Value=2></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="q_type_validator" runat="server" ErrorMessage="Select Type" ControlToValidate="qtype" ForeColor="Red"></asp:RequiredFieldValidator>
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
                        <asp:Label ID="image_errror_lbl0" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Option B</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txt_optiontwo" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:CheckBox ID="optBCheck" runat="server" Text="Image" AutoPostBack="True" OnCheckedChanged="optBCheck_CheckedChanged" />
                        <asp:FileUpload ID="optBimg" runat="server" Visible="False" />                        
                        <asp:RequiredFieldValidator ID="require_op2" runat="server" ErrorMessage="Enter option two" ControlToValidate="txt_optiontwo" ForeColor="red"></asp:RequiredFieldValidator>
                        <asp:Label ID="image_errror_lbl1" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Option C</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txt_optionthree" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:CheckBox ID="optCCheck" runat="server" Text="Image" AutoPostBack="True" OnCheckedChanged="optCCheck_CheckedChanged" />
                        <asp:FileUpload ID="optCimg" runat="server" Visible="False" />
                        <asp:RequiredFieldValidator ID="require_op3" runat="server" ErrorMessage="Enter option three" ControlToValidate="txt_optionthree" ForeColor="red"></asp:RequiredFieldValidator>
                        <asp:Label ID="image_errror_lbl2" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Option D</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txt_optionfour" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:CheckBox ID="optDCheck" runat="server" Text="Image" AutoPostBack="True" OnCheckedChanged="optDCheck_CheckedChanged" />
                        <asp:FileUpload ID="optDimg" runat="server" Visible="False" />
                        <asp:RequiredFieldValidator ID="require_op4" runat="server" ErrorMessage="Enter option four" ControlToValidate="txt_optionfour" ForeColor="red"></asp:RequiredFieldValidator>
                        <asp:Label ID="image_errror_lbl3" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label text-center">Correct Answer</label>
                        <div class="col-md-4">
                            <asp:RadioButtonList ID="rdo_correctanswer" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="10" CssClass="radio">
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
    <div class="div2">
        <asp:Label ID="Label1" runat="server" ForeColor="#33CC33" Visible="False"></asp:Label>
        <br />
        <asp:Button ID="next_question_btn" runat="server" Text="Add Question" class="btn btn-info" OnClick="next_question_btn_Click"/>
        <asp:Button ID="next_section_btn" runat="server" Text="Next Section" class="btn btn-warning"  OnClientClick="return confirm('Are you sure?');" OnClick="next_section_btn_Click"/>
        <asp:Button ID="test_submit_btn" runat="server" Text="Submit" class="btn btn-success" OnClientClick="return confirm('Are you sure to submit test?');" OnClick="test_submit_btn_Click"/>
        <br />
        <br />
    </div>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <div class="div2">
                <asp:Label ID="Label4" runat="server" Text="New test added successfully" ForeColor="#00CC00" Font-Size="X-Large"></asp:Label>
            </div>
            <table class="table1 table table-bordered">
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Test Id"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="test_id_lbl" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                  <td>
                        <asp:Label ID="Label7" runat="server" Text="Test Name"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="test_name_lbl" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                  <td>
                        <asp:Label ID="Label9" runat="server" Text="No. of question"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="no_of_q_lbl" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                  <td>
                        <asp:Label ID="Label11" runat="server" Text="Total marks"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="total_marks_lbl" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                  <td>
                        <asp:Label ID="Label13" runat="server" Text="Test Duration"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="duration_lbl" runat="server" Text="Null"></asp:Label>
                    </td>
                </tr>
                <tr>
                  <td class="auto-style6">
                        <asp:Label ID="Label15" runat="server" Text="Test Description"></asp:Label>
                    </td>
                    <td class="auto-style7">
                        <asp:Label ID="desc_lbl" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <div class="div2">
                <asp:Button ID="Button1" runat="server" Text="Home Page" class="btn btn-primary" OnClick="Button1_Click"/>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
