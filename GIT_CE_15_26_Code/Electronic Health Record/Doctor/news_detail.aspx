<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctor.Master" AutoEventWireup="true" CodeBehind="news_detail.aspx.cs" EnableEventValidation="false" Inherits="Electronic_Health_Record.news_detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="content">
		
		<div class="news-posts">
			<div class="container">
				<div class="row">
					
					<%--<div class="col-md-8">
							
							<div class="news-detail">
								<div class="detail">
									<span class="date">March 7, 2015 / By Rockal</span>
									<h3>Standard Post Format</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lorem quam, adipiscing condimentum tristique vel, eleifend sed turpis. Pellentesque cursus arcu id magna euismod in elementum purus molestie. Curabitur pellentesque massa eu porttitorarcu porttitor. Quisque volutpat pharetra felis, eu cursus lorem molestie vitae. Nulla vehicula.</p>
									
									<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>
								</div>
							</div>
							
					</div>--%>

                    <asp:DataList ID="datalist1" runat="server">
                                    <ItemTemplate>

                                        <h3 style="color: black" class="news-detail">
                                            <asp:Label ID="lbltitle" Text='<% #Bind("news_title")%>' runat="server" /></h3>
                                        <p style="color: black" class="news-detail">
                                            <asp:Label ID="lbldescription" style="font-style:italic; font-weight:bold" Text='<% #Bind("news_point")%>' runat="server" />
                                        </p>
                                        <p style="color:black" class="news-detail">
                                            <asp:Label ID="lvldetail" Text='<%#Bind("news_description") %>' runat="server" />
                                        </p>
                                        <span class="detail">
                                            <asp:Label ID="lbldate" Text='<%#Bind("date") %>' runat="server" />
                                            <asp:Label ID="lblauthor" Text='<%#Bind("author") %>' runat="server" />
                                        </span>
                                        <br />
                                        
                                        <br />
                                        <br />
                                        <br />
                                    </ItemTemplate>
                                </asp:DataList>
					
					<%--<div class="col-md-4">

                        <div class="recent-posts">
                            <h6 class="bar-title">Recent Posts</h6>

                            <div class="post-sec">

                                <a href="news-detail.html" class="title">Geometric Landscapes Heartologic</a>
								<span class="date">11 Minutes ago</span>
                                <marquee behaviour="scroll" scrollamount="2" height="200px" direction="up">
                                <asp:DataList ID="datalist2" runat="server">
                                    <ItemTemplate>

                                        <a href="#" class="title"><asp:Label ID="lbltitle" Text='<% #Bind("news_title")%>'  runat="server" /></a>
                                            <asp:Label ID="lbltitle" Text='<% #Bind("news_title")%>' runat="server" />
                                        <p style="color: black" class="news-detail">
                                            <asp:Label ID="lbldescription" Text='<% #Bind("news_point")%>' runat="server" />
                                        </p>
                                        <span class="date">
                                            <asp:Label ID="lbldate" Text='<%#Bind("date") %>' runat="server" />
                                        </span>
                                        <br />
                                        <br />
                                    </ItemTemplate>
                                </asp:DataList>
                                    </marquee>
                            </div>

                            
                        </div>
                        

                    </div>--%>
					
				</div>
			</div>
		</div>
  
  
  
   
   </div>
</asp:Content>
