<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="ViewEditClientConfigurations.aspx.cs" Inherits="win.txDesigner.ViewEditClientConfigurations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MasterHead" runat="server">
  <title>Client Configuration</title>
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="MasterContent" runat="server">
 
      <!-- Grid Container starts -->
        <script type="text/javascript">
            $(document).ready(function () {
                var valC = $('.eml').val();
                $('.eml').blur(function () {
                    if ($(this).val() != 0) {
                        var emailText = $(this).val();
                        var pattern = /^[a-zA-Z0-9\-_]+(\.[a-zA-Z0-9\-_]+)*@[a-z0-9]+(\-[a-z0-9]+)*(\.[a-z0-9]+(\-[a-z0-9]+)*)*\.[a-z]{2,4}$/;
                        if (pattern.test(emailText)) {
                            $(this).removeClass('error-textbox');
                            return true;
                        } else {
                            $(this).addClass('error-textbox');
                            //alert('Bad email address: ' + emailText);
                            return false;
                        }
                    }
                    else {
                        return true;
                    }
                });
            });
        </script>

        <h2 class="light-grey">
        <a href="ViewClients.aspx">Clients</a></h2> 

        <span class="client-name light-grey"> <asp:Label ID="lblClientname" runat="server" Text=""></asp:Label>  </span>
      
        
        <br class="clear" /> 
          <asp:Label ID="lblSuccess" runat="server"   Visible="False"></asp:Label>

        <span class="frm-block light-grey">

        <span class="field-raw dark-grey"><strong>Server Information</strong> <span class="info-text blue">View/Update Server Info</span></span>
            <span class="field-raw">
            	<span class="field-text">Outgoing Mail Server</span>
                <span class="field-right-txt">
                    <asp:TextBox ID="txtMailServer" runat="server" MaxLength="50" class="form-txtfld"></asp:TextBox>
                </span>
            </span>
            <span class="field-raw">
            	<span class="field-text">Email Address</span>
                <span class="field-right-txt">
                 <asp:TextBox ID="txtUserMail" runat="server" MaxLength="50" class="form-txtfld"></asp:TextBox>
                </span>
            </span>
            <span class="field-raw">
            	<span class="field-text">Password</span>
                <span class="field-right-txt">
                <asp:TextBox ID="txtUserPwd" runat="server"  MaxLength="50" class="form-txtfld"></asp:TextBox>
                </span>
            </span>
            <span class="field-raw">
            	<span class="field-text">Port</span>
                <span class="field-right-txt">
                 <asp:TextBox ID="txtMailPort" runat="server" MaxLength="50" class="form-txtfld"></asp:TextBox>
                </span>
            </span>

      
          
            <br class="clear" /> 
            <span class="field-raw dark-grey"><strong>User Information</strong> <span class="info-text blue">View/Update User Information</span></span>
        	
            <span class="field-raw">
            	<span class="field-text">Mail To</span>
                <span class="field-right-txt">
                <asp:TextBox ID="txtMailTo" runat="server" MaxLength="255" class="form-txtfld"></asp:TextBox>
                </span>
            </span>
            <span class="field-raw">
            	<span class="field-text">CC</span>
                <span class="field-right-txt">
                <asp:TextBox ID="txtMailCC" runat="server" MaxLength="50" class="form-txtfld"></asp:TextBox>
                </span>
            </span>
            <span class="field-raw">
            	<span class="field-text">BCC</span>
                <span class="field-right-txt">
                <asp:TextBox ID="txtMailBCC" runat="server" MaxLength="50" class="form-txtfld"></asp:TextBox>
                </span>
            </span>
            <span class="field-raw">
            	<span class="field-text">Subject</span>
                <span class="field-right-txt">
                <asp:TextBox ID="txtMailSubject" runat="server" MaxLength="50" CssClass="form-txtfld"></asp:TextBox>
                </span>
            </span>
            <span class="field-raw" style="display:none;">
            	<span class="field-text">Body</span>
                <span class="field-right-txt">
                <textarea id="txtMailBody" cols="40" rows="2" runat="server"  class="form-txtfld" style="display:none;" ></textarea>
                </span>
            </span>
            
            <br class="clear" /> 
            <span class="field-raw dark-grey"><strong>Other Details</strong> <span class="info-text blue">View/Update User other settings</span></span>
        	
            <span class="field-raw">
            	<span class="field-text">Password Expired</span>
                <span class="field-right-txt">
                <asp:TextBox ID="txtPasswordExpiredInDays" runat="server" MaxLength="4" class="form-txtfld" Width="40px"></asp:TextBox><em style="font-size:10px;">&nbsp;(In days)</em>
                </span>
            </span>
        </span>
        
           
        <span class="frm-block2 light-grey">
        	


            <span class="field-raw dark-grey"><strong>Basic Details</strong> <span class="info-text blue">View/Update basic details of Client</span></span>

        
        <span class="field-raw">
            	<span class="field-text">Client</span>
                <span class="field-right-txt">
                    <asp:DropDownList  ID="ddlClientName" runat="server" onselectedindexchanged="ddlClientName_SelectedIndexChanged" AutoPostBack ="true" CssClass ="form-txtfld light-grey"></asp:DropDownList>
                </span>
            </span>
        
        <span class="field-raw">
            	<span class="field-text">Email Address</span>
                <span class="field-right-txt">
                <asp:TextBox ID="txtFromMail" runat="server" MaxLength="50" class="form-txtfld eml"></asp:TextBox>
                </span>
            </span>



            <br class="clear" />
            
            <span class="field-raw dark-grey"><strong>Annotated CRF Settings</strong> <span class="info-text blue">View/Update Annotated CRF Settings</span></span>
            <span class="field-raw">
            	<span class="field-text">Date Format</span>
                <span class="field-right-txt">
                 <asp:TextBox ID="txtDateFormat" runat="server" MaxLength="50" class="form-txtfld"></asp:TextBox>
                </span>
            </span>
            <span class="field-raw">
            	<span class="field-text">Annotated eCRF</span>
                <span class="field-right-txt">
                 <asp:CheckBox ID="chkNormalPDF" runat="server"  CssClass="field-right-txt" />
                </span>
            </span>
            <span class="field-raw">
            	<span class="field-text">Blank eCRF</span>
                <span class="field-right-txt">
                 <asp:CheckBox ID="chkBlankPDF" runat="server"  CssClass="field-right-txt" />
                </span>
            </span>
            <span class="field-raw">
            	<span class="field-text">Edit Check Specs</span>
                <span class="field-right-txt">
                 <asp:CheckBox ID="chkIsEditCheckPDF" runat="server" CssClass="field-right-txt" />
                </span>
            </span>
             <span class="field-raw">
            	<span class="field-text">EDC Dev Specs</span>
                <span class="field-right-txt">
                 <asp:CheckBox ID="chkDevsp" runat="server" CssClass="field-right-txt" />
                </span>
            </span>
            <span class="field-raw">
            	<span class="field-text"> Link On PDF</span>
                <span class="field-right-txt">
                <asp:CheckBox ID="chkLink" runat="server" CssClass="field-right-txt" />
                </span>
            </span>

             <span class="field-raw">
            	<span class="field-text">Font Family</span>
                <span class="field-right-txt">
              <asp:RadioButton runat="server" ID="rbTimesnewRoman" Text="Times New Roman" GroupName="Font" Checked="true" CssClass="radiobox" />
              <asp:RadioButton runat="server" ID="rbCourier" Text="Courier" GroupName="Font" CssClass="radiobox" />
                </span>
            </span>
        </span>
            <br class="clear" /><br class="clear" /><br class="clear" />
            <span class="field-raw">
            <span class="btn-block">

            <asp:Button ID="btnCancel" runat="server" Text="Reset" onclick="btnCancel_Click" CssClass="btn-back white" />
                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Submit"  CssClass="btn-add white" />
             
             </span>
        </span>
         
       
    
    
      <!-- Grid Container ends --> 

<%--**********************************************************************************************************************************************************************--%>
 
  <script type="text/javascript">
      $(document).ready(function () {
          $('input:text').change(function () {
              $(this).css({ 'border': '1px solid #757575', 'color': '#333' });
          });
          $('input:password').change(function () {
              $(this).css({ 'border': '1px solid #757575', 'color': '#333' });
          });
      });
    </script>
 
 </asp:Content>
