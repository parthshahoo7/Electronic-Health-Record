<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctor.Master" AutoEventWireup="true" CodeBehind="contactus.aspx.cs" Inherits="Electronic_Health_Record.contactus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
  <div class="sub-banner">
   
   	<img class="banner-img" src="images/sub-banner.jpg" alt="">
    <div class="detail">
    	<div class="container">
        	<div class="row">
            	<div class="col-md-12">
                	
                    <div class="paging">
                		<h2>Contact Us</h2>
						<ul>
						<li><a href="index-2.html">Home</a></li>
						<li><a>Contact Us</a></li>
						</ul>
                    </div>

            	</div>
            </div>
        </div>
    </div>
   
   </div>
      <div class="content">
  <div class="contact-us">
   		<div class="container">
        	
            <div class="row">
            	<div class="col-md-12">
				
				<%--<div class="our-location">
				<div class="map"><iframe src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Envato+Pty+Ltd,+Elizabeth+Street,+Melbourne,+Victoria,+Australia&amp;aq=0&amp;oq=envato+&amp;sll=37.0625,-95.677068&amp;sspn=39.235538,86.572266&amp;ie=UTF8&amp;hq=Envato+Pty+Ltd,&amp;hnear=Elizabeth+St,+Melbourne+Victoria+3000,+Australia&amp;ll=-37.817942,144.964977&amp;spn=0.01918,0.008866&amp;t=m&amp;output=embed"></iframe></div>
                    	<div class="get-directions">
                        	<form action="http://maps.google.com/maps" method="get" target="_blank">
                               <input type="text" name="saddr" placeholder="Enter Your Address" />
                               <input type="hidden" name="daddr" value="Envato Pty Ltd, Elizabeth Street, Melbourne, Victoria, Australia" />
                               <input type="submit" value="Get directions" class="direction-btn" />
                            </form>
                        </div>
                </div>--%>
				
				</div>
            </div>
            
        </div>
		
		
		<div class="leave-msg dark-back">
			<div class="container">
			
			<div class="rox">
				<div class="col-md-7">
					
					<div class="main-title">
						<h2><span>We'd</span> Love to <span>Hear From You</span></h2>
						<%--<p>cursus lorem molestie vitae. Nulla vehicula, lacus ut suscipit fermentum, turpis felis ultricies dui, ut rhoncus libero augue. </p>--%>
					 </div>
					
					<div class="form">
				<div class="row">
                                    <p class="success" id="success" style="display:none;"></p>
                                    <p class="error" id="error" style="display:none;"></p>
                <div name="contact_form" id="contact_form" >
					<div class="col-md-4"><input type="text" data-delay="300" placeholder="Your full name" name="contact_name" id="contact_name" class="input"></div>
					<div class="col-md-4"><input type="text" data-delay="300" placeholder="E-mail Address" name="contact_email" id="contact_email" class="input"></div>
					<div class="col-md-4"><input type="text" data-delay="300" placeholder="Subject" name="contact_subject" id="contact_subject" class="input"></div>
					<div class="col-md-12"><textarea data-delay="500" class="required valid" placeholder="Message" name="message" id="message"></textarea></div>
					<div class="col-md-3"><input name=" " type="submit" value="submit" onclick="validateContact();"></div>
                    </div>
                    
				</div>
			</div>

					
				</div>
				
				<div class="col-md-5">
					
					<div class="contact-get">
					<div class="main-title">
						<h2><span>GET IN</span> Touch</h2>
						<%--<p>cursus lorem molestie vitae. Nulla vehicula, lacus ut suscipit fermentum, turpis felis ultricies.</p>--%>
					 </div>
					
					<div class="get-in-touch">
					<div class="detail">
						<span><b>Phone:</b> +919898505252</span>
						<span><b>Email:</b> <a href="#.">support@EHR.com</a></span>
						<span><b>Web:</b> <a href="#.">www.EHR.com</a></span>
						<span><b>Address:</b> Gujarat, India</span>
					 </div>
					 
					 <div class="social-icons">
                        	<a href="#." class="fb"><i class="icon-euro"></i></a>
                            <a href="#." class="tw"><i class="icon-yen"></i></a>
                            <a href="#." class="gp"><i class="icon-google-plus"></i></a>
                            <a href="#." class="vimeo"><i class="icon-vimeo4"></i></a>
                     </div>
					 </div>
					 </div>
					 
				</div>
				
			</div>

			</div>
		</div>
		
   </div>
  
   
   </div>
</asp:Content>
