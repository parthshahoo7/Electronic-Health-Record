<%@ Page Title="" Language="C#" MasterPageFile="~/Default/Site1.Master" AutoEventWireup="true" CodeBehind="forgotpassword.aspx.cs" EnableEventValidation="false" Inherits="Electronic_Health_Record.forgotpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div  class="sub-banner">
        <div class="detail">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">

                        <div class="paging">
                            <h2>Forgot Password</h2>
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a>Forgot Password</a></li>
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


            <div class="leave-msg dark-back">
                <div class="container">

                    <div class="row">
                        <div class="col-md-12">
                        </div>
                    </div>

                    <div class="form">
                        <div class="row">

                            <div name="contact_form" id="searchuname" runat="server">
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <asp:Label ID="lblmsg" Text="" runat="server" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtuname" runat="server" CssClass="input" placeholder="Enter Your UserName">

                                        </asp:TextBox><asp:RequiredFieldValidator ID="requiredvalidationfname" ValidationGroup="grp1" runat="server" ErrorMessage="UserName Required" ControlToValidate="txtuname" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-md-4">
                                            <asp:Button ID="btnforgotpswd" runat="server" Text="SEARCH" OnClick="btnforgotpswd_Click" ValidationGroup="grp1" />

                                        </div>
                                    </div>


                                
                                </div>
                            <div name="contact_form">
                                <div id="mailauthen" runat="server">
                                    <div class="col-md-12">
                                        
                                            <div class="col-md-4">
                                                <asp:Label ID="lblreset" CssClass="label-warning" Text="" runat="server" />

                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                        <div class="col-md-4">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="grp2" runat="server" ErrorMessage="Code Required" ControlToValidate="txtseccode" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtseccode" runat="server" CssClass="input" placeholder="######">

                                        </asp:TextBox>
                                            </div>
                                            </div>
                                    
                                    <div class="col-md-12">
                                        <div class="col-md-4">
                                            <asp:Button ID="btnreset" Text="SUBMIT" ValidationGroup="grp2" runat="server" OnClick="btnreset_Click" />
                                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="link" OnClick="LinkButton1_Click" CausesValidation="true">Resend Code Again ?</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <asp:Label ID="lblinfo" Text="" runat="server" />
                                    </div>
                                </div>


                           </div> 


                        </div>
                    </div>


                </div>
            </div>

        </div>
    
</asp:Content>
