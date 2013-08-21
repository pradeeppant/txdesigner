<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="win.txDesigner.signup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>txDESIGNER - trial development Xccelerator</title>
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />
<link href="css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="Scripts/jquery-1.10.1.js"></script>
<script src="js/jquery-min.js" type="text/javascript"></script>
  <script src="js/masked.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        $(document).ready(function () {
            // alert('0');
            //Signup code
            $('.personal-plan-form').hide();
            $('.enterprise-plan-form').hide();

            $('#btnSugnUp').click(function () {
                var delay = 0;
                $('.p-hide:lt(15)').each(function () {
                    $(this).delay(delay).animate({
                        width: 0,
                        opacity: 0
                    }, 90, function () {
                        $('.personal-plan-content').hide('slow');
                        $('.enterprise-plan-content').css('display', 'block');
                    });
                    delay += 90;
                });
                $('.personal-plan-form').slideDown('slow');
                $('#btnSugnUp').slideUp('fast');
               
                $('.start-trial').delay(500).slideDown('slow');
                $('.enterprise-plan-form').slideUp('fast');
                $('.sign-up-confirmation').slideUp('fast');
                $('.e-hide').removeAttr('style');
                $('.submit-btn').slideUp();
                $('.getin-touch').removeAttr('style');
            });
            $('.signin-btn').click(function () {
                window.location.assign('login.html');
            });
            $('.getin-touch').click(function () {
                var delay = 0;
                $('.e-hide:lt(15)').each(function () {
                    $(this).delay(delay).animate({
                        width: 0,
                        opacity: 0
                    }, 90, function () {
                        $('.enterprise-plan-content').hide('slow');
                        $('.personal-plan-content').css('display', 'block');
                    });
                    delay += 90;
                });
                $('.enterprise-plan-form').slideDown('slow');
                $('.getin-touch').slideUp('fast');
                $('.submit-btn').delay(500).slideDown('slow');


                $('.personal-plan-form').slideUp('fast');
                $('.sign-up-confirmation').slideUp('fast');
                $('.p-hide').removeAttr('style');

                $('.start-trial').slideUp('slow');
                $('.signin-btn').slideUp('slow');
                $('.personal-plan-btn').removeAttr('style');
            });
            $('.submit-btn').click(function () {
                $('.enterprise-plan-form').slideUp('fast');
                $('.enterprise-plan-form').next('span.sign-up-confirmation').slideDown('fast');
                $('.submit-btn').hide('fast');
            });


        });

        function maskPhone() {
             
            $('#txtPhone').mask("+1(999)999-9999");
        }

        function maskBusinessPhone() {

            $('#txtBusinessPhone').mask("+1(999)999-9999");
        }

        
        function validatePersonal() {

            //Controls
           // txtUserID = $("#<%= txtUserID.ClientID %>").val();
            txtName = $("#<%= txtName.ClientID %>").val();
            txtEmail = $("#<%= txtEmail.ClientID %>").val();
            txtPassword = $("#<%= txtPassword.ClientID %>").val();
            txtConfPassword = $("#<%= txtConfPassword.ClientID %>").val();
            txtPhone = $("#<%= txtPhone.ClientID %>").val();
             

           // $("#<%= txtUserID.ClientID %>").css("background-color", "#FFFFFF");
            $("#<%= txtName.ClientID %>").css("background-color", "#FFFFFF");
            $("#<%= txtEmail.ClientID %>").css("background-color", "#FFFFFF");
            $("#<%= txtPassword.ClientID %>").css("background-color", "#FFFFFF");
            $("#<%= txtConfPassword.ClientID %>").css("background-color", "#FFFFFF");
            $("#<%= txtPhone.ClientID %>").css("background-color", "#FFFFFF");
             

            $("#txtUserIDError").text("");
            $("#txtNameError").text("");
            $("#txtEmailError").text("");
            $("#txtPasswordError").text("");
            $("#txtConfPasswordError").text("");
            $("#txtConfPasswordError").text("");
            $("#txtPhoneError").text("");
            
                   
//            if (txtUserID.trim() == "" || txtUserID == "User ID")
//             {
//                $("#<%= txtUserID.ClientID %>").css("background-color", "#FFDCDC");
//                $("#txtUserIDError").text("User ID cannot be empty");
//                return false;
//            }

            //Name           
            if (txtName.trim() == "" || txtName == "Name") 
            {
                $("#<%= txtName.ClientID %>").css("background-color", "#FFDCDC");
                $("#txtNameError").text("Name cannot be empty");
                return false;
                }

            //Email           
            if (txtEmail.trim() == "" || txtEmail == "someone@example.com") 
            {
                $("#<%= txtEmail.ClientID %>").css("background-color", "#FFDCDC");
                $("#txtEmailError").text("Email cannot be empty");
                return false;
            }

            if (!isValidEmailAddress(txtEmail)) {
                $("#<%= txtEmail.ClientID %>").css("background-color", "#FFDCDC");
                $("#txtEmailError").text("Please provide valid email address");
                return false;
            }

            //Password           
            if (txtPassword.trim() == "" || txtPassword == "Password") 
            {
                $("#<%= txtPassword.ClientID %>").css("background-color", "#FFDCDC");
                $("#txtPasswordError").text("Password cannot be empty");
                return false;
                }

            //Password length          
            if (txtPassword.toString().length < 6) {
                $("#<%= txtPassword.ClientID %>").css("background-color", "#FFDCDC");
                $("#txtPasswordError").text("Minimum 6 characters required");
                return false;
            }
            // Retype Password            
            if (txtConfPassword.trim() == "" || txtConfPassword == "Retype Password") 
            {
                $("#<%= txtConfPassword.ClientID %>").css("background-color", "#FFDCDC");
                $("#txtConfPasswordError").text("Confirm Password cannot be empty");
                return false;
            }

            // Check Password match 
            if (txtPassword.trim() != txtConfPassword.trim()) {
                $("#<%= txtConfPassword.ClientID %>").css("background-color", "#FFDCDC");
                $("#txtConfPasswordError").text("Password mismatch");
                return false;
            }

           // Phone

            if (txtPhone.trim() == "" || txtPhone == "+1(XXX)XXX-XXXX") 
            {
                $("#<%= txtPhone.ClientID %>").css("background-color", "#FFDCDC");
                $("#txtPhoneError").text("Phone cannot be empty");
                return false;
            }

          
//            if (ChkTermsOfUse.checked == false) {
//                $("#<%= ChkTermsOfUse.ClientID %>").css("background-color", "#FFDCDC");
//                $("#ChkTermsOfUseError").text("Phone cannot be empty");
//                return false;
//            }
           
            if ($('input[type=checkbox]').is(':checked') == false) {                
                $('#ChkTermsOfUse:checked').css("background-color", "#FFDCDC");
                $("#ChkTermsOfUseError").text("To use this service you must accept terms of use.");
                return false;
                }
            
        }


        function validateEnterprise() {

            //Controls
            txtNameE = $("#<%= txtNameE.ClientID %>").val();
            ddlNameTitle = $("#<%= ddlNameTitle.ClientID %>").val();
            txtEmailE = $("#<%= txtEmailE.ClientID %>").val();
            txtCompanyE = $("#<%= txtCompanyE.ClientID %>").val();
            txtCompanyURL = $("#<%= txtCompanyURL.ClientID %>").val();
            ddlNumberOfUse = $("#<%= ddlNumberOfUse.ClientID %>").val();
            ddlCountry = $("#<%= ddlCountry.ClientID %>").val();
            txtBusinessPhone = $("#<%= txtBusinessPhone.ClientID %>").val();

            $("#<%= txtNameE.ClientID %>").css("background-color", "#FFFFFF");
            $("#<%= ddlNameTitle.ClientID %>").css("background-color", "#FFFFFF");
            $("#<%= txtEmailE.ClientID %>").css("background-color", "#FFFFFF");
            $("#<%= txtCompanyE.ClientID %>").css("background-color", "#FFFFFF");
            $("#<%= txtCompanyURL.ClientID %>").css("background-color", "#FFFFFF");
            $("#<%= ddlNumberOfUse.ClientID %>").css("background-color", "#FFFFFF");
            $("#<%= ddlCountry.ClientID %>").css("background-color", "#FFFFFF");
            $("#<%= txtBusinessPhone.ClientID %>").css("background-color", "#FFFFFF");
            $("#<%= ChkTermsOfUse.ClientID %>").css("background-color", "#FFFFFF");
            $("#<%= ChkTermsOfUseEP.ClientID %>").css("background-color", "#FFFFFF");


            $("#txtNameEError").text("");
            $("#ddlNameTitleError").text("");
            $("#txtEmailEError").text("");

            $("#txtCompanyEError").text("");
            $("#txtCompanyURLError").text("");
            $("#ddlNumberOfUseError").text("");
            $("#ddlCountryError").text("");
            $("#txtBusinessPhoneError").text("");
            $("#ChkTermsOfUseError").text("");
            $("#ChkTermsOfUseErrorEP").text("");
           
             
            if (txtNameE.trim() == "" || txtNameE == "Name") {
                $("#<%= txtNameE.ClientID %>").css("background-color", "#FFDCDC");
                $("#txtNameEError").text("Name cannot be empty");
                return false;
            }

            if (ddlNameTitle.trim() == "" || ddlNameTitle == "Title") {
                $("#<%= ddlNameTitle.ClientID %>").css("background-color", "#FFDCDC");
                $("#ddlNameTitleError").text("Please select Title");
                return false;
            }

            if (txtEmailE.trim() == "" || txtEmailE == "someone@example.com") {
                $("#<%= txtEmailE.ClientID %>").css("background-color", "#FFDCDC");
                $("#txtEmailEError").text("Email cannot be empty");
                return false;
            }

            if (!isValidEmailAddress(txtEmailE)) {
                $("#<%= txtEmailE.ClientID %>").css("background-color", "#FFDCDC");
                $("#txtEmailEeError").text("Please provide valid email address");
                return false;
            }

            if (txtCompanyE.trim() == "" || txtCompanyE == "Company") {
                $("#<%= txtCompanyE.ClientID %>").css("background-color", "#FFDCDC");
                $("#txtCompanyEError").text("Company cannot be empty");
                return false;
            }

            if (txtCompanyURL.trim() == "" || txtCompanyURL == "www.company.com") {
                $("#<%= txtCompanyURL.ClientID %>").css("background-color", "#FFDCDC");
                $("#txtCompanyURLError").text("Please provide Company URL");
                return false;
            }

            if (ddlNumberOfUse.trim() == "" || ddlNumberOfUse == "# of Use") {
                $("#<%= ddlNumberOfUse.ClientID %>").css("background-color", "#FFDCDC");
                $("#ddlNumberOfUseError").text("Please select  # of Use");
                return false;
                        }

          
            if (ddlCountry.trim() == "" || ddlCountry == "Country") {
                
                $("#<%= ddlCountry.ClientID %>").css("background-color", "#FFDCDC");
                $("#ddlCountryError").text("Please select Country");
                return false;
            }

            if (txtBusinessPhone.trim() == "" || txtBusinessPhone == "+1(XXX)XXX-XXXX") {
                $("#<%= txtBusinessPhone.ClientID %>").css("background-color", "#FFDCDC");
                $("#txtBusinessPhoneError").text("Business Phone cannot be empty");
                return false;
            }

            if ($('input[type=checkbox]').is(':checked') == false) {
                $('#ChkTermsOfUseEP:checked').css("background-color", "#FFDCDC");
                $("#ChkTermsOfUseErrorEP").text("To use this service you must accept terms of use.");
                return false;
            }

        }



        function isValidEmailAddress(emailAddress) {
            var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
            return pattern.test(emailAddress);
        };
        

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:UpdateProgress  DisplayAfter="0" ID="UpdateProgress2" DynamicLayout="true" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
    <ProgressTemplate>
      <div class="loader-bg loader">
        <div align="center" style="width: 100%; padding-top: 7%; opacity:0.7; filter:alpha(opacity=70);"><img src="images/ajax-loader.gif" alt="" /></div>         
      </div>
    </ProgressTemplate>
  </asp:UpdateProgress>
     <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>
       

    <span class="header-line"></span>
    <div class="main-container">
	<!-- Header Start -->
    <div class="header">
    	<span class="header-line-inner"></span>
        <a href="#" class="tx-logo"></a>
    </div>
    <!-- Header End -->
    
    <asp:UpdatePanel ID ="UpdatePanel1" runat="server" UpdateMode="Conditional" >
      <ContentTemplate >
       
    <!-- Content Start -->
    <div class="content">
    	<br class="clear" />
    	<h1 class="process-tag">trial development Xccelerator...</h1>
    	<br class="clear" />
        <br class="clear" />
        <br class="clear" />
       
        <div class="signup-area dark-grey">
        	<span class="plan-details" >
             
            	<span class="plan-text-left"><strong>User</strong></span>
                <span class="plan-text-left">Online storage</span>
                <span class="plan-text-left">Upload file size limit</span>
                <span class="plan-text-left">File download links</span>
                <span class="plan-text-left">Password protected sharing</span>
                <br class="clear" />
                
                <span class="plan-text-left"><strong>Enhanced Features</strong></span>
                <span class="plan-text-left">Download statistics and tracking</span>
                <span class="plan-text-left">Role base access</span>
                <span class="plan-text-left">Version history</span>
                <br class="clear" />
                
            	<span class="plan-text-left"><strong>Admin &amp; Security Controls</strong></span>
                <span class="plan-text-left">User admin console</span>
                <span class="plan-text-left">Access management</span>
                <span class="plan-text-left">Email settings &amp; configuration</span>
                <span class="plan-text-left">Custom branding</span>
                <span class="plan-text-left">Groups based access</span>
                <br class="clear" />
            </span>
            <span class="personal-plan">
            	<span class="personal-plan-heading"></span>
            	<span class="head-text">
                    <!-- Step 1 Start -->
                	<span class="personal-plan-content" id="panel1Left" runat="server">
                        <span class="plan-text-left p-hide"><strong>01 Users</strong></span>
                        <span class="plan-text-left p-hide">5 to 10 GB</span>
                        <span class="plan-text-left p-hide">1 MB to 5 MB</span>
                        <span class="plan-text-left p-hide"><img src="images/right-sign.png" width="20" height="20" alt="Right Arrow" /></span>
                        <span class="plan-text-left p-hide"> </span>
                        <br class="clear" />
                        
                        <span class="plan-text-left p-hide"> </span>
                        <span class="plan-text-left p-hide"> </span>
                        <span class="plan-text-left p-hide"> </span>
                        <span class="plan-text-left p-hide"> </span>
                        <br class="clear" />
                        
                        <span class="plan-text-left p-hide"> </span>
                        <span class="plan-text-left p-hide"> </span>
                        <span class="plan-text-left p-hide"> </span>
                        <span class="plan-text-left p-hide"> </span>
                        <span class="plan-text-left p-hide"> </span>
                        <span class="plan-text-left p-hide"> </span>
                	</span>
                    <!-- Step 1 End -->

                    <!-- Step 2 Start -->
                    <span class="personal-plan-form" id="PerSigmUp" runat="server">
                        <asp:TextBox ID="txtUserID" CssClass="form-txtfld" runat="server" Text="User ID" MaxLength="40" ClientIDMode="Static" visible="false"
                         onblur="if(this.value=='') this.value='User ID';" onfocus="if(this.value=='User ID') this.value='';"></asp:TextBox>
                         <br />
                         <span id="txtUserIDError" class="ErrorMsg" runat="server"  ></span>                           
                        <%-- <asp:Label ID="lblUserIDError" runat="server" Text="" ForeColor="Red"></asp:Label>--%>

                        <asp:TextBox ID="txtName" CssClass="form-txtfld" runat="server" Text="Name" MaxLength="100" ClientIDMode="Static" 
                         onblur="if(this.value=='') this.value='Name';" onfocus="if(this.value=='Name') this.value='';"></asp:TextBox>
                          <br class="clear" />
                          <span id="txtNameError" class="ErrorMsg"></span>    
                        
                        <asp:TextBox ID="txtEmail" CssClass="form-txtfld" runat="server" MaxLength="100" Text="someone@example.com" ClientIDMode="Static" 
                         onblur="if(this.value=='') this.value='someone@example.com';" onfocus="if(this.value=='someone@example.com') this.value='';"></asp:TextBox>
                         <br class="clear" />
                         <span id="txtEmailError" class="ErrorMsg" runat="server"></span>  

                        <asp:TextBox ID="txtPassword" CssClass="form-txtfld" runat="server" Text="Password" placeholder="Password" MaxLength="30" TextMode ="Password" ClientIDMode="Static" 
                         onblur="if(this.value=='') this.value='Password';" onfocus="if(this.value=='Password') this.value='';"></asp:TextBox>
                        <br class="clear" />
                        <span id="txtPasswordError" class="ErrorMsg"></span>  

                        <asp:TextBox ID="txtConfPassword" CssClass="form-txtfld" runat="server" Text="Retype Password" placeholder="Retype Password" MaxLength="30" TextMode="Password" ClientIDMode="Static"
                         onblur="if(this.value=='') this.value='Retype Password';" onfocus="if(this.value=='Retype Password') this.value='';" ></asp:TextBox>
                        <br class="clear" />
                        <span id="txtConfPasswordError" class="ErrorMsg"></span>  

                        <asp:TextBox ID="txtPhone" CssClass="form-txtfld" runat="server" value="+1(XXX)XXX-XXXX" placeholder="+1(XXX)XXX-XXXX" onfocus="maskPhone()" ClientIDMode="Static" MaxLength="30" ></asp:TextBox>
                         
                        <br class="clear" />
                         <span id="txtPhoneError" class="ErrorMsg"   ></span>  

                        <span class="terms-condition">
                        	<%--<input type="checkbox" id="Checkbox1" name="keepSingin_1" checked="checked" />--%>
                            
                            <asp:CheckBox ID="ChkTermsOfUse"  runat="server" ClientIDMode="Static" />
                            <label for="keepSingin" class="light-grey">
                                Yes, I accept the Terms of Use and the Privacy Statement
                            </label>
                            
                        </span>
                         <br class="clear" />
                         <span id="ChkTermsOfUseError"  class="ErrorMsg" style="text-align:left"></span>  
                  </span>
                  <!-- Step 2 End -->

                  <!-- Step 3 Start -->
                  <span class="sign-up-confirmation" id="PerSignupSuccess" runat="server">
                    <strong>Confirmation</strong><br class="clear" />
                    An account activation e-mail has been sent to your email:<br />
                      <asp:Label ID="lblSuccess" runat="server" Text="" ></asp:Label>
                    <a href="#"><asp:Label ID="lblMail" runat="server" Text=""></asp:Label>  </a>
                </span> 

                </span>
                <br class="clear" />
                <br class="clear" />

                <div align="center">
                    <asp:Button ID="btnSugnUp" runat="server"  CssClass="sign-up-yellow personal-plan-btn" ClientIDMode = "Static" OnClick = "btnSugnUp_Click" />
                    <asp:Button ID="btnStartTrial" runat="server" CssClass="start-trial" ClientIDMode = "Static" OnClientClick = "return validatePersonal();" OnClick="btnStartTrial_Click"  />
                    <asp:Button ID="btnSignIn" runat="server" CssClass="signin-btn" ClientIDMode = "Static" PostBackUrl="~/Login.aspx"/>
                     
                </div>
            </span>

            <span class="enterprise-plan">
            	<span class="enterprise-plan-heading"></span>
                <span class="head-text">
                	<span class="enterprise-plan-content" id = "EntprisePlan" runat="server">
                        <span class="plan-text-left e-hide"><strong>Unlimited</strong></span>
                        <span class="plan-text-left e-hide">Unlimited</span>
                        <span class="plan-text-left e-hide">Unlimited</span>
                        <span class="plan-text-left e-hide"><img src="images/right-sign.png" width="20" height="20" alt="Right Arrow" /></span>
                        <span class="plan-text-left e-hide"><img src="images/right-sign.png" width="20" height="20" alt="Right Arrow" /></span>
                        <br class="clear" />
                        
                        <span class="plan-text-left e-hide"><img src="images/right-sign.png" width="20" height="20" alt="Right Arrow" /></span>
                        <span class="plan-text-left e-hide"><img src="images/right-sign.png" width="20" height="20" alt="Right Arrow" /></span>
                        <span class="plan-text-left e-hide"><img src="images/right-sign.png" width="20" height="20" alt="Right Arrow" /></span>
                        <span class="plan-text-left e-hide"><img src="images/right-sign.png" width="20" height="20" alt="Right Arrow" /></span>
                        <br class="clear" />
                        
                        <span class="plan-text-left e-hide"><img src="images/right-sign.png" width="20" height="20" alt="Right Arrow" /></span>
                        <span class="plan-text-left e-hide"><img src="images/right-sign.png" width="20" height="20" alt="Right Arrow" /></span>
                        <span class="plan-text-left e-hide"><img src="images/right-sign.png" width="20" height="20" alt="Right Arrow" /></span>
                        <span class="plan-text-left e-hide"><img src="images/right-sign.png" width="20" height="20" alt="Right Arrow" /></span>
                        <span class="plan-text-left e-hide"><img src="images/right-sign.png" width="20" height="20" alt="Right Arrow" /></span>
                        <span class="plan-text-left e-hide"><img src="images/right-sign.png" width="20" height="20" alt="Right Arrow" /></span>
                    </span>
                    
                     <span class="enterprise-plan-form" id="enterprisePlanForm" runat="server"> 
                         <asp:TextBox ID="txtNameE" Text = "Name" runat="server" CssClass="form-txtfld" MaxLength="40" ClientIDMode="Static"
                         onblur="if(this.value=='') this.value='Name';" onfocus="if(this.value=='Name') this.value='';"></asp:TextBox>
                             <br class="clear" />
                             <span id="txtNameEError" class="ErrorMsg"></span>  

                         <asp:DropDownList ID="ddlNameTitle" runat="server" CssClass="form-txtfld" ClientIDMode="Static">
                          <asp:ListItem Text="Title" Value="Title"> </asp:ListItem>
                          <asp:ListItem Text="Mr." Value="Mr.">   </asp:ListItem>
                          <asp:ListItem Text="Mrs." Value="Mrs.">  </asp:ListItem>
                          <asp:ListItem Text="Dr." Value="Dr.">   </asp:ListItem>
                         </asp:DropDownList> 
                        <br class="clear" /> 
                        <span id="ddlNameTitleError" class="ErrorMsg"></span>  

                        <asp:TextBox ID="txtEmailE" Text = "someone@example.com" runat="server" CssClass="form-txtfld" ClientIDMode="Static"
                         onblur="if(this.value=='') this.value='someone@example.com';" onfocus="if(this.value=='someone@example.com') this.value='';"></asp:TextBox>                        
                        <br class="clear" /> 
                        <span id="txtEmailEError" class="ErrorMsg"></span>  

                        <asp:TextBox ID="txtCompanyE" Text = "Company" runat="server" CssClass="form-txtfld" ClientIDMode="Static"
                         onblur="if(this.value=='') this.value='Company';" onfocus="if(this.value=='Company') this.value='';"></asp:TextBox>
                        <br class="clear" />
                        <span id="txtCompanyEError" class="ErrorMsg"></span>  

                        <asp:TextBox ID="txtCompanyURL" Text = "www.company.com" runat="server" CssClass="form-txtfld" ClientIDMode="Static"
                         onblur="if(this.value=='') this.value='www.company.com';" onfocus="if(this.value=='www.company.com') this.value='';"></asp:TextBox>
                        <br class="clear" />
                        <span id="txtCompanyURLError" class="ErrorMsg"></span>  

                        <asp:DropDownList ID="ddlNumberOfUse" runat="server" CssClass="form-txtfld" ClientIDMode="Static">
                             <asp:ListItem Text="# of Use" Value="# of Use"> </asp:ListItem>
                             <asp:ListItem Text="&lt;5" Value="2"> </asp:ListItem>
                             <asp:ListItem Text="5-10" Value="3"> </asp:ListItem>
                             <asp:ListItem Text="10&gt;" Value="4"> </asp:ListItem>
                        </asp:DropDownList>  
                        <br class="clear" />
                        <span id="ddlNumberOfUseError" class="ErrorMsg"></span>  

                         <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-txtfld" ClientIDMode="Static">
                             <asp:ListItem Text="Country" Value="Country"> </asp:ListItem>
                             <asp:ListItem Text="USA" Value="2"> </asp:ListItem>
                             <asp:ListItem Text="Canada" Value="3"> </asp:ListItem>
                             <asp:ListItem Text="India" Value="4"> </asp:ListItem>
                        </asp:DropDownList>                                                 
                        <br class="clear" />
                        <span id="ddlCountryError" class="ErrorMsg"></span>  
                        <asp:TextBox ID="txtBusinessPhone" CssClass="form-txtfld" runat="server" value="+1(XXX)XXX-XXXX" placeholder="+1(XXX)XXX-XXXX" onfocus="maskBusinessPhone()" ClientIDMode="Static" MaxLength="30" ></asp:TextBox>
                        
                        <br class="clear" />
                        <span id="txtBusinessPhoneError" class="ErrorMsg"></span>  

                        <span class="terms-condition">
                             <asp:CheckBox ID="ChkTermsOfUseEP"  runat="server" ClientIDMode="Static" />
                            <label for="keepSingin" class="light-grey">
                                Yes, I accept the Terms of Use and the Privacy Statement
                            </label>
                        </span>
                        <br class="clear" />
                         <span id="ChkTermsOfUseErrorEP" style="text-align:left" class="ErrorMsg"></span>  
                    </span>

                                      
                    <span class="sign-up-confirmation" id="EntpSignupSuccess" runat="server">
                    	<strong>Confirmation</strong>
                        <br class="clear" />
                        Thank You, we have received your response.<br /><br />
                        <b>We will get in touch with you.</b>
                    </span>
                </span>
                <br class="clear" />
                <br class="clear" />
                <div align="center">
                     <asp:Button ID="btnGetInTouch" runat="server" CssClass="getin-touch" ClientIDMode = "Static"  OnClick="btnGetInTouch_Click"/>
                    <%--<asp:Button ID="btnGetInTouch" runat="server" CssClass="getin-touch" ClientIDMode = "Static"/>--%>
                    <asp:Button ID="btnSubmitEntp" runat="server" CssClass="submit-btn" ClientIDMode = "Static" OnClientClick = "return validateEnterprise();" OnClick="btnSubmitEntp_Click" />
                </div>
            </span>
           
        </div>
        
    </div> 
    <br />
    <table width="135" border="0" cellpadding="2" cellspacing="0" title="Click to Verify - This site chose Symantec SSL for secure e-commerce and confidential communications.">
<tr>
<td width="135" align="center" valign="top"><script type="text/javascript" src="https://seal.verisign.com/getseal?host_name=www.txdesigner.us&amp;size=S&amp;use_flash=YES&amp;use_transparent=YES&amp;lang=en"></script><br />
<a href="http://www.symantec.com/ssl-certificates" target="_blank"  style="color:#000000; text-decoration:none; font:bold 7px verdana,sans-serif; letter-spacing:.5px; text-align:center; margin:0px; padding:0px;">ABOUT SSL CERTIFICATES</a></td>
</tr>
</table>

        </ContentTemplate>
    </asp:UpdatePanel>
    <!-- Content End -->
</div>

<!-- Footer Start -->
<div class="footer light-grey">
	<span class="footer-content inner-space">
    	<p class="copyright">&copy; 2013 txDES<span class="red">I</span>GNER&nbsp;<asp:Label ID="lblVersion" runat="server" Text=""></asp:Label>, Powered by <strong>WINCERE, INC</strong>.</p>
        <p class="footer-links light-grey">
        	<a href="#">FAQ</a>
            <a href="#" class="last">Send Feedback</a>
        </p>
    </span>
</div>
<!-- Footer End -->

    </form>
</body>
</html>
