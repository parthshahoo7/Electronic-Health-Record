<%@ Page Title="" Language="C#" MasterPageFile="~/user/Main.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="news.aspx.cs" Inherits="Electronic_Health_Record.user.news" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sub-banner">
   	<div class="detail">
    	<div class="container">
        	<div class="row">
            	<div class="col-md-12">
                	
                    <div class="paging">
                		<h2>News</h2>
						<ul>
						<li><a href="Default.aspx">Home</a></li>
						<li><a>News</a></li>
						</ul>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
   
   </div>
    <div class="content">

        <div class="news-posts">
            <div class="container">
                
                <div class="row">

                    <div class="col-md-8">

                        <div class="news-sec">
                            
                            <div>
                                <%--<span>March 7, 2015 / By Rockal</span>
									<h3>Standard Post Format</h3>
									<p>Etharums ser quidem rerum facilis dolores nemis omnis fugats vitaes nemo minima rerums unsers sadips amets. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium totam rem aperiam. </p>
									<a href="news-detail.html" class="read-more">read more</a>--%>

                                <asp:DataList ID="datalist1" runat="server" OnItemCommand="datalist1_ItemCommand">
                                    <ItemTemplate>

                                        <h3 style="color: black" class="news-detail">
                                            <asp:Label ID="lbltitle" Text='<% #Bind("news_title")%>' runat="server" /></h3>
                                        <p style="color: black" class="news-detail">
                                            <asp:Label ID="lbldescription" Text='<% #Bind("news_point")%>' runat="server" />
                                        </p>
                                        <span class="detail">
                                            <asp:Label ID="lbldate" Text='<%#Bind("date") %>' runat="server" />
                                            <asp:Label ID="lblauthor" Text='<%#Bind("author") %>' runat="server" />
                                        </span>
                                        <br />
                                        <asp:Button ID="btnreadmore" runat="server" class="read-more detail" Style="background-color: #525866; color: #fff; text-transform: uppercase; display: inline-block; margin: 15px 0 0 0; padding: 14px 40px; font-family: 'Raleway', sans-serif; font-weight: 600; font-size: 15px; transition: background-color 0.5s ease; cursor: auto;"
                                            Text="Read More" OnClick="btnreadmore_Click" CommandName="SwitchViewByID" CommandArgument='<% #Eval("n_id") %>'></asp:Button>
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </div>


                    </div>

                    <div class="col-md-4">

                        <div class="recent-posts">
                            <h6 class="bar-title">Recent Posts</h6>

                            <div class="post-sec">

                                <%--<a href="news-detail.html" class="title">Geometric Landscapes Heartologic</a>
								<span class="date">11 Minutes ago</span>--%>
                                <marquee behaviour="scroll" scrollamount="3" height="200px" direction="up">
                                <asp:DataList ID="datalist2" runat="server">
                                    <ItemTemplate>

                                        <a href="#" class="title"><asp:Label ID="lbltitle" Text='<% #Bind("news_title")%>'  runat="server" /></a>
                                            <%--<asp:Label ID="lbltitle" Text='<% #Bind("news_title")%>' runat="server" />--%>
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
                      <%--  <div class="clear"></div>


                        <div class="categories">
                            <h6 class="bar-title">Categories</h6>
                            <ul>
                                <li><a href="#."><i class="icon-chevron-small-right"></i>Facelift</a></li>
                                <li><a href="#."><i class="icon-chevron-small-right"></i>Dental</a></li>
                                <li><a href="#."><i class="icon-chevron-small-right"></i>Tummy Tuck</a></li>
                                <li><a href="#."><i class="icon-chevron-small-right"></i>Colonoscopy</a></li>
                                <li><a href="#."><i class="icon-chevron-small-right"></i>Heart Patient</a></li>
                                <li><a href="#."><i class="icon-chevron-small-right"></i>Chin Implant</a></li>
                            </ul>
                        </div>
                        <div class="clear"></div>

                        <div class="tags">
                            <h6 class="bar-title">Tags</h6>
                            <div class="all-tags">
                                <a href="#." runat="server">Benefits</a>
                                <asp:LinkButton Text="Benefits" runat="server" />
                                <a href="#.">Kids Health </a>
                                <a href="#.">Body Lift</a>
                                <a href="#.">Trunk Liposuction</a>
                                <a href="#.">Liposuction</a>
                                <a href="#.">ill</a>
                                <a href="#.">Cardiac ablation</a>
                                <a href="#.">Clean Environment</a>
                                <a href="#.">Benefits </a>
                                <a href="#.">Kids Health </a>
                                <a href="#.">Body Lift</a>
                                <a href="#.">Trunk Liposuction</a>
                                <a href="#.">Liposuction</a>
                                <a href="#.">ill</a>
                            </div>
                        </div>
                        <div class="clear"></div>--%>


                        <div class="search">
                            <%--<input runat="server" id="txtnewssearch" type="text" name=" " value="Search here">--%>
                            <asp:TextBox ID="txtsearch" style="width:87%;" placeholder="Search for news catagory" runat="server"  />  
                            <%--<a href="#."><i runat="server" id="btnsearch" class="icon-search"></i></a>--%>
                            <asp:LinkButton ID="btnnewssearch" CssClass="icon-search" OnClick="btnnewssearch_Click" runat="server" />
                            
                        </div>

                    </div>

                </div>
            </div>
        </div>

        <%--<asp:Repeater ID="rssRepeater" runat="server">
            <ItemTemplate>
                <table style="border: solid 1px black; width: 500px; font-family: Arial">
                    <tr>
                        <td style="font-weight: bold">
                            <asp:HyperLink ID="HyperLink1" runat="server"
                                NavigateUrl='<%#Eval("link")%>'
                                Text='<%#Eval("title")%>'></asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: #C2D69B">
                            <asp:Label ID="Label1" runat="server"
                                Text='<%#Eval("description")%>'></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </ItemTemplate>
        </asp:Repeater>--%>
    </div>
</asp:Content>
