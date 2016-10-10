<%@ Page Title="" Language="C#" MasterPageFile="~/Default/Site1.Master" AutoEventWireup="true" CodeBehind="galleryi.aspx.cs" Inherits="Electronic_Health_Record.Default.galleryi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="sub-banner">
   
   	<img class="banner-img" src="images/sub-banner.jpg" alt=""/>
    <div class="detail">
    	<div class="container">
        	<div class="row">
            	<div class="col-md-12">
                	
                    <div class="paging">
                		<h2>Gallery</h2>
						<ul>
						<li><a href="index-2.html">Home</a></li>
						<li><a>Gallery</a></li>
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
		<div class="cbp-panel" style="max-width:1170px;">

        <div id="grid-container4" class="cbp main-gallery">
           
			
			
			<div class="cbp-item technology facilities motion">
					
               

			
			
            <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="3">
                         <ItemTemplate>
                	<figure>
	        			<figcaption>
	    					<strong></strong>
	    					<span><asp:Label ID="Label1" runat="server" Text='<%# Eval("description") %>'></asp:Label></span>
	    					<em></em>
	    					<a href="#" class="opener"></a></figcaption>
		        		<asp:HyperLink ID="HyperLink1" runat="server"  class="thumb" data-rel="prettyPhoto" NavigateUrl='<%# "~/gallery/" +Eval("image")%>'>
		                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/gallery/" +Eval("image")%>' Height="273px" Width="446px" />
                        </asp:HyperLink>
	        		</figure>
                    </ItemTemplate>
                     <FooterTemplate>
                            <asp:Label Visible='<%#bool.Parse((DataList1.Items.Count==0).ToString())%>' runat="server"
                                ID="lblNoRecord" ForeColor="Red" Font-Size="X-Large" Text="No Event Image Found ...!"></asp:Label>
                        </FooterTemplate>
                    </asp:DataList>
                <div id="tblPaging" runat="server" style="width:100%">
                <ul class="pager">
					<li><asp:LinkButton ID="lnkbtnPrevious" runat="server" OnClick="lnkbtnPrevious_Click">PRE</asp:LinkButton></li>
					
                    <asp:DataList ID="dlPaging" runat="server" OnItemCommand="dlPaging_ItemCommand" OnItemDataBound="dlPaging_ItemDataBound"
                                    RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                    <li>
                                        <asp:LinkButton ID="lnkbtnPaging" runat="server" CommandArgument='<%# Eval("PageIndex") %>'
                                            CommandName="lnkbtnPaging" Text='<%# Eval("PageText") %>'></asp:LinkButton>
                                    </li>
                                    </ItemTemplate>
                                </asp:DataList>
                    <li><asp:LinkButton ID="lnkbtnNext" runat="server" OnClick="lnkbtnNext_Click">NXT</asp:LinkButton></li>
				</ul>
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
