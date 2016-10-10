<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminpanel.Master" AutoEventWireup="true" CodeBehind="changepassword.aspx.cs" Inherits="Electronic_Health_Record.admin.changepassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <ol class="breadcrumb">
        <li><i class="clip-home-3"></i><a href="dashboard.aspx">Home </a></li>
        <li class="active">Change Password </li>
    </ol>
    <div class="page-header">
        <h1>
            Change Password
        </h1>
    </div>
    <%--<asp:ChangePassword ID="ChangeUserPassword" runat="server" CancelDestinationPageUrl="~/" EnableViewState="false" RenderOuterTable="false" 
         SuccessPageUrl="ChangePasswordSuccess.aspx">
        <ChangePasswordTemplate>
            <span class="failureNotification">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
            <asp:ValidationSummary ID="ChangeUserPasswordValidationSummary" runat="server" CssClass="failureNotification" 
                 ValidationGroup="ChangeUserPasswordValidationGroup"/>
            <div class="accountInfo">
                <fieldset class="changePassword">
                    <legend>Account Information</legend>
                    <p>
                        <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword">Old Password:</asp:Label>
                        <asp:TextBox ID="CurrentPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword" 
                             CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Old Password is required." 
                             ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">New Password:</asp:Label>
                        <asp:TextBox ID="NewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword" 
                             CssClass="failureNotification" ErrorMessage="New Password is required." ToolTip="New Password is required." 
                             ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">Confirm New Password:</asp:Label>
                        <asp:TextBox ID="ConfirmNewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword" 
                             CssClass="failureNotification" Display="Dynamic" ErrorMessage="Confirm New Password is required."
                             ToolTip="Confirm New Password is required." ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                             CssClass="failureNotification" Display="Dynamic" ErrorMessage="The Confirm New Password must match the New Password entry."
                             ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:CompareValidator>
                    </p>
                </fieldset>
                <p class="submitButton">
                    <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"/>
                    <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword" Text="Change Password" 
                         ValidationGroup="ChangeUserPasswordValidationGroup"/>
                </p>
            </div>
        </ChangePasswordTemplate>
    </asp:ChangePassword>--%>
    <div class="panel panel-default">
        <div class="panel-heading">
            <i class="fa fa-file"></i>Change Password
            <div class="panel-tools">
                <a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a><a class="btn btn-xs btn-link panel-refresh"
                    href="#"><i class="fa fa-refresh"></i></a><a class="btn btn-xs btn-link panel-expand"
                        href="#"><i class="fa fa-resize-full"></i></a><a class="btn btn-xs btn-link panel-close"
                            href="#"><i class="fa fa-times"></i></a>
            </div>
        </div>
        <div class="panel-body">
            <asp:ValidationSummary ID="valSummaryInsert" ValidationGroup="valInsert" runat="server"
                CssClass="errorHandler alert alert-danger" ForeColor="Red" />
            <asp:RequiredFieldValidator ID="reqName" runat="server" Display="None" ForeColor="Red"
                ErrorMessage="Old Password Required.." ControlToValidate="txtOldPassword" ValidationGroup="valInsert"></asp:RequiredFieldValidator><br />
            <asp:CompareValidator ID="CompareValidator1" Display="None" ControlToValidate="txtConfirmPassword"
                ControlToCompare="txtNewPassword" runat="server" ForeColor="Red" ErrorMessage="Invalid" />
            <div class="form-horizontal">
                <div class="form-group">
                    <asp:Label ID="lblnotification" CssClass="col-sm-2 control-label" Text="" runat="server" />
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="form-field-1">
                        Old Password
                    </label>
                    <div class="col-sm-9">
                        <asp:TextBox ID="txtOldPassword" TextMode="Password"  runat="server" placeholder="Old Password"
                            CssClass="form-control" />
                        <asp:Label ID="lblOldPassword" runat="server" ForeColor="Red" Text=""></asp:Label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="form-field-1">
                        New Password
                    </label>
                    <div class="col-sm-9">
                        <asp:TextBox ID="txtNewPassword" TextMode="Password"  runat="server" placeholder="New Password"
                            CssClass="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="form-field-1">
                        Confirm Password
                    </label>
                    <div class="col-sm-9">
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtNewPassword"
                                                ControlToValidate="txtConfirmPassword" ForeColor="Red" ErrorMessage="Password Not Match"
                                                ValidationGroup="Required" Display="Dynamic"></asp:CompareValidator>
                        <asp:TextBox ID="txtConfirmPassword" TextMode="Password"  runat="server" placeholder="Confirm Password"
                            CssClass="form-control" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-2 col-sm-offset-3">
                                <asp:Button ID="btnInsert" ValidationGroup="valInsert" runat="server" OnClick="btnInsert_Click" CssClass="btn btn-blue next-step btn-block"
                                    Text="Change Password"  />
                            </div>
                            <div class="col-sm-2 col-sm-offset-6" style="margin-left: 0%;">
                                <asp:Button ID="btnCancel" ValidationGroup="valInsert" runat="server" Text="Reset"
                                    CssClass="btn btn-blue next-step btn-block"  />
                            </div>
                        </div>
                        <div class="row" style="margin-left: 20px">
                            <asp:Label ID="lblInsert" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
