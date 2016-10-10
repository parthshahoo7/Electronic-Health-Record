<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminpanel.Master" AutoEventWireup="true" CodeBehind="managesubevent.aspx.cs" Inherits="Electronic_Health_Record.admin.managesubevent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager EnablePartialRendering="true" ID="ScriptManager1" runat="server" />
    <ol class="breadcrumb">
        <li><i class="clip-home-3"></i><a href="dashboard.aspx">Home </a></li>
       <li>
            <i class="clip-camera"></i>
            <a href="#">Gallery</a>
        </li>
        <li class="active">Manage Album Image
        </li>
    </ol>
    <div class="page-header">
        <h1>Album Image</h1>
    </div>
      <div class="panel panel-default">
        <div class="panel-heading">
            <i class="fa fa-plus"></i>Add Album Image
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
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" runat="server"
                                    ErrorMessage="Select Album.." ControlToValidate="drpEvent" ValidationGroup="valInsert"></asp:RequiredFieldValidator><br />
            <asp:RequiredFieldValidator ID="reqEventName" runat="server" ForeColor="Red" ErrorMessage="Image Details Required.."
                ControlToValidate="txtEventdesc" Display="None" ValidationGroup="valInsert"></asp:RequiredFieldValidator><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="None" runat="server"
                ForeColor="Red" ErrorMessage="Image Required.." ControlToValidate="FUImageInsert"
                ValidationGroup="valInsert"></asp:RequiredFieldValidator>
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="form-field-1">
                        Album
                    </label>
                    <div class="col-sm-9">
                      <asp:DropDownList ID="drpEvent" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="form-field-1">
                        Description
                    </label>
                    <div class="col-sm-9">
                       
                                <asp:TextBox ID="txtEventDesc" runat="server" TextMode="MultiLine" placeholder="Image Details"
                                    CssClass="form-control" />
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
                                runat="server" Text="Add Album Image" OnClick="btnInsert_Click" />
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
    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <fieldset title="Panel1">--%>
      <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <fieldset>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-file"></i>Manage Album Image
                                <div class="panel-tools">
                                    <a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a><a class="btn btn-xs btn-link panel-refresh"
                                        href="#"><i class="fa fa-refresh"></i></a><a class="btn btn-xs btn-link panel-expand"
                                            href="#"><i class="fa fa-resize-full"></i></a><a class="btn btn-xs btn-link panel-close"
                                                href="#"><i class="fa fa-times"></i></a>
                                </div>
                    </div>
                    <div class="panel-body">
                        <asp:ListView ID="lstSubEvent" runat="server"
                            GroupPlaceholderID="groupPlaceHolder1"
                            OnItemCanceling="OnItemCanceling"
                            OnItemEditing="OnItemEditing"
                            OnItemDeleting="OnItemDeleting"
                            OnItemUpdating="OnItemUpdating"
                            ItemPlaceholderID="itemPlaceHolder1">
                            <LayoutTemplate>
                                <table class="table table-striped table-bordered table-hover" id="sample-table-2">
                                    <tr>
                                        <th class="center">
                                            <div class="checkbox-table">
                                                <label>
                                                    <input type="checkbox" id="chkSelectAll" runat="server" class="flat-grey">
                                                </label>
                                                
                                            &nbsp;&nbsp;&nbsp;&nbsp;</div>
                                        </th>
                                        <th class="center">Image
                                        </th>
                                        <th>Name
                                        </th>
                                        <th class="hidden-xs">Details
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
                                            
                                        &nbsp;&nbsp;&nbsp;&nbsp;</div>
                                    </td>
                                    <asp:Label ID="lblSubEventID" Visible="False" runat="server" Text='<%# Eval("sub_evt_id") %>'></asp:Label>
                                    </td>
                                    <td class="center">
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/gallery/" + Eval("image")%>'
                                            Height="50px" Width="50px" />
                                        <asp:Label ID="image_name" Visible="false" runat="server" />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblEvntName" runat="Server" Text='<%# Eval("evt_name") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblDesc" runat="Server" Text='<%# Eval("description") %>'></asp:Label>
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" runat="server"
                                    ErrorMessage="Select Album.." ControlToValidate="drpEvent" ValidationGroup="valView"></asp:RequiredFieldValidator><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" runat="server"
                                    ErrorMessage="Image Details Required.." ControlToValidate="txtSubEventDesc" ValidationGroup="valView"></asp:RequiredFieldValidator><br />
                                <tr>
                                    <th class="center">
                                        <div class="checkbox-table">
                                            <label>
                                                <input type="checkbox" id="chkSelectAll" runat="server" class="flat-grey">
                                            </label>
                                            
                                        &nbsp;&nbsp;&nbsp;&nbsp;</div>
                                        <asp:Label ID="lblSubEventID" Visible="False" runat="server" Text='<%# Eval("sub_evt_id") %>'></asp:Label>
                                    </th>

                                    

                                    <td class="center">
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/gimage/" + Eval("image")%>'
                                            Height="50px" Width="50px" />
                                        <asp:FileUpload ID="FUImage" runat="server" />
                                        <asp:Label ID="image_name" Visible="false" runat="server" Text='<%# Eval("image") %>' />
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drpEvent" runat="server" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtSubEventDesc" runat="Server" Text='<%# Eval("description") %>'></asp:TextBox>
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
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        <asp:Label ID="lblImagename" Visible="false" runat="server"></asp:Label>
                        <asp:Label ID="Label2" Visible="false" runat="server"></asp:Label>
                    </div>
                </div>
            </fieldset>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
