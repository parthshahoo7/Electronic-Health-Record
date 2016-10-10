<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" EnableEventValidation="false" Inherits="Electronic_Health_Record.admin._default" %>

<!DOCTYPE html>
<!--[if IE 8]><html class="ie8 no-js" lang="en"><![endif]-->
<!--[if IE 9]><html class="ie9 no-js" lang="en"><![endif]-->
<!--[if !IE]><!-->
<html xmlns="http://www.w3.org/1999/xhtml">
    <!--<![endif]-->
<head id="Head1" runat="server">
  <title>Admin Panel - Login</title>
		<!-- start: META -->
		<meta charset="utf-8" />
		<!--[if IE]><meta http-equiv='X-UA-Compatible' content="IE=edge,IE=9,IE=8,chrome=1" /><![endif]-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0"/>
		<meta name="apple-mobile-web-app-capable" content="yes"/>
		<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
		<meta content="" name="description" />
		<meta content="" name="author" />
		<!-- end: META -->
		<!-- start: MAIN CSS -->
		<link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css"/>
		<link rel="stylesheet" href="assets/fonts/style.css"/>
		<link rel="stylesheet" href="assets/css/main.css"/>
		<link rel="stylesheet" href="assets/css/main-responsive.css"/>
		<link rel="stylesheet" href="assets/plugins/iCheck/skins/all.css"/>
		<link rel="stylesheet" href="assets/plugins/bootstrap-colorpalette/css/bootstrap-colorpalette.css"/>
		<link rel="stylesheet" href="assets/plugins/perfect-scrollbar/src/perfect-scrollbar.css"/>
		<link rel="stylesheet" href="assets/css/theme_light.css" type="text/css" id="skin_color"/>
		<link rel="stylesheet" href="assets/css/print.css" type="text/css" media="print"/>
		<!--[if IE 7]>
		<link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome-ie7.min.css">
		<![endif]-->
		<!-- end: MAIN CSS -->
		<!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
		<!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
</head>
<body class="login example2">
    <form id="form1" runat="server">
   <div class="main-login col-sm-4 col-sm-offset-4">
			<div class="logo">Electronic Health Record</div>
			<!-- start: LOGIN BOX -->
			<div class="box-login">
				<h3>Sign in to your account</h3>
				<p>
					Please enter your name and password to log in.
				</p>
				<div class="form-login">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="errorHandler alert alert-danger display" ShowSummary="true" ValidationGroup="LoginValidation" />
                    <div id="errorBlog" runat="server" visible="false" class="errorHandler alert alert-danger display">
                        <i class="fa fa-times-circle"></i> Invalid UserName or Password.
                    </div>
					<fieldset>
						<div class="form-group">
							<span class="input-icon">
                                <asp:TextBox ID="txtusername" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
								<i class="fa fa-user"></i> </span>
                            <asp:RequiredFieldValidator ID="requredUsername" runat="server" ErrorMessage="UserName Required." ControlToValidate="txtusername" Display="None" ValidationGroup="LoginValidation"></asp:RequiredFieldValidator>
						</div>
						<div class="form-group form-actions">
							<span class="input-icon">
								
                                <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control password" placeholder="Password" TextMode="Password"></asp:TextBox> 
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Password Required." ControlToValidate="txtpassword" Display="None" ValidationGroup="LoginValidation"></asp:RequiredFieldValidator>
								<i class="fa fa-lock"></i>
								 </span>
						</div>
						<div class="form-actions">
							
							<asp:LinkButton ID="txtlogin" runat="server" cssclass="btn btn-bricky pull-right" ValidationGroup="LoginValidation" OnClick="txtlogin_Click">
								Login <i class="fa fa-arrow-circle-right"></i>
                                </asp:LinkButton>
							
						</div>
					</fieldset>
				</div>
			</div>
			<!-- end: LOGIN BOX -->
			<!-- start: FORGOT BOX -->
			<div class="box-forgot">
				<h3>Forget Password?</h3>
				<p>
					Enter your e-mail address below to reset your password.
				</p>
				<form class="form-forgot">
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowSummary="true" CssClass="errorHandler alert alert-danger display" ValidationGroup="ForgetValidation" />
					<fieldset>
						<div class="form-group">
							<span class="input-icon">
                                <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="E-Mail"></asp:TextBox>
								<i class="fa fa-envelope"></i> </span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="E-Mail Address Required." ControlToValidate="txtemail" Display="None" ValidationGroup="ForgetValidation"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid E-Mail Address" ControlToValidate="txtemail" Display="None" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="ForgetValidation"></asp:RegularExpressionValidator>
						</div>
						<div class="form-actions">
							<a class="btn btn-light-grey go-back">
								<i class="fa fa-circle-arrow-left"></i> Back
							</a>
							
                                <asp:LinkButton ID="lnkforgot" runat="server" class="btn btn-bricky pull-right" ValidationGroup="ForgetValidation">
								Submit <i class="fa fa-arrow-circle-right"></i>
                                    </asp:LinkButton>
							
						</div>
					</fieldset>
				</form>
			</div>
			<!-- end: FORGOT BOX -->
			<!-- start: COPYRIGHT -->
			<div class="copyright">
				2016 &copy; Powred by <a href="#" target="_blank">EHR Team</a>
			</div>
			<!-- end: COPYRIGHT -->
		</div>
		<!-- start: MAIN JAVASCRIPTS -->
		<!--[if lt IE 9]>
		<script src="assets/plugins/respond.min.js"></script>
		<script src="assets/plugins/excanvas.min.js"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<![endif]-->
		<!--[if gte IE 9]><!-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<!--<![endif]-->
		<script src="assets/plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
		<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
		<script src="assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"></script>
		<script src="assets/plugins/blockUI/jquery.blockUI.js"></script>
		<script src="assets/plugins/iCheck/jquery.icheck.min.js"></script>
		<script src="assets/plugins/perfect-scrollbar/src/jquery.mousewheel.js"></script>
		<script src="assets/plugins/perfect-scrollbar/src/perfect-scrollbar.js"></script>
		<script src="assets/plugins/less/less-1.5.0.min.js"></script>
		<script src="assets/plugins/jquery-cookie/jquery.cookie.js"></script>
		<script src="assets/plugins/bootstrap-colorpalette/js/bootstrap-colorpalette.js"></script>
		<script src="assets/js/main.js"></script>
		<!-- end: MAIN JAVASCRIPTS -->
		<!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script src="assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
		<script src="assets/js/login.js"></script>
		<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script>
		    jQuery(document).ready(function () {
		        Main.init();
		        Login.init();
		    });
		</script>
    </form>
</body>
</html>

