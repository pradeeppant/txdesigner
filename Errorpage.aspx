<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Errorpage.aspx.cs" Inherits="win.txDesigner.Errorpage" %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>txDESIGNER - trial development Xccelerator...</title>
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="Scripts/jquery-1.10.1.js" type="text/javascript"></script>
<script type="text/javascript">
    //Focus On Off Code
    $(document).ready(function () {
        var el = $('input[type=password]');
        el.focus(function (e) {
            if (e.target.value == e.target.defaultValue)
                e.target.value = '';
        });
        el.blur(function (e) {
            if (e.target.value == '')
                e.target.value = e.target.defaultValue;
        });
    });
</script>
</head>
<body>
    <form id="Form1" runat="server">
<span class="header-line"></span>
<div class="main-container">
	<!-- Header Start -->
    <div class="header">
    	<span class="header-line-inner"></span>
        <a href="Login.aspx" class="tx-logo greyscale"></a>
    </div>
    <!-- Header End -->
    
    <!-- Content Start -->
    <div class="content login">
    	<span class="error-text">
            <h1>Sorry...<br />It's not you. It's us.</h1>
            <span class="err-msg-bg">The server encountered an internal error and was unable to complete your request.</span>
        </span>
        <span class="login-form">
        	<h1 class="login-heading greyscale">trial development Xccelerator...</h1>
            <div class="password-block" id = "divEnterUser" runat="server" clientidmode="Static" visible="true">
                <span class="light-grey"><em>For security reasons, we would appreciate you to <br class="clear" />Sign In again.</em></span><br class="clear" />
                <a href="Login.aspx" class="signin-btn-logout"></a>
            </div>
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
            <a href="html/privacy.html" class="last" target="_blank">Privacy</a>
        </p>
    </span>
</div>
<!-- Footer End -->
</form>
</body>
</html>
