<%@ Page Title="" Language="C#" MasterPageFile="~/Default/Site1.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Electronic_Health_Record.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Start Banner-->

    <div class="tp-banner-container">
        <div class="tp-banner">
            <ul>
                <!-- SLIDE  -->


                <li data-transition="fade" data-slotamount="7" data-masterspeed="500" data-saveperformance="on" data-title="Intro Slide">

                    <img src="../images/slides/banenr-img1.jpg" alt="" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat"/>

                    <div class="tp-caption lft customout rs-parallaxlevel-0"
                        data-x="0"
                        data-y="199"
                        data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                        data-speed="700"
                        data-start="1100"
                        data-easing="Power3.easeInOut"
                        data-elementdelay="0.1"
                        data-endelementdelay="0.1"
                        style="z-index: 4;">
                        <img src="../images/heart-icon.png" alt=""/>
                    </div>


                    <div class="tp-caption grey_heavy_72 skewfromrightshort tp-resizeme rs-parallaxlevel-0"
                        data-x="0"
                        data-y="280"
                        data-speed="500"
                        data-start="2250"
                        data-easing="Power3.easeInOut"
                        data-splitin="chars"
                        data-splitout="none"
                        data-elementdelay="0.1"
                        data-endelementdelay="0.1"
                        style="z-index: 5; max-width: auto; max-height: auto; white-space: nowrap;">
                        Heart
                    </div>

                    <div class="tp-caption grey_heavy_72-light skewfromrightshort tp-resizeme rs-parallaxlevel-0"
                        data-x="183"
                        data-y="280"
                        data-speed="500"
                        data-start="2250"
                        data-easing="Power3.easeInOut"
                        data-splitin="chars"
                        data-splitout="none"
                        data-elementdelay="0.1"
                        data-endelementdelay="0.1"
                        style="z-index: 5; max-width: auto; max-height: auto; white-space: nowrap;">
                        Specialist
                    </div>

                    <div class="tp-caption grey_regular_18 customin tp-resizeme rs-parallaxlevel-0"
                        data-x="0"
                        data-y="357"
                        data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                        data-speed="500"
                        data-start="2600"
                        data-easing="Power3.easeInOut"
                        data-splitin="none"
                        data-splitout="none"
                        data-elementdelay="0.05"
                        data-endelementdelay="0.1"
                        style="z-index: 9; max-width: auto; max-height: auto; white-space: nowrap;">
                        <div style="text-align: left;">
                            If you need a doctor for Better Treatment
                            <br />
                            We Help You.
                        </div>
                    </div>


                </li>



                <li data-transition="fade" data-slotamount="7" data-masterspeed="500" data-saveperformance="on" data-title="Intro Slide">

                    <img src="../images/slides/banenr-img2.jpg" alt="" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat"/>

                    <div class="tp-caption grey_heavy_72 skewfromleftshort fadeout tp-resizeme rs-parallaxlevel-10"
                        data-x="0"
                        data-y="115"
                        data-speed="500"
                        data-start="2250"
                        data-easing="Power3.easeInOut"
                        data-splitin="chars"
                        data-splitout="none"
                        data-elementdelay="0.1"
                        data-endelementdelay="0.1"
                        style="z-index: 5; max-width: auto; max-height: auto; white-space: nowrap;">
                        Medical
                    </div>

                    <div class="tp-caption grey_heavy_72-light skewfromleftshort fadeout tp-resizeme rs-parallaxlevel-10"
                        data-x="245"
                        data-y="115"
                        data-speed="500"
                        data-start="2950"
                        data-easing="Power3.easeInOut"
                        data-splitin="chars"
                        data-splitout="none"
                        data-elementdelay="0.1"
                        data-endelementdelay="0.1"
                        style="z-index: 5; max-width: auto; max-height: auto; white-space: nowrap;">
                        Services
                    </div>


                    <div class="tp-caption grey_regular_18 customin tp-resizeme rs-parallaxlevel-0"
                        data-x="0"
                        data-y="194"
                        data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                        data-speed="800"
                        data-start="3400"
                        data-easing="Power3.easeInOut"
                        data-splitin="none"
                        data-splitout="none"
                        data-elementdelay="0.05"
                        data-endelementdelay="0.1"
                        style="z-index: 9; max-width: auto; max-height: auto; white-space: nowrap;">
                        
                    </div>


                    <div class="tp-caption arrowicon customin fadeout rs-parallaxlevel-10"
                        data-x="0"
                        data-y="265"
                        data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                        data-speed="600"
                        data-start="4000"
                        data-easing="Power3.easeInOut"
                        data-elementdelay="0.1"
                        data-endelementdelay="0.1"
                        data-endspeed="1000"
                        style="z-index: 8;">
                        <img src="images/slides/plus.png" alt="">
                    </div>


                    <div class="tp-caption black_bold_bg_20 sfr fadeout tp-resizeme rs-parallaxlevel-10"
                        data-x="38"
                        data-y="265"
                        data-speed="600"
                        data-start="4100"
                        data-easing="Power3.easeInOut"
                        data-splitin="none"
                        data-splitout="none"
                        data-elementdelay="0.1"
                        data-endelementdelay="0.1"
                        data-endspeed="1000"
                        style="z-index: 9; max-width: auto; max-height: auto; white-space: nowrap; font-size: 18px;">
                        Managing your Family Health care.
                    </div>

                    <div class="tp-caption arrowicon customin fadeout rs-parallaxlevel-10"
                        data-x="0"
                        data-y="310"
                        data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                        data-speed="600"
                        data-start="4300"
                        data-easing="Power3.easeInOut"
                        data-elementdelay="0.1"
                        data-endelementdelay="0.1"
                        data-endspeed="1000"
                        style="z-index: 8;">
                        <img src="images/slides/plus.png" alt=""/>
                    </div>


                    <div class="tp-caption black_bold_bg_20 sfr fadeout tp-resizeme rs-parallaxlevel-10"
                        data-x="38"
                        data-y="310"
                        data-speed="600"
                        data-start="4400"
                        data-easing="Power3.easeInOut"
                        data-splitin="none"
                        data-splitout="none"
                        data-elementdelay="0.1"
                        data-endelementdelay="0.1"
                        data-endspeed="1000"
                        style="z-index: 9; max-width: auto; max-height: auto; white-space: nowrap; font-size: 18px;">
                        Cancer Researchers Honored
                    </div>

                    <div class="tp-caption arrowicon customin fadeout rs-parallaxlevel-10"
                        data-x="0"
                        data-y="355"
                        data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                        data-speed="600"
                        data-start="4600"
                        data-easing="Power3.easeInOut"
                        data-elementdelay="0.1"
                        data-endelementdelay="0.1"
                        data-endspeed="1000"
                        style="z-index: 8;">
                        <img src="images/slides/plus.png" alt="">
                    </div>


                    <div class="tp-caption black_bold_bg_20 sfr fadeout tp-resizeme rs-parallaxlevel-10"
                        data-x="38"
                        data-y="355"
                        data-speed="600"
                        data-start="4700"
                        data-easing="Power3.easeInOut"
                        data-splitin="none"
                        data-splitout="none"
                        data-elementdelay="0.1"
                        data-endelementdelay="0.1"
                        data-endspeed="1000"
                        style="z-index: 9; max-width: auto; max-height: auto; white-space: nowrap; font-size: 18px;">
                        Orthopedic Health keeps you Active
                    </div>

                    <div class="tp-caption arrowicon customin  rs-parallaxlevel-10"
                        data-x="0"
                        data-y="430"
                        data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                        data-speed="850"
                        data-start="5500"
                        data-easing="Power3.easeInOut"
                        data-elementdelay="0.1"
                        data-endelementdelay="0.1"
                        data-endspeed="1000"
                        style="z-index: 12000;">
                        <a href="services.html">
                            <img src="images/slides/icon1.png" alt=""></a>
                    </div>

                    <div class="tp-caption arrowicon customin  rs-parallaxlevel-10"
                        data-x="108"
                        data-y="430"
                        data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                        data-speed="850"
                        data-start="6000"
                        data-easing="Power3.easeInOut"
                        data-elementdelay="0.1"
                        data-endelementdelay="0.1"
                        data-endspeed="1000"
                        style="z-index: 12000;">
                        <a href="services.html">
                            <img src="../images/slides/icon2.png" alt=""></a>
                    </div>

                    <div class="tp-caption arrowicon customin  rs-parallaxlevel-10"
                        data-x="216"
                        data-y="430"
                        data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                        data-speed="850"
                        data-start="6500"
                        data-easing="Power3.easeInOut"
                        data-elementdelay="0.1"
                        data-endelementdelay="0.1"
                        data-endspeed="1000"
                        style="z-index: 12000;">
                        <a href="services.html">
                            <img src="images/slides/icon3.png" alt=""></a>
                    </div>

                    <div class="tp-caption arrowicon customin  rs-parallaxlevel-10"
                        data-x="324"
                        data-y="430"
                        data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                        data-speed="850"
                        data-start="7000"
                        data-easing="Power3.easeInOut"
                        data-elementdelay="0.1"
                        data-endelementdelay="0.1"
                        data-endspeed="1000"
                        style="z-index: 12000;">
                        <a href="services.html">
                            <img src="../images/slides/icon4.png" alt=""></a>
                    </div>


                    <div class="tp-caption arrowicon customin  rs-parallaxlevel-10"
                        data-x="432"
                        data-y="430"
                        data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                        data-speed="850"
                        data-start="7500"
                        data-easing="Power3.easeInOut"
                        data-elementdelay="0.1"
                        data-endelementdelay="0.1"
                        data-endspeed="1000"
                        style="z-index: 12000;">
                        <a href="services.html">
                            <img src="../images/slides/view-all.png" alt=""></a>
                    </div>



                </li>


                <li data-transition="fade" data-slotamount="7" data-masterspeed="500" data-saveperformance="on" data-title="Intro Slide">

                    <img src="../images/slides/banenr-img3.jpg" alt="" data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">




                    <div class="tp-caption grey_heavy_72-light customin randomrotateout tp-resizeme rs-parallaxlevel-10"
                        data-x="0"
                        data-y="220"
                        data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                        data-speed="650"
                        data-start="1050"
                        data-easing="Power3.easeInOut"
                        data-splitin="chars"
                        data-splitout="none"
                        data-elementdelay="0.1"
                        data-endelementdelay="0.1"
                        style="z-index: 5; max-width: auto; max-height: auto; white-space: nowrap;">
                        Leading the Way in
                    </div>


                    <div class="tp-caption grey_heavy_72 customin randomrotateout tp-resizeme rs-parallaxlevel-10"
                        data-x="0"
                        data-y="286"
                        data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                        data-speed="650"
                        data-start="2500"
                        data-easing="Power3.easeInOut"
                        data-splitin="chars"
                        data-splitout="none"
                        data-elementdelay="0.1"
                        data-endelementdelay="0.1"
                        style="z-index: 5; max-width: auto; max-height: auto; white-space: nowrap;">
                        Research & Development
                    </div>


                    <div class="tp-caption grey_regular_18 customin tp-resizeme rs-parallaxlevel-0"
                        data-x="0"
                        data-y="362"
                        data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                        data-speed="500"
                        data-start="4600"
                        data-easing="Power3.easeInOut"
                        data-splitin="none"
                        data-splitout="none"
                        data-elementdelay="0.05"
                        data-endelementdelay="0.1"
                        style="z-index: 9; max-width: auto; max-height: auto; white-space: nowrap;">
                        <div style="text-align: left;">Whether it's picking up the photne and calling you back.</div>
                    </div>


                    <div class="tp-caption grey_regular_18 customin tp-resizeme rs-parallaxlevel-0"
                        data-x="0"
                        data-y="429"
                        data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0;scaleY:0;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                        data-speed="800"
                        data-start="4900"
                        data-easing="Power3.easeInOut"
                        data-splitin="none"
                        data-splitout="none"
                        data-elementdelay="0.05"
                        data-endelementdelay="0.1"
                        style="z-index: 9; max-width: auto; max-height: auto; white-space: nowrap;">
                        <div style="text-align: left; background: #f15b5a;">
                            <a href="about-us.html" class="read-more" style="line-height: initial; color: #fff; text-transform: uppercase; font-weight: 500; padding: 12px 36px; display: inline-block; font-size: 18px;">read more</a>
                        </div>
                    </div>

                </li>


            </ul>
            <div class="tp-bannertimer"></div>
        </div>
    </div>

    <!--End Banner-->
    <!--Start Make Appointment-->
    <div class="make-appointment">
        <div class="container">

            <ul id="accordion" class="accordion">
                <li>

                    <div class="link"><i class="fa fa-database"></i><span class="appointment-title">Make an Appointment</span> <i class="icon-chevron-down"></i></div>

                    <section class="bgcolor-3">
                        <p class="error" id="error" style="display: none;"></p>
                        <p class="success" id="success" style="display: none;"></p>

                        <form name="appointment_form" id="appointment_form" method="post" action="#" onsubmit="return false">

                            <span class="input input--kohana">
                                <input class="input__field input__field--kohana" type="text" id="input-29" name="input-29" />
                                <label class="input__label input__label--kohana" for="input-29">
                                    <i class="icon-user6 icon icon--kohana"></i>
                                    <span class="input__label-content input__label-content--kohana">Your Name</span>
                                </label>
                            </span>
                            <span class="input input--kohana">
                                <input class="input__field input__field--kohana" type="text" id="input-30" name="input-30" />
                                <label class="input__label input__label--kohana" for="input-30">
                                    <i class="icon-dollar icon icon--kohana"></i>
                                    <span class="input__label-content input__label-content--kohana">Email Address</span>
                                </label>
                            </span>
                            <span class="input input--kohana last">
                                <input class="input__field input__field--kohana" type="text" id="input-31" name="input-31" />
                                <label class="input__label input__label--kohana" for="input-31">
                                    <i class="icon-phone5 icon icon--kohana"></i>
                                    <span class="input__label-content input__label-content--kohana">Phone Number</span>
                                </label>
                            </span>

                            <span class="input input--kohana">
                                <input class="input__field input__field--kohana" type="text" id="datepicker" placeholder="Appointment Date" onclick="" name="datepicker" />
                            </span>

                            <span class="input input--kohana message">
                                <input class="input__field input__field--kohana" type="text" id="textarea" name="textarea">
                                <label class="input__label input__label--kohana" for="textarea">
                                    <i class="icon-new-message icon icon--kohana"></i>
                                    <span class="input__label-content input__label-content--kohana">Message</span>
                                </label>
                            </span>

                            <input name="submit" type="submit" value="send" onclick="validateAppointment();">
                        </form>


                    </section>



                </li>

            </ul>
        </div>
    </div>
    <%--End Make Appointment--%>
    <!--Start Content-->
    <div class="content">

        <!--Start Services-->
        <div class="services-one">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="service-sec">

                            <div class="icon">
                                <i class="icon-patient-bed"></i>
                            </div>

                            <div class="detail">
                                <h5>Operation Theater</h5>
                                <p>If you need a doctor for to consectetuer Lorem ipsum dolor, consectetur adipiscing elit Lorem ipsum dolor, consectetur  Ut volutpat eros.</p>
                            </div>

                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="service-sec">

                            <div class="icon">
                                <i class="icon-ambulanc"></i>
                            </div>

                            <div class="detail">
                                <h5>Emergency Services</h5>
                                <p>If you need a doctor for to consectetuer Lorem ipsum dolor, consectetur adipiscing elit Lorem ipsum dolor, consectetur  Ut volutpat eros.</p>
                            </div>

                        </div>
                    </div>



                    <div class="col-md-6">
                        <div class="service-sec">

                            <div class="icon">
                                <i class="icon-mortar-pestle"></i>
                            </div>

                            <div class="detail">
                                <h5>Rehabilitation Center</h5>
                                <p>If you need a doctor for to consectetuer Lorem ipsum dolor, consectetur adipiscing elit Lorem ipsum dolor, consectetur  Ut volutpat eros.</p>
                            </div>

                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="service-sec">

                            <div class="icon">
                                <i class="icon-doctor"></i>
                            </div>

                            <div class="detail">
                                <h5>Qualified Doctors</h5>
                                <p>If you need a doctor for to consectetuer Lorem ipsum dolor, consectetur adipiscing elit Lorem ipsum dolor, consectetur  Ut volutpat eros.</p>
                            </div>

                        </div>
                    </div>


                </div>
            </div>
        </div>
        <!--End Services-->


        <!--Start Welcome-->
        <div class="welcome dark-back">
            <div class="container">

                <div class="row">
                    <div class="col-md-12">
                        <div class="main-title">
                            <h2><span>Welcome to</span> Medical Guide</h2>
                            <p>If you need a doctor for to consectetuer Lorem ipsum dolor, consectetur adipiscing elit. Ut volutpat eros  adipiscing nonummy.</p>
                        </div>
                    </div>
                </div>

                <div id="tabbed-nav">
                    <ul>
                        <li><a>Medical Surgery</a></li>
                        <li><a>Departments</a></li>
                        <li><a>Patient life</a></li>
                        <li><a>Baby Birth</a></li>
                    </ul>


                    <div>

                        <div>

                            <div class="row">

                                <div class="col-md-6">
                                    <div class="welcome-serv-img">
                                        <img src="../images/services-img2.jpg" alt="">
                                    </div>
                                </div>

                                <div class="col-md-6">

                                    <div class="detail">
                                        <h4>Washington Medical Science Institute</h4>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat Duis.<br />
                                            <br />

                                            Voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam quis nostrud exercitation.
                                        </p>
                                        <a href="about-us.html">Read More</a>

                                    </div>

                                </div>

                            </div>


                        </div>

                        <div>

                            <div class="row">

                                <div class="col-md-6">
                                    <div class="welcome-serv-img">
                                        <img src="../images/services-img3.jpg" alt="">
                                    </div>
                                </div>

                                <div class="col-md-6">

                                    <div class="detail">
                                        <h4>Medical Guide Departments</h4>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat Duis.<br />
                                            <br />

                                            Voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam quis nostrud exercitation.
                                        </p>
                                        <a href="about-us.html">Read More</a>

                                    </div>

                                </div>

                            </div>


                        </div>

                        <div>

                            <div class="row">

                                <div class="col-md-6">
                                    <div class="welcome-serv-img">
                                        <img src="../images/services-img1.jpg" alt="">
                                    </div>
                                </div>

                                <div class="col-md-6">

                                    <div class="detail">
                                        <h4>Patient Life in Hospital</h4>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat Duis.<br />
                                            <br />

                                            Voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam quis nostrud exercitation.
                                        </p>
                                        <a href="about-us.html">Read More</a>

                                    </div>

                                </div>

                            </div>


                        </div>

                        <div>

                            <div class="row">

                                <div class="col-md-6">
                                    <div class="welcome-serv-img">
                                        <img src="../images/services-img4.jpg" alt="">
                                    </div>
                                </div>

                                <div class="col-md-6">

                                    <div class="detail">
                                        <h4>Latest Technology</h4>
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat Duis.<br />
                                            <br />

                                            Voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam quis nostrud exercitation.
                                        </p>
                                        <a href="about-us.html">Read More</a>

                                    </div>

                                </div>

                            </div>


                        </div>

                    </div>

                </div>


            </div>
        </div>
        <!--End Welcome-->



        <!--Start Specialists-->
        <div class="meet-specialists">
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
                                                <img src="../images/team-member1.jpg" alt="">
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
                                            
                                        </div>

                                    </div>
                                    <div class="post item">

                                        <div class="gallery-sec">
                                            <div class="image-hover img-layer-slide-left-right">
                                                <img src="../images/team-member2.jpg" alt="">
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
                                           
                                        </div>

                                    </div>
                                    <div class="post item">

                                        <div class="gallery-sec">
                                            <div class="image-hover img-layer-slide-left-right">
                                                <img src="../images/team-member3.jpg" alt="">
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
                                            
                                        </div>

                                    </div>

                                    <div class="post item">

                                        <div class="gallery-sec">
                                            <div class="image-hover img-layer-slide-left-right">
                                                <img src="../images/team-member4.jpg" alt="">
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
                                            
                                        </div>

                                    </div>

                                    <div class="post item">

                                        <div class="gallery-sec">
                                            <div class="image-hover img-layer-slide-left-right">
                                                <img src="../images/team-member5.jpg" alt="">
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
                                            
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End Specialists-->


        <!--Start Doctor Quote-->
        <div class="dr-quote">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <span class="quote">"Meeting the challenges of an ever-changing healthcare environment."</span>
                        <span class="name">- Dr. Jonathan Gobi</span>
                    </div>
                </div>
            </div>
        </div>
        <!--End Doctor Quote-->



        <!--Start Latest News-->
        <div class="latest-news dark-back">
            <div class="container">

                <div class="row">
                    <div class="col-md-12">
                        <div class="main-title">
                            <h2><span>Latest News from</span> Medical guide</h2>
                            <p>If you need News Related to medical than You Got From News Section.We Provide latest news for Health.</p>
                        </div>
                    </div>
                </div>




                <div id="latest-news">
                    <div class="container">
                        <div class="row">
                            <div class="span12">

                                <div id="owl-demo" class="owl-carousel">

                                    <div class="post item">
                                        <img class="lazyOwl" src="../images/news-img1.jpg" alt="">
                                        <div class="detail">
                                            <img src="../images/news-dr1.jpg" alt="">
                                            <h4><a href="news-detail.html">Center for Medical</a></h4>
                                            <p>We provide central health record facility.so, Any hospital doctor can upload thier patient reports.</p>
                                            <span><i class="icon-clock3"></i>Apr 22, 2016</span>
                                            
                                        </div>
                                    </div>
                                    <div class="post item">
                                        <img class="lazyOwl" src="../images/news-img2.jpg" alt="">
                                        <div class="detail">
                                            <img src="../images/news-dr2.jpg" alt="">
                                            <h4><a href="news-detail.html">Laboratory Tests</a></h4>
                                            <p>We provide Lab Test Report for better help to patient.</p>
                                            <span><i class="icon-clock3"></i>Apr 09, 2016</span>
                                            
                                        </div>
                                    </div>

                                    <div class="post item">
                                        <img class="lazyOwl" src="../images/news-img3.jpg" alt="">
                                        <div class="detail">
                                            <img src="../images/news-dr1.jpg" alt="">
                                            <h4><a href="news-detail.html">Research Center</a></h4>
                                            <p>Here Doctors are upload their Research news.</p>
                                            <span><i class="icon-clock3"></i>Mar 28, 2016</span>
                                            
                                        </div>
                                    </div>

                                   

                                </div>

                            </div>
                        </div>
                    </div>

                </div>



            </div>
        </div>
        <!--End Latest News-->


        <!--Start Testimonials-->
        <div class="patients-testi">
            <div class="container">

                <div class="row">
                    <div class="col-md-12">
                        <div class="main-title main-title2">
                            <h2><span>What Our Patients Say</span> About Us</h2>
                        </div>
                    </div>
                </div>

                <div id="testimonials">
                    <div class="container">
                        <div class="row">

                            <div class="col-md-12">
                                <div class="span12">

                                    <div id="owl-demo2" class="owl-carousel">

                                        <div class="testi-sec">
                                            <img src="../images/testimonial-img1.jpg" alt="">
                                            <div class="height30"></div>
                                            <p>I got better performance for storing health data and for this EHR is best </p>
                                            <div class="height35"></div>
                                            <span class="name">Elebana Front</span>
                                            <span class="patient">Heart Patient</span>
                                            <div class="height10"></div>

                                        </div>
                                        <div class="testi-sec">
                                            <img src="../images/testimonial-img2.jpg" alt="">
                                            <div class="height30"></div>
                                            <p>My Details and record are safe and secured because of health record</p>
                                            <div class="height35"></div>
                                            <span class="name">Johny Bravo</span>
                                            <span class="patient">Hair Patient</span>
                                            <div class="height10"></div>

                                        </div>
                                        <div class="testi-sec">
                                            <img src="../images/testimonial-img3.jpg" alt="">
                                            <div class="height30"></div>
                                            <p>Electronic Health Record Is best For saving data on the serve. I think they also developed cloud for better performance</p>
                                            <div class="height35"></div>
                                            <span class="name">Rubica Noi</span>
                                            <span class="patient">Skin Patient</span>
                                            <div class="height10"></div>

                                        </div>


                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>


        <!--End Testimonials-->

    </div>
    <!--End Content-->
</asp:Content>
