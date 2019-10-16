<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_home.aspx.cs" Inherits="e_Exam.admin_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div class="col-12">
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
                    <div class="mr-5">Number of registered student:
                        <asp:Label ID="lbltotalexam" runat="server"></asp:Label>
                        </div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="student_detail.aspx">
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
                    <div class="mr-5">Number of registered teacher:
                        <asp:Label ID="lbltotalquestion" runat="server"></asp:Label>
                     </div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="teacher_detail.aspx">
                    <span class="float-left">View Details</span>
                    <span class="float-right">
                        <i class="fa fa-angle-right"></i>
                    </span>
                </a>
            </div>
        </div>
    </div>
</asp:Content>
