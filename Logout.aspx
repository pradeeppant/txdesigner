<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="win.txDesigner.Logout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>txDESIGNER - trial development Xccelerator...</title>
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="Scripts/jquery-1.10.1.js" type="text/javascript"></script>
</head>
<body>

<form id="Form1" runat="server">
<span class="header-line"></span>
<div class="main-container">
	<!-- Header Start -->
    <div class="header">
    	<span class="header-line-inner"></span>
        <a href="Login.aspx" class="tx-logo"></a>
        <div class="moduleLogo"></div>
    </div>
    <!-- Header End -->
    
    <!-- Content Start -->
    <div class="content content-logout">
        <h2><strong>Thank you: <em><asp:Label ID="lblUserName" runat="server" Text=""></asp:Label></em></strong>
        <br /><span>You have successfully signed out from the system.</span></h2>
        <br class="clear" />
        <span class="page-heading">Session Details:</span>
        <table class="gridTbl">
        <tr>
            <th>Started</th>
            <th>Ended</th>
            <th>Duration <em><strong>(hh:mm:ss)</strong></em></th>
        </tr>
         <tr>
              <td><asp:Label ID="lblStart" runat="server" Text=""></asp:Label></td>
            <td><asp:Label ID="lblEnd" runat="server" Text=""></asp:Label></td>
            <td style="border-right:none;"><asp:Label ID="lblDuration" runat="server" Text=""></asp:Label></td>
        </tr>
        </table>
        <div align="right"><a href="Login.aspx" class="signin-btn-logout"></a></div>
    </div>
    <!-- Content End -->
</div>

<!-- Footer Start -->
<div class="footer light-grey">
	<span class="footer-content inner-space">
    	<p class="copyright">Version 1.0<br />&copy; 2013 txDES<span class="red">I</span>GNER&nbsp;, Powered by <strong>WINCERE, INC</strong>.</p>
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

