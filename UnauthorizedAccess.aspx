<%@ Page Language="C#"  MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="UnauthorizedAccess.aspx.cs" Inherits="win.txDesigner.UnauthorizedAccess" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MasterHead" runat="server">
<title >Unauthorized Access</title>
    <script src="include/javascripts.js" type="text/javascript"></script>
    <link href="css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="include/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="include/jQuery-AECommon.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="MasterContent" runat="server">
<div class="content">
<div class="page-heading">
    	<span>You do not have access to this page Click Here TO GO <asp:LinkButton ID="back" runat="server" Text="Back" 
            onclick="BackButton_Click" /></span>
 
</div>
  
   
   
    </div>
</asp:Content>
