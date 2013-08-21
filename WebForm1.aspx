<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="win.txDesigner.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 39%;
            height: 119px;
            background-color: #CCCCFF;
        }
        .style2
        {
            font-weight: bold;
        }
        .style3
        {
            font-weight: normal;
            color: #333399;
        }
        .style4
        {
            color: #333399;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    
    <table border="1" class="style1">
        <tr>
            <td class="style2">
                Email</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="233px">dinesh.gupta@wincere.com</asp:TextBox>
            </td>
        </tr>
                <tr>
            <td class="style2">
                OTP Password</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" Width="138px">********</asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" style="font-weight: 700" 
                    Text="Click Here To Get OTP" Width="175px" />
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <br class="style4" />
                <span class="style3">Create your password</span></td>
        </tr>
        <tr>
            <td class="style2">
                Password</td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server" Width="138px">********</asp:TextBox>
&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td class="style2">
                Confirm Password</td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" Width="138px">********</asp:TextBox>
            </td>
        </tr>

        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Button ID="Button2" runat="server" style="font-weight: 700" Text="Submit" 
                    Width="101px" />
            </td>
        </tr>
    </table>
    
    </form>
</body>
</html>
