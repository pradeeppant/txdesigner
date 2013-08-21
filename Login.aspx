<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="win.txDesigner.Login" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>txDESIGNER - trial development Xccelerator</title>
<script src="js/jquery-min.js" type="text/javascript"></script>
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    function checkbox() {
        var checkval = document.getElementById('keepSingin');
        if (checkval.checked) {
            document.getElementById('checkP').classList.add('keep-signin-uncheck');
        }
        else {
            document.getElementById('checkP').classList.remove('keep-signin-uncheck');
        }
    }
</script>
</head>

<body>
<form id="Form1" runat="server">
<span class="header-line"></span>
<div class="main-container">
	<!-- Header Start -->
    <div class="header">
    	<span class="header-line-inner"></span>
        <a href="#" class="tx-logo"></a>
    </div>
    <!-- Header End -->
    
    <!-- Content Start -->
    <div class="content login">
    	<span class="process"></span>
        <span class="login-form">
        	<h1 class="login-heading">trial development Xccelerator...</h1>          
            <asp:TextBox ID="txtUserName" runat="server" Text=""  CssClass="txtbox light-grey" placeholder="Email Address"></asp:TextBox>
            <asp:TextBox ID="passwrd" runat="server" TextMode="Password" CssClass="txtbox light-grey"  placeholder="Password"></asp:TextBox>
            <span class="clear"></span>
            <asp:Label ID="lblMessage" runat="server" Visible="False" CssClass="ErrorMsg error-margn"></asp:Label>
            <span class="clear"></span>
            <span class="keep-signin" id="checkP">
            	<input type="checkbox" id="keepSingin" name="keepSingin" runat="server" onchange="checkbox()" />
                <label for="keepSingin" class="light-grey">
                	Keep me signed in<br />
                    <span>(Uncheck if on a shared computer)</span>
                </label>
            </span>
            <div class="clear"></div>
             <asp:Button ID="btnLogin" runat="server" CssClass ="loginBtn"  OnClick="btnLogin_Click" ToolTip ="Sign In"/>
            <p class="light-grey"><a href="ForgotPassword.aspx">Can't access your account?</a><br />
           <%-- Don't have an account? 
            <a href="signup.aspx">Sign up for free trial.</a>--%>
            </p>
        </span>
    </div>
    <!-- Content End -->
</div>

<!-- Footer Start -->
<div class="footer light-grey">
	<span class="footer-content inner-space">
    	<p class="copyright"><asp:Label ID="lblVersion" runat="server" Text=""></asp:Label><br />&copy; 2013 txDES<span class="red">I</span>GNER&nbsp;, Powered by <strong>WINCERE, INC</strong>.</p>
        <p class="footer-links light-grey">
        	<a href="html/help.html" target="_blank">FAQ</a>
            <a href="html/feedback.html" target="_blank">Send Feedback</a>
            <a href="html/terms.html" target="_blank">Terms</a>
            <a href="html/privacy.html" target="_blank" class="last">Privacy</a>
        </p>
    </span>
</div>
<!-- Footer End -->
</form>
</body>
</html>
