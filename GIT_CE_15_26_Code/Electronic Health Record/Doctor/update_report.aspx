<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctor.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="update_report.aspx.cs" Inherits="Electronic_Health_Record.update_report" %>

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
                        <h2>Patient Report</h2>
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li><a>Edit Patient Report</a></li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>
        </div>
    <div class="contact-us">
        <div class="leave-msg dark-back">
            <div class="container">
                <div class="form">
                    <div id="report" runat="server">
                       

                        <div class="form">
                            <div class="row">

                                <div name="contact_form" id="contact_form1">
                                    <div class="col-md-12">
                                        <div class="col-md-4">
                                            <asp:Label ID="lblreportid" Text="" Visible="false" runat="server" />
                                        </div>
                                        <div class="col-md-4">
                                            <asp:Label ID="lblnotofication" CssClass="label-success" Text="" runat="server" />
                                        </div>

                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtdate" CssClass="input" ToolTip="Date of Report Creation" placeholder="Today Date" runat="server" />
                                            <asp:CalendarExtender ID="calendarextender" TargetControlID="txtdate" runat="server"></asp:CalendarExtender>
                                        </div>
                                        <div class="col-md-4">
                                           
                                            <asp:TextBox ID="txtpname" CssClass="input" placeholder="Patient Name" Enabled="false" runat="server" />
                                            
                                                  
                                                     
                                        </div>
                                                   
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtage" CssClass="input" placeholder="Patient Age" TextMode="Number" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-md-4">
                                            <asp:DropDownList ID="drpmarrige" Style="height: 45px; width: 300px;" runat="server">
                                                <asp:ListItem Text="Married" />
                                                <asp:ListItem Text="Unmarried" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtpadmit" CssClass="input" Style="margin-top: 14px;" placeholder="Admit Date" runat="server" />
                                            <asp:CalendarExtender ID="CalendarExtender1" TargetControlID="txtpadmit" runat="server"></asp:CalendarExtender>
                                        </div>
                                        <div class="col-md-1">
                                            <asp:TextBox ID="txtpadmittimeh" CssClass="input" placeholder="Hrs" ToolTip="Admit Time" Style="margin-top: 14px;" runat="server" />
                                        </div>

                                        <div class="col-md-1">
                                            <asp:TextBox ID="txtpadmittimem" CssClass="input" placeholder="Min" ToolTip="Admit Time" Style="margin-top: 14px;" runat="server" />
                                        </div>
                                        <div class="col-md-1">
                                           <%-- <asp:DropDownList ID="drppadmittime" CssClass="dropdown-header" ToolTip="Admit Time" Style="margin-top: 14px; height: 48px" runat="server">
                                                <asp:ListItem Text="AM" />
                                                <asp:ListItem Text="PM" />
                                            </asp:DropDownList>--%>
                                            <asp:TextBox ID="drppadmittime" CssClass="input" placeholder="AM/PM" ToolTip="Admit Time" Style="margin-top: 14px;" runat="server" />

                                        </div>

                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtpdischarge" CssClass="input" placeholder="Discharge Date" runat="server" />
                                            <asp:CalendarExtender ID="CalendarExtender2" TargetControlID="txtpdischarge" runat="server"></asp:CalendarExtender>
                                        </div>
                                        <div class="col-md-1">
                                            <asp:TextBox ID="txtpdischargetimeh" CssClass="input" ToolTip="Discharge Time" placeholder="Hrs" runat="server" />
                                        </div>

                                        <div class="col-md-1">
                                            <asp:TextBox ID="txtpdischargetimem" CssClass="input" ToolTip="Discharge Time" placeholder="Min" runat="server" />
                                        </div>
                                        <div class="col-md-1">
                                          <%--  <asp:DropDownList ID="drppdischargetime" ToolTip="Discharge Time" CssClass="dropdown-header" Style="height: 48px" runat="server">
                                                <asp:ListItem Text="AM" />
                                                <asp:ListItem Text="PM" />
                                            </asp:DropDownList>--%>
                                            <asp:TextBox ID="drppdischargetime" CssClass="input" ToolTip="Discharge Time" placeholder="AM/PM" runat="server" />
                                        </div>

                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtpdeseasename" CssClass="input" placeholder="Deaseas Name" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtpdescription" CssClass="input" placeholder="Deseas Related Description" TextMode="MultiLine" runat="server" />
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>

                        <div class="main-title2">
                            <h2><span>Billing Details</span></h2>
                            <div class="form">
                                <div class="row">
                                    <div name="contact_form" id="contact_form2">
                                        <div class="col-md-12">
                                            <div class="col-md-4">
                                                <asp:Label Text="Room Type : " runat="server" />
                                                <asp:DropDownList ID="drproomtype" runat="server">
                                                    <asp:ListItem Text="General Word" />
                                                    <asp:ListItem Text="Non AC Room" />
                                                    <asp:ListItem Text="AC Room" />
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="col-md-4" style="padding-top: 14px">
                                                <asp:TextBox ID="txtdays" CssClass="input" placeholder="Number of Days For Treatment" runat="server" />
                                            </div>
                                            <div class="col-md-4" style="padding-top: 14px">
                                                <asp:TextBox ID="txtcharge" CssClass="input" placeholder="Charges for room" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtdoctorcharge" CssClass="input" placeholder="Doctor visit charge" runat="server" />
                                            </div>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtnursecharge" CssClass="input" placeholder="Nursing charge" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtmedicalcharge" CssClass="input" placeholder="Medicine Charge" runat="server" />  
                                            </div>
                                             <div class="col-md-4">
                                                <asp:TextBox ID="txtothercharge" CssClass="input" placeholder="other Charge" runat="server" />  
                                            </div>
                                        </div>
                                            <div class="col-md-2">
                                                <asp:Button ID="btnreport" Text="Update" OnClick="btnreport_Click" runat="server" />
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
