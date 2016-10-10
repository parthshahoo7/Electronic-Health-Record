<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctor.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="Electronic_Health_Record.Doctor.EditProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="contact-us">
        <div class="container">

            <div class="row">
            </div>

        </div>



        <div class="leave-msg dark-back" id="div1">
            
            <div class="container">

                <div class="row">
                    <div class="col-md-12">
                        <div class="main-title">
                            <h2><span>Edit Profile</span></h2>
                            <asp:Label ID="lblupdate" Text="" runat="server" />
                            <p></p>
                        </div>
                    </div>
                </div>

                <div class="form">
                    <div class="row">
                        <%--<asp:ValidationSummary ID="error" runat="server" CssClass="error" Style="color: red; padding: 11px; border-bottom-left-radius: 8px; border-bottom-right-radius: 8px; width: 35%; margin: 10px; font-weight: bold; font-family: sans-serif; border-top-left-radius: 8px; border-top-right-radius: 8px;"
                                    ShowMessageBox="false" DisplayMode="List" ValidationGroup="Required" ForeColor="Red" />--%>
                        <div name="contact_form" id="contact_form">
                            <div class="col-md-12">
                                <div class="col-md-4">
                                     <asp:RequiredFieldValidator ID="requiredvalidationfname" CssClass="error" ValidationGroup="Required" runat="server" ForeColor="Red" ErrorMessage="First Name Required" ControlToValidate="txtfname" Display="Dynamic"></asp:RequiredFieldValidator>

                                    <asp:TextBox ID="txtfname" runat="server" CssClass="input" placeholder="First Name"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Required" runat="server" ForeColor="Red" ErrorMessage="Middle Name Required" ControlToValidate="txtmname" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                    <asp:TextBox ID="txtmname" runat="server" CssClass="input" Placeholder="Middle Name"></asp:TextBox>

                                </div>
                                <div class="col-md-4">
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="Required" runat="server" ForeColor="Red" ErrorMessage="Last Name Required" ControlToValidate="txtlname" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                    <asp:TextBox ID="txtlname" runat="server" CssClass="input" Placeholder="Last Name"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="col-md-4">
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="Required" runat="server" ForeColor="Red" ErrorMessage="Username Required" ControlToValidate="txtusername" Display="Dynamic"></asp:RequiredFieldValidator>--%>


                                    <asp:TextBox ID="txtusername" runat="server" CssClass="input" Enabled="false" AutoPostBack="true" placeholder="Username"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="col-md-4">
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtemail"
                                                ForeColor="Red" ErrorMessage="Email-id Reuired" ValidationGroup="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtemail"
                                                ForeColor="Red" ErrorMessage="Input correct email-id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                ValidationGroup="Required" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                                    <asp:TextBox ID="txtemail" runat="server" CssClass="input" placeholder="E-mail" TextMode="Email"></asp:TextBox>

                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="col-md-4">
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtphone"
                                                ForeColor="Red" ErrorMessage="Mobile Number Reuired" ValidationGroup="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="Required" runat="server"
                                                ControlToValidate="txtphone" ErrorMessage="Insert atleast 10 digit"
                                                ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>--%>
                                    <asp:TextBox ID="txtphone" runat="server" CssClass="number" placeholder="Mobile Number" TextMode="Phone"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="col-md-4" style="padding-top: 18px;">
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Birth Date Required" ValidationGroup="Required" ForeColor="Red" Display="Dynamic" ControlToValidate="txtdob" runat="server" />--%>
                                    <asp:TextBox ID="txtdob" runat="server" CssClass="input" placeholder="Birth Date"></asp:TextBox>
                                    <%-- <asp:CalendarExtender ID="CalendarExtender1" TargetControlID="txtdob" runat="server"></asp:CalendarExtender>--%>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="col-md-4">
                                    <asp:RadioButtonList ID="rbgender" CssClass="pulse" RepeatDirection="Horizontal" runat="server">
                                        <asp:ListItem Text="Male" Selected="True" />
                                        <asp:ListItem Text="Feamle" />
                                    </asp:RadioButtonList>
                                    <%--<asp:RadioButton ID="rbmale" Text="Male" CssClass="radio" Style="height:20px; "  GroupName="gender" Checked="true" runat="server" />--%>
                                </div>
                                <%-- <div class="col-md-4" Style="height:20px;">
                                            <asp:RadioButton ID="rbfemale" Text="Female" CssClass="radio" GroupName="gender" runat="server" />
                                        </div>--%>
                            </div>

                            <div class="col-md-12">
                                <div class="col-md-6">
                                    <%-- <asp:RequiredFieldValidator ErrorMessage="Address Required" ForeColor="Red" ValidationGroup="Required" ControlToValidate="txtadd" runat="server" />--%>
                                    <asp:TextBox ID="txtadd" runat="server" CssClass="input" Placeholder="Address" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="col-md-4">
                                    <%--<asp:RequiredFieldValidator ErrorMessage="Select Your Country" InitialValue="Please Select" ForeColor="Red" ValidationGroup="Required" ControlToValidate="country" runat="server" />--%>

                                    <asp:TextBox ID="country" CssClass="input" runat="server" />

                                </div>
                                <div class="col-md-4">
                                    <%-- <asp:RequiredFieldValidator ErrorMessage="Select Your State" ForeColor="Red" ValidationGroup="Required" ControlToValidate="state" runat="server" />--%>

                                    <asp:TextBox ID="state" CssClass="input" runat="server" />

                                </div>
                                <div class="col-md-4">
                                    <%-- <asp:RequiredFieldValidator ErrorMessage="Select Your City" ForeColor="Red" ValidationGroup="Required" ControlToValidate="city" runat="server" />--%>

                                    <asp:TextBox ID="city" CssClass="input" runat="server" />

                                </div>
                            </div>
                            <div class="row">
                            </div>
                              <div class="col-md-12">
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="drpdegree" CssClass="dropdown-header" Style="padding: 14px 98px; margin-top: 3%;" runat="server">
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
                            <div class="col-md-12">
                                <div class="col-md-6">
                                    <asp:Label Text="" ID="lblimgnm" runat="server" />
                                        <asp:Image ID="image1"  Height="50px" Width="50px" Visible="true" runat="server" />
                                </div>
                            </div>
                            <div class="col-md-12" style="padding-top: 15px; margin-top: 2%">
                                <div class="col-md-4">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="photoupload"
                                        ErrorMessage="Upload Your Photo" ForeColor="Red" ValidationGroup="Required" Display="Dynamic"></asp:RequiredFieldValidator>
                                    
                                    <asp:FileUpload ID="photoupload" AllowMultiple="false" runat="server"></asp:FileUpload>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="col-md-2">
                                    <asp:Button ID="btnupdate" runat="server" Text="Update" OnClick="btnupdate_Click" ValidationGroup="Required" />

                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>

    </div>
</asp:Content>
