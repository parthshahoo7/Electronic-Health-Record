<%@ Page Title="" Language="C#" MasterPageFile="~/Default/Site1.Master" AutoEventWireup="true" CodeBehind="gallery.aspx.cs" Inherits="Electronic_Health_Record.Default.gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sub-banner">
   
   	<img class="banner-img" src="../images/sub-banner.jpg" alt="">
    <div class="detail">
    	<div class="container">
        	<div class="row">
            	<div class="col-md-12">
                	
                    <div class="paging">
                		<h2>Gallery</h2>
						<ul>
						<li><a href="Home.aspx">Home</a></li>
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

        <div id="filters-container" class="cbp-l-filters-list ">
            <div data-filter="*" class="cbp-filter-item-active cbp-filter-item cbp-l-filters-list-first">All Departments </div>
            <div data-filter=".technology" class="cbp-filter-item">Advanced Technology</div>
            <div data-filter=".facilities" class="cbp-filter-item">Free Facilities</div>
            <div data-filter=".dental" class="cbp-filter-item">Medical Dental</div>
            <div data-filter=".kids" class="cbp-filter-item cbp-l-filters-list-last">Kids Care</div>
        </div>

        <div id="grid-container4" class="cbp main-gallery">
           
			
			
			<div class="cbp-item technology facilities motion">
					
                <a class="gallery-sec fancybox photo-icon" href="../images/gallery/img1.jpg" data-fancybox-group="gallery">		
					<div class="image-hover img-layer-slide-left-right">
					<img src="../images/gallery/img1.jpg" alt="">
					<div class="layer"> <i class="icon-image2"></i> </div>
					</div>
					
					<div class="detail">
						<h6>Operation Theater</h6>
						<span>Cras porttitor mauris pulvinar</span>
					</div>
				</a>

			</div>
			
			
			
			<div class="cbp-item kids motion">
					
                <a class="gallery-sec fancybox-media video-icon" href="http://vimeo.com/36031564">
					<div class="image-hover img-layer-slide-left-right">
					<img src="../images/gallery/img2.jpg" alt="">
					<div class="layer"> <i class="icon-video2"></i> </div>
					</div>
					
					<div class="detail">
						<h6>Kids Treatment</h6>
						<span>Cras porttitor mauris pulvinar</span>
					</div>
				</a>

			</div>
			
			
			
			<div class="cbp-item dental motion">
					
                <a class="gallery-sec fancybox-media video-icon" href="http://vimeo.com/36031564">		
					<div class="image-hover img-layer-slide-left-right">
					<img src="../images/gallery/img3.jpg" alt="">
					<div class="layer"> <i class="icon-video2"></i> </div>
					</div>
					
					<div class="detail">
						<h6>Medical Record </h6>
						<span>Cras porttitor mauris pulvinar</span>
					</div>
				</a>

			</div>
			
			
			<div class="cbp-item dental motion">
					
                <a class="gallery-sec fancybox photo-icon" href="../images/gallery/img4.jpg" data-fancybox-group="gallery" >		
					<div class="image-hover img-layer-slide-left-right">
					<img src="../images/gallery/img4.jpg" alt="">
					<div class="layer"> <i class="icon-image2"></i> </div>
					</div>
					
					<div class="detail">
						<h6>Dental Treatment</h6>
						<span>Cras porttitor mauris pulvinar</span>
					</div>
				</a>

			</div>
			
			
			
			<div class="cbp-item technology facilities motion">
					
                <a class="gallery-sec fancybox-media video-icon" href="http://vimeo.com/36031564">		
					<div class="image-hover img-layer-slide-left-right">
					<img src="../images/gallery/img5.jpg" alt="">
					<div class="layer"> <i class="icon-video2"></i> </div>
					</div>
					
					<div class="detail">
						<h6>Advanced Lab</h6>
						<span>Cras porttitor mauris pulvinar</span>
					</div>
				</a>

			</div>
			
			
			
			<div class="cbp-item facilities motion">
					
               <a class="gallery-sec fancybox photo-icon" href="../images/gallery/img6.jpg" data-fancybox-group="gallery">		
					<div class="image-hover img-layer-slide-left-right">
					<img src="../images/gallery/img6.jpg" alt="">
					<div class="layer"> <i class="icon-image2"></i> </div>
					</div>
					
					<div class="detail">
						<h6>Skin Counseling</h6>
						<span>Cras porttitor mauris pulvinar</span>
					</div>
				</a>

			</div>
			
			
			
			<div class="cbp-item technology facilities motion">
					
                <a class="gallery-sec fancybox photo-icon" href="../images/gallery/img7.jpg" data-fancybox-group="gallery" >		
					<div class="image-hover img-layer-slide-left-right">
					<img src="../images/gallery/img7.jpg" alt="">
					<div class="layer"> <i class="icon-image2"></i> </div>
					</div>
					
					<div class="detail">
						<h6>Well Trained Staff</h6>
						<span>Cras porttitor mauris pulvinar</span>
					</div>
				</a>

			</div>
			
			
			
			<div class="cbp-item facilities kids motion">
					
                <a class="gallery-sec fancybox-media video-icon" href="http://vimeo.com/36031564">		
					<div class="image-hover img-layer-slide-left-right">
					<img src="../images/gallery/img8.jpg" alt="">
					<div class="layer"> <i class="icon-video2"></i> </div>
					</div>
					
					<div class="detail">
						<h6>Health Counseling</h6>
						<span>Cras porttitor mauris pulvinar</span>
					</div>
				</a>

			</div>
		
			
            
        </div>

    </div>
   <!--End Team Detail-->
   
   </div>
   </div>
</asp:Content>
