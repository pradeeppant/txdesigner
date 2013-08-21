<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MailTest.aspx.cs" Inherits="win.txDesigner.MailTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="Button1" runat="server" Text="Mail" 
            Width="150px" />
        <br />
        <br />
        <asp:Button ID="btnMailAttachment" runat="server"  
            Text="Mail with Attachment" Width="150px" 
            onclick="btnMailAttachment_Click" />
        <br />
        <br />
        <asp:Button ID="btnMailNoAttachment" runat="server"  
            Text="btnMail No Attachment" Width="150px" 
            onclick="btnMailNoAttachment_Click" />
        <br />
        <br />
        <asp:Button ID="Button4" runat="server"   Text="Mail" 
            Width="150px" />
        <br />
        <br />
        <asp:Button ID="Button5" runat="server"  Text="Mail" 
            Width="150px" />
        <br />
        <br />
        <asp:Button ID="Button6" runat="server" Text="Mail" Width="150px" />
        <br />
        <br />
        <asp:Button ID="Button7" runat="server" Text="Mail" Width="150px" />
        <br />
        <br />
        <asp:Button ID="Button8" runat="server" Text="Mail" Width="150px" />
        <br />
        <br />
        <asp:Button ID="Button9" runat="server" Text="Mail" Width="150px" />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
