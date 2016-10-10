<%@ Page Title="" Language="C#" MasterPageFile="~/user/Main.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="gallery.aspx.cs" Inherits="Electronic_Health_Record.user.gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="sub-banner">

        <img class="banner-img" src="images/sub-banner.jpg" alt="" />
        <div class="detail">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">

                        <div class="paging">
                            <h2>Gallery</h2>
                            <ul>
                                <li><a href="index-2.html">Home</a></li>
                                <li><a>Gallery - Album</a></li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="content">

        <div class="gallery">
            <!--Start Team Detail-->
            <div class="cbp-panel" style="max-width: 1170px;">

                <div id="grid-container4" class="cbp main-gallery">
                    <div class="cbp-item technology facilities motion">
                        <asp:DataList ID="DataList1" runat="server" CellPadding="10" OnEditCommand="DataList1_EditCommand1" RepeatDirection="Horizontal" RepeatColumns="3">

                            <ItemTemplate>

                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit" CssClass="gallery-sec fancybox photo-icon">
                                    <div class="image-hover img-layer-slide-left-right">
                                        <asp:Image ID="Image2" runat="server" ImageUrl='<%# "~/gallery/" +Eval("evt_image")%>' Height="150px" Width="750px" />
                                        <div class="layer"><i class="icon-image2"></i></div>
                                    </div>

                                    <div class="detail">
                                        <h6>
                                            <asp:Label ID="txtName" runat="server" ForeColor="Black" Text='<%# Eval("evt_name") %>'></asp:Label></h6>
                                        <asp:Label ID="txtID" runat="server" Visible="false" Text='<%# Eval("evt_id") %>'></asp:Label>
                                    </div>
                                </asp:LinkButton>

                            </ItemTemplate>
                            <FooterTemplate>

                                <asp:Label Visible='<%#bool.Parse((DataList1.Items.Count==0).ToString())%>' runat="server"
                                    ID="lblNoRecord" ForeColor="Red" Font-Size="X-Large" Text="No Album Found ...!"></asp:Label>
                            </FooterTemplate>
                        </asp:DataList>
                    </div>




                </div>

            </div>
            <!--End Team Detail-->

        </div>
    </div>
    <script>
	<!-- Fancybox -->	
    /*
                 *  Simple image gallery. Uses default settings
                 */

    $('.fancybox').fancybox();

    /*
     *  Different effects
     */

    $(document).ready(function () {
        $('.fancybox-media').fancybox({
            openEffect: 'none',
            closeEffect: 'none',
            helpers: {
                media: {}
            }
        });
    });
    </script>
</asp:Content>
