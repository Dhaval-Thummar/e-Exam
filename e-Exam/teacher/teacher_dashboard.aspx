<%@ Page Title="" Language="C#" MasterPageFile="~/teacher.Master" AutoEventWireup="true" CodeBehind="teacher_dashboard.aspx.cs" Inherits="e_Exam.teacher_dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <style type="text/css">
        .style1 {
            text-align:center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div  class="col-12">
        <h1>Dashboard</h1>
        <hr />
    </div>
    <div class="row">
                <div class="col-xl-4 col-sm-6 mb-4">
        <div class="card text-white bg-primary o-hidden h-100">
            <div class="card-body">
                <div class="card-body-icon">
                    <i class="fa fa-fw fa-comments"></i>
                </div>
                <div class="mr-5">You have added <asp:Label ID="lbltotalexam" runat="server"></asp:Label> Tests</div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="exam.aspx">
                <span class="float-left">View Details</span>
                <span class="float-right">
                    <i class="fa fa-angle-right"></i>
                </span>
            </a>
        </div>
    </div>
        <div class="col-xl-4 col-sm-6 mb-4">
        <div class="card text-white bg-warning o-hidden h-100">
            <div class="card-body">
                <div class="card-body-icon">
                    <i class="fa fa-fw fa-comments"></i>
                </div>
                <div class="mr-5">You have added <asp:Label ID="lbltotalquestion" runat="server"></asp:Label> questions</div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="question.aspx">
                <span class="float-left">View Details</span>
                <span class="float-right">
                    <i class="fa fa-angle-right"></i>
                </span>
            </a>
        </div>
    </div>
    </div>
        <div class="col-md-12">
        <div class="card">
            <div class="card-header">
                <asp:Panel ID="panel_index_warning" runat="server" Visible="false">
                    <div class="card-footer">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_indexwarning" runat="server" />
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
    </asp:Content>

