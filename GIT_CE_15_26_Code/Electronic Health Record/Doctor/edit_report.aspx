<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctor.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="edit_report.aspx.cs" Inherits="Electronic_Health_Record.edit_report" %>

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
        <div class="container">

            <div class="row">
            </div>

        </div>



        <div class="leave-msg dark-back" id="div1">

            <div class="container">
                <div class="form">
                    <div class="row">

                        <div class="col-md-12">
                           
                            <div class="col-md-12">
                                <div class="col-md-4">
                                    <asp:Label ID="lblsearch" Text='<% #Eval("p_id") %>' Visible="false" runat="server" />
                                </div>
                            </div>
                           
                          
                            
                        <div class="col-md-12">
                            <div class="col-md-6">
                                <asp:TextBox ID="txtsearch" CssClass="input" placeholder="Patient Name" OnTextChanged="txtsearch_TextChanged" AutoPostBack="true" runat="server" />
                                <asp:AutoCompleteExtender id="autocompleteextender1" runat="server"
                                     TargetControlID="txtsearch" MinimumPrefixLength="1"
                                     EnableCaching="true" CompletionSetCount="1" CompletionInterval="1000"
                                     ServiceMethod="GetUsers"> </asp:AutoCompleteExtender>       

                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="btnsearch" Text="Search" OnClick="btnsearch_Click" runat="server" />
                            </div>
                        </div>
                        

                            <div class="col-md-12">
                            <asp:GridView ID="gridview1" AutoGenerateColumns="false" DataKeyNames="rt_id" Style="border: thin;" OnRowEditing="gridview1_RowEditing"  CssClass="col-lg-12" runat="server">
                                <Columns>
                                    <asp:BoundField DataField="rt_id" HeaderText="rt_id" Visible="false" />
                                    <asp:BoundField DataField="report_date" HeaderText="Date" />
                                    <asp:BoundField DataField="p_name" HeaderText="Patient Name" />
                                    <asp:BoundField DataField="deaseas_name" HeaderText="Deaseas Name" />    
                                    <asp:TemplateField>
                                        
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" CssClass="link" OnClick="lnkedit_Click" CommandName="Edit" ID="lnkedit">Edit</asp:LinkButton>&nbsp;&nbsp;&nbsp;
                                             <%--<asp:LinkButton ID="lnkdelete" CssClass="link" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this Report?');" runat="server" >Delete</asp:LinkButton>--%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>


                            </asp:GridView>
                        </div>
                            <asp:Label ID="lblerror" Text="" ForeColor="Red" runat="server" />
                        </div>
                        
                    </div>
                </div>


            </div>

        </div>

    </div>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="Scripts/jquery.searchabledropdown-1.0.8.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("select").searchable();
        });
    </script>
</asp:Content>
