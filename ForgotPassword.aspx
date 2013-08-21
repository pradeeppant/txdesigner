<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="win.txDesigner.ForgotPassword" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>txDESIGNER - trial development Xccelerator...</title>
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="script/jquery-1.10.1.js"></script>

</head>

<body>
         
            
<form id="Form1" runat="server">
<span class="header-line"></span>
<div class="main-container">
	<!-- Header Start -->
    <div class="header">
    	<span class="header-line-inner"></span>
        <a href="Login.aspx" class="tx-logo"></a>
    </div>
    <!-- Header End -->
    
    <!-- Content Start -->
    <div class="content login">
    	<span class="process"></span>
        <span class="login-form">
        	<h1 class="login-heading">trial development Xccelerator...</h1>
            <div class="password-block" id = "divEnterUser" runat="server" clientidmode="Static" visible="true">
                <span class="light-grey"><strong>Forgot your password?</strong><br /> <em>Enter your email address and we'll email you a link to change your password.</em></span>
                <br class="clear" />
               <%-- <input type="text" value="User ID" class="form-txtfld" />--%>
               <asp:TextBox ID="txtUserEmail" runat="server" CssClass = "form-txtfld"></asp:TextBox>
               <span id ="newPassword" class ="ErrorMsg" runat="server" CssClass="ErrorMsg"></span>
                <asp:Label ID="lblSuccess1" runat="server" Text="" CssClass="ErrorMsg"></asp:Label>
                <br class="clear" />
                  
                <asp:Button ID="btnSendMail" runat="server" CssClass="send-email" 
                    title="Send email" onclick="btnSendMail_Click" ClientIDMode="Static"  OnClientClick="return validate();"/>
                    <a href="Login.aspx" class="cancel-btn-forgot" title="Cancel"></a>
            </div>
            
            
            <div class="password-msg-block" id = "divPasswordSent" runat="server" clientidmode="Static" visible="false">
                <span class="success-msg-pswrd dark-grey">
                    We sent an email to the address<strong><asp:Label ID ="email" runat ="server" ></asp:Label></strong>.<br />
                    Please check your inbox.
                </span>
               <p class="didnt-rec-email light-grey"> <%--Didn't receive an email?  Click here for <a href="#">help</a>   <br />--%>
             
                Click here to <a href="Login.aspx">Sign in</a></p>
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

<!-- Loader Ist Screen Start -->
<%--	<div class="loader">
        <img src="images/ajax-loader.gif" class="loader-image" width="250" height="250" />
        <p class="please-text dark-grey">Please Wait...</p>
    </div>--%>
<!-- Loader Ist Screen End -->
</form>
</body>
</html>