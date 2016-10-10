<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminpanel.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Electronic_Health_Record.admin.dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- start: PAGE HEADER -->
    <div class="row">
        <div class="col-sm-12">
            <!-- start: PAGE TITLE & BREADCRUMB -->
            <ol class="breadcrumb">
                <li>
                    <i class="clip-home-3"></i>
                    <a href="dashboard.aspx">Home
                    </a>
                </li>
                <li class="active">Dashboard
                </li>
                
            </ol>
            <div class="page-header">
                <h1>Dashboard <small> Welcome to Back Office </small></h1>
            </div>
            <!-- end: PAGE TITLE & BREADCRUMB -->
        </div>
    </div>
    <!-- end: PAGE HEADER -->
    <!-- start: PAGE CONTENT -->
    <div class="row">
        <div class="col-sm-4">
            <div class="core-box">
                <div class="heading">
                    <i class="clip-leaf circle-icon circle-green"></i>
                    <h2>Manage User (Menu)</h2>
                </div>
                <div class="content">
                    
                </div>
                <a class="view-more" href="ManageProducts.aspx">View More <i class="clip-arrow-right-2"></i>
                </a>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="core-box">
                <div class="heading">
                    <i class="clip-location circle-icon circle-teal"></i>
                    <h2>Manage Event</h2>
                </div>
                <div class="content">
                    
                </div>
                <a class="view-more" href="ManageEvent.aspx">View More <i class="clip-arrow-right-2"></i>
                </a>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="core-box">
                <div class="heading">
                    <i class="clip-network circle-icon circle-bricky"></i>
                    <h2>Manage Location</h2>
                </div>
                <div class="content">
                
                </div>
                <a class="view-more" href="ManagePromotion.aspx">View More <i class="clip-arrow-right-2"></i>
                </a>
            </div>
        </div>
    </div>
    <div class="row">
    </div>
   
    <!-- end: PAGE CONTENT-->
</asp:Content>
