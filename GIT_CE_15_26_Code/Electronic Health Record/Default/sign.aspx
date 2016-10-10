<%@ Page Title="" Language="C#" MasterPageFile="~/Default/Site1.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="sign.aspx.cs" Inherits="Electronic_Health_Record.Default.sign" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style runat="server" type="text/css">
        input[type="radio"] {
            width: 100px;
            height: 41px;
            display: inline;
            margin-left: 76px;
        }

        label {
            margin-right: auto;
            width: auto;
            display: inline-flex;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contact-us">
        <div class="container">

            <div class="row">
            </div>

        </div>
        <div>

            <asp:MultiView ActiveViewIndex="0" ID="multiview" runat="server">

                <asp:View runat="server" ID="view1">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="leave-msg dark-back" id="div1">
                                <div class="main-title">
                                    <div class="row">
                                        <div class="col-md-12" style="margin-left: 95px">
                                            <h2><span>Personal Details</span></h2>
                                            <p></p>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <asp:RadioButtonList runat="server" ID="Dropbutton1" AutoPostBack="true" OnSelectedIndexChanged="Dropbutton1_SelectedIndexChanged" RepeatDirection="Horizontal" RepeatColumns="0">
                                        <asp:ListItem Value="Patient"></asp:ListItem>
                                        <asp:ListItem Value="Doctor"></asp:ListItem>
                                        <asp:ListItem Value="insurance"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>

                                <div class="container">


                                    <%--<div class="row">
                                        <div class="col-md-12">
                                            <%--<asp:ValidationSummary ID="error"
                                        runat="server" CssClass="error" HeaderText="Following Errors Occured:" ShowSummary="true"
                                        DisplayMode="BulletList" ValidationGroup="Required"
                                        ForeColor="Red" BackColor="Snow" />

                                            <div class="main-title">
                                                <h2><span>Personal Details</span></h2>
                                                <p></p>
                                            </div>
                                        </div>
                                    </div>--%>

                                    <div class="form">
                                        <div class="row">


                                            <div class="contact_form" id="contact_form">
                                                <div class="col-md-12">
                                                    <div class="col-md-4">
                                                        <asp:RequiredFieldValidator ID="rfv1" runat="server"
                                                            ErrorMessage="Enter First Name" ControlToValidate="txtfname"
                                                            Display="Dynamic" ForeColor="Red" ValidationGroup="Required"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                            ControlToValidate="txtfname" Display="Dynamic" ErrorMessage="Enter Valid name."
                                                            ForeColor="Red" ValidationGroup="Required" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
                                                        <asp:TextBox ID="txtfname" runat="server" CssClass="input" placeholder="First Name"></asp:TextBox>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                                            ValidationGroup="Required" Display="Dynamic" runat="server"
                                                            ErrorMessage="Enter Middle Name" ForeColor="Red" ControlToValidate="txtmname">                                                   
                                                        </asp:RequiredFieldValidator>
                                                        <asp:TextBox ID="txtmname" runat="server" CssClass="input" Placeholder="Middle Name"></asp:TextBox>

                                                    </div>
                                                    <div class="col-md-4">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="Required"
                                                            runat="server" ErrorMessage="Enter Last Name" ForeColor="Red" Display="Dynamic"
                                                            ControlToValidate="txtlname"></asp:RequiredFieldValidator>
                                                        <asp:TextBox ID="txtlname" runat="server" CssClass="input" Placeholder="Last Name"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="col-md-4">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="Required" runat="server" ErrorMessage="Enter Username" ControlToValidate="txtusername" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                        <asp:Label ID="label1" Text="" runat="server" />
                                                        <asp:TextBox ID="txtusername" runat="server" AutoPostBack="true" OnTextChanged="txtusername_TextChanged" CssClass="input" placeholder="Username"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="col-md-4">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="Required" runat="server" ErrorMessage="Enter password" ControlToValidate="txtpswd" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtcpswd"
                                                            ErrorMessage="Password does not match!" ForeColor="Red" ValidationExpression="((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,12})"
                                                            ValidationGroup="Required" Display="Dynamic"></asp:RegularExpressionValidator>
                                                        <asp:TextBox ID="txtpswd" runat="server" CssClass="input" Placeholder="Password"></asp:TextBox>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <asp:CompareValidator ID="CompareValidator1" runat="server" Display="Dynamic" ErrorMessage="CompareValidator" ControlToCompare="txtpswd" ControlToValidate="txtcpswd"></asp:CompareValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtcpswd"
                                                            ErrorMessage="password does not match!" ForeColor="Red" ValidationExpression="((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,12})"
                                                            ValidationGroup="Required" Display="Dynamic"></asp:RegularExpressionValidator>
                                                        <asp:TextBox ID="txtcpswd" runat="server" CssClass="input" TextMode="Password" Placeholder="Confirm Password"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="col-md-4">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="Required" runat="server" ErrorMessage="Enter Email" ControlToValidate="txtemail" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtemail"
                                                            ErrorMessage="Enter Valid Email ID!" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                            ValidationGroup="Required" Display="Dynamic"></asp:RegularExpressionValidator>
                                                        <asp:TextBox ID="txtemail" runat="server" CssClass="input" placeholder="E-mail" TextMode="Email"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-12" style="padding-top: 15px; width: ">
                                                    <div class="col-md-4">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="Required" runat="server" ErrorMessage="Phone No Required" ControlToValidate="txtphone" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                        <asp:TextBox ID="txtphone" runat="server" CssClass="number" placeholder="Mobile Number" TextMode="Phone"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <%--<div class="col-md-12" >
                                                            <div class="col-md-4" style="padding-top: 18px;" >
                                                                <asp:TextBox runat="server" ForeColor="Black" CssClass=" input__field input__field--kohana" placeholder="dob" ID="datepicker" TextMode="DateTime" />
                                                            </div>
                                                        </div>--%>
                                                <div class="col-md-12">
                                                    <div class="col-md-4" style="padding-top: 18px;">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="Required" runat="server" ErrorMessage="Date Of birth Required" ControlToValidate="txtdob" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" TargetControlID="txtdob" runat="server" />
                                                        <asp:TextBox ID="txtdob" runat="server" AutoPostBack="true" CssClass="input" placeholder="Date Of Birth"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="col-md-3" style="padding-top: 18px;">
                                                        <asp:DropDownList runat="server" ID="dpgender">
                                                            <asp:ListItem ID="ListItem1" Text="Male" Value="Male" runat="server"></asp:ListItem>
                                                            <asp:ListItem ID="ListItem2" Text="Female" Value="Female" runat="server"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="col-md-2">
                                                        <asp:Button ID="nextbutton" runat="server" Text="NEXT" CommandArgument="view2" CommandName="SwitchViewByID" OnClick="nextbutton_Click" ValidationGroup="Required" />
                                                    </div>
                                                </div>
                                            </div>

                                        </div>


                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="nextbutton" />
                        </Triggers>

                    </asp:UpdatePanel>
                </asp:View>
                <asp:View runat="server" ID="view2">

                    <div class="leave-msg dark-back" id="div2">
                        <div class="container">

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="main-title">
                                        <h2><span>Address Details</span></h2>
                                        <p></p>
                                    </div>
                                </div>
                            </div>

                            <div class="form">
                                <div class="row">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="error" ShowMessageBox="True" DisplayMode="List" ValidationGroup="Required" ForeColor="white" BackColor="Red" />
                                            <div class="contact_form1" id="contact_form1">

                                                <div class="col-md-12">
                                                    <div class="col-md-12">
                                                        <asp:TextBox ID="txtadd" runat="server" CssClass="input" Placeholder="Address" TextMode="MultiLine"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="col-md-4">
                                                        <asp:DropDownList ID="drpcountry" DataTextField="countryname" AutoPostBack="true" OnSelectedIndexChanged="drpcountry_SelectedIndexChanged" DataValueField="country_id" runat="server" CssClass="dropdown-header">
                                                            <asp:ListItem Text="<--select-->" />
                                                        </asp:DropDownList>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <asp:DropDownList ID="drpstate" DataTextField="statename" DataValueField="state_id" AutoPostBack="true" OnSelectedIndexChanged="drpstate_SelectedIndexChanged" runat="server" CssClass="dropdown-header">
                                                            <asp:ListItem Text="<--select-->" />
                                                        </asp:DropDownList>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <asp:DropDownList ID="drpcity" DataTextField="cityname" DataValueField="city_id" CssClass="dropdown-header" runat="server">
                                                            <asp:ListItem Text="<--select-->" />
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <%--<div class="row">
                                                            <div class="col-md-12">
                                                                <div class="main-title">
                                                                    <h2><span>Role Details</span></h2>
                                                                    <p></p>
                                                                </div>
                                                            </div>
                                                        </div>--%>
                                                <div id="fudiv" runat="server" class="col-md-12" style="padding-top: 15px;">
                                                    <div class="col-md-4">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="Required" runat="server" ErrorMessage="File Must Uploaded" ControlToValidate="photoupload" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                        <asp:FileUpload ID="photoupload" runat="server"></asp:FileUpload>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="col-md-2">
                                                        <asp:Button ID="previousbutton" runat="server" Text="PREVIOUS" OnClick="previousbutton_Click" />
                                                    </div>
                                                    <div class="col-md-2">
                                                        <asp:Button ID="nextbutton1" runat="server" Text="NEXT" OnClick="nextbutton1_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:PostBackTrigger ControlID="nextbutton1" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </div>


                        </div>
                    </div>

                </asp:View>

                <asp:View runat="server" ID="view3">
                    <div class="leave-msg dark-back" id="div3">

                        <div class="container">

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="main-title">
                                        <h2><span>Doctor Details</span></h2>
                                        <p></p>
                                    </div>
                                </div>
                            </div>



                            <div class="form">
                                <div class="row">
                                </div>
                                <%-- <div class="col-md-12">
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="drptype" CssClass="dropdown-header" Style="padding: 14px 98px;" runat="server">
                                            <asp:ListItem Text="Type Of Doctor" />
                                            <asp:ListItem Text="text2" />
                                        </asp:DropDownList>
                                    </div>
                                </div>--%>
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="degree" CssClass="dropdown-header" Style="padding: 14px 98px; margin-top: 3%;" runat="server">
                                            <asp:ListItem Text="Degree" />
                                            <asp:ListItem Text="MBBS" />
                                            <asp:ListItem Text="MD" />
                                            <asp:ListItem Text="DENTAL" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="drpspeciality" CssClass="dropdown-header" Style="padding: 14px 98px; margin-top: 3%;" runat="server">
                                            <asp:ListItem Text="Speciality" />
                                            <asp:ListItem Text="Cancer Specialist" />
                                            <asp:ListItem Text="PHYSICIAN" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtlicense" CssClass="input" placeholder="License Number" Style="margin-top: 4%;" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div runat="server" class="col-md-12" style="padding-top: 15px;">
                                    <div class="col-md-4">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Required" runat="server" ErrorMessage="File Must Uploaded" ControlToValidate="photoupload" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:FileUpload ID="FileUpload1" runat="server"></asp:FileUpload>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-2">
                                        <asp:Button ID="previousbutton1" runat="server" Text="Back" OnClick="previousbutton1_Click1" />
                                    </div>
                                    <div class="col-md-2">
                                        <asp:Button ID="nextbutton2" runat="server" Text="SignUp" OnClick="nextbutton2_Click" />
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </asp:View>
                <asp:View runat="server" ID="view4">
                    <div class="leave-msg dark-back" id="div4">
                        <div class="container">

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="main-title">
                                        <h2><span>Insurance Details</span></h2>
                                        <p></p>
                                    </div>
                                </div>
                            </div>
                            <div class="form">
                                <div class="row">
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="drpcompany" CssClass="dropdown-header" Style="padding: 14px 98px;" runat="server">
                                            <asp:ListItem Text="Company Name" />
                                            <asp:ListItem Text="LIC" />
                                            <asp:ListItem Text="KOTAK" />
                                            <asp:ListItem Text="BAJAJ" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-4">
                                        <asp:TextBox ID="TextBox2" CssClass="input" placeholder="License Number" Style="margin-top: 4%;" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="Required" runat="server" ErrorMessage="File Must Uploaded" ControlToValidate="photoupload" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:FileUpload ID="insurance_fileupload" runat="server"></asp:FileUpload>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-2">
                                        <asp:Button ID="previousbutton2" runat="server" Text="Previous" OnClick="previousbutton2_Click" />
                                    </div>
                                    <div class="col-md-2">
                                        <asp:Button ID="nextbutton3" runat="server" Text="SignUp" OnClick="nextbutton3_Click" />
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>

        </div>
    </div>

</asp:Content>

