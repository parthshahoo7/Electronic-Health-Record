<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctor.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="add_prescription1.aspx.cs" Inherits="Electronic_Health_Record.add_prescription1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <%-- <style type="text/css">
        .CheckBoxList1 {
            height: 58px;
            width: 48px;
        }
    </style>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="sub-banner">
        <div class="detail">
            <%--<div class="container">--%>
                <div class="row">
                    <div class="col-md-12">

                        <div class="paging">
                            <h2>Prescription</h2>
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a>Add Prescription</a></li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="contact-us">
        <div class="container">
        </div>
        <div class="leave-msg dark-back" id="div1">

            <div class="container">


                <div class="container">

                    <div class="main-title2" id="prescription" runat="server">

                        <div class="form">
                            <div class="row">

                                <div name="contact_form" id="contact_form3">
                                    <div class="col-md-12">
                                        <div class="col-md-4">
                                            <asp:Label ID="lblpid" Text='<%# Eval("p_id") %>' runat="server" Visible="false" />
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-md-4">
                                            <asp:RequiredFieldValidator ErrorMessage="Date Required" Display="Dynamic" ControlToValidate="txtpredate" ForeColor="Red" ValidationGroup="prescription" runat="server" />
                                            <asp:TextBox ID="txtpredate" placeholder="Prescription Date" CssClass="input" runat="server" />
                                            <asp:CalendarExtender ID="CalendarExtender3" TargetControlID="txtpredate" runat="server"></asp:CalendarExtender>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-md-4">
                                            <asp:RequiredFieldValidator ErrorMessage="Name Required" Display="Dynamic" ControlToValidate="txtprename" ForeColor="Red" ValidationGroup="prescription" runat="server" />
                                            <asp:TextBox ID="txtprename" placeholder="Patient Name" OnTextChanged="txtprename_TextChanged" AutoPostBack="true" CssClass="input" runat="server" />
                                            <asp:AutoCompleteExtender ID="autocompleteextender" runat="server"
                                                TargetControlID="txtprename" MinimumPrefixLength="1"
                                                EnableCaching="true" CompletionSetCount="1" CompletionInterval="1000"
                                                ServiceMethod="GetUsers">
                                            </asp:AutoCompleteExtender>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:RequiredFieldValidator ErrorMessage="Age Required" Display="Dynamic" ControlToValidate="txtpreage" ForeColor="Red" ValidationGroup="prescription" runat="server" />
                                            <asp:TextBox ID="txtpreage" placeholder="Patient Age" CssClass="input" TextMode="Number" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-md-4">
                                            <asp:RequiredFieldValidator ErrorMessage="Doctor Name Required" Display="Dynamic" ControlToValidate="txtmadeby" ForeColor="Red" ValidationGroup="prescription" runat="server" />
                                            <asp:TextBox ID="txtmadeby" CssClass="input" placeholder="Made By" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div>


                                    <asp:Table Style="margin-top: 30px; margin-left: 10px" CssClass="table-bordered col-md-12" runat="server">
                                        <asp:TableHeaderRow>
                                            <asp:TableCell Text="Medicine Name">
                
                                            </asp:TableCell>
                                            <asp:TableCell Text="Time">
                
                                            </asp:TableCell>
                                            <asp:TableCell Text="Before / After">
                
                                            </asp:TableCell>
                                            <asp:TableCell Text="Advice">
                
                                            </asp:TableCell>

                                        </asp:TableHeaderRow>
                                        <asp:TableRow>
                                            <asp:TableCell>
                                                <asp:RequiredFieldValidator ErrorMessage="Medicine Name Required" Display="Dynamic" ControlToValidate="TextBox1" ForeColor="Red" ValidationGroup="prescription" runat="server" />
                                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                            </asp:TableCell>
                                            <asp:TableCell>

                                                <asp:CheckBoxList ID="CheckBoxList1" RepeatDirection="Horizontal"  runat="server">
                                                    <asp:ListItem>Morning</asp:ListItem>
                                                    <asp:ListItem>Evening</asp:ListItem>
                                                    <asp:ListItem>Night</asp:ListItem>
                                                   
                                                </asp:CheckBoxList>
                                            </asp:TableCell>
                                            <asp:TableCell>

                                                <asp:RadioButtonList ID="RadioButtonList1" RepeatDirection="Horizontal" runat="server">
                                                    <asp:ListItem>Before Meal</asp:ListItem>
                                                    <asp:ListItem>After Meal</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:RequiredFieldValidator ErrorMessage="Advice Required" Display="Dynamic" ControlToValidate="TextBox4" ForeColor="Red" ValidationGroup="prescription" runat="server" />
                                                <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine"></asp:TextBox>
                                            </asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableFooterRow>
                                            <asp:TableCell>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                            </asp:TableCell>
                                            <asp:TableCell>
                                                <asp:Button ID="AddMedicine" runat="server" Style="color: White" Text="Add Medicine"
                                                    OnClick="AddMedicine_Click1" BackColor="#999966" />
                                            </asp:TableCell>
                                        </asp:TableFooterRow>
                                    </asp:Table>

                                    <div style="margin-left: 10px; margin-top: 10px">
                                        <asp:GridView ID="GridView1" AutoGenerateColumns="false" CssClass="col-md-12" runat="server" CellPadding="4"
                                            ForeColor="#333333" GridLines="None">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField HeaderStyle-Width="120px" HeaderText="Medicine  Name" DataField="MediName" />
                                                <asp:BoundField HeaderStyle-Width="120px" HeaderText="Time" DataField="Time" />
                                                <asp:BoundField HeaderStyle-Width="120px" HeaderText="Schedule" DataField="Schedule" />
                                                <asp:BoundField HeaderStyle-Width="120px" HeaderText="Advice" DataField="Advice" />
                                            </Columns>
                                            <EditRowStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                            <RowStyle BackColor="#EFF3FB" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                        </asp:GridView>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-2">
                                        <asp:Button ID="btnprscription" Text="ADD" OnClick="btnprscription_Click" runat="server" />
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
