<%@ Page Title="" Language="C#" MasterPageFile="~/user/Main.Master" AutoEventWireup="true" CodeBehind="patient_prescription.aspx.cs" EnableEventValidation="false" Inherits="Electronic_Health_Record.patient_prescription" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="sub-banner">
        <div class="detail">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">

                        <div class="paging">
                            <h2>Patient History</h2>
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a>Patient Report</a></li>
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


        <div class="leave-msg dark-back" id="history" runat="server">
            <div class="container">

                <div class="form">
                    <div class="row">
                        <div runat="server">
                            <div class="col-md-4">
                                <asp:Label ID="lblerror" Text="" runat="server" />
                                <asp:Label ID="lblpid" runat="server" Text='<%#Eval("p_id") %>' Visible="false"></asp:Label>
                            </div>
                            <asp:GridView ID="gridview" DataKeyNames="p_pid" CssClass="col-lg-12"  AutoGenerateColumns="false" OnSelectedIndexChanged="gridview_SelectedIndexChanged" runat="server">
                                <Columns>
                                    <asp:BoundField DataField="p_pid" HeaderText="Report_id" />    
                                    <asp:BoundField DataField="pre_date" HeaderText="Prescription Date" />
                                    <asp:BoundField DataField="patient_name" HeaderText="Patient Name" />
                                    <asp:BoundField DataField="doctor_name" HeaderText="Doctor Name" />
                                    <asp:CommandField ShowSelectButton="true" HeaderText="View" />
                                    <%--<asp:TemplateField>

                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" CssClass="link" Text="View" ID="lnkview">View</asp:LinkButton>

                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                </Columns>
                            </asp:GridView>

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
						<h2><span>Prescription</span></h2>
						
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
                    
				</li>
                
               
                <li><div class="icon"><i class="icon-doctor"></i></div>
                    <asp:Label Text="Doctor Name: " runat="server" />
                    <asp:Label ID="lbldoctor" Text="" runat="server" />
				</li>
                <li><div class="icon"><i class="icon-Medicine-bottle"></i></div>
                    <asp:GridView ID="gridsub" runat="server" CssClass="col-md-12 table-bordered" AutoGenerateColumns="false">  
                        <Columns>    
                                    <asp:BoundField DataField="p_pid" HeaderText="Report_id" Visible="false" />    
                                    <asp:BoundField DataField="medicine_name" HeaderText="Medicine Name" />
                                    <asp:BoundField DataField="Schedule" HeaderText="Schedule" />
                                    <asp:BoundField DataField="meal_schedule" HeaderText="Meal Schedule" />
                                    
                            </Columns> 

                    </asp:GridView>
                </li>
                
				
			</ul>
			
			
           
              </div>
            </div>
   
  </div>
    </div>
</asp:Content>
