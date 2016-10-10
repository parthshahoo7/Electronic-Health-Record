<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/user/Main.Master" AutoEventWireup="true" CodeBehind="doctor_list.aspx.cs" Inherits="Electronic_Health_Record.user.doctor_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="member-detail" runat="server">
        <div class="container" runat="server">


            <div class="row" runat="server">

                <asp:DataList runat="server" ID="DataList1" OnSelectedIndexChanged="datalist1_SelectedIndexChanged">
                    <ItemTemplate>
                        <%--<asp:Label Text="" ID="docname" runat="server" />--%>
                        <div class="col-md-5">
                            <asp:Image ID="docimage" ImageUrl='<%# Bind("imagename")%>' style="height:50%; width:50%" runat="server" />
                            <%--<img src="../images/team-member-detail2.jpg" Width="420.896px" Height="315.672px"  alt="">--%>
                        </div>

                        <div class="col-md-7" runat="server">
                            <div class="team-detail" runat="server">

                                <div class="name" runat="server">
                                    <h6 runat="server">
                                        <%-- <asp:Label ID="docname" Text='<%#Eval("FullName") %>' Visible="true"  runat="server" />--%>
                                        <asp:Label ID="lbl_docname" Text='<%#Eval("FullName") %>' Visible="true" runat="server" />
                                    </h6>
                                    <%--<h6>Dr.Andrew Bert</h6>--%>
                                    <span>Outpatient Surgery</span>
                                </div>

                                <ul>
                                    <li><span class="title">Speciality</span>
                                        <span>
                                            <asp:Label Text='<%#Eval("speciality") %>' runat="server" />
                                        </span>
                                        <span><%--<span>Physiotherapist</span>--%></span></li>
                                    <li><span class="title">Degrees</span>
                                        <span>
                                            <asp:Label Text='<%#Eval("degree") %>' runat="server" />
                                            <%--M.D. of Medicine--%></span></li>
                                    <li><span class="title">Contact No:<%--Experience--%></span>
                                        <span>
                                            <asp:Label Text='<%#Eval("phoneno") %>' runat="server" />
                                            <%--38 years of Experience--%></span></li>
                                    <%--<li><span class="title">Book Appointment</span> <span>
                                        <asp:Button Text="Appointment" CssClass="button" ID="bookappointment" OnClick="bookappointment_Click" runat="server" />--%>
                                        <%--Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipisicing elit.--%></span></li>
                                    <li><span class="title">Work days</span> <span>Monday, Friday</span></li>
                                    <li><span class="title">Book Appointment</span>
                                        <span>
                                            <a href="Appointment.aspx">Appointment</a>
                                            <%--<asp:Button Text="Appointment" CssClass="button" ID="bookappointment" OnClick="bookappointment_Click" runat="server" />--%>
                                        </span></li>
                                </ul>

                            </div>
                        </div>

                    </ItemTemplate>
                </asp:DataList>
            </div>

        </div>
    </div>
    <%--<form id="form1" runat="server">
        <div runat="server">
            <asp:DataList runat="server" ID="DataList1" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                <ItemTemplate>
                    <div>
                        <div style="width: 200px height:200px">
                            <asp:Image ID="docimage" runat="server" ImageUrl='<%# Bind("imagename")%>' Height="100px" Width="100px" />
                        </div>
                        <div>
                            <asp:Label Text="docname" ID="docname" runat="server" />
                        </div>
                    </div>

                </ItemTemplate>
            </asp:DataList>
        </div>
    </form>--%>
</asp:Content>
