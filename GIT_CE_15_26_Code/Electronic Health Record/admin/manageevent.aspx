<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminpanel.Master" AutoEventWireup="true" CodeBehind="manageevent.aspx.cs" Inherits="Electronic_Health_Record.admin.manageevent" %>
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
            <i class="clip-camera"></i>
            <a href="#">Gallery</a>
        </li>
        <li class="active">Manage Album
        </li>
    </ol>
    <div class="page-header">
        <h1>
            Album</h1>
    </div>
    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <fieldset>--%>
    <div class="panel panel-default">
        <div class="panel-heading">
            <i class="fa fa-plus"></i>Add Album
            <div class="panel-tools">
                <a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a><a class="btn btn-xs btn-link panel-refresh"
                    href="#"><i class="fa fa-refresh"></i></a><a class="btn btn-xs btn-link panel-expand"
                        href="#"><i class="fa fa-resize-full"></i></a><a class="btn btn-xs btn-link panel-close"
                            href="#"><i class="fa fa-times"></i></a>
            </div>
        </div>
        <div class="panel-body">
            <asp:ValidationSummary ID="valSummaryInsert" ValidationGroup="valInsert" CssClass="errorHandler alert alert-danger"
                runat="server" ForeColor="Red" />
            <asp:RequiredFieldValidator ID="reqEventName" runat="server" ForeColor="Red" ErrorMessage="Album Name Required.."
                ControlToValidate="txtEventName" Display="None" ValidationGroup="valInsert"></asp:RequiredFieldValidator><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="None" runat="server"
                ForeColor="Red" ErrorMessage="Image Required.." ControlToValidate="FUImageInsert"
                ValidationGroup="valInsert"></asp:RequiredFieldValidator>
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="form-field-1">
                        Album Name
                    </label>
                    <div class="col-sm-9">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="txtEventName" runat="server" placeholder="Album Name"
                                    CssClass="form-control" />
                                <asp:Label ID="lblEventName" runat="server" ForeColor="Red" Text=""></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
               
                <div class="form-group">
                    <label class="col-sm-2  control-label">
                        Album Image
                    </label>
                    <div class="col-sm-4">
                        <asp:FileUpload ID="FUImageInsert" runat="server" />
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="row">
                        <div class="col-sm-2 col-sm-offset-3">
                            <asp:Button ID="btnInsert" ValidationGroup="valInsert" CssClass="btn btn-blue next-step btn-block"
                                runat="server" Text="Add Album" OnClick="btnInsert_Click" />
                        </div>
                        <div class="col-sm-2 col-sm-offset-3" style="margin-left: 1px">
                            <asp:Button ID="btnCancel" ValidationGroup="valInsert" CssClass="btn btn-blue next-step btn-block"
                                runat="server" Text="Reset" OnClick="btnCancel_Click" />
                        </div>
                        <br />
                    </div>
                    <div class="row" style="margin-left: 10px">
                        <asp:Label ID="lblInsert" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--  </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>--%>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <fieldset>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-file"></i>Manage Album
                        <div class="panel-tools">
                            <a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a><a class="btn btn-xs btn-link panel-refresh"
                                href="#"><i class="fa fa-refresh"></i></a><a class="btn btn-xs btn-link panel-expand"
                                    href="#"><i class="fa fa-resize-full"></i></a><a class="btn btn-xs btn-link panel-close"
                                        href="#"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="panel-body">
                        <asp:ListView ID="lstEvent" runat="server" GroupPlaceholderID="groupPlaceHolder1"
                            OnItemCanceling="OnItemCanceling" OnItemEditing="OnItemEditing" OnItemDeleting="OnItemDeleting"
                            OnItemUpdating="OnItemUpdating" ItemPlaceholderID="itemPlaceHolder1">
                            <LayoutTemplate>
                                <table class="table table-striped table-bordered table-hover" id="sample-table-2">
                                    <tr>
                                        <th class="center">
                                            <div class="checkbox-table">
                                                <label>
                                                    <input type="checkbox" id="chkSelectAll" runat="server" class="flat-grey">
                                                </label>
                                                &nbsp;&nbsp;&nbsp;</div>
                                        </th>
                                        <th class="center">
                                            Image
                                        </th>
                                        <th>
                                            Name
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
                                            &nbsp;&nbsp;&nbsp;</div>
                                    </td>
                                    <asp:Label ID="txtID" Visible="False" runat="server" Text='<%# Eval("evt_id") %>'></asp:Label>
                                    </td>
                                    <td class="center">
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/gallery/" + Eval("evt_image")%>'
                                            Height="50px" Width="50px" />
                                        <asp:Label ID="image_name" Visible="false" runat="server" />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblEvntName" runat="Server" Text='<%# Eval("evt_name") %>'></asp:Label>
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
                            <EditItemTemplate>
                                <asp:ValidationSummary ID="valSummaryView" ValidationGroup="valView" CssClass="errorHandler alert alert-danger"
                                    runat="server" ForeColor="Red" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" runat="server"
                                    ErrorMessage="Album Name Required.." Display="None" ControlToValidate="txtEventName"
                                    ValidationGroup="valView"></asp:RequiredFieldValidator><br />
                                
                                <tr>
                                    <th class="center">
                                        <div class="checkbox-table">
                                            <label>
                                                <input type="checkbox" id="chkSelectAll" runat="server" class="flat-grey">
                                            </label>
                                            &nbsp;&nbsp;&nbsp;</div>
                                    </th>
                                    <asp:Label ID="txtID" Visible="False" runat="server" Text='<%# Eval("evt_id") %>'></asp:Label>
                                    <td class="center">
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/gimage/" + Eval("evt_image")%>'
                                            Height="50px" Width="50px" />
                                        <asp:FileUpload ID="FUImage" runat="server" />
                                        <asp:Label ID="image_name" Visible="false" runat="server" Text='<%# Eval("evt_image") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEventName" runat="Server" Text='<%# Eval("evt_name") %>'></asp:TextBox>
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
