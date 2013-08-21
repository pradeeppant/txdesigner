<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true"
    CodeBehind="ViewUsers.aspx.cs" Inherits="win.txDesigner.ViewUsers" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MasterHead" runat="server">
    <title>txDESIGNER - User List</title>
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="MasterContent" runat="server">
    <asp:ScriptManager ID="ScriptManager2" runat="server">
    </asp:ScriptManager>
    <script type ="text/javascript" >
        $(document).ready(function () {
       
    );
    </script>
    <h2>Users</h2>
    <div class="clear">
    </div>
    <span class="select-options"><span class="dark-grey field-left-text"><strong>Client</strong></span>
        <span class="field-right-obj">
            <asp:DropDownList ID="ddlClientName" runat="server" CssClass="light-grey form-txtfld" OnSelectedIndexChanged="ddlClientName_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
            <br class="clear" />
            <span class="info-text blue">Select Client to view User List</span> </span>
    </span>
    <div class="clear">
    </div>
    <!-- Grid table starts -->
    <asp:Label ID="lblMessage" runat="server" Visible="false" ForeColor="Red"></asp:Label>
    <asp:GridView ID="gvUserList" runat="server" AutoGenerateColumns="False" Width="100%"
        border="0" CellSpacing="0" CellPadding="0" bgcolor="#FFFFFF" AllowPaging="true"
        PageSize="7" OnPageIndexChanging="gvUserList_PageIndexChanging" PagerStyle-CssClass="paging"
        AllowSorting="true" OnSorting="gvUserList_Sorting" CssClass="gridTbl" OnRowDataBound = "gvUserList_OnRowDataBound">
        <AlternatingRowStyle CssClass="grey" />
        <Columns>
            <asp:TemplateField HeaderText="User ID" Visible="false">
                <ItemTemplate>
                    <asp:Label ID="lblUId" runat="server" Text=' <%#Eval("UserId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="User ID" SortExpression="UserName">
                <ItemTemplate>
                    <asp:LinkButton ID="btnEdit" CssClass="popup-open" CommandArgument="Edit" runat="server"
                        Text='<%#Eval("UserName") %>' OnClick="btnEdit_Click" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" SortExpression="FirstName">
                <ItemTemplate>
                    <%#Eval("FirstName")%>
                    <%#Eval("LastName")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Type" SortExpression="UserTypeName">
                <ItemTemplate>
                    <%#Eval("UserTypeName")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Role" SortExpression="UserRole">
                <ItemTemplate>
                    <%#Eval("UserRole")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone #" HeaderStyle-Width="14%" SortExpression="Phone">
                <ItemTemplate>
                    <%#Eval("Phone")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email Address" SortExpression="Email">
                <ItemTemplate>
                    <a href='mailto:<%#Eval("Email") %>'>
                        <%#Eval("Email")%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status" SortExpression="Active">
                <ItemTemplate>
                    <%#Eval("Status")%>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle CssClass="paging" HorizontalAlign="Right" />
    </asp:GridView>
    <!-- Grid table ends -->
    <!-- Page Content Start -->
    <br class="clear" />
    <div id="SearchResults" runat="server">
        <asp:Button ID="btnAddUser" runat="server" Text="Add User" CommandArgument="Add" OnClick="btnAddUser_Click"
            ToolTip="Add User" CssClass="btn-add white" />
    </div>
    <!-- Data Grid End -->
    <asp:Button ID="btnShowPopup" runat="server" Style="display: none" />
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowPopup"
        PopupControlID="pnlpopup" CancelControlID="btnCancel" BackgroundCssClass="overlay">
        <Animations>
      <OnShown>
        <FadeIn Duration="0.5" Fps="50" />
      </OnShown>
        </Animations>
    </ajaxToolkit:ModalPopupExtender>
    <div class="hiddenDiv">
        <asp:Panel ID="pnlpopup" runat="server"  onmouseover ="abc();">
    <%--    
           <script type="text/javascript">
               //Focus On Off Code
               function abc() {
                   var el = $('input[type=text], textarea, input[type=password]');
                   el.focus(function (e) {
                       if (e.target.value == e.target.defaultValue)
                           e.target.value = '';
                   });
                   el.blur(function (e) {
                       if (e.target.value == '')
                           e.target.value = e.target.defaultValue;
                   });
               }
            </script>--%>
            
            <!-- Popup Start  -->
            <div id="edit-details-content" onmouseover="MaskText();">
                <div class="page-heading">
                    <span>
                        <asp:Label ID="lblname" runat="server"></asp:Label>
                        <span class="name-popup">
                            <asp:Label ID="lblCompany" runat="server"></asp:Label>
                        </span></span>
                    <asp:ImageButton ID="btnclose" runat="server" ImageUrl="~/images/close-button.png" Width="24px" OnClick="btnclose_click" CssClass="right" ToolTip="Close" />
                </div>
                <asp:Label ID="lblSuccess" runat="server" ForeColor="Red"></asp:Label>
                <span id="spanMessage" class="ErrorMsg"></span>
                <asp:Label ID="lblUserId" Visible="false" runat="server" />
                <span class="mandatory">All fields are mandatory</span>
                <div class="edit-form">
                    <div class="form-raw">
                        <div class="field-nm">
                            Client</div>
                        <div class="field-val">
                            <asp:DropDownList ID="ddlClient1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlClient1_SelectedIndexChanged" CssClass="form-txtfld country-state">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-raw">
                        <div class="field-nm">User ID 
                       <%-- <span class="red">*</span>--%>
                      </div>
                        <div class="field-val">
                            <asp:TextBox ID="txtUserName" CssClass="form-txtfld" runat="server" MaxLength="20" Enabled="false" placeholder="Username"></asp:TextBox>
                            <br />
                            <span id="uerror" class="ErrorMsg"></span>
                        </div>
                    </div>
                    <div class="form-raw password-hint" id="dvUserHint" runat="server">
                        <div class="field-nm">
                            &nbsp;</div>
                        <div class="field-val">
                            <span class="info-text blue">Please type a User ID. (4-20 Character)</span>
                        </div>
                    </div>
                   
                   <%-- <asp:Panel ID="pnlPassword" runat="server">
                        <div class="form-raw two-col">
                            <div class="field-nm">
                                Password</div>
                            <div class="field-val">
                                <asp:TextBox ID="txtPassword" CssClass="form-txtfld" runat="server" MaxLength="12" TextMode="Password" placeholder="Password"></asp:TextBox>
                                <br />
                                <span id="Passworderror" class="ErrorMsg"></span>
                            </div>
                        </div>
                        <div class="form-raw two-col">
                            <div class="field-val">
                                <asp:TextBox ID="txtConfirmPassword" CssClass="form-txtfld" runat="server" MaxLength="12" TextMode="Password"  placeholder="Confirm password"></asp:TextBox>
                                <br />
                                <span id="ConfirmError" class="ErrorMsg"></span>
                            </div>
                        </div>
                    </asp:Panel>

                    <div class="clear">
                    </div>
                    <div class="form-raw password-hint" id="SpanPassword" runat="server">
                        <div class="field-nm">
                            &nbsp;</div>
                        <div class="field-val">
                            <span class="info-text  blue">Must have (4-12) characters; case sensitive</span>
                        </div>
                    </div>--%>
                    <div class="form-raw two-col">
                        <div class="field-nm">Name</div>
                        <div class="field-val">
                            <asp:TextBox ID="txtFirstName" CssClass="form-txtfld" runat="server" MaxLength="50"
                                placeholder="First Name"></asp:TextBox>
                            <br />
                            <span id="nameerror" class="ErrorMsg"></span>
                        </div>
                    </div>
                    <div class="form-raw two-col">
                        <div class="field-val">
                            <asp:TextBox ID="txtLastName" CssClass="form-txtfld" runat="server" MaxLength="50"
                                placeholder="Last Name"></asp:TextBox>
                            <br />
                            <span id="LnameError" class="ErrorMsg"></span>
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                    <div class="form-raw">
                        <div class="field-nm">
                            Title</div>
                        <div class="field-val">
                            <asp:TextBox ID="txtDesignation" CssClass="form-txtfld email" runat="server" placeholder="User Designation"></asp:TextBox>
                            <br />
                            <span id="SpanDesignation" class="ErrorMsg"></span>
                        </div>
                    </div>
                    <div class="clear">
                    </div>   
                     <div class="form-raw two-col">
                        <div class="field-nm">
                           Role</div>
                        <div class="field-val">
                             <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-txtfld country-state">
                            </asp:DropDownList>
                            <br />
                            <span id="RoleError" class="ErrorMsg"></span>
                        </div>
                    </div>
                                     
                   
                    <div class="clear">
                    </div>
                    <div class="form-raw two-col">
                        <div class="field-nm">
                            Phone #</div>
                        <div class="field-val">
                            <asp:TextBox ID="txtPhone" CssClass="form-txtfld" runat="server" MaxLength="15"
                                placeholder="+1(XXX)XXX-XXXX" onfocus="maskPhone()"></asp:TextBox>
                            <br />
                            <span id="PhoneError" class="ErrorMsg"></span>
                        </div>
                    </div>
                    <div class="form-raw two-col" style="display:none;">
                        <div class="field-nm small">
                            extn:</div>
                        <div class="field-val">
                            <asp:TextBox ID="txtPhoneExtn" CssClass="form-txtfld title" runat="server" MaxLength="4" placeholder ="Ext"></asp:TextBox>
                        </div>
                    </div>
                    <div class="clear">
                    </div>
                    <div class="form-raw">
                        <div class="field-nm">
                            Email Address</div>
                        <div class="field-val">
                            <asp:TextBox ID="txtEmail" CssClass="form-txtfld email" runat="server" placeholder="Email Address"></asp:TextBox>
                            <br />
                            <span id="EmailError" class="ErrorMsg"></span>
                        </div>
                    </div>
                    <div class="form-raw">
                        <div class="field-nm">
                            Active</div>
                        <div class="field-val">
                            <asp:RadioButton runat="server" ID="Active" Text="Yes" GroupName="Active" Checked="true"
                                CssClass="radiobox" />
                            <asp:RadioButton runat="server" ID="Deactive" Text="No" GroupName="Active" CssClass="radiobox" />
                        </div>
                    </div>
                    <br class="clear" />
                    <span class="field-raw"><span class="btn-block">
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn-add-left white" />
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" ToolTip="Update" CssClass="btn-add-left white" />
                        <asp:Button ID="btncancel" runat="server" Text="Cancel" ToolTip="Cancel" CssClass="btn-back-right white" />
                    </span></span>
                </div>
            </div>
            <!-- Popup Start -->
            <script type="text/javascript">
               
                function MaskText() {

                    $(document).ready(function () {

                        //Focus On Off Code	
                        var el = $('input[type=text], textarea, input[type=password]');
                        el.focus(function (e) {
                            if (e.target.value == e.target.defaultValue)
                                e.target.value = '';
                        });
                        el.blur(function (e) {
                            if (e.target.value == '')
                                e.target.value = e.target.defaultValue;
                        });

                        $('input:text').change(function () {
                            $(this).css({ 'border': '1px solid #757575', 'color': '#333' });
                        });
                        $('select').change(function () {
                            $(this).css({ 'border': '1px solid #757575', 'color': '#333' });
                        });
                        $('input:password').change(function () {
                            $(this).css({ 'border': '1px solid #757575', 'color': '#333' });
                        });

                        $("#<%= txtPhoneExtn.ClientID %>").keydown(function (event) {

                            if (event.keyCode == 9 || event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 39 || event.keyCode == 37 || (event.keyCode >= 48 && event.keyCode <= 57)) {
                                // let it happen, don't do anything
                            }
                            else {
                                // Ensure that it is a number and stop the key press
                                event.preventDefault();
                            }
                        });


                        $("#<%= txtUserName.ClientID %>").keydown(function (event) {
                            if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 65 && event.keyCode <= 90) || event.keyCode == 8 || event.keyCode == 9) {

                            }
                            else {
                                event.preventDefault();
                            }

                        });


                        $("#<%= txtUserName.ClientID %>").change(function (e) {

                            $("#<%= txtUserName.ClientID %>").css("background-color", "#FFFFFF");
                            $("#uerror").text('');
                        });

                        $("#<%= txtFirstName.ClientID %>").change(function (e) {

                            $("#<%= txtFirstName.ClientID %>").css("background-color", "#FFFFFF");
                            $("#nameerror").text('');
                        });

                        $("#<%= txtLastName.ClientID %>").change(function (e) {

                            $("#<%= txtLastName.ClientID %>").css("background-color", "#FFFFFF");
                            $("#LnameError").text('');
                        });
                        
                        $("#<%= ddlRole.ClientID %>").change(function (e) {

                            $("#<%= ddlRole.ClientID %>").css("background-color", "#FFFFFF");
                            $("#RoleError").text('');
                        });

                        $("#<%= txtPhone.ClientID %>").change(function (e) {

                            $("#<%= txtPhone.ClientID %>").css("background-color", "#FFFFFF");
                            $("#PhoneError").text('');
                        });

                        $("#<%= txtEmail.ClientID %>").change(function (e) {

                            $("#<%= txtEmail.ClientID %>").css("background-color", "#FFFFFF");
                            $("#EmailError").text('');
                        });


                        $("#<%= txtDesignation.ClientID %>").change(function (e) {

                            $("#<%= txtDesignation.ClientID %>").css("background-color", "#FFFFFF");
                            $("#SpanDesignation").text('');
                        });

                        // Click Events
                        $("#<%= btnSave.ClientID %>").click(function (e) {
                            // action goes here!!
                            var a = $("#<%= txtUserName.ClientID %>").val();
                            // alert(a);
                            if (a.trim() == "" || a == "Username") {
                                $("#<%= txtUserName.ClientID %>").css("background-color", "#FFDCDC");
                                $("#uerror").text('User ID cannot be empty ');
                               // $("#Passworderror").text('');
                                $("#ConfirmError").text('');
                                $("#nameerror").text('');
                                $("#LnameError").text('');
                                $("#SpanDesignation").text('');
                                $("#TypeError").text('');
                                $("#RoleError").text('');
                                $("#PhoneError").text('');
                                $("#EmailError").text('');

                              
                                $("#<%= txtFirstName.ClientID %>").css("background-color", "#FFFFFF");
                                $("#<%= txtLastName.ClientID %>").css("background-color", "#FFFFFF");
                                $("#<%= txtDesignation.ClientID %>").css("background-color", "#FFFFFF");
                               
                                $("#<%= ddlRole.ClientID %>").css("background-color", "#FFFFFF");
                                $("#<%= txtPhone.ClientID %>").css("background-color", "#FFFFFF");
                                $("#<%= txtEmail.ClientID %>").css("background-color", "#FFFFFF");
                                return false;
                                event.preventDefault();
                            }

                            if (a.trim().length < 4 && a.length <= 20) {
                                $("#<%= txtUserName.ClientID %>").css("background-color", "#FFDCDC");
                                $("#uerror").text('User ID must have at least 4 - 20 characters.');
                               // $("#Passworderror").text('');
                                $("#ConfirmError").text('');
                                $("#nameerror").text('');
                                $("#LnameError").text('');
                                $("#SpanDesignation").text('');
                                $("#TypeError").text('');
                                $("#RoleError").text('');
                                $("#PhoneError").text('');
                                $("#EmailError").text('');
                              
                                $("#<%= txtFirstName.ClientID %>").css("background-color", "#FFFFFF");
                                $("#<%= txtLastName.ClientID %>").css("background-color", "#FFFFFF");
                                $("#<%= txtDesignation.ClientID %>").css("background-color", "#FFFFFF");
                               
                                $("#<%= ddlRole.ClientID %>").css("background-color", "#FFFFFF");
                                $("#<%= txtPhone.ClientID %>").css("background-color", "#FFFFFF");
                                $("#<%= txtEmail.ClientID %>").css("background-color", "#FFFFFF");
                                return false;
                                event.preventDefault();

                            }
                           

                            a = $("#<%= txtFirstName.ClientID %>").val();
                            //alert(a);
                            if (a.trim() == "" || a == "First Name") {
                                $("#<%= txtFirstName.ClientID %>").css("background-color", "#FFDCDC");
                                $("#nameerror").text('First name is required');
                                $("#LnameError").text('');
                                $("#SpanDesignation").text('');
                                $("#TypeError").text('');
                                $("#RoleError").text('');
                                $("#PhoneError").text('');
                                $("#EmailError").text('');
                                $("#SpanDesignation").text('');
                                $("#<%= txtLastName.ClientID %>").css("background-color", "#FFFFFF");
                                $("#<%= txtDesignation.ClientID %>").css("background-color", "#FFFFFF");
                               
                                $("#<%= ddlRole.ClientID %>").css("background-color", "#FFFFFF");
                                $("#<%= txtPhone.ClientID %>").css("background-color", "#FFFFFF");
                                $("#<%= txtEmail.ClientID %>").css("background-color", "#FFFFFF");
                                return false;
                                event.preventDefault();
                            }

                            a = $("#<%= txtLastName.ClientID %>").val();
                            // alert(a);
                            if (a.trim() == "" || a == "Last Name") {
                                $("#<%= txtLastName.ClientID %>").css("background-color", "#FFDCDC");
                                $("#LnameError").text('Last name is required');
                                $("#TypeError").text('');
                                $("#RoleError").text('');
                                $("#PhoneError").text('');
                                $("#EmailError").text('');
                                $("#SpanDesignation").text('');
                                $("#<%= txtDesignation.ClientID %>").css("background-color", "#FFFFFF");
                               
                                $("#<%= ddlRole.ClientID %>").css("background-color", "#FFFFFF");
                                $("#<%= txtPhone.ClientID %>").css("background-color", "#FFFFFF");
                                $("#<%= txtEmail.ClientID %>").css("background-color", "#FFFFFF");
                                return false;
                                event.preventDefault();
                            }

                            a = $("#<%= txtDesignation.ClientID %>").val();
                            // alert(a);
                            if (a.trim() == "" || a == "Last Name") {
                                $("#<%= txtDesignation.ClientID %>").css("background-color", "#FFDCDC");
                                $("#SpanDesignation").text('User Designation cannot be empty');
                                $("#TypeError").text('');
                                $("#RoleError").text('');
                                $("#PhoneError").text('');
                                $("#EmailError").text('');
                               
                                $("#<%= ddlRole.ClientID %>").css("background-color", "#FFFFFF");
                                $("#<%= txtPhone.ClientID %>").css("background-color", "#FFFFFF");
                                $("#<%= txtEmail.ClientID %>").css("background-color", "#FFFFFF");
                                return false;
                                event.preventDefault();
                            }


                          
                            a = $("#<%= ddlRole.ClientID %>").val();
                            // alert(a);
                            if (a == "" || a == "--Select--") {
                                $("#<%= ddlRole.ClientID %>").css("background-color", "#FFDCDC");
                                $("#RoleError").text('Select Role');
                                $("#PhoneError").text('');
                                $("#EmailError").text('');
                                $("#<%= txtPhone.ClientID %>").css("background-color", "#FFFFFF");
                                $("#<%= txtEmail.ClientID %>").css("background-color", "#FFFFFF");
                                return false;
                                event.preventDefault();
                            }

                            a = $("#<%= txtPhone.ClientID %>").val();

                            if (a == "" || a == "+1(XXX)XXX-XXXX") {
                                $("#<%= txtPhone.ClientID %>").css("background-color", "#FFDCDC");
                                $("#<%= txtEmail.ClientID %>").css("background-color", "#FFFFFF");
                                $("#PhoneError").text('Phone # cannot be empty');
                                $("#EmailError").text('');
                                return false;
                                event.preventDefault();

                            }

                            a = $("#<%= txtEmail.ClientID %>").val();
                            if (a.trim() == "" || a == 'Email Address') {

                                $("#<%= txtEmail.ClientID %>").css("background-color", "#FFDCDC");
                                $("#<%= txtPhone.ClientID %>").css("background-color", "#FFFFFF");
                                $("#PhoneError").text('');
                                $("#EmailError").text('Email address cannot be empty');
                                return false;
                                event.preventDefault();

                            }
                            a = $("#<%= txtEmail.ClientID %>").val();
                            if (!isValidEmailAddress(a)) { /* do stuff here */

                                $("#<%= txtEmail.ClientID %>").css("background-color", "#FFDCDC");
                                $("#EmailError").text('Please provide valid email address');
                                $("#<%= txtPhone.ClientID %>").css("background-color", "#FFFFFF");
                                $("#PhoneError").text('');
                                return false;
                                event.preventDefault();



                            }
                        });
                        $("#<%= btnUpdate.ClientID %>").click(function (e) {
                            var a = $("#<%= txtUserName.ClientID %>").val();
                            // alert(a);
                            if (a.trim() == "" || a == "Username") {
                                $("#<%= txtUserName.ClientID %>").css("background-color", "#FFDCDC");
                                $("#uerror").text('User ID cannot be empty ');
                                $("#nameerror").text('');
                                $("#LnameError").text('');
                                $("#TypeError").text('');
                                $("#RoleError").text('');
                                $("#PhoneError").text('');
                                $("#EmailError").text('');

                                $("#<%= txtFirstName.ClientID %>").css("background-color", "#FFFFFF");
                                $("#<%= txtLastName.ClientID %>").css("background-color", "#FFFFFF");
                               
                                $("#<%= ddlRole.ClientID %>").css("background-color", "#FFFFFF");
                                $("#<%= txtPhone.ClientID %>").css("background-color", "#FFFFFF");
                                $("#<%= txtEmail.ClientID %>").css("background-color", "#FFFFFF");
                                return false;
                                event.preventDefault();
                            }

                            a = $("#<%= txtFirstName.ClientID %>").val();
                            //alert(a);
                            if (a.trim() == "" || a == "First Name") {
                                $("#<%= txtFirstName.ClientID %>").css("background-color", "#FFDCDC");
                                $("#nameerror").text('First name cannot be empty');
                                $("#LnameError").text('');
                                $("#TypeError").text('');
                                $("#RoleError").text('');
                                $("#PhoneError").text('');
                                $("#EmailError").text('');


                                $("#<%= txtLastName.ClientID %>").css("background-color", "#FFFFFF");
                               //
                                $("#<%= ddlRole.ClientID %>").css("background-color", "#FFFFFF");
                                $("#<%= txtPhone.ClientID %>").css("background-color", "#FFFFFF");
                                $("#<%= txtEmail.ClientID %>").css("background-color", "#FFFFFF");
                                return false;
                                event.preventDefault();
                            }

                            a = $("#<%= txtLastName.ClientID %>").val();
                            // alert(a);
                            if (a.trim() == "" || a == "Last Name") {
                                $("#<%= txtLastName.ClientID %>").css("background-color", "#FFDCDC");
                                $("#LnameError").text('Last name cannot be empty');
                                $("#TypeError").text('');
                                $("#RoleError").text('');
                                $("#PhoneError").text('');
                                $("#EmailError").text('');
                               
                                $("#<%= ddlRole.ClientID %>").css("background-color", "#FFFFFF");
                                $("#<%= txtPhone.ClientID %>").css("background-color", "#FFFFFF");
                                $("#<%= txtEmail.ClientID %>").css("background-color", "#FFFFFF");
                                return false;
                                event.preventDefault();
                            }
                             
                            a = $("#<%= ddlRole.ClientID %>").val();
                            // alert(a);
                            if (a == "" || a == "--Select--") {
                                $("#<%= ddlRole.ClientID %>").css("background-color", "#FFDCDC");
                                $("#RoleError").text('Select Role');
                                $("#PhoneError").text('');
                                $("#EmailError").text('');
                                $("#<%= txtPhone.ClientID %>").css("background-color", "#FFFFFF");
                                $("#<%= txtEmail.ClientID %>").css("background-color", "#FFFFFF");
                                return false;
                                event.preventDefault();
                            }

                            a = $("#<%= txtPhone.ClientID %>").val();
                            if (a == "" || a == "+1(XXX)XXX-XXXX") {

                                $("#<%= txtPhone.ClientID %>").css("background-color", "#FFDCDC");
                                $("#PhoneError").text('Phone # cannot be empty');
                                $("#EmailError").text('');
                                $("#<%= txtEmail.ClientID %>").css("background-color", "#FFFFFF");
                                return false;
                                event.preventDefault();

                            }

                            a = $("#<%= txtEmail.ClientID %>").val();
                            if (a.trim() == "" || a == 'Email Address') {

                                $("#<%= txtEmail.ClientID %>").css("background-color", "#FFDCDC");
                                $("#EmailError").text('Email address cannot be empty');
                                $("#<%= txtPhone.ClientID %>").css("background-color", "#FFFFFF");
                                $("#PhoneError").text('');
                                return false;
                                event.preventDefault();

                            }
                            a = $("#<%= txtEmail.ClientID %>").val();
                            if (!isValidEmailAddress(a)) { /* do stuff here */

                                $("#<%= txtEmail.ClientID %>").css("background-color", "#FFDCDC");
                                $("#EmailError").text('Please provide valid email address');
                                $("#<%= txtPhone.ClientID %>").css("background-color", "#FFFFFF");
                                $("#PhoneError").text('');
                                return false;
                                event.preventDefault();
                            }
                        });

                        function isValidEmailAddress(emailAddress) {
                            var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
                            return pattern.test(emailAddress);
                        };

                    });
                    // alert("HII");


                    $("#<%= txtPhone.ClientID %>").mask("+1(999)999-9999");


                }
                $(document).ready(function () {

                    $("#<%= btnAddUser.ClientID %>").click(function (e) {
                        var a = $("#<%= ddlClientName.ClientID %>").val();
                        // alert(a);
                        // alert(a);
                        if (a == "" || a == 0) {
                            $("#<%= ddlClientName.ClientID %>").css("background-color", "#FFDCDC");
                            $("#mastermsg").text('Please Select Client.');
                            return false;
                            event.preventDefault();
                        }

                    });
                    $("#<%= ddlClientName.ClientID %>").focus(function (e) {

                        $("#<%= ddlClientName.ClientID %>").css("background-color", "#FFFFFF");
                        $("#mastermsg").text('');
                    });
                });

            </script>
        </asp:Panel>
    </div>
    <!-- Page Content End -->
</asp:Content>
