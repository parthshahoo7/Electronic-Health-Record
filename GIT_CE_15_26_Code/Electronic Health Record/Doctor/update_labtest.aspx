<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctor.Master" AutoEventWireup="true" CodeBehind="update_labtest.aspx.cs" Inherits="Electronic_Health_Record.update_labtest" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="sub-banner">
    <div class="detail">
        <div class="container">
            <div class="row">
                <div class="col-md-12">

                    <div class="paging">
                        <h2>Lab Test</h2>
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li><a>Edit Lab Test</a></li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>
        </div>

    <div class="contact-us">
        <div class="container">

            <div class="row">
            </div>

        </div>
        <div class="leave-msg dark-back" id="div1">

            <div class="container">
                
                
                <div class="container">
                    
                    <div class="main-title2" id="labtest" runat="server">
                        
                        <div class="form">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <asp:Label ID="lblnotification" Text="" runat="server" />
                                        <asp:Label ID="lblpid" Text='<% #Eval("p_id") %>' Visible="false" runat="server" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtlabadd" CssClass="input" placeholder="Lab address" TextMode="MultiLine" runat="server" />
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtlabdate" CssClass="input" placeholder="Lab Test Date" runat="server" />
                                        <asp:CalendarExtender ID="CalendarExtender4" TargetControlID="txtlabdate" runat="server"></asp:CalendarExtender>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtpname" CssClass="input" placeholder="Patient Name" Enabled="false" runat="server" />
                                       
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtpatientage" CssClass="input" placeholder="Patient Age" TextMode="Number" runat="server" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtdocname" CssClass="input" placeholder="Ordering Doctor Name" runat="server" />
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txttestname" CssClass="input" placeholder="Lab Test Name" runat="server" />  
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <asp:FileUpload ID="uploadtest" runat="server" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-2">
                                        <asp:Button ID="addtest" Text="Update" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="Scripts/jquery.searchabledropdown-1.0.8.min.js" type="text/javascript"></script>

</asp:Content>
