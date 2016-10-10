<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminpanel.Master" AutoEventWireup="true" CodeBehind="updatedoctor.aspx.cs" Inherits="Electronic_Health_Record.admin.updatedoctor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager EnablePartialRendering="true" ID="ScriptManager1" runat="server" />
    <ol class="breadcrumb">
        <li>
            <i class="clip-home-3"></i>
            <a href="dashboard.aspx">Home
            </a>
        </li>
        <li>
            <i class="clip-User"></i>
            <a href="#">Manage User</a>
        </li>
        <li class="active">Update Patient
        </li>

    </ol>
    <div class="page-header">
        <h1>Patient</h1>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <fieldset>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-plus"></i>Update Doctor
                                   <div class="panel-tools">
                                       <a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a>
                                       <a class="btn btn-xs btn-link panel-refresh" href="#"><i class="fa fa-refresh"></i></a>
                                       <a class="btn btn-xs btn-link panel-expand" href="#"><i class="fa fa-resize-full"></i></a>
                                       <a class="btn btn-xs btn-link panel-close" href="#"><i class="fa fa-times"></i></a>
                                   </div>
                    </div>
                    <div class="panel-body">
                        <%--<asp:ValidationSummary ID="valSummaryInsert" ValidationGroup="valInsert" runat="server" ForeColor="Red"  />--%>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtuname" ErrorMessage="UserName Required." ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtfname" ErrorMessage="First Name Required." ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtmname" ErrorMessage="Middle Name Required." ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtlname" ErrorMessage="Last Name Required." ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtdob" ErrorMessage="Date of Birth Required." ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtphno" ErrorMessage="Mobile Number Required." ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtemail" ErrorMessage="E-Mail Required." ForeColor="Red"></asp:RequiredFieldValidator>

                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="Invalid E-Mail." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtadd" ErrorMessage="Address Required." ForeColor="Red"></asp:RequiredFieldValidator>


                        <div class="form-horizontal">
                            <div class="form-group">
                                <asp:Label ID="lblupdate" Text="" runat="server" />
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="form-field-1">
                                    UserName
                                </label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtuname" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="form-field-1">
                                    First Name
                                </label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtfname" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="form-field-1">
                                    Middle Name
                                </label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtmname" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="form-field-1">
                                    Last Name
                                </label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtlname" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="form-field-1">
                                    Date of Birth
                                </label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtdob" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="form-field-1">
                                    Phone No.
                                </label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtphno" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="form-field-1">
                                    E-Mail
                                </label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtemail" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>  
                              
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="form-field-1">
                                    Profile Image
                                </label>
                                <div class="col-sm-9">
                                    <asp:Label id="lblimgnm" Visible="false" runat="server" />
                                    <asp:Image ID="Image1" runat="server" Height="50px" Width="50px" />
                                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                                </div>
                            </div>                       

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="form-field-1">
                                    Gender
                                </label>
                                <div class="col-sm-9">
                                    <asp:RadioButton ID="rbdmale" runat="server" GroupName="Enable" Text="male" CssClass="form-control" />
                                    <asp:RadioButton ID="rbdfemale" runat="server" GroupName="Enable" Text="female" CssClass="form-control" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="form-field-1">
                                    Address
                                </label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtadd" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="form-field-1">
                                    License Number
                                </label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtlicenceno" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="form-field-1">
                                    Degree
                                </label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtdegree" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="form-field-1">
                                    Speciality
                                </label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="txtspeciality" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="form-field-1">
                                    Country
                                </label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="drpCountry" AutoPostBack="true" OnSelectedIndexChanged="drpcountry_SelectedIndexChanged" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="form-field-1">
                                    State
                                </label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="drpState" AutoPostBack="true" OnSelectedIndexChanged="drpstate_SelectedIndexChanged" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="form-field-1">
                                    City
                                </label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="drpCity" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                            </div>
                             

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-2 col-sm-offset-3">
                                        <asp:Button ID="btnUpdate" runat="server" Text="Update Patient" CssClass="btn btn-blue next-step btn-block"
                                            OnClick="btnUpdate_Click" />

                                        <asp:Button ID="btnCancle" runat="server" Text="Cancle" CssClass="btn btn-blue next-step btn-block"
                                            CausesValidation="false" OnClick="btnCancle_Click" />
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </fieldset>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnUpdate" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
