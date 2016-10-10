<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctor.Master" AutoEventWireup="true" CodeBehind="edit_prescription.aspx.cs" Inherits="Electronic_Health_Record.edit_prescription" %>

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
                        <h2>Prescription</h2>
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li><a>Edit Prescription</a></li>
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
                            <div class="col-md-4">
                                <asp:Label ID="lblsearcherror" Text="" runat="server" />
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-md-6">
                                <asp:TextBox ID="txtsearch" CssClass="input" placeholder="Patient ID" runat="server" />
                                <asp:AutoCompleteExtender ID="autocompleteextender1" runat="server"
                                    TargetControlID="txtsearch" MinimumPrefixLength="1"
                                    EnableCaching="true" CompletionSetCount="1" CompletionInterval="1000"
                                    ServiceMethod="GetUsers">
                                </asp:AutoCompleteExtender>

                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="btnsearch" Text="Search" runat="server" />
                            </div>
                        </div>


                        <div class="col-md-12">
                            <asp:GridView ID="gridview1" Style="border: thin;" CssClass="col-lg-12" runat="server">
                                <Columns>
                                    <asp:TemplateField>

                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" CssClass="link" ID="lnkedit">Edit</asp:LinkButton>&nbsp;&nbsp;&nbsp;
                                            <%--<asp:LinkButton ID="lnkdelete" CssClass="link" runat="server">Delete</asp:LinkButton>--%>
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
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="Scripts/jquery.searchabledropdown-1.0.8.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("select").searchable();
        });
    </script>
</asp:Content>
