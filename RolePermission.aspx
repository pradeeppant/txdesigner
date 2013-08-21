<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master.Master" CodeBehind="RolePermission.aspx.cs"
    Inherits=" win.txDesigner.Role_Permission" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MasterHead" runat="server">
    <title>Role & Permissions</title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MasterContent" runat="server">
    <script type="text/javascript">

        function ShowAlert() {

            var a = $("#<%= txtAddRole.ClientID %>").val();
            if (a == "" || a == "Role Name") {
                $("#<%= txtAddRole.ClientID %>").css("background-color", "#FFDCDC");
                $("#mastermsg").text('Please Provide Role.');
                return false;
                // event.preventDefault();
            }

            var b = $("#<%= ddlUserType.ClientID %>").val();

            if (b == "" || b == "--User Type--") {
                $("#<%= ddlUserType.ClientID %>").css("background-color", "#FFDCDC");
                $("#mastermsg").text('Please select UserType.');
                return false;
                // event.preventDefault();
            }


            var regex2 = "^[A-Za-z0-9 _]*[A-Za-z0-9][A-Za-z0-9 _]*$";

            var UserName = document.getElementById("<%=txtAddRole.ClientID %>").value;
            var matchArray = UserName.match(regex2);
            if (matchArray == null) {
                $("#<%= txtAddRole.ClientID %>").css("background-color", "#FFDCDC");
                $("#mastermsg").text('Please Provide only characters or numbers in Role.');

                document.getElementById("<%=txtAddRole.ClientID %>").focus();
                return false;
            }
        }


        function val(btnCtrl) {

            var gridview = document.getElementById('<%=gvRoles.ClientID%>');
            var selectedRowIndex = btnCtrl.parentNode.parentNode.rowIndex;

            var txt2 = gridview.rows[parseInt(selectedRowIndex)].cells[0].children[0];
            var msg = gridview.rows[parseInt(selectedRowIndex)].cells[0].children[1];


            if (txt2.value == "" || txt2.value == "Role Name") {
                txt2.style.backgroundColor = "#FFDCDC";
                msg.innerHTML = "Please provide Role";
                return false;

            }

            var regex2 = "^[A-Za-z0-9 _]*[A-Za-z0-9][A-Za-z0-9 _]*$";

            var matchArray = txt2.value.match(regex2);

            if (matchArray == null) {

                txt2.style.backgroundColor = "#FFDCDC";
                msg.innerHTML = "Please Provide only characters or numbers in Role.";

                return false;
            }

        }


        //--Function for header checkbox --//
    </script>
    <!-- Header Code End -->
    <!-- Page Content Start -->
    <a class="converter-pdf" target="_blank" href="Default.aspx" title="User Module">
    </a>
   <div>
    <h2>Roles &amp; Permissions</h2>
    <div class="clear"></div>
    <span class="select-options">
        <span class="dark-grey field-left-text"><strong>Client</strong></span>
        <span class="field-right-obj">
            <asp:DropDownList ID="ddlClient" CssClass="light-grey form-txtfld" runat="server" OnSelectedIndexChanged="ddlClient_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
            <br />
            <span class="info-text blue">Select Client to Proceed</span>
            <span id="errorClient" class="ErrorMsg"></span>
        </span>
    </span>
    <div class="clear">
    </div>
    <!-- Grid table starts -->
    <div class="half-grid-left">
        <div class="half-grid-left-heading">
            <h3 class="light-grey">Current Role</h3>
        </div>
        <div class="grid-content">
            <!-- Current Role List Start -->
            <div class="roles-permission">
                <!-- Data Grid Start -->
                <asp:GridView ID="gvRoles" runat="server" AlternatingRowStyle-BackColor="#EFEFEF"
                    BackColor="#FFFFFF" AutoGenerateColumns="False" AllowPaging="true" PageSize="7"
                    OnRowEditing="editrecord" OnRowUpdating="updaterecord" OnRowDeleting="deleterecord"
                    OnRowDataBound="gvRoles_RowDataBound" OnPageIndexChanging="gvRoles_PageIndexChanging"
                    OnRowCancelingEdit="cancelrecord" BorderWidth="1" HeaderStyle-BorderColor="Transparent"
                    PagerStyle-CssClass="paging" Width="100%" ShowHeader="false" CssClass="gridTbl">
                    <Columns>
                        <asp:TemplateField HeaderStyle-Width="75px" ShowHeader="false" HeaderStyle-BorderStyle="None"
                            HeaderStyle-BorderWidth="0" HeaderStyle-BorderColor="Transparent" FooterStyle-BorderColor="Transparent"
                            FooterStyle-BorderWidth="0">
                            <ItemTemplate>
                                <asp:RadioButton ID="rbName" runat="server" GroupName="Roles" AutoPostBack="true"
                                    OnCheckedChanged="rbName_CheckedChanged" Text=' <%#Eval("Name") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtRoleNameEdit" runat="server" Text=' <%#Eval("Name") %>' ValidationGroup="gvRoles"
                                    CausesValidation="true" CssClass="form-txtfld"></asp:TextBox>
                                <span id="editmsg" class="ErrorMsg"></span>
                                <asp:ValidationSummary ID="ValidationSummary2" runat="server" DisplayMode="SingleParagraph"
                                    ShowMessageBox="false" ShowSummary="true" ForeColor="Red" ValidationGroup="gvRoles" />
                                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtRoleNameEdit"
                                    BackColor="#ff8888" ErrorMessage="Please provide Role" Display="None" ValidationGroup="gvRoles" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderStyle-Width="75px" ShowHeader="false" HeaderStyle-BorderStyle="None"
                            HeaderStyle-BorderWidth="0" HeaderStyle-BorderColor="Transparent" FooterStyle-BorderColor="Transparent"
                            FooterStyle-BorderWidth="0">
                            <ItemTemplate>
                                <asp:Label ID="lblUserType" runat="server" Text=' <%#Eval("UserTypeName") %>' ></asp:Label>
                                
                            </ItemTemplate>
                            <EditItemTemplate>                           
                           
                        <%--    <asp:DropDownList ID="ddlUserTypeGrid" runat="server" Enabled="false" CssClass="form-txtfld" ValidationGroup="gvRoles"
                                    CausesValidation="true" style="width:100px; margin-left:10px;">
                            </asp:DropDownList>--%>

                             <asp:Label ID="lblUserTypeEdtt" runat="server" Text=' <%#Eval("UserTypeName") %>' ></asp:Label>
                                
                                <span id="errValddlUser" class="ErrorMsg"></span>
                                <asp:ValidationSummary ID="ValDDLUSer" runat="server" DisplayMode="SingleParagraph"
                                    ShowMessageBox="false" ShowSummary="true" ForeColor="Red" ValidationGroup="gvRoles" />
                               <%-- <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="ddlUserTypeGrid"
                                    BackColor="#ff8888" ErrorMessage="Please provide UserType" Display="None" ValidationGroup="gvRoles" />--%>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Current List" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblRoleName" runat="server" Text=' <%#Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="RoleId" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblRoleId" runat="server" Text=' <%#Eval("RoleId") %>' Visible="false"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField Visible="true" ItemStyle-Width="35px" HeaderStyle-Width="25px"
                            ShowHeader="false" HeaderStyle-BorderWidth="0" HeaderStyle-BorderColor="Transparent"
                            FooterStyle-BorderColor="Transparent" FooterStyle-BorderWidth="0">
                            <ItemTemplate>
                                <asp:ImageButton ID="edit" runat="server" CommandName="Edit" ImageUrl="~/images/edit.gif"
                                    Visible="false" ToolTip="Edit" />
                                &nbsp;&nbsp;
                                <asp:ImageButton ID="delete" runat="server" CommandName="Delete" ImageUrl="~/images/delete.png"
                                    Visible="false" ToolTip="Deactivate" OnClientClick="return confirm('Do you want to Deactivate Role?');" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton ID="btnUpdate" runat="server" OnClientClick='javascript:return val(this);'
                                    CausesValidation="true" ToolTip="Update" CommandName="Update" ImageUrl="~/images/right-icon.png" />
                                &nbsp;
                                <asp:ImageButton ID="cancel" runat="server" CommandName="Cancel" ImageUrl="~/images/cancel.png"
                                    ToolTip="Cancel" Width="12" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle HorizontalAlign="Right" />
                </asp:GridView>
                <!-- Data Grid End -->
                <asp:Label ID="lblMessage" runat="server" Visible="true"></asp:Label>
                <br class="clear" />
                <br class="clear" />
                <span class="select-options">
                    <span class="dark-grey field-left-fld">
                        <asp:CheckBox ID="ChkAddRole" runat="server" OnCheckedChanged="ChkAddRole_CheckedChange" AutoPostBack="true" Text=" " />
                    </span>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            //Focus On Off Code	
                            var el = $('input[type=text], textarea, input[type=password]');
//                            el.focus(function (e) {
//                                if (e.target.value == e.target.defaultValue)
//                                    e.target.value = '';
//                            });
//                            el.blur(function (e) {
//                                if (e.target.value == '')
//                                    e.target.value = e.target.defaultValue;
//                            });
                        });
                    </script>
                    <span class="field-right-obj">
                        <asp:TextBox ID="txtAddRole" runat="server" Enabled="false" placeholder="Role Name" class="form-txtfld"></asp:TextBox></span>
                       <asp:DropDownList ID="ddlUserType" runat="server" Enabled="false" CssClass="form-txtfld" style="width:100px; margin-left:10px;">
                            </asp:DropDownList>

                     
                    <div class="clear"></div>
                    <span class="info-text blue">Check to Add Role</span> </span>
                  <asp:Button ID="btnAddRole" ToolTip="Add" runat="server" Text="Add Role" CommandName="Add Role" Enabled="false" OnClick="btnAddRole_Click" CssClass="btn-add white" ClientIDMode="Static"
                        OnClientClick="return ShowAlert();" />
                <asp:HiddenField ID="hdnRoleId" runat="server" />
            </div>
            <!-- Current Role List End -->
        </div>
    </div>
    <div class="half-grid-right">
        <div class="half-grid-left-heading">
            <h3 class="light-grey">Assigned Permissions</h3>
        </div>
        <div class="grid-content">
            <!-- Data Grid Start -->
            <div id="scroll1" runat="server" style="width: 100%; height: 253px; overflow-y: scroll; opacity: 0.8;">
                <asp:GridView ID="gvRolesPermssn" runat="server" Width="100%" AutoGenerateColumns="False"
                    AlternatingRowStyle-BackColor="#EFEFEF" BackColor="#FFFFFF" OnPageIndexChanging="gvRolesPermssn_PageIndexChanging"
                    OnRowDataBound="gvRolesPermssn_RowDataBound" AllowPaging="false" PageSize="7"
                    CssClass="gridTbl">
                    <Columns>
                        <asp:TemplateField HeaderText="Full List">
                            <HeaderTemplate>
                                <asp:CheckBox runat="server" ID="chkheader" Text="Select All" AutoPostBack="true"
                                    OnCheckedChanged="chkSelectAll_CheckedChanged" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="process_flag" runat="server" Checked='<%# bool.Parse(Eval("Value").ToString()) %>'
                                    Enable='<%# !bool.Parse(Eval("Value").ToString()) %>' Text=' <%#Eval("Description") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Permission Name" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblPermissionName" runat="server" Text='<%#Eval("Description") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PermissionId" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblPermissionId" runat="server" Text='<%#Eval("PermissionId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle HorizontalAlign="Right" />
                </asp:GridView>
            </div>
            <div id="scroll2" runat="server" style="width: 100%; height: 245Px; overflow: hidden;"
                class="opacity">
                <div id="permissions" runat="server" visible="false">
                    <asp:GridView ID="gvpermissions" runat="server" Width="100%" AutoGenerateColumns="False"
                        AlternatingRowStyle-BackColor="#EFEFEF" BackColor="#FFFFFF" OnPageIndexChanging="gvRolesPermssn_PageIndexChanging"
                        OnRowDataBound="gvRolesPermssn_RowDataBound" AllowPaging="false" PageSize="7"
                        CssClass="gridTbl">
                        <Columns>
                            <asp:TemplateField HeaderText="Full List">
                                <HeaderTemplate>
                                    <asp:CheckBox runat="server" ID="chkheader" Text="Select All" AutoPostBack="true" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="process_flag" runat="server" Text=' <%#Eval("Description") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Permission Name" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblPermissionName" runat="server" Text='<%#Eval("Description") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PermissionId" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblPermissionId" runat="server" Text='<%#Eval("PermissionId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle HorizontalAlign="Right" />
                    </asp:GridView>
                </div>
            </div>
            <br class="clear" />
            <asp:Label ID="lblSuccess" runat="server" Visible="true"></asp:Label>
            <br class="clear" />
            <span class="select-options"><span class="info-text blue">Assign Permissions to Selected Role</span>
                <span id="btnPermission" runat="server">
                    <asp:Button ID="btnUpdate" runat="server" Text="Assign" Enabled="true" Visible="false" ToolTip="Assign Permissions" OnClick="btnUpdate_Click" CssClass="btn-add white" />
                </span>
            </span>
            <!-- Data Grid End -->
        </div>
       <div id ="SearchResults" runat ="server"></div>
        </div>
        </div>
        <!-- Message Code End -->
</asp:Content>
