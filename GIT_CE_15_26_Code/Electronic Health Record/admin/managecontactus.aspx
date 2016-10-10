<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminpanel.Master" AutoEventWireup="true" CodeBehind="managecontactus.aspx.cs" Inherits="Electronic_Health_Record.admin.managecontactus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager EnablePartialRendering="true" ID="ScriptManager2" runat="server" />
    <ol class="breadcrumb">
        <li><i class="clip-home-3"></i><a href="dashboard.aspx">Home </a></li>
        <li class="active">Feedback </li>
    </ol>
    <div class="page-header">
        <h1>
            Feedback</h1>
    </div>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <fieldset>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-file"></i>Feedback
                        <div class="panel-tools">
                            <a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a><a class="btn btn-xs btn-link panel-config"
                                href="#panel-config" data-toggle="modal"><i class="fa fa-wrench"></i></a><a class="btn btn-xs btn-link panel-refresh"
                                    href="#"><i class="fa fa-refresh"></i></a><a class="btn btn-xs btn-link panel-expand"
                                        href="#"><i class="fa fa-resize-full"></i></a><a class="btn btn-xs btn-link panel-close"
                                            href="#"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="panel-body">
                        <asp:ListView ID="lstContactus" runat="server" GroupPlaceholderID="groupPlaceHolder1"
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
                                        <th>
                                            Name
                                        </th>
                                        <th>
                                            Mail ID
                                        </th>
                                        <th>
                                            Subject
                                        </th>
                                        <th>
                                            Message
                                        </th>
                                        <th class="hidden-xs">
                                            Created On
                                        </th>
                                        <th>
                                            Active
                                        </th>
                                        <th>
                                        </th>
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
                                    <asp:Label ID="lblcontactusID" Visible="False" runat="Server" Text='<%# Eval("c_id") %>'></asp:Label>
                                    <td>
                                        <asp:Label ID="lblProductName" runat="Server" Text='<%# Eval("c_name") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label1" runat="Server" Text='<%# Eval("c_mail") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label3" runat="Server" Text='<%# Eval("c_sub") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label4" runat="Server" Text='<%# Eval("c_message") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblCdate" runat="Server" Text='<%# Eval("c_cDate") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label2" runat="Server" Text='<%# Eval("c_IsActive") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <div class="visible-md visible-lg hidden-sm hidden-xs" runat="server" id="EditDelete">
                                            <asp:LinkButton ID="lnkDelete" CommandName="Delete" class="btn btn-xs btn-bricky tooltips"
                                                data-placement="top" data-original-title="Remove" runat="server"><i class="fa fa-times fa fa-white"></i></asp:LinkButton>
                                        </div>
                                        <div class="visible-xs visible-sm hidden-md hidden-lg">
                                            <div class="btn-group">
                                                <a class="btn btn-primary dropdown-toggle btn-sm" data-toggle="dropdown" href="#"><i
                                                    class="fa fa-cog"></i><span class="caret"></span></a>
                                                <ul role="menu" class="dropdown-menu pull-right">
                                                    <li role="presentation"><i class="fa fa-edit"></i>Edit </li>
                                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><i class="fa fa-times">
                                                    </i>Remove </a></li>
                                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><i class="fa fa-share">
                                                    </i>Save </a></li>
                                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><i class="fa fa-share">
                                                    </i>Cancel </a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
