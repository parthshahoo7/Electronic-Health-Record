<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/Doctor/doctor.Master" AutoEventWireup="true" CodeBehind="ConfirmAppointment.aspx.cs" Inherits="Electronic_Health_Record.Doctor.ConfirmAppointment" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .modalBackground {
            background-color: black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .modalPopup {
            background-color: rgba(219, 219, 219, 0.92);
            border-width: 3px;
            border-style: solid;
            border-top-left-radius: 30px;
            border-top-right-radius: 30px;
            border-bottom-left-radius: 30px;
            border-bottom-right-radius: 30px;
            border-color: #4848d1;
            padding-top: 10px;
            padding-left: 10px;
            width: 340px;
            height: 340px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="sub-banner">

        <img class="banner-img" src="../images/sub-banner.jpg" alt="">
        <div class="detail">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">

                        <div class="paging">
                            <h2>Contact Us</h2>
                            <ul>
                                <li><a href="index-2.html">Home</a></li>
                                <li><a>Confirm Apoointment</a></li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="content">
        <div class="contact-us">
            <div class="container">

                <div class="row">
                    <div class="col-md-12">
                        <asp:Label Text="" ID="lblapp_doc" AutoPostBack="true" runat="server" />
                        <%--<div class="our-location">
				<div class="map"><iframe src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Envato+Pty+Ltd,+Elizabeth+Street,+Melbourne,+Victoria,+Australia&amp;aq=0&amp;oq=envato+&amp;sll=37.0625,-95.677068&amp;sspn=39.235538,86.572266&amp;ie=UTF8&amp;hq=Envato+Pty+Ltd,&amp;hnear=Elizabeth+St,+Melbourne+Victoria+3000,+Australia&amp;ll=-37.817942,144.964977&amp;spn=0.01918,0.008866&amp;t=m&amp;output=embed"></iframe></div>
                    	<div class="get-directions">
                        	<form action="http://maps.google.com/maps" method="get" target="_blank">
                               <input type="text" name="saddr" placeholder="Enter Your Address" />
                               <input type="hidden" name="daddr" value="Envato Pty Ltd, Elizabeth Street, Melbourne, Victoria, Australia" />
                               <input type="submit" value="Get directions" class="direction-btn" />
                            </form>
                        </div>
                </div>--%>
                    </div>
                </div>

            </div>


            <div class="leave-msg dark-back">
                <div class="container">

                    <div class="rox">
                        <div class="col-md-7">



                            <div class="form">
                                <div class="row">
                                    <strong>
                                    Select Available dates!!!!
                                        </strong>
                                    <p class="success" id="success" style="display: none;"></p>
                                    <p class="error" id="error" style="display: none;"></p>
                                    <div name="contact_form" id="contact_form">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <div class="col-md-8">
                                                    <asp:Calendar CssClass="col-md-12" ID="Calendar1" OnSelectionChanged="Calendar1_SelectionChanged" runat="server" BackColor="White" BorderColor="#3366CC" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="18pt" ForeColor="#003399" Height="305px" Width="998px" BorderWidth="2px" CellPadding="1">
                                                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                                        <NextPrevStyle Font-Size="15pt" ForeColor="#CCCCFF" />
                                                        <OtherMonthDayStyle ForeColor="#999999" />
                                                        <SelectedDayStyle BackColor="#009999" ForeColor="#CCFF99" Font-Bold="True" />
                                                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                                        <TitleStyle BackColor="#003399" Font-Bold="True" Font-Size="20pt" ForeColor="#CCCCFF" Height="25px" BorderColor="#3366CC" BorderWidth="1px" />
                                                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                                        <%-- <WeekendDayStyle BackColor="#CCCCFF" />--%>
                                                    </asp:Calendar>
                                                </div>
                                                <%--<asp:Calendar runat="server"
                                                    BackColor="White"
                                                    BorderColor="Black"
                                                    BorderStyle="Solid"
                                                    CellSpacing="1"
                                                    Font-Names="Verdana"
                                                    Font-Size="19pt"
                                                    ForeColor="Black"
                                                    Height="332px"
                                                    Width="993px"
                                                    NextPrevFormat="ShortMonth"
                                                    SelectionMode="Day">
                                                    <SelectedDayStyle BackColor="DarkOrange"
                                                        ForeColor="White" />
                                                    <DayStyle BackColor="Orange"
                                                        Font-Bold="True"
                                                        ForeColor="White" />
                                                    <NextPrevStyle Font-Bold="True"
                                                        Font-Size="20pt"
                                                        ForeColor="White" />
                                                    <DayHeaderStyle Font-Bold="True"
                                                        Font-Size="15pt"
                                                        ForeColor="#333333"
                                                        Height="8pt" />
                                                    <TitleStyle BackColor="Firebrick"
                                                        BorderStyle="None"
                                                        Font-Bold="True"
                                                        Font-Size="20pt"
                                                        ForeColor="White" Height="20pt" />
                                                    <OtherMonthDayStyle BackColor="NavajoWhite"
                                                        Font-Bold="False"
                                                        ForeColor="DarkGray" />
                                                </asp:Calendar>--%>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>

                                    </div>

                                </div>
                                <asp:Label Text="" ID="label1" runat="server" />

                            </div>


                        </div>



                    </div>

                </div>
                <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="modalBackground" PopupControlID="popup1" CancelControlID="cancle" TargetControlID="label1"></ajaxToolkit:ModalPopupExtender>
                <asp:Panel runat="server" ID="popup1" CssClass="modalPopup">
                    <asp:Label Text="Select Available Time For Appointment" BorderStyle="Double" Style="align-content: center; align-self: center" BackColor="Black" ForeColor="Wheat" runat="server" />
                    <asp:CheckBoxList ID="CheckBoxList1" RepeatColumns="3" CellSpacing="20" ToolTip="Select Available Time" CellPadding="14" runat="server">
                        <asp:ListItem Text="8:00-8:30" />
                        <asp:ListItem Text="8:30-9:00" />
                        <asp:ListItem Text="9:00-9:30" />
                        <asp:ListItem Text="9:30-10:00" />
                        <asp:ListItem Text="10:00-10:30" />
                        <asp:ListItem Text="10:30-11:00" />
                        <asp:ListItem Text="11:00-11:30" />
                        <asp:ListItem Text="11:30-12:00" />
                        <asp:ListItem Text="12:00-12:30" />
                        <asp:ListItem Text="12:30-13:00" />
                        <asp:ListItem Text="13:00-13:30" />
                        <asp:ListItem Text="13:30-14:00" />
                        <asp:ListItem Text="14:00-14:30" />
                        <asp:ListItem Text="14:30-15:00" />
                        <asp:ListItem Text="15:00-15:30" />
                        <asp:ListItem Text="15:30-16:00" />
                        <asp:ListItem Text="16:00-16:30" />
                        <asp:ListItem Text="16:30-17:00" />
                        <asp:ListItem Text="17:00-17:30" />
                        <asp:ListItem Text="17:30-18:00" />
                        <asp:ListItem Text="18:00-18:30" />
                        <asp:ListItem Text="18:30-19:00" />
                        <asp:ListItem Text="19:00-19:30" />
                        <asp:ListItem Text="19:30-20:00" />
                        <asp:ListItem Text="20:00-20:30" />
                        <asp:ListItem Text="20:30-21:00" />
                    </asp:CheckBoxList>
                    <asp:Button Text="cancle" ID="Cancle" CssClass="button" runat="server" />
                    <asp:Button Text="submit" ID="Submit" CssClass="button" OnClick="Submit_Click" runat="server" />

                </asp:Panel>
            </div>



        </div>


    </div>
</asp:Content>
