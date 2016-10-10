<%@ Page Title="" Language="C#" MasterPageFile="~/user/Main.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="view_patient_report.aspx.cs" Inherits="Electronic_Health_Record.view_patient_report" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="sub-banner">
    <div class="detail">
        <div class="container">
            <div class="row">
                <div class="col-md-12">

                    <div class="paging">
                        <h2>Patient Report</h2>
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li><a>Edit Patient Report</a></li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>
        </div>
    <div class="contact-us">
        <div class="container">

            <div class="row">
            </div>

        </div>



        <div class="leave-msg dark-back" id="div1" runat="server">

            <div class="container">
                <div class="form">
                    <div class="row">

                        <div class="col-md-12">
                           
                            <div class="col-md-12">
                                <div class="col-md-4">
                                    <asp:Label ID="lblsearch" Text='<% #Eval("p_id") %>' Visible="true" runat="server" />
                                    <asp:Label ID="lblpid" runat="server" Text='<%#Eval("p_id") %>' Visible="false"></asp:Label>
                                </div>
                            </div>
                           
                          
                            
                        <div class="col-md-12">
                            <div class="col-md-6">
                                <asp:TextBox ID="txtsearch" CssClass="input" placeholder="Patient Name" OnTextChanged="txtsearch_TextChanged" AutoPostBack="true" runat="server" />
                                <asp:AutoCompleteExtender id="autocompleteextender1" runat="server"
                                     TargetControlID="txtsearch" MinimumPrefixLength="1"
                                     EnableCaching="true" CompletionSetCount="1" CompletionInterval="1000"
                                     ServiceMethod="GetUsers"> </asp:AutoCompleteExtender>       

                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="btnsearch" Text="Search" OnClick="btnsearch_Click" runat="server" />
                            </div>
                        </div>
                        

                            <div class="col-md-12">
                            <asp:GridView ID="gridview1" DataKeyNames="rt_id" CssClass="col-lg-12"  AutoGenerateColumns="false" OnSelectedIndexChanged="gridview1_SelectedIndexChanged" runat="server">
                                <Columns>
                                    <asp:BoundField DataField="rt_id" HeaderText="Report_id" />    
                                    <asp:BoundField DataField="report_date" HeaderText="Date" />
                                    <asp:BoundField DataField="p_name" HeaderText="Patient Name" />
                                    <asp:BoundField DataField="deaseas_name" HeaderText="Deaseas Name" />
                                    <asp:CommandField ShowSelectButton="true" HeaderText="View" />
                                    <%--<asp:TemplateField>

                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" CssClass="link" Text="View" ID="lnkview">View</asp:LinkButton>

                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                </Columns>
                            </asp:GridView>
                        </div>
                            <asp:Label ID="lblerror" Text="" ForeColor="Red" runat="server" />
                        </div>
                        
                    </div>
                </div>


            </div>

        </div>

        <div class="content" id="report" runat="server">
		<div class="research">
			<div class="container">
			
			<div class="research-sec">
			
				
				<div class="col-md-12">
					<div class="main-title" style="text-align:center;">
						<h2><span>REPORT</span></h2>
						
					</div>
				</div>
				
			</div>
			
			<ul class="research-detail">
				<li><div class="icon"><i class="icon-calendar"></i></div>
                    <asp:Label Text="Date: " runat="server" />
                    <asp:Label ID="lbldate" Text="" runat="server" />
				</li>
                <li><div class="icon"><i class="icon-man"></i></div>
                    <asp:Label Text="Name: " runat="server" />
                    <asp:Label ID="lblpname" Text="" runat="server" />
				</li>
                
                <li><div style="width:25%; float:left;">
                    <div class="icon"><i class="icon-man2"></i></div>
                    <span style="width:80%;"><asp:Label Text="Age: " runat="server" /></span>
                    <span style="width:80%;"><asp:Label ID="lblage" Text="" runat="server" /></span>
                    </div>
                    <div style="width:25%; float:left;">
                    <div class="icon"><i class="icon-man-woman"></i></div>
                    
                    <span style="width:80%;"><asp:Label Text="Marital Status: " runat="server" /></span>
                    <span style="width:80%;"><asp:Label ID="lblstatus" Text="" runat="server" /></span>
                    </div>
				</li>
               
                <li><div style="width:25%; float:left;">
                    <div class="icon"><i class="icon-calendar2"></i></div>
                    <span style="width:80%;"><asp:Label Text="Admit Date: " runat="server" /></span>
                    <span style="width:80%;"><asp:Label ID="lbladmitdate" Text="" runat="server" /></span>
                    </div>
                    <div style="width:25%;float:left;">
                    <div class="icon"><i class="icon-time"></i></div>
                    <span style="width:80%;"><asp:Label Text="Admit Time: " runat="server" /></span>
                    <span style="width:80%;"><asp:Label ID="lbladmittime" Text="" runat="server" /></span>
                     </div>
                    <div style="width:25%; float:left;">
                    <div class="icon"><i class="icon-calendar2"></i></div>
                    <span style="width:80%;"><asp:Label Text="Discharge Date: " runat="server" /></span>
                    <span style="width:80%;"><asp:Label ID="lbldischargedate" Text="" runat="server" /></span>
                    </div>
                    <div style="width:25%;float:left;">
                    <div class="icon"><i class="icon-time"></i></div>
                    <span style="width:80%;"><asp:Label Text="Discharge Time: " runat="server" /></span>
                    <span style="width:80%;"><asp:Label ID="lbldischargetime" Text="" runat="server" /></span>
                     </div>
				</li>
                <li>
				</li>
                <li><div class="icon"><i class="icon-info"></i></div>
                    <asp:Label Text="Diseases Name: " runat="server" />
                    <asp:Label ID="lbldiseases" Text="" runat="server" />
				</li>
                <li><div class="icon"><i class="icon-info2"></i></div>
                    <asp:Label Text="Description: " runat="server" />
                    <asp:Label ID="lbldescription" Text="" runat="server" />
                </li>
                    <li><div class="icon"><i class="icon-home"></i></div>
                    <asp:Label Text="Room Type: " runat="server" />
                    <asp:Label ID="lblroom" Text="" runat="server" />
				</li>
                
                <li><div class="icon"><i class="icon-clock"></i></div>
                    <asp:Label Text="Admit Days: " runat="server" />
                    <asp:Label ID="lbldays" Text="" runat="server" />
				</li>
                <li><div style="width:25%; float:left;">
                    <div class="icon"><i class="icon-price-tag"></i></div>
                    <span style="width:80%;"><asp:Label Text="Room Charge: " runat="server" /></span>
                    <span style="width:80%;"><asp:Label ID="lblcharge" Text="" runat="server" /></span>
                    </div>
                    <div style="width:25%; float:left;">
                    <div class="icon"><i class="icon-price-tag"></i></div>
                    <span style="width:80%;"><asp:Label Text="Doctor Charge: " runat="server" /></span>
                    <span style="width:80%;"><asp:Label ID="lbldcharge" Text="" runat="server" /></span>
                    </div>
                    <div style="width:25%; float:left;">
                    <div class="icon"><i class="icon-price-tag"></i></div>
                    <span style="width:80%;"><asp:Label Text="Nursing Charge: " runat="server" /></span>
                    <span style="width:80%;"><asp:Label ID="lblncharge" Text="" runat="server" /></span>
                    </div>
				</li>
                 <li><div style="width:25%; float:left;">
                    <div class="icon"><i class="icon-price-tag"></i></div>
                    <span style="width:80%;"><asp:Label Text="Medicine Charge: " runat="server" /></span>
                    <span style="width:80%;"><asp:Label ID="lblmedicinecharge" Text="" runat="server" /></span>
                    </div>
                    <div style="width:25%; float:left;">
                    <div class="icon"><i class="icon-price-tag"></i></div>
                    <span style="width:80%;"><asp:Label Text="other Charges: " runat="server" /></span>
                    <span style="width:80%;"><asp:Label ID="lblothercharge" Text="" runat="server" /></span>
                    </div>
                     </li>
               
                <li><div class="icon"><i class="icon-price-tags"></i></div>
                    <asp:Label Text="Grande Total: " runat="server" />
                    <asp:Label ID="lbltotal" Text="" runat="server" />
				</li>
				
			</ul>
			
			
           <%-- <div class="research-sec">
			
				
				<div class="col-md-12">
					<div class="main-title" style="text-align:center;">
						<h2><span>LAB TEST REPORT</span></h2>
						
					</div>
				</div>
				
			</div>

            <ul class="research-detail">
				<li><div class="icon"><i class="icon-calendar"></i></div>
                    <asp:Label Text="Test Date: " runat="server" />
                    <asp:Label ID="lbllabdate" Text="text" runat="server" />
				</li>
                <li><div class="icon"><i class="icon-address"></i></div>
                    <asp:Label Text="Address: " runat="server" />
                    <asp:Label ID="lbladdress" Text="text" runat="server" />
				</li>
                
                <li><div style="width:25%; float:left;">
                    <div class="icon"><i class="icon-blood-bag"></i></div>
                    <span style="width:80%;"><asp:Label Text="Test Name: " runat="server" /></span>
                    <span style="width:80%;"><asp:Label ID="lbltestname" Text="text" runat="server" /></span>
                    </div>
                    <div style="width:25%; float:left;">
                    <div class="icon"><i class="icon-doctor"></i></div>
                    <span style="width:80%;"><asp:Label Text="Doctor Name: " runat="server" /></span>
                    <span style="width:80%;"><asp:Label ID="lbldocname" Text="text" runat="server" /></span>
                        </div>
				</li>
                </ul>--%>
              </div>
            </div>
   
  </div>

    </div>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="Scripts/jquery.searchabledropdown-1.0.8.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("select").searchable();
        });
    </script>
</asp:Content>
