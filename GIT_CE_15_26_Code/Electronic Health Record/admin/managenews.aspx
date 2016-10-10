<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminpanel.Master" AutoEventWireup="true" CodeBehind="managenews.aspx.cs" Inherits="Electronic_Health_Record.managenews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager EnablePartialRendering="true" ID="ScriptManager1" runat="server" />
    <ol class="breadcrumb">
        <li>
            <i class="clip-home-3"></i>
            <a href="dashboard.aspx">Home
            </a>
        </li>
        <li>
            <i class="clip-location"></i>
            <a href="#">News</a>
        </li>
        <li class="active">Manage News
        </li>

    </ol>
    <div class="page-header">
        <h1>News</h1>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <fieldset>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-plus"></i>Add News
                                   <div class="panel-tools">
                                       <a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a>
                                       <a class="btn btn-xs btn-link panel-refresh" href="#"><i class="fa fa-refresh"></i></a>
                                       <a class="btn btn-xs btn-link panel-expand" href="#"><i class="fa fa-resize-full"></i></a>
                                       <a class="btn btn-xs btn-link panel-close" href="#"><i class="fa fa-times"></i></a>
                                   </div>
                    </div>
                    <div class="panel-body">
                        <%--<asp:ValidationSummary ID="valSummaryInsert" ValidationGroup="valInsert" runat="server" ForeColor="Red"  />--%>
                        <asp:RequiredFieldValidator ID="reqCountryName" runat="server" ForeColor="Red" ErrorMessage="News Date Required.."
                            ControlToValidate="txtnewsdate" ValidationGroup="valInsert"></asp:RequiredFieldValidator><br />

                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="form-field-1">
                                    News Date
                                </label>
                                <div class="col-sm-9">
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtnewsdate" runat="server" placeholder="News Date" CssClass="form-control" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="form-field-1">
                                    News Author
                                </label>
                                <div class="col-sm-9">
                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtnewsauthor" runat="server" placeholder="Author Name" CssClass="form-control" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="form-field-1">
                                    News Title
                                </label>
                                <div class="col-sm-9">
                                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtnewstitle" runat="server" placeholder="News Tilte" CssClass="form-control" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="form-field-1">
                                    News Point
                                </label>
                                <div class="col-sm-9">
                                    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtnewspoint" runat="server" placeholder="News Point" CssClass="form-control" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="form-field-1">
                                    News description
                                </label>
                                <div class="col-sm-9">
                                    <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtnewsdescription" runat="server" placeholder="News description" CssClass="form-control" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="form-field-1">
                                    News Catagory
                                </label>
                                <div class="col-sm-9">
                                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtnewscatagory" runat="server" placeholder=" News Catagory" CssClass="form-control" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-2 col-sm-offset-3">
                                        <asp:Button ID="btnInsert" ValidationGroup="valInsert" CssClass="btn btn-blue next-step btn-block" runat="server" Text="Add News" OnClick="btnInsert_Click" />
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <fieldset>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-file"></i>Manage News
                                <div class="panel-tools">
                                    <a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a><a class="btn btn-xs btn-link panel-refresh"
                                        href="#"><i class="fa fa-refresh"></i></a><a class="btn btn-xs btn-link panel-expand"
                                            href="#"><i class="fa fa-resize-full"></i></a><a class="btn btn-xs btn-link panel-close"
                                                href="#"><i class="fa fa-times"></i></a>
                                </div>
                    </div>
                    <div class="panel-body">
                        <asp:ListView ID="lstEvent" runat="server"
                            GroupPlaceholderID="groupPlaceHolder1"
                          
                            OnItemCanceling="lstEvent_ItemCanceling"
                            OnItemEditing="lstEvent_ItemEditing"
                            OnItemDeleting="lstEvent_ItemDeleting"
                            OnItemUpdating="lstEvent_ItemUpdating"
                            ItemPlaceholderID="itemPlaceHolder1">
                            <LayoutTemplate>
                                <table class="table table-striped table-bordered table-hover" id="sample-table-2">
                                    <tr>
                                        <th class="center">
                                            <div class="checkbox-table">
                                                <label>
                                                    <input type="checkbox" id="chkSelectAll" runat="server" class="flat-grey">
                                                </label>

                                            </div>
                                        </th>
                                        <th class="center">News
                                        </th>

                                        <th></th>
                                    </tr>
                                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>
                                </table>
                            </LayoutTemplate>
                            <GroupTemplate>
                                <tr>
                                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                                </tr>
                            </GroupTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="center">
                                        <div class="checkbox-table">
                                            <label>
                                                <input type="checkbox" id="chkSelect" runat="server" class="flat-grey">
                                            </label>

                                        </div>
                                    </td>
                                    <asp:Label ID="lblnewsid" Visible="False" runat="server" Text='<%# Eval("n_id") %>'></asp:Label>
                                    </td>
                                    <td class="center">
                                        <asp:Label ID="lblnewsdate" runat="Server" Text='<%# Eval("date") %>'></asp:Label>
                                    </td>
                                    <td class="center">
                                        <asp:Label ID="lblnewsauthor" runat="Server" Text='<%# Eval("author") %>'></asp:Label>
                                    </td>
                                    <td class="center">
                                        <asp:Label ID="lblnewstitle" runat="Server" Text='<%# Eval("news_title") %>'></asp:Label>
                                    </td>
                                    <td class="center">
                                        <asp:Label ID="lblnewspoint" runat="Server" Text='<%# Eval("news_point") %>'></asp:Label>
                                    </td>
                                    <td class="center">
                                        <asp:Label ID="lblnewsdescription" runat="Server" Text='<%# Eval("news_description") %>'></asp:Label>
                                    </td>
                                    <td class="center">
                                        <asp:Label ID="lblnewscatagory" runat="Server" Text='<%# Eval("news_catagory") %>'></asp:Label>
                                    </td>
                                   

                                    <td>
                                        <div class="visible-md visible-lg hidden-sm hidden-xs" runat="server" id="EditDelete">
                                            <asp:LinkButton ID="lnkEdit" CommandName="Edit" class="btn btn-xs btn-teal tooltips"
                                                data-placement="top" data-original-title="Edit" runat="server"><i class="fa fa-edit"></i></asp:LinkButton>
                                            <asp:LinkButton ID="lnkDelete" CommandName="Delete" class="btn btn-xs btn-bricky tooltips"
                                                data-placement="top" data-original-title="Remove" runat="server"><i class="fa fa-trash-o"></i></asp:LinkButton>
                                        </div>
                                        <div class="visible-xs visible-sm hidden-md hidden-lg">
                                            <div class="btn-group">
                                                <a class="btn btn-primary dropdown-toggle btn-sm" data-toggle="dropdown" href="#"><i
                                                    class="fa fa-cog"></i><span class="caret"></span></a>
                                                <ul role="menu" class="dropdown-menu pull-right">
                                                    <li role="presentation"><i class="fa fa-edit"></i>Edit </li>
                                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><i class="fa fa-times"></i>Remove </a></li>
                                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><i class="fa fa-share"></i>Save </a></li>
                                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><i class="fa fa-share"></i>Cancel </a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" runat="server"
                                    ErrorMessage="News Date Required.." ControlToValidate="txtnewsdate" ValidationGroup="valView"></asp:RequiredFieldValidator><br />--%>
                                <tr>
                                    <th class="center">
                                        <div class="checkbox-table">
                                            <label>
                                                <input type="checkbox" id="chkSelectAll" runat="server" class="flat-grey">
                                            </label>

                                        </div>
                                    </th>
                                    <asp:Label ID="lblnewsid" Visible="False" runat="server" Text='<%# Eval("n_id") %>'></asp:Label>
                                    </td>
                                    <td class="center">
                                        <asp:TextBox ID="lblnewsdate" runat="Server" Text='<%# Eval("date") %>'></asp:TextBox>
                                    </td>
                                    <td class="center">
                                        <asp:TextBox ID="lblnewsauthor" runat="Server" Text='<%# Eval("author") %>'></asp:TextBox>
                                    </td>
                                    <td class="center">
                                        <asp:TextBox ID="lblnewstitle" runat="Server" Text='<%# Eval("news_title") %>'></asp:TextBox>
                                    </td>
                                    <td class="center">
                                        <asp:TextBox ID="lblnewspoint" runat="Server" Text='<%# Eval("news_point") %>'></asp:TextBox>
                                    </td>
                                    <td class="center">
                                        <asp:TextBox ID="lblnewsdescription" runat="Server" Text='<%# Eval("news_description") %>'></asp:TextBox>
                                    </td>
                                    <td class="center">
                                        <asp:TextBox ID="lblnewscatagory" runat="Server" Text='<%# Eval("news_catagory") %>'></asp:TextBox>
                                    </td>
                                   


                                    <td>
                                        <div class="visible-md visible-lg hidden-sm hidden-xs" runat="server" id="EditDelete">
                                            <asp:LinkButton ID="lnkSave" CommandName="Update" class="btn btn-xs btn-teal tooltips"
                                                data-placement="top" data-original-title="Update" runat="server"><i class="fa fa-save"></i></asp:LinkButton>
                                            <asp:LinkButton ID="lnkCancel" CommandName="Cancel" class="btn btn-xs btn-bricky tooltips"
                                                data-placement="top" data-original-title="Cancel" runat="server"><i class="fa fa-times"></i></asp:LinkButton>
                                        </div>
                                        </div>
                                        <div class="visible-xs visible-sm hidden-md hidden-lg">
                                            <div class="btn-group">
                                                <a class="btn btn-primary dropdown-toggle btn-sm" data-toggle="dropdown" href="#"><i
                                                    class="fa fa-cog"></i><span class="caret"></span></a>
                                                <ul role="menu" class="dropdown-menu pull-right">
                                                    <li role="presentation"><i class="fa fa-edit"></i>Edit </li>
                                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><i class="fa fa-times"></i>Remove </a></li>
                                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><i class="fa fa-share"></i>Save </a></li>
                                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><i class="fa fa-share"></i>Cancel </a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </EditItemTemplate>
                        </asp:ListView>
                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                        <asp:Label ID="img_id" runat="server" Text=""></asp:Label>
                        <asp:Label ID="lblImagename" Visible="false" runat="server"></asp:Label>
                        <asp:Label ID="Label1" Visible="false" runat="server"></asp:Label>
                    </div>
                </div>
            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
