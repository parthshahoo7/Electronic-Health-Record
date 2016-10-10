<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctor.Master" AutoEventWireup="true" CodeBehind="aboutus.aspx.cs" Inherits="Electronic_Health_Record.aboutus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <!--Start Content-->
   <div class="content">
   
   
   <!--Start Welcome-->
    <div class="welcome-two">
    	<div class="container">
        	
            <div class="row">
            <div class="col-md-12">
                <div class="main-title">
                    <h2><span>Welcome to</span> Electronic Health Record</h2>
                     
                </div>
            </div>
            </div>
            
            <div class="welcome-detail">
            	<div class="row">
                	
                    <div class="col-md-5">
                    	<img src="../images/welcome-img.jpg" alt="">
                    </div>
                    
                    <div class="col-md-7">
                    	<div class="detail">
                        	
                            <p>EHR platform connects the complex ecosystem of medical professionals, patients, labs, billers, imaging centers and life science partners. Healthcare partners connect with our community of medical professionals about services that streamline their daily practice, allowing them to focus on delivering value-based care and drive better patient outcomes. We work with pharmaceutical partners to market relevant media directly to the physician community inside the EHR and with health partners such as labs to bring connections to their services. </span></p>
                            <ul>
                            	<li><span>Manage Reports</span></li>
                                <li><span>Make Appointment</span></li>
                                <li><span>Manage Patient Easily</span></li>
                                <li><span>Mediclaim Varification</span></li>
                                
                                <li><span>Easy To Manage Prescription</span></li>
                                
                            </ul>
                            
                        </div>
                    </div>
                    
                </div>
            </div>
            
        </div>
    </div>
   <!--End Welcome-->
   
   <!--Start Specialists-->
   <%--<div class="meet-specialists dark-back">
   		<div class="container">
        	
            
			<div class="row">
	        <div class="col-md-12">
            <div class="main-title">
                <h2><span>Meet Our</span> Specialists</h2>
                
            </div>
            </div>
            </div>
            
            <div id="demo">
        <div class="container">
			<div class="row">
            	<div class="span12">

              <div id="owl-demo4" class="owl-carousel">
			  
                <div class="post item">
						
						<div class="gallery-sec">		
                        	<div class="image-hover img-layer-slide-left-right">
							<img src="images/team-member1.jpg" alt="">
                            <div class="layer">
									<a href="#."><i class="icon-euro"></i></a>
									<a href="#."><i class="icon-yen"></i></a>
									<a href="#."><i class="icon-caddieshoppingstreamline"></i></a>
								 </div>
                            </div>
                        </div>
							
                    <div class="detail">
                    	<h6>Dr. Andrew Bert</h6>
                        <span>Outpatient Surgery</span>
                        
                        <a href="team-member-detail.html">- View Profile</a>
                    </div>
                    
                </div>
                <div class="post item">
                	
					<div class="gallery-sec">		
                        	<div class="image-hover img-layer-slide-left-right">
							<img src="images/team-member2.jpg" alt="">
                            <div class="layer">
									<a href="#."><i class="icon-euro"></i></a>
									<a href="#."><i class="icon-yen"></i></a>
									<a href="#."><i class="icon-caddieshoppingstreamline"></i></a>
								 </div>
                            </div>
                        </div>
						
                    <div class="detail">
                    	<h6>Dr. Sara Stefon</h6>
                        <span>Cardiologist</span>
                        
                        <a href="team-member-detail.html">- View Profile</a>
                    </div>
                    
                </div>
                <div class="post item">
                	
					<div class="gallery-sec">		
                        	<div class="image-hover img-layer-slide-left-right">
							<img src="images/team-member3.jpg" alt="">
                            <div class="layer">
									<a href="#."><i class="icon-euro"></i></a>
									<a href="#."><i class="icon-yen"></i></a>
									<a href="#."><i class="icon-caddieshoppingstreamline"></i></a>
								 </div>
                            </div>
                        </div>
						
                    <div class="detail">
                    	<h6>Dr. Wahab Apple</h6>
                        <span>Heart Specialist</span>
                        
                        <a href="team-member-detail.html">- View Profile</a>
                    </div>
                    
                </div>
                
				<div class="post item">
                	
					<div class="gallery-sec">		
                        	<div class="image-hover img-layer-slide-left-right">
							<img src="images/team-member4.jpg" alt="">
                            <div class="layer">
									<a href="#."><i class="icon-euro"></i></a>
									<a href="#."><i class="icon-yen"></i></a>
									<a href="#."><i class="icon-caddieshoppingstreamline"></i></a>
								 </div>
                            </div>
                        </div>
						
                    <div class="detail">
                    	<h6>Dr. Mecan smith</h6>
                        <span>Heart Specialist</span>
                       
                        <a href="team-member-detail.html">- View Profile</a>
                    </div>
                    
                </div>
				
				<div class="post item">
						
						<div class="gallery-sec">		
                        	<div class="image-hover img-layer-slide-left-right">
							<img src="images/team-member5.jpg" alt="">
                            <div class="layer">
									<a href="#."><i class="icon-euro"></i></a>
									<a href="#."><i class="icon-yen"></i></a>
									<a href="#."><i class="icon-caddieshoppingstreamline"></i></a>
								 </div>
                            </div>
                        </div>
						
                    <div class="detail">
                    	<h6>Dr. Jack Bravo</h6>
                        <span>Heart Specialist</span>
                       <p></p>
                        <a href="team-member-detail.html">- View Profile</a>
                    </div>
                    
                </div>
				
                </div>
				</div>
            </div>
            </div>
			</div>
        </div>
   </div>--%>
   <!--End Specialists-->
   
   <!--Start Services Four-->
   <%--<div class="services-four-dark">
   		<div class="container">
        	
            <div class="row">
	        <div class="col-md-12">
            <div class="main-title">
                <h2><span>Special</span> Services</h2>
                <p>If you need a doctor for to consectetuer Lorem ipsum dolor, consectetur adipiscing elit. Ut volutpat eros  adipiscing nonummy.</p>
            </div>
            </div>
            </div>
            
            <div class="row">
            	
                <div class="col-md-4">
                	<div class="services-sec">
                    	
                    	<div class="icon">
                        	<i class="icon-ambulanc"></i>
                        </div>
                        <div class="detail">
                        	<h6>Emergency Services</h6>
                            <p>Lorem ipsum dolor sit amet, adipiscing elit. Donec nec eros eget nisl fringilla graph commodo.</p>
                        </div>
                        
                    </div>
                </div>
                
                <div class="col-md-4">
                	<div class="services-sec">
                    	
                    	<div class="icon">
                        	<i class="icon-heart10"></i>
                        </div>
                        <div class="detail">
                        	<h6>Heart Problems</h6>
                            <p>Lorem ipsum dolor sit amet, adipiscing elit. Donec nec eros eget nisl fringilla graph commodo.</p>
                        </div>
                        
                    </div>
                </div>
                
                <div class="col-md-4">
                	<div class="services-sec">
                    	
                    	<div class="icon">
                        	<i class="icon-kidney2"></i>
                        </div>
                        <div class="detail">
                        	<h6>Kidney problems</h6>
                            <p>Lorem ipsum dolor sit amet, adipiscing elit. Donec nec eros eget nisl fringilla graph commodo.</p>
                        </div>
                        
                    </div>
                </div>
                
                <div class="bottom-serv">
                
                <div class="col-md-4">
                	<div class="services-sec">
                    	
                    	<div class="icon">
                        	<i class="icon-patientbed"></i>
                        </div>
                        <div class="detail">
                        	<h6>Patient Services</h6>
                            <p>Lorem ipsum dolor sit amet, adipiscing elit. Donec nec eros eget nisl fringilla graph commodo.</p>
                        </div>
                        
                    </div>
                </div>
                
                <div class="col-md-4">
                	<div class="services-sec">
                    	
                    	<div class="icon">
                        	<i class="icon-ecg-line"></i>
                        </div>
                        <div class="detail">
                        	<h6>ECG Line </h6>
                            <p>Lorem ipsum dolor sit amet, adipiscing elit. Donec nec eros eget nisl fringilla graph commodo.</p>
                        </div>
                        
                    </div>
                </div>
                
                <div class="col-md-4">
                	<div class="services-sec">
                    	
                    	<div class="icon">
                        	<i class="icon-stomach"></i>
                        </div>
                        <div class="detail">
                        	<h6>Stomach Problems</h6>
                            <p>Lorem ipsum dolor sit amet, adipiscing elit. Donec nec eros eget nisl fringilla graph commodo.</p>
                        </div>
                        
                    </div>
                </div>
                
                </div>
                
            </div>
            
            
        </div>
   </div>--%>
   <!--End Services Four-->
   
   
   
   <!--Start Our Hospital-->
   <div class="hospital">
   <div class="container">
		
		
		
	   <div class="row">
		 <%--<div class="col-md-6">
				<div class="row">
		<div class="col-md-12">
			<div class="main-title">
			<h2><span>Our</span> Hospital</h2>
			<p>Lorem ipsum dolor sit amet, adipiscing elit Donec nec eros eget.</p>
			</div>
		</div>
		</div>		
			<div id="hospital">


			<div class="span12">
			<div id="services-slide" class="owl-carousel">

			<div class="item"><img src="images/service-two-img1.jpg" alt=""></div>
			<div class="item"><img src="images/service-two-img2.jpg" alt=""></div>
			<div class="item"><img src="images/service-two-img3.jpg" alt=""></div>

			</div>
			</div>


			</div>
						
		 </div>--%>
		 
		 <%--<div class="col-md-12">
		 <div class="why-choose-us">
			<div class="row">
			<div class="col-md-12">
				<div class="main-title">
				<h2><span>Why Choose</span> EHR</h2>
				<p>Lorem ipsum dolor sit amet, adipiscing elit Donec nec eros eget.</p>
				</div>
			</div>
			</div>
		
			<ul id="why-choose" class="why-choose">
  <li class="open">
    <div class="link"><i class="icon-first-aid-box"></i>Our Responsibility<i class="icon-chevron-down"></i></div>
    <ul class="submenu" style=" display:block;">
      <li>
	  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec eros eget nisl fringilla commodo. Maecenas ornare, augue ut ultricies tristique, enim lectus pretium quam.
<br/><br/>
Donec nec eros eget nisl fringilla commodo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
	  </li>
    </ul>
  </li>
  
  <li>
    <div class="link"><i class="icon-heart-beat"></i>Heart Specialist<i class="icon-chevron-down"></i></div>
    <ul class="submenu">
      <li>
	  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec eros eget nisl fringilla commodo. Maecenas ornare, augue ut ultricies tristique, enim lectus pretium quam.
<br/><br/>
Donec nec eros eget nisl fringilla commodo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
	  </li>
    </ul>
  </li>
  <li>
    <div class="link"><i class="icon-mobile2"></i>Responsive Design<i class="fa icon-chevron-down"></i></div>
    <ul class="submenu">
      <li>
	  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec eros eget nisl fringilla commodo. Maecenas ornare, augue ut ultricies tristique, enim lectus pretium quam.
<br/><br/>
Donec nec eros eget nisl fringilla commodo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
	  </li>
    </ul>
  </li>
</ul>
</div>
		 </div>--%>
		 
		</div>
	</div>
	</div>
   <!--End Our Hospital-->
   
     
   </div>
   <!--End Content-->
</asp:Content>
