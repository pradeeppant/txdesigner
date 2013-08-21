<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true"
    CodeBehind="UpdateClient.aspx.cs" Inherits="win.txDesigner.UpdateClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MasterHead" runat="server">
    <script src="Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>
  <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
  <title>Client Profile</title>
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="MasterContent" runat="server">

   <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="content" onmouseover ="MaskText();">
    <script type="text/javascript">
      $(document).ready(function () {
          $('input:text').change(function () {
              $(this).css({ 'border': '1px solid #757575', 'color': '#333' });
          });
          $("#<%= txtPhoneNo.ClientID %>").mask("+1(999)999-9999");
      });
    
    
    
    
    
    </script>
      <script type ="text/javascript">
          function maskPhone() {
              $("#<%= txtPhoneNo.ClientID %>").mask("+1(999)999-9999");
          }
          function MaskText() {
              $('input:text').change(function () {
                  $(this).css({ 'border': '1px solid #757575', 'color': '#333' });
              });
              $('input:password').change(function () {
                  $(this).css({ 'border': '1px solid #757575', 'color': '#333' });
              });
              $('select').change(function () {
                  $(this).css({ 'border': '1px solid #757575', 'color': '#333' });
              });
              $("#<%= btnUpdate.ClientID %>").click(function (e) {
                  var a = $("#<%= txtName.ClientID %>").val();
                  if (a.trim() == "" || a == "Name") {
                      $("#<%= txtName.ClientID %>").css("background-color", "#FFDCDC");
                      $("#ClientError").text("Client's name cannot be empty");
                      $("#AddressError").text("");
                      $("#locationError").text('');
                      $("#MaiilError").text('');
                      $("#PhoneError").text('');
                      $("#ContactError").text('');

                      $("#<%= txtAddress.ClientID %>").css("background-color", "#FFFFFF");
                      $("#<%= txtLocation.ClientID %>").css("background-color", "#FFFFFF");
                      $("#<%= txtEmail.ClientID %>").css("background-color", "#FFFFFF");
                      $("#<%= txtContactPerson.ClientID %>").css("background-color", "#FFFFFF");
                      $("#<%= txtPhoneNo.ClientID %>").css("background-color", "#FFFFFF");
                      $("#<%= txtContactPerson.ClientID %>").css("background-color", "#FFFFFF");
                      return false;
                      event.preventDefault();
                  }


                  a = $("#<%= txtAddress.ClientID %>").val();
                  if (a.trim() == "" || a == "Address") {
                      $("#<%= txtAddress.ClientID %>").css("background-color", "#FFDCDC");
                      $("#AddressError").text("Address cannot be empty");
                      $("#locationError").text('');
                      $("#MaiilError").text('');
                      $("#PhoneError").text('');
                      $("#ContactError").text('');

                      $("#<%= txtLocation.ClientID %>").css("background-color", "#FFFFFF");
                      $("#<%= txtEmail.ClientID %>").css("background-color", "#FFFFFF");
                      $("#<%= txtContactPerson.ClientID %>").css("background-color", "#FFFFFF");
                      $("#<%= txtPhoneNo.ClientID %>").css("background-color", "#FFFFFF");
                      $("#<%= txtContactPerson.ClientID %>").css("background-color", "#FFFFFF");
                      return false;
                      event.preventDefault();
                  }


                  a = $("#<%= txtLocation.ClientID %>").val();
                  if (a.trim() == "" || a == "Location") {
                      $("#<%= txtLocation.ClientID %>").css("background-color", "#FFDCDC");
                      $("#locationError").text('Location cannot be empty');
                      $("#MaiilError").text('');
                      $("#PhoneError").text('');
                      $("#ContactError").text('');

                      $("#<%= txtEmail.ClientID %>").css("background-color", "#FFFFFF");
                      $("#<%= txtPhoneNo.ClientID %>").css("background-color", "#FFFFFF");
                      $("#<%= txtContactPerson.ClientID %>").css("background-color", "#FFFFFF");
                      return false;
                      event.preventDefault();
                  }

                  a = $("#<%= txtEmail.ClientID %>").val();
                  if (a.trim() == "" || a == 'Email Address') {

                      $("#<%= txtEmail.ClientID %>").css("background-color", "#FFDCDC");
                      $("#MaiilError").text('Email address cannot be empty');



                      $("#PhoneError").text('');
                      $("#ContactError").text('');
                      $("#<%= txtPhoneNo.ClientID %>").css("background-color", "#FFFFFF");
                      $("#<%= txtContactPerson.ClientID %>").css("background-color", "#FFFFFF");


                      return false;
                      event.preventDefault();

                  }
                  a = $("#<%= txtEmail.ClientID %>").val();
                  if (!isValidEmailAddress(a)) { /* do stuff here */

                      $("#<%= txtEmail.ClientID %>").css("background-color", "#FFDCDC");
                      $("#MaiilError").text('Please provide valid email address');
                      $("#PhoneError").text('');
                      $("#ContactError").text('');

                      $("#<%= txtPhoneNo.ClientID %>").css("background-color", "#FFFFFF");
                      $("#<%= txtContactPerson.ClientID %>").css("background-color", "#FFFFFF");
                      return false;
                      event.preventDefault();
                  }

                  a = $("#<%= txtPhoneNo.ClientID %>").val();
                  if (a == "" || a == '+1(XXX)XXX-XXXX') {

                      $("#<%= txtPhoneNo.ClientID %>").css("background-color", "#FFDCDC");
                      $("#PhoneError").text('Phone # cannot be empty');
                      $("#ContactError").text('');

                      $("#<%= txtContactPerson.ClientID %>").css("background-color", "#FFFFFF");
                      return false;
                      event.preventDefault();

                  }

                  a = $("#<%= txtContactPerson.ClientID %>").val();
                  // alert(a);
                  if (a == "" || a == "Contact Person") {
                      $("#<%= txtContactPerson.ClientID %>").css("background-color", "#FFDCDC");
                      $("#ContactError").text('Contact Person name required');
                      $("#PhoneError").text('');
                      $("#<%= txtPhoneNo.ClientID %>").css("background-color", "#FFFFFF");
                      return false;
                      event.preventDefault();
                  }

                  $("#<%= txtContactPerson.ClientID %>").change(function (e) {

                      $("#<%= txtContactPerson.ClientID %>").css("background-color", "#FFFFFF");
                      $("#ContactError").text('');
                  });

                  $("#<%= txtPhoneNo.ClientID %>").change(function (e) {

                      $("#<%= txtPhoneNo.ClientID %>").css("background-color", "#FFFFFF");
                      $("#PhoneError").text('');
                  });

                  $("#<%= txtEmail.ClientID %>").change(function (e) {

                      $("#<%= txtEmail.ClientID %>").css("background-color", "#FFFFFF");
                      $("#MaiilError").text('');
                  });

                  $("#<%= txtLocation.ClientID %>").change(function (e) {

                      $("#<%= txtLocation.ClientID %>").css("background-color", "#FFFFFF");
                      $("#locationError").text('');
                  });

                  $("#<%= txtAddress.ClientID %>").change(function (e) {

                      $("#<%= txtAddress.ClientID %>").css("background-color", "#FFFFFF");
                      $("#AddressError").text('');
                  });


                  $("#<%= txtName.ClientID %>").change(function (e) {

                      $("#<%= txtName.ClientID %>").css("background-color", "#FFFFFF");
                      $("#ClientError").text('');
                  });

              });
          }
          function isValidEmailAddress(emailAddress) {
              var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
              return pattern.test(emailAddress);
          };

                         </script>
    <div class="page-heading">
        <span>Client Profile</span>
    </div>
    <asp:Label ID="lblMessage" runat="server" SkinID="ErrMsg"></asp:Label>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
      <ContentTemplate>
        <asp:Label ID="lblClientId" Visible="false" runat="server" />
        <span id="spanMessage" class="ErrorMsg"></span>
       <div class="edit-form">
            <div class="form-raw">
              <div class="field-nm">Client</div>
              <div class="field-val">
                <asp:TextBox ID="txtName" runat="server" MaxLength="50" CssClass="field-frm com-name"
                                           value="Name" onblur="if(this.value=='') this.value='Name';" onfocus="if(this.value=='Name') this.value='';"></asp:TextBox>
                <br />
                <span id="ClientError" class="ErrorMsg"></span> </div>
            </div>
            <div class="form-raw">
              <div class="field-nm">Address</div>
              <div class="field-val">
                <asp:TextBox ID="txtAddress" runat="server" CssClass="field-frm address" value="Address" onblur="if(this.value=='') this.value='Address';" onfocus="if(this.value=='Address') this.value='';"></asp:TextBox>
                <br />
                <span id="AddressError" class="ErrorMsg"></span> </div>
            </div>
            <div class="form-raw">
              <div class="field-nm">Location</div>
              <div class="field-val">
                <asp:TextBox ID="txtLocation" runat="server"   CssClass="field-frm" value="Location" onblur="if(this.value=='') this.value='Location';"
                                            onfocus="if(this.value=='Location') this.value='';"></asp:TextBox>
                <br />
                <span id="locationError" class="ErrorMsg"></span> </div>
            </div>
            <div class="form-raw">
              <div class="field-nm">Email Address</div>
              <div class="field-val">
                <asp:TextBox ID="txtEmail" runat="server"   CssClass="field-frm email" value ="Email Address" onblur="if(this.value=='') this.value='Email Address';"
                                            onfocus="if(this.value=='Email Address') this.value='';" ></asp:TextBox>
                <br />
                <span id="MaiilError" class="ErrorMsg"></span> </div>
            </div>
            <div class="form-raw">
              <div class="field-nm">Phone #</div>
              <div class="field-val">
                <asp:TextBox ID="txtPhoneNo" runat="server" CssClass="field-frm" value="+1(XXX)XXX-XXXX" placeholder="+1(XXX)XXX-XXXX" onblur="if(this.value=='') this.value='+1(XXX)XXX-XXXX';" onfocus="maskPhone()"></asp:TextBox>
                <br />
                <span id="PhoneError" class="ErrorMsg"></span> </div>
            </div>
            <div class="form-raw">
              <div class="field-nm">Contact Person</div>
              <div class="field-val">
                <asp:TextBox ID="txtContactPerson" runat="server" value="Contact Person"  CssClass="field-frm com-name" onblur="if(this.value=='') this.value='Contact Person';"
                                            onfocus="if(this.value=='Contact Person') this.value='';"></asp:TextBox>
                <br />
                <span id="ContactError" class="ErrorMsg"></span> </div>
            </div>
            <div class="form-raw">
              <div class="field-nm">Active</div>
              <div class="field-val">
                <asp:RadioButton runat="server" ID = "Active"  Text="Yes" GroupName ="Active" Checked="true" />
                <asp:RadioButton runat="server" ID = "Deactive"  Text="No" GroupName ="Active"/>
              </div>
            </div>
            <div class="form-raw">
              <div class="field-nm">Image</div>
              <div class="field-val">
                <asp:TextBox ID="txtImagePath" runat="server" Visible ="false"></asp:TextBox>
                <asp:FileUpload ID="FileUpload1"  runat="server" Enabled="true" />
                <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="Upload Image" CssClass ="upload-button" />
              </div>
         
              <div class="clear"></div>
               <div class="form-raw password-hint"  id ="dvUserHint" runat ="server">
          <div class="field-nm">&nbsp;</div>
          <div class="field-val"> <span class="info-text">Logo Size Must be less then 2 MB</span> </div>
        </div>
              <div class="form-raw">
                <div class="field-nm">&nbsp;</div>
                <div class="field-val">
                  <asp:Image ID="Image1" runat="server" AlternateText="LogoNotAvailable"  />
                  <br />
                  <asp:Label ID="lblImgMsg" runat="server" Visible="false" ForeColor="Red" CssClass="ErrorMsg"></asp:Label>
                </div>
              </div>
        
            </div>
            <br class="clear" /><br class="clear" />
            <div style="width:60%;">
           <span class="field-raw">
            <span class="btn-block">

            <asp:Button ID="btncancel" runat="server" Text="Cancel"  CssClass="btn-back white" ToolTip="Cancel" />
                <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update"  CssClass="btn-add white" ToolTip="Update" />
             
             </span>
        </span>
         
         </div>


          </div>
        <asp:Label ID="lblSuccess" runat="server" ForeColor="Red"></asp:Label>
        <asp:Label ID="Label1" runat="server" Visible="false" ForeColor="Red"></asp:Label>
      </ContentTemplate>
      <Triggers>
        <asp:PostBackTrigger ControlID="btnUpload" />
      </Triggers>
    </asp:UpdatePanel>
  </div>
 
  </asp:Content>
