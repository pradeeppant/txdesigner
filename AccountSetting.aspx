<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AccountSetting.aspx.cs" Inherits="win.txDesigner.AccountSetting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="js/masked.js" type="text/javascript"></script>
  <script type="text/javascript">

      function Show() {
//          if ($('#txtPassword').val() == 0) {
//              //alert('Please enter the password');
//              $('#txtPassword').addClass('error-textbox');
//              $('#txtPassword').attr('placeholder', 'Please Enter Password');
//              $('#txtPassword').focus();
//              return false;
//          }
          if ($('#txtPassword').val() != 0 && $('#txtConfirmpassword').val() == 0) {
              $('#txtConfirmpassword').addClass('error-textbox');
              $('#txtConfirmpassword').attr('placeholder', 'Please Retype Password');
              $('#txtConfirmpassword').focus();
              return false;
          }
          if ($('#txtFirstname').val() == 0) {
              //alert('Please enter the password');
              $('#txtFirstname').addClass('error-textbox');
              $('#txtFirstname').attr('placeholder', 'Please Enter First Name');
              $('#txtFirstname').focus();
              return false;
          }
          if ($('#txtLastname').val() == 0) {
              $('#txtLastname').addClass('error-textbox');
              $('#txtLastname').attr('placeholder', 'Please Enter Last Name');
              $('#txtLastname').focus();
              return false;
          }
          if ($('#txtDesignation').val() == 0) {
              $('#txtDesignation').addClass('error-textbox');
              $('#txtDesignation').attr('placeholder', 'Please Enter Title');
              $('#txtDesignation').focus();
              return false;
          }
          if ($('#txtPhone').val() == 0) {
              $('#txtPhone').addClass('error-textbox');
              $('#txtPhone').attr('placeholder', 'Please Enter Phone No');
              $('#txtPhone').focus();
              return false;
          }

      }
      $(document).ready(function () {
          var txtFldVal = $('.mandt').val();
          $('.mandt').keydown(function () {
              $('.mandt').removeClass('error-textbox');
          });

          $('#txtPhone').mask('+(999) 999-9999');
          $('#txtPhone').keypress(function (event) {
              if ((event.which > 58 && event.which < 126)) {
                  event.preventDefault()
                  $(this).addClass('error-textbox');
              }
              else {
                  return true;
              }
          });

          $('.profileSettingDD').hide();
          $('div.profileSetting').hover(
                  function () {
                      var target = $('.profileSettingDD');
                      target.stop(true, true).slideDown('fast');
                  },
                  function () {
                      var target = $('.profileSettingDD');
                      target.stop(true, true).slideUp('fast');
                  }
              );

          $('input:password').change(function () {
              $(this).css({ 'border': '1px solid #757575', 'color': '#333' });

          });
          function goBack() {
              history.go(-1);
          }

      });

      
      
</script> 
  
  <!-- Content Start -->
  <div class="content">
    <h1 class="process-tag">trial development Xccelerator...</h1>
    <br class="clear" />
    <br class="clear" />
    <br class="clear" />
    <span class="account-setting-bg light-grey">
        <span class="account-setting-heading"></span>
        <span class="mandatory-actStng">All fields are mandatory</span>
        <span class="select-options">
            <span class="raw">
                <span class="field-left-text">Company</span>
                <span class="field-right-obj"><asp:TextBox ID="txtClientname" runat="server" CssClass="form-txtfld email" Enabled ="false"></asp:TextBox></span>
            </span>
            <span class="raw">
                <span class="field-left-text">User ID</span>
                <span class="field-right-obj"><asp:TextBox ID="txtUserId" runat="server" CssClass="form-txtfld email" Enabled ="false"></asp:TextBox></span>
            </span>
              <span class="raw">
                <span class="field-left-text">Role</span>
                <span class="field-right-obj"><asp:TextBox ID="txtRole" runat="server" CssClass="form-txtfld email" Enabled ="false"></asp:TextBox></span>
            </span>
            <span class="raw">
                <span class="field-left-text">Password</span>
                <span class="field-right-obj">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-txtfld mandt" placeholder="Password" TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                    <asp:TextBox ID="txtConfirmpassword" runat="server" CssClass="form-txtfld mandt" placeholder ="Confirm password" TextMode ="Password" ClientIDMode="Static"></asp:TextBox>
                       <span id ="newPassword" class ="ErrorMsg" runat="server" ></span>
                </span>
                <span class="field-left-text"> </span>
                <span class="field-right-obj">
                    <p class="info-text blue">Must have (4-12) characters; case sensitive</p>
                </span>
            </span>
            <span class="raw">
                <span class="field-left-text">Name</span>
                <span class="field-right-obj">
                    <asp:TextBox ID="txtFirstname" runat="server" CssClass="form-txtfld mandt" placeholder ="First" ClientIDMode="Static"></asp:TextBox>
                    <asp:TextBox ID="txtLastname" runat="server" CssClass="form-txtfld mandt" placeholder ="Last" ClientIDMode="Static"></asp:TextBox>
                </span>
            </span>
            <span class="raw">
                <span class="field-left-text">Email Address</span>
                <span class="field-right-obj"><asp:TextBox ID="txtEmail" runat="server" CssClass="form-txtfld email" Enabled ="false"  placeholder ="Email"></asp:TextBox></span>
            </span>
            <span class="raw">
                <span class="field-left-text">Title</span>
                <span class="field-right-obj"><asp:TextBox ID="txtDesignation" runat="server" CssClass="form-txtfld email mandt"  placeholder ="Designation" ClientIDMode="Static"></asp:TextBox></span>
            </span>
            <span class="raw">
                <span class="field-left-text">Phone #</span>
                <span class="field-right-obj">
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-txtfld mandt" MaxLength="15" ClientIDMode="Static"></asp:TextBox>
                    <asp:TextBox ID="txtExtension" Visible="false" runat="server" CssClass="form-txtfld extension mandt" placeholder ="Ext" ClientIDMode="Static"></asp:TextBox>
                </span>
            </span>
            <span class="raw">
                <span class="field-left-text"></span>
                <span class="field-right-obj">
                    <asp:Button ID="btnSubmit" runat="server" CssClass="save-changes-btn"  ClientIDMode="Static" OnClientClick="return Show();" OnClick="btnSubmit_Click"  />
                    <asp:Button ID="BtnCancel" runat="server" CssClass="cancel-btn-grey" OnClientClick="goBack();" OnClick="BtnCancel_Click" />
                </span>
                <br class="clear" />
                <span class="field-left-text"></span>
                <span class="field-right-obj">
                    <asp:Label runat ="server" ID="lblMsg" CssClass="green"></asp:Label>
                </span>
            </span>
        </span>
    </span>
 </div>
</asp:Content>
