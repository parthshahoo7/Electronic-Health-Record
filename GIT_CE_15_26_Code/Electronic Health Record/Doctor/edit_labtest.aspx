<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctor.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="edit_labtest.aspx.cs" Inherits="Electronic_Health_Record.edit_labtest" %>

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
                        <h2>Lab Test</h2>
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li><a>Edit Lab Test</a></li>
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
                                <asp:label id="lblpid" text='<% #Eval("p_id") %>' Visible="false" runat="server" />
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-md-6">
                                <asp:TextBox ID="txtpname" CssClass="input" placeholder="Patient Name" AutoPostBack="true" OnTextChanged="txtpname_TextChanged" runat="server" />
                                <asp:AutoCompleteExtender ID="autocompleteextender1" runat="server"
                                    TargetControlID="txtpname" MinimumPrefixLength="1"
                                    EnableCaching="true" CompletionSetCount="1" CompletionInterval="1000"
                                    ServiceMethod="GetUsers">
                                </asp:AutoCompleteExtender>

                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="btnsearch" Text="Search" OnClick="btnsearch_Click" runat="server" />
                            </div>
                        </div>

                        <div class="col-md-12">
                            <asp:GridView ID="gridview1" AutoGenerateColumns="false" DataKeyNames="lab_id" OnRowEditing="gridview1_RowEditing"   Style="border: thin;" CssClass="col-lg-12" runat="server">
                                <Columns>
                                    <%--<asp:CommandField ShowSelectButton="true" SelectText="Download" ControlStyle-ForeColor="Blue" />--%>
                                    <asp:BoundField DataField="lab_id" HeaderText="lab_id" />
                                    <asp:BoundField DataField="test_date" HeaderText="Date" />
                                    <asp:BoundField DataField="patient_name" HeaderText="Patient Name" />
                                    <asp:BoundField DataField="test_name" HeaderText="Test Name" />    
                                    <asp:TemplateField>
                                        
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkDownload" runat="server" CausesValidation="False" CommandArgument='<%#Bind("file_path") %>' CommandName="Download" OnClick="lnkDownload_Click" Text="Download" />&nbsp;&nbsp;&nbsp;
                                            <asp:LinkButton runat="server" CssClass="link" CommandName="Edit" ID="lnkedit">Edit</asp:LinkButton>&nbsp;&nbsp;&nbsp;
                                             <%--<asp:LinkButton ID="lnkdelete" CssClass="link" runat="server" OnClientClick="return confirm('Are you sure you want to delete this Report?');" CommandName="Delete" >Delete</asp:LinkButton>--%>
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
