<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="win.txDesigner.UserControls.Header" %>
<script language="javascript" type="text/javascript">
    function RemoveSignOut() {
        alert("inside");
        lnkSignOut.style.visibility = 'hidden';
    }

</script>
<div>
    <img id="imglogo" src="../images/Logo.gif" alt="Wincere" style="width: 194px; height: 49px;" />
    <span id="span" runat="server" visible="false"><span style="margin-left: 150px; top: 10px;
        vertical-align: middle">
        <img id="img1" src="../images/pdf-attachment-extractor.png" runat="server" alt="Wincere" style="width: 225px;
            height: 50px;" />
        <asp:Label ID="Label1" runat="server" SkinID="ClientName"></asp:Label>
    </span><span style="text-align: right; margin-left: 300px;">
        <asp:Label ID="lblWelcome" runat="server" SkinID="Title"></asp:Label>
    </span>&nbsp;&nbsp; <span>
        <a id="lnkSignOut" href="../Login.aspx?SignOut=Y" target="_self" >Sign Out</a> <a
            id="lnkChngPwd" href="../ChangePassword.aspx" target="_self" onclick="RemoveSignOut">Change Password</a>
    </span></span>
</div>
