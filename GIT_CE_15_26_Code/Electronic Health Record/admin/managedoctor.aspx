<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminpanel.Master" AutoEventWireup="true" CodeBehind="managedoctor.aspx.cs" Inherits="Electronic_Health_Record.admin.managedoctor" %>
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
            <i class="clip-user"></i>
            <a href="#">User Detail</a>
        </li>
        <li class="active">Manage Doctor
        </li>

    </ol>
    <div class="page-header">
        <h1>Doctor Details</h1>
    </div>
     <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <fieldset>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-file"></i>Manage Doctor Details
                                <div class="panel-tools">
                                    <a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a><a class="btn btn-xs btn-link panel-refresh"
                                        href="#"><i class="fa fa-refresh"></i></a><a class="btn btn-xs btn-link panel-expand"
                                            href="#"><i class="fa fa-resize-full"></i></a><a class="btn btn-xs btn-link panel-close"
                                                href="#"><i class="fa fa-times"></i></a>
                                </div>
                    </div>
                    <div class="panel-body">
                        <asp:ListView ID="lstProduct" runat="server" GroupPlaceholderID="groupPlaceHolder1"
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
                                                
                                            </div>
                                        </th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th class="hidden-xs">DOB</th>
                                        <th class="hidden-xs">Contact</th>
                                        <th class="hidden-xs">E-Mail</th>
                                        <th class="hidden-xs">UserName</th>
                                        <th class="hidden-xs">License Number</th>
                                        <th>Image</th>
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
                                    <asp:Label ID="lblID" Visible="False" runat="Server" Text='<%# Eval("d_id") %>'></asp:Label>
                                    <td>
                                        <asp:Label ID="lblfName" runat="Server" Text='<%# Eval("fname") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("lname") %>'></asp:Label>
                                    </td>

                                    <td>
                                        <asp:Label ID="Label4" runat="Server" Text='<%# Eval("dob") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label5" runat="Server" Text='<%# Eval("phoneno") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label1" runat="Server" Text='<%# Eval("email") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblCdate" runat="Server" Text='<%# Eval("username") %>'></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lbllicense" Text='<%# Eval("licenceno") %>' runat="server" />
                                    </td>
                                    <td>
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "" + Eval("imagename")%>'
                                            Height="50px" Width="50px" />
                                        
                                    </td>
                                    <td>
                                        <div class="visible-md visible-lg hidden-sm hidden-xs" runat="server" id="EditDelete">
                                            <asp:LinkButton ID="lnkUpate" CommandName="Update" CssClass="btn btn-xs btn-teal tooltips"
                                                data-placement="top" data-original-title="Update" runat="server"><i class="fa fa-edit"></i></asp:LinkButton>
                                            <asp:LinkButton ID="lnkDelete" CommandName="Delete" CssClass="btn btn-xs btn-bricky tooltips"
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
                                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><i class="fa fa-trash"></i>Cancel </a></li>
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
