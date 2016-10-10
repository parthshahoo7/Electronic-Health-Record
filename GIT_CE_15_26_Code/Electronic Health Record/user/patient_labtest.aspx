<%@ Page Title="" Language="C#" MasterPageFile="~/user/Main.Master" AutoEventWireup="true" CodeBehind="patient_labtest.aspx.cs" EnableEventValidation="false" Inherits="Electronic_Health_Record.patient_labtest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sub-banner">
        <div class="detail">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">

                        <div class="paging">
                            <h2>Patient History</h2>
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a>Lab Report</a></li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="contact-us">
        <div class="container">

            <div class="row">
            </div>

        </div>


        <div class="leave-msg dark-back" id="history" runat="server">
            <div class="container">

                <div class="form">
                    <div class="row">
                        <div runat="server">
                            <div class="col-md-4">
                                <asp:Label ID="lblerror" Text="" runat="server" />
                                <asp:Label ID="lblpid" runat="server" Text='<%#Eval("p_id") %>' Visible="false"></asp:Label>
                            </div>
                            <asp:GridView ID="gridview" DataKeyNames="lab_id" CssClass="col-lg-12"  AutoGenerateColumns="false" runat="server">
                                <Columns>
                                    <asp:BoundField DataField="lab_id" HeaderText="Lab_id" />    
                                    <asp:BoundField DataField="test_date" HeaderText="Date" />
                                    <asp:BoundField DataField="patient_name" HeaderText="Patient Name" />
                                    <asp:BoundField DataField="test_name" HeaderText="Deaseas Name" />
                                    <asp:BoundField DataField="doc_name" HeaderText="Doctor Name" />   
                                    
                                    <asp:TemplateField>

                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkDownload" runat="server" CausesValidation="False" CommandArgument='<%#Bind("file_path") %>' CommandName="Download" OnClick="lnkDownload_Click" Text="View" />

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                        </div>
                    </div>
                </div>
            </div>

        </div>

        

        
    </div>
</asp:Content>