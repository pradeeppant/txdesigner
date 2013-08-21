<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewClients.aspx.cs" Inherits="win.txDesigner.ViewClients"
    MasterPageFile="~/Master.Master" MaintainScrollPositionOnPostback="true" EnableEventValidation="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MasterHead" runat="server">
    <title>txDESIGNER - Client List</title>
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="MasterContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
  <script src="js/masked.js" type="text/javascript"></script>
  <script type ="text/javascript" >
      
  </script>
  <asp:LinkButton ID="btnAddClients" runat="server" Text="Add Client" CommandArgument="Add" ToolTip="Add Client" OnClick="btnAddClients_Click" CssClass="addClientBtn white"></asp:LinkButton>
  <div class="content" onmouseover="MaskText()">
    <h2>Clients</h2>
    <br class="clear" />
    <br class="clear" />
    <asp:GridView ID="gvClients" runat="server" AutoGenerateColumns="False" width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" AllowPaging="true" PageSize="7" OnPageIndexChanging="gvClients_PageIndexChanging" 
          AllowSorting ="true" onsorting="gvClients_Sorting" PagerStyle-CssClass="paging" CssClass="gridTbl">
      <AlternatingRowStyle CssClass="grey"  />
      <Columns>
      <asp:TemplateField >
        <ItemTemplate>
          <asp:ImageButton ID="btnClientConfig" runat="server" ImageUrl="~/images/client-config-icon.png" OnClick="btnClientConfig_Click"  width="17" height="20" ToolTip="Configuration"></asp:ImageButton>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Client ID" Visible="false">
        <ItemTemplate>
          <asp:Label ID="lblid" runat="server" Text=' <%#Eval("ClientId") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Name" SortExpression ="ClientName">
        <ItemTemplate>
          <asp:LinkButton ID="btnEdit" CommandArgument="Edit" CssClass="popup-open" runat="server" Text=' <%#Eval("ClientName") %>' OnClick="btnEdit_Click" />
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Location" HeaderStyle-Width ="12%" SortExpression ="Location" >
        <ItemTemplate>
          <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("Location") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Phone #" HeaderStyle-Width="14%"  SortExpression ="PhoneNo">
        <ItemTemplate>
          <asp:Label ID="lblPhoneNo" runat="server" Text='<%#Eval("PhoneNo") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Address" SortExpression="Address">
        <ItemTemplate>
          <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("Address") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Contact Person" HeaderStyle-Width="12%"  SortExpression ="ContactPerson">
        <ItemTemplate>
          <asp:Label ID="lblContactPerson" runat="server" Text='<%#Eval("ContactPerson") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Email Address" SortExpression="Email">
        <ItemTemplate> <a href='mailto:<%#Eval("Email") %>'>
          <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
          </a> </ItemTemplate>
      </asp:TemplateField>
    <asp:TemplateField HeaderText="Status" SortExpression="Active">
                <ItemTemplate>
                    <%#Eval("Status")%>
                </ItemTemplate>
            </asp:TemplateField>
      </Columns>
      <PagerStyle CssClass="paging" HorizontalAlign="Right" />
    </asp:GridView>

    <br class="clear" />
    <asp:CheckBox ID="chkShowAll" runat="server" AutoPostBack="true" Text=" Show All"
                ToolTip="Allows to view both active and inactive client." OnCheckedChanged="chkShowAll_CheckedChange"
                Visible="false" />
    <asp:HyperLink ID="hlnkBack" runat="server" NavigateUrl="" Visible="false">Back</asp:HyperLink>
    <asp:Button ID="btnShowPopup" runat="server" Style="display: none" />
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup" CancelControlID="btnCancel" BackgroundCssClass="overlay">
      <Animations>
        <OnShown>
          <FadeIn Duration="0.4" Fps="24" />
        </OnShown>
      </Animations>
    </ajaxToolkit:ModalPopupExtender>
  </div>
<%--  <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
    <ContentTemplate> --%>
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

                  $("#ClientError").text("");
                  $("#AddressError").text("");
                  $("#locationError").text('');
                  $("#MaiilError").text('');
                  $("#PhoneError").text('');
                  $("#ContactError").text('');
                                 

                  $("#<%= txtName.ClientID %>").css("background-color", "#FFFFFF");
                  $("#<%= txtAddress.ClientID %>").css("background-color", "#FFFFFF");                
                  $("#<%= txtLocation.ClientID %>").css("background-color", "#FFFFFF");
                  $("#<%= txtEmail.ClientID %>").css("background-color", "#FFFFFF");
                  $("#<%= txtPhoneNo.ClientID %>").css("background-color", "#FFFFFF");
                  $("#<%= txtContactPerson.ClientID %>").css("background-color", "#FFFFFF");
                 
                  

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
                      //                         ddddd
                     
                     

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

              $('INPUT[type="file"]').change(function () {

                  var fileext = this.value.substring(this.value.lastIndexOf('.') + 1);
                  switch (fileext) {
                      case 'jpg':
                      case 'png':
                      case 'bmp':
                      case 'gif':
                      case 'tif':
                          $("#<%= lblImgMsg.ClientID %>").val('');
                          break;
                      default:
                          $("#<%= lblImgMsg.ClientID %>").val('Logo Size should be less then 2 MB');
                          return false;
                  }
                  var a = this.files[0].size / 1024 / 1024;
                  if (a > 2.0) {
                      $("#<%= btnUpload.ClientID %>").attr('disabled', true);
                      $("#<%= btnUpload.ClientID %>").addClass('opacity');
                      $("#<%= lblImgMsg.ClientID %>").val('Logo Size should be less then 2 MB');
                      return false;

                  }
                  else {

                      $("#<%= btnUpload.ClientID %>").attr('disabled', false);
                      $("#<%= btnUpload.ClientID %>").removeClass('opacity');
                      $("#imgerr").val('');
                  }
              });

          }
          function isValidEmailAddress(emailAddress) {
              var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
              return pattern.test(emailAddress);
          };
          </script>
      <div  class ="hiddenDiv">
        <asp:Panel ID="pnlpopup" runat="server"> 
          <script type="text/javascript">
              //Focus On Off Code
              function abc() {
                  var el = $('input[type=text], textarea, input[type=password]');
//                  el.focus(function (e) {
//                      if (e.target.value == e.target.defaultValue)
//                          e.target.value = '';
//                  });
//                  el.blur(function (e) {
//                      if (e.target.value == '')
//                          e.target.value = e.target.defaultValue;
//                  });
              }
              //});
        </script>
          <asp:HiddenField ID="hdnFilename" runat ="server" />
          <!-- Popup Start  -->
          <div id="edit-details-content" onmouseover ="MaskText()">
            <div class="page-heading"> <span>
              <asp:Label ID="lblname" runat ="server"></asp:Label>
              <span class="name-popup">
              <asp:Label ID="lblCompany" runat ="server"></asp:Label>
              </span></span>
              <asp:ImageButton ID="btnclose" runat="server" ImageUrl="~/images/close-button.png" OnClick="btnclose_click" CssClass="right-float" ToolTip ="Close" />
            </div>
            <span class="mandatory">All fields are mandatory</span>
            <asp:Label ID="lblClientId" Visible="false" runat="server" />
            <span id="spanMessage" class="ErrorMsg"></span>
            <asp:Label ID="lblMessage" runat="server" Visible="false" ForeColor="Red"></asp:Label>
            <div class="edit-form">
              <div class="form-raw">
                <div class="field-nm">Client</div>
                <div class="field-val">
                  <asp:TextBox ID="txtName" runat="server" MaxLength="50" CssClass="form-txtfld com-name" placeholder="Name" ClientIDMode="Static"></asp:TextBox>
                  <br />
                  <span id="ClientError" class="ErrorMsg"></span> </div>
              </div>
              <div class="form-raw">
                <div class="field-nm">Address</div>
                <div class="field-val">
                  <asp:TextBox ID="txtAddress" runat="server" CssClass="form-txtfld address" placeholder="Address"></asp:TextBox>
                  <br />
                  <span id="AddressError" class="ErrorMsg"></span> </div>
              </div>
              <div class="form-raw">
                <div class="field-nm">Location</div>
                <div class="field-val">
                  <asp:TextBox ID="txtLocation" runat="server" CssClass="form-txtfld" placeholder="Location"></asp:TextBox>
                  <br />
                  <span id="locationError" class="ErrorMsg"></span> </div>
              </div>
              <div class="form-raw">
                <div class="field-nm">Email Address</div>
                <div class="field-val">
                  <asp:TextBox ID="txtEmail" runat="server" CssClass="form-txtfld email" placeholder ="Email Address"></asp:TextBox>
                  <br />
                  <span id="MaiilError" class="ErrorMsg"></span> </div>
              </div>
              <div class="form-raw">
                <div class="field-nm">Phone #</div>
                <div class="field-val">
                  <asp:TextBox ID="txtPhoneNo" runat="server" CssClass="form-txtfld" value="+1(XXX)XXX-XXXX" placeholder="+1(XXX)XXX-XXXX" onfocus="maskPhone()"></asp:TextBox>
                  <br />
                  <span id="PhoneError" class="ErrorMsg"></span> </div>
              </div>
              <div class="form-raw">
                <div class="field-nm">Contact Person</div>
                <div class="field-val">
                  <asp:TextBox ID="txtContactPerson" runat="server" placeholder="Contact Person" CssClass="form-txtfld com-name"></asp:TextBox>
                  <br />
                  <span id="ContactError" class="ErrorMsg"></span> </div>
              </div>
              <div class="form-raw">
                <div class="field-nm">Active</div>
                <div class="field-val">
                  <asp:RadioButton runat="server" ID = "Active"  Text="Yes" GroupName ="Active" Checked="true" CssClass="radiobox" />
                  <asp:RadioButton runat="server" ID = "Deactive"  Text="No" GroupName ="Active" CssClass="radiobox" />
                </div>
              </div>
              <div class="form-raw" runat="server" id ="divImg" clientidmode="Static" visible="false">
                <div class="field-nm">Image</div>
                <div class="field-val">
                  <asp:TextBox ID="txtImagePath" runat="server" Visible ="false"></asp:TextBox>
                  <asp:FileUpload ID="FileUpload1"  runat="server" Enabled="true" />
                  <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="Upload Image" CssClass ="upload-button" />
                  <br />
                  <asp:Label ID="lblImgMsg" runat="server" Visible="true" ForeColor="Red" CssClass="ErrorMsg"></asp:Label>
                  <span id="imgerr" class="ErrorMsg"></span> </div>
                <div class="clear"></div>
                <div class="form-raw password-hint"  id ="dvUserHint" runat ="server">
                  <div class="field-nm">&nbsp;</div>
                  <div class="field-val"> <span class="info-text blue">Logo Size should not be more then 2 MB</span> </div>
                </div>
                <div class="form-raw">
                  <div class="field-nm">&nbsp;</div>
                  <div class="field-val">
                    <asp:Image ID="Image1" runat="server" AlternateText="LogoNotAvailable"  />
                  </div>
                </div>
              </div>
              <br class="clear" />
              <span class="field-raw"> <span class="btn-block">
                  <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn-add-left white" OnClick="btnUpdate_Click" ValidationGroup="Group1" CausesValidation="true" ToolTip="Update"  />
                  <asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass ="btn-back-right white"  ToolTip="Cancel"/>
              </span> </span> </div>
            <asp:Label ID="lblSuccess" runat="server" ForeColor="Red"></asp:Label>
            <asp:Label ID="Label1" runat="server" Visible="false" ForeColor="Red"></asp:Label>
          </div>
        </asp:Panel>
      </div>
    <%--</ContentTemplate>
    <Triggers>
      <asp:PostBackTrigger ControlID="btnUpload" />
    
    </Triggers>
  </asp:UpdatePanel>--%>
</asp:Content>
