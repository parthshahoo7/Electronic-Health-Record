<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/user/Main.Master" AutoEventWireup="true" CodeBehind="patientappointment.aspx.cs" Inherits="Electronic_Health_Record.user.patientappointment" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrap">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="content">
            <div class="contact-us">
                <%--<div class="container">

                    <div class="row">

                        <div class="get-touch">
                            <div class="col-md-6">

                                <div class="main-title">
                                    <h2><span>San</span> Francisco</h2>
                                    <p>cursus lorem molestie vitae. Nulla vehicula, lacus ut suscipit fermentum, turpis felis ultricies dui, ut rhoncus libero augue at liberolacus ut suscipit fermentum turpis. </p>
                                </div>

                                <div class="map">
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3151.8655244315096!2d144.9554158!3d-37.8166187!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad65d4c2b349649%3A0xb6899234e561db11!2sEnvato!5e0!3m2!1sen!2s!4v1437236216432" width="100%" height="460px" frameborder="0" style="border: 0" allowfullscreen></iframe>
                                    <div class="get-directions">
                                        <form action="http://maps.google.com/maps" method="get" target="_blank">
                                            <input type="text" name="saddr" placeholder="Enter Your Address" />
                                            <input type="hidden" name="daddr" value="Envato Pty Ltd, Elizabeth Street, Melbourne, Victoria, Australia" />
                                            <input type="submit" value="Get directions" class="direction-btn" />
                                        </form>
                                    </div>
                                </div>

                                <div class="detail">
                                    <span><b>Phone:</b> 1.800.555.6789</span>
                                    <span><b>Email:</b> support@medical.com</span>
                                    <span><b>Web:</b> www.Medicalguide.com</span>
                                    <span><b>Address:</b> 12345 North Main Street, New York, NY 555555</span>
                                </div>

                            </div>

                            <div class="col-md-6">
                                <div class="contact-adrs2">

                                    <div class="main-title">
                                        <h2><span>Cape</span> Twon</h2>
                                        <p>cursus lorem molestie vitae. Nulla vehicula, lacus ut suscipit fermentum, turpis felis ultricies dui, ut rhoncus libero augue at liberolacus ut suscipit fermentum turpis. </p>
                                    </div>

                                    <div class="map">
                                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6305.606734438974!2d-122.39947661499052!3d37.79464769631387!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8085808aa44da05d%3A0x7bd6bdbc78216027!2sBrook+Furniture+Rental+-+San+Francisco%2C+CA!5e0!3m2!1sen!2s!4v1437244029146" width="100%" height="460" frameborder="0" style="border: 0" allowfullscreen></iframe>
                                        <div class="get-directions">
                                            <form action="http://maps.google.com/maps" method="get" target="_blank">
                                                <input type="text" name="saddr" placeholder="Enter Your Address" />
                                                <input type="hidden" name="daddr" value="500 Washington St #100, San Francisco, CA 94111, United States" />
                                                <input type="submit" value="Get directions" class="direction-btn" />
                                            </form>
                                        </div>
                                    </div>

                                    <div class="detail">
                                        <span><b>Phone:</b> 1.800.555.6789</span>
                                        <span><b>Email:</b> support@medical.com</span>
                                        <span><b>Web:</b> www.Medicalguide.com</span>
                                        <span><b>Address:</b> 12345 North Main Street, New York, NY 555555</span>
                                    </div>

                                </div>
                            </div>

                        </div>


                    </div>

                </div>--%>


                <div class="leave-msg dark-back">
                    <div class="container">

                        <div class="row">
                            <div class="col-md-12">
                                <div class="main-title">
                                    <h2><span>We'd</span> Love to <span>Hear From You</span></h2>
                                    <p>If you need a doctor for to consectetuer Lorem ipsum dolor, consectetur adipiscing elit. Ut volutpat eros  adipiscing nonummy.</p>
                                </div>
                            </div>
                        </div>

                        <div class="form">
                            <div class="row">
                                <p class="success" id="success" style="display: none;"></p>
                                <p class="error" id="error" style="display: none;"></p>
                                <form name="contact_form" id="contact_form" method="post" action="#" onsubmit="return false">
                                    <div class="col-md-4">
                                        <asp:Label Text="Search Doctor" runat="server" />
                                        <asp:TextBox runat="server" CssClass="input" placeholder="Search Doctor" ID="docname" />
                                        <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server"
                                            ServiceMethod="AutoCompleteAjaxRequest"
                                            ServicePath="~/user/AutoComplete.asmx"
                                            MinimumPrefixLength="1"
                                            CompletionInterval="100"
                                            EnableCaching="false"
                                            CompletionSetCount="10"
                                            TargetControlID="docname"
                                            FirstRowSelected="false"
                                            DelimiterCharacters="/">
                                        </ajaxToolkit:AutoCompleteExtender>
                                        <%--<input type="text" data-delay="300" placeholder="Your full name" name="contact_name" id="contact_name" class="input">--%>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label Text="Select Speciality" runat="server" />
                                        <asp:DropDownList runat="server" ID="docspeciality" CssClass="dropdown-header"  Style="height: 50px; width:375px">
                                            <asp:ListItem Text="<--Select Speciality-->" />
                                            <asp:ListItem Text="Andrology" />
                                            <asp:ListItem Text="Anesthesiology" />
                                            <asp:ListItem Text="Audiology" />
                                            <asp:ListItem Text="Biochemistry" />
                                            <asp:ListItem Text="Cardiac Surgery" />
                                            <asp:ListItem Text="Cardiology" />
                                            <asp:ListItem Text="Cardiothoracic Surgery" />
                                            <asp:ListItem Text="Clinical trial" />
                                        </asp:DropDownList>
                                       <%-- <input type="text" data-delay="300" placeholder="E-mail Address" name="contact_email" id="contact_email" class="input">--%>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label Text="Select Location" runat="server" />
                                        <asp:TextBox runat="server" CssClass="input" placeholder="Enter state/city" ID="location" />
                                        <%--<input type="text" data-delay="300" placeholder="Subject" name="contact_subject" id="contact_subject" class="input">--%>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:Button Text="Search" ID="search" OnClick="search_Click" runat="server" />
                                        <%--<textarea data-delay="500" class="required valid" placeholder="Message" name="message" id="message"></textarea>--%>
                                    </div>
                                    <%--<div class="col-md-2">
                                        <input name=" " type="submit" value="submit" onclick="validateContact();">
                                    </div>--%>
                                </form>

                            </div>
                        </div>


                    </div>
                </div>

            </div>


        </div>


        

    </div>


</asp:Content>
