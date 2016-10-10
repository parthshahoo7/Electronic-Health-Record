<%@ Page Title="" Language="C#" MasterPageFile="~/Default/Site1.Master" AutoEventWireup="true" CodeBehind="resetpassword.aspx.cs" EnableEventValidation="false" Inherits="Electronic_Health_Record.resetpassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="sub-banner">
     <div class="detail">
    	<div class="container">
        	<div class="row">
            	<div class="col-md-12">
                	
                    <div class="paging">
                		<h2>Reset Password</h2>
						<ul>
						<li><a href="#">Home</a></li>
						<li><a>Reset Password</a></li>
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
		
		
		<div class="leave-msg dark-back">
			<div class="container">

			<div class="row">
				<div class="col-md-12">
					
				</div>
			</div>
			
			<div class="form">
				<div class="row">
                   
                <div name="contact_form" id="contact_form" >
                    <div class="col-md-12">
					<div class="col-md-4">
                        <asp:Label ID="lblmsg1" Text="" runat="server" />
                        </div>
                        </div>
                    <div class="col-md-12">
					<div class="col-md-4">
                        <asp:RequiredFieldValidator ID="requiredvalidationfname" ValidationGroup="Required" runat="server" ForeColor="Red" ErrorMessage="Password Required" ControlToValidate="txtnewpswd" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtnewpswd" runat="server" CssClass="input" placeholder="Enter Your New Password"></asp:TextBox>

                        </div>
					
                        </div>
                    <div class="col-md-12">
                        <div class="col-md-4">
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtnewpswd"
                                                ControlToValidate="txtrepswd" ForeColor="Red" ErrorMessage="Password Not Match"
                                                ValidationGroup="Required" Display="Dynamic"></asp:CompareValidator>
                            <asp:TextBox ID="txtrepswd" runat="server" TextMode="Password" CssClass="input" placeholder="Re-Enter Your Password" />  
                        </div>
                    </div>
                   
                     <div class="col-md-12">
                    <div class="col-md-4"><asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click"  ValidationGroup="Required" /></div>
                    </div>
                    </div>
                    
				</div>
			</div>
			
			
			</div>
		</div>
		
   </div>
</asp:Content>