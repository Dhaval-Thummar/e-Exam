<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="student_homepage.aspx.cs" Inherits="e_Exam.student_homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <div class="row">
        <div class="col-xl-4 col-sm-6 mb-4">
            <div class="card text-white bg-primary o-hidden h-100">
                <div class="card-body">
                    <div class="card-body-icon">
                        <i class="fa fa-fw fa-comments"></i>
                    </div>
                    <div class="mr-5 ">You have given
                        <asp:Label ID="lbltotaltest" runat="server"></asp:Label>
                        Test</div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="result.aspx">
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
                    <div class="mr-5">You have 
                        <asp:Label ID="lbltestpending" runat="server"></asp:Label>
                        Test pending</div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="student/student_dashboard.aspx">
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
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
