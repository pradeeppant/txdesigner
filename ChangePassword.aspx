<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true"
    CodeBehind="ChangePassword.aspx.cs" Inherits="win.txDesigner.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MasterHead" runat="server">
    <title>txDESIGNER - Change Password</title>
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="MasterContent" runat="server">
<script type="text/javascript">
    $(document).ready(function () {

        $('input:password').change(function () {
            $(this).css({ 'border': '1px solid #757575', 'color': '#333' });

        });
    });

    function goBack() {
        history.go(-1);
    }

    


</script>
<div class="content">
<!-- Change Passowrd Start -->
    <h2>Change Password</h2>
    <br class="clear" />
    <br class="clear" />
    <div style="width:62%;">
    <span class="field-raw">
        <span class="field-text">User Name</span>
        <span class="field-right-txt">
            <asp:TextBox ID="txtUserName" runat="server" MaxLength="50" class="form-txtfld" ReadOnly ="true"></asp:TextBox>
        </span>
    </span>
    <span class="field-raw">
        <span class="field-text">New Password</span>
        <span class="field-right-txt">
            <asp:TextBox TextMode="Password" ID="txtNewPassword" runat="server" MaxLength="12" class="form-txtfld" placeholder="Password"></asp:TextBox>
            <span id ="newPassword" class ="ErrorMsg" runat="server" ></span>
        </span>
    </span>
    <span class="field-raw">
        <span class="field-text">Confirm Password</span>
        <span class="field-right-txt">
            <asp:TextBox TextMode="Password" ID="txtConfirmPassword" runat="server" MaxLength="12" class="form-txtfld"  placeholder="Confirm password"></asp:TextBox>
            <span id ="ConfPassword" class ="ErrorMsg" runat="server" ></span>
        </span>
    </span>
    <span class="field-raw">
        <span class="btn-block">
            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit"  CssClass="btn-add-left white" />
            <asp:Button ID="BtnCancel" runat="server" Text="Cancel" OnClick="BtnCancel_Click" CssClass="btn-back-right white"  PostBackUrl="~/ViewClients.aspx" />
        </span>
    </span>
    <div class ="clear"></div>
    <div style="padding-left:160px">    
     <asp:Label ID="lblMessage" runat="server" Visible="False"></asp:Label>
    </div>
   
    </div>
  </div>
</asp:Content>
