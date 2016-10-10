<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/Default/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Electronic_Health_Record.Default.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style runat="server" type="text/css">
        input[type="radio"] {
            width: 100px;
            height: 41px;
            display: inline;
            margin-left: 76px;
        }

        /*input[type=radio],
        input.radio {
            float: left;
            clear: none;
            margin: 2px 0 27px 2px;
        }*/


        label {
            margin-right: auto;
            width: auto;
            display: inline-flex;
        }

        /*table.radioButtonList input {
            width: 20px;
            display: block;
            float: left;
        }*

        .radioButtonList {
            list-style: none;
            margin: 0;
            padding: 0;
        }

            .radioButtonList.horizontal li {
                display: inline;*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Start Banner-->

    <div class="sub-banner">

        <img class="banner-img" src="../images/sub-banner.jpg" alt="cover" />
        <div class="detail">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">

                        <div class="paging">
                            <h2>LOGIN</h2>
                            <ul>
                                <li><a href="Home.aspx">Home</a></li>
                                <li><a>LOGIN</a></li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>

    <!--End Banner-->
    <!--Start Content-->
    <div class="contact-us">
        <div class="container">

            <div class="row">
            </div>

        </div>


        <div class="leave-msg dark-back">

            <asp:RadioButtonList runat="server" ID="role" RepeatDirection="Horizontal" RepeatColumns="0">
                <asp:ListItem Value="patient"><img src="../images/patient.png"  style="height:50px; width:50px" /></asp:ListItem>
                <asp:ListItem Value="doctor"><img src="../images/doctor.png"  style="height:50px; width:50px" /></asp:ListItem>
                <asp:ListItem Value="insurance"><img src="../images/insurance.png" style="height:50px; width:50px" /></asp:ListItem>
            </asp:RadioButtonList>

            <div class="container">

                <div class="row">
                    <div class="col-md-12">
                    </div>
                </div>

                <div class="form">
                    <div class="row">
                        <asp:ValidationSummary ID="error" runat="server" CssClass="error" Style="color: white; padding: 11px; border-bottom-left-radius: 8px; border-bottom-right-radius: 8px; background-color: red; width: 35%; margin: 10px; font-weight: bold; font-family: sans-serif; border-top-left-radius: 8px; border-top-right-radius: 8px;"
                            ShowMessageBox="false" DisplayMode="List" ValidationGroup="Required" ForeColor="white" BackColor="Red" />
                        <asp:Label ID="lblerror" CssClass="label-danger" runat="server" />
                        <div name="contact_form" id="contact_form">
                            <%-- <div class="col-md-12">
                        <div class="col-md-4">
                            <asp:Label ID="lblerror" CssClass="label-danger" runat="server" />
                        </div>
                    </div>--%>
                            <div class="col-md-12">
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtuname" runat="server" CssClass="input" placeholder="Enter Your User Name">

                                    </asp:TextBox><asp:RequiredFieldValidator ID="requiredvalidationfname" ValidationGroup="Required" runat="server" ErrorMessage="User Name Required" ControlToValidate="txtuname" Display="None"></asp:RequiredFieldValidator>
                                </div>

                            </div>
                            <div class="col-md-12">
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtpswd" runat="server" CssClass="input" TextMode="Password" Placeholder="Enter Your Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="requiredvalidationpswd" ErrorMessage="Password Required" Display="None" ControlToValidate="txtpswd" runat="server" ValidationGroup="Required" />
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="col-md-4">
                                    <asp:Button ID="btnlogin" runat="server" Text="LogIn" ValidationGroup="Required" OnClick="Login_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12" style="margin: 10px">
                            <div class="col-md-4">
                                <a href="forgotpassword.aspx" class="link">Can't access account ?</a>
                            </div>
                        </div>
                        <div class="col-md-12" style="margin: 10px">
                            <div class="co-md-4">
                                <a href="sign.aspx">Can't have an account ?</a>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>

    </div>

    <!--End Content-->
</asp:Content>
