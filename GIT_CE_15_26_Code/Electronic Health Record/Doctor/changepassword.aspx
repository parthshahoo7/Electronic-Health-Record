<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctor.Master" AutoEventWireup="true" CodeBehind="changepassword.aspx.cs" Inherits="Electronic_Health_Record.changepassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="sub-banner">
        <div class="detail">
            <div class="container">
                <div class="row">
                    <%--<div class="col-md-12">

                        <div class="paging">
                            <h2>Change Password</h2>
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a>Change Password</a></li>
                            </ul>
                        </div>

                    </div>--%>
                </div>
            </div>
        </div>
        <div class="contact-us">
            <div class="container">

                <div class="row">
                </div>

            </div>


            <div class="leave-msg dark-back">
                <div class="container">

                    <div class="row">
                        <div class="col-md-12">
                            <div class="main-title">
                                <h2><span>Change Password</span></h2>
                            </div>
                        </div>
                    </div>

                    <div class="form">
                        <div class="row">
                            <%--<asp:ValidationSummary ID="error" runat="server" CssClass="error" Style="color: white; padding: 11px; border-bottom-left-radius: 8px; border-bottom-right-radius: 8px; background-color: red; width: 35%; margin: 10px; font-weight: bold; font-family: sans-serif; border-top-left-radius: 8px; border-top-right-radius: 8px;"
                                ShowMessageBox="false" DisplayMode="List" ValidationGroup="Required" ForeColor="white" BackColor="Red" />--%>
                            <div name="contact_form" id="contact_form">
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <asp:Label ID="lblchangepswd" Text="" runat="server" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <asp:RequiredFieldValidator ID="requiredvalidationfname" ValidationGroup="Required" runat="server" ErrorMessage="Old Password Required" ControlToValidate="txtoldpswd" Display="Dynamic"></asp:RequiredFieldValidator>
                                    
                                    <asp:TextBox ID="txtoldpswd" runat="server" CssClass="input" placeholder="Enter Old Password">

                                    </asp:TextBox>
                                </div>
                                    </div>
                                   <div class="col-md-12">
                                    <div class="col-md-4">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Required" runat="server" ErrorMessage="New Password Required" ControlToValidate="txtoldpswd" Display="Dynamic"></asp:RequiredFieldValidator>
                                
                                    <asp:TextBox ID="txtnewpswd" runat="server" CssClass="input" placeholder="Enter New Password">

                                    </asp:TextBox>
                                </div>
                            </div>
                             <div class="col-md-12">
                                    <div class="col-md-4">
                                        
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtnewpswd"
                                                ControlToValidate="txtcnewpswd" ForeColor="Red" ErrorMessage="Password Not Match"
                                                ValidationGroup="Required" Display="Dynamic"></asp:CompareValidator>
                                    <asp:TextBox ID="txtcnewpswd" runat="server" CssClass="input" TextMode="Password" placeholder="Re-enter New Password">

                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="col-md-4">
                                    <asp:Button ID="btnchangepswd" runat="server" Text="Change" OnClick="btnchangepswd_Click" ValidationGroup="Required" /></div>
                            </div>
                        </div>

                    </div>
                </div>


            </div>
        </div>

    </div>
</asp:Content>
