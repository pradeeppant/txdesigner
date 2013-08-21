<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateUser.aspx.cs" MasterPageFile="~/Master.Master"
    Inherits="win.txDesigner.UpdateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MasterHead" runat="server">
    <script src="Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery-1.9.1-vsdoc.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="MasterContent" runat="server">
    <script language="javascript" type="text/javascript">

    </script>
    <div style="width: 600px; margin-left: 25px; margin-top: 5px; text-align: left">
        <br />
        <span id="spanMessage" class="ErrorMsg"></span>
        <asp:Label ID="lblMessage" runat="server" SkinID="ErrMsg"></asp:Label>
        <table width="500px">
            <tr>
                <td>
                    <asp:Label ID="lblClient" runat="server" Text="Client :"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlClient" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td width="100px">
                    <asp:Label ID="lblUserId" Visible="false" runat="server" />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblUserName" runat="server" Text="User Name : "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server" MaxLength="50" Enabled="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblFirstName" runat="server" Text="First Name :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server" EnableViewState="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblLastName" runat="server" Text="Last Name :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server" EnableViewState="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblUserType" runat="server" Text="User Type :"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlUserType" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblRole" runat="server" Text="Role :"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlRole" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPhone" runat="server" Text="Phone :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPhoneNo" runat="server" EnableViewState="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPhoneExtn" runat="server" Text="Phone Extn : "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPhoneExtn" runat="server" EnableViewState="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEmail" runat="server" Text="Email : "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblActive" runat="server" Text="Active : "></asp:Label>
                </td>
                <td>
                    <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" ID="lstActive">
                        <asp:ListItem Text="Yes" Selected="True" Value="1" />
                        <asp:ListItem Text="No" Selected="False" Value="0" />
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <br />
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click"
                        ValidationGroup="Group1" CausesValidation="true" />
                    &nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Label ID="lblSuccess" runat="server" CssClass="ErrorMsg" Visible="False"></asp:Label>
    </div>
    <%--UserName--%>
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionUserName" ControlToValidate="txtUserName"
        ValidationExpression="^[a-zA-Z0-9]*$" ErrorMessage="Please Provide only Characters or Numbers in UserName Field."
        EnableClientScript="true" Display="none" ValidationGroup="Group1" />
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldUserName" ControlToValidate="txtUserName"
        ErrorMessage="Please provide UserId" Display="None" ValidationGroup="Group1" />
    <%--First Name--%>
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldFirstName" ControlToValidate="txtFirstName"
        EnableClientScript="true" Display="none" ErrorMessage="First Name is Required"
        ValidationGroup="Group1" />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFirstName"
        EnableClientScript="true" ValidationExpression="^([a-zA-Z]+\s)*[a-zA-Z]*$" ErrorMessage="Please Provide only Characters in First Name Field."
        Display="none" ValidationGroup="Group1" />
    <%--Last Name--%>
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtLastName"
        EnableClientScript="true" Display="none" ValidationGroup="Group1" ErrorMessage="Last Name is Required" />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtLastName"
        EnableClientScript="true" ValidationExpression="^([a-zA-Z]+\s)*[a-zA-Z]*$" ErrorMessage="Please Provide only Characters in Last Name Field."
        Display="None" ValidationGroup="Group1" />
    <%--User Type--%>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserType" ControlToValidate="ddlUserType"
        EnableClientScript="true" runat="server" InitialValue="--Select--" ErrorMessage="Please select UserType"
        ValidationGroup="Group1" Display="None"></asp:RequiredFieldValidator>
   

    <%--Role--%>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorRole" ControlToValidate="ddlRole"
        EnableClientScript="true" runat="server" InitialValue="--Select--" ErrorMessage="Please select Role"
        ValidationGroup="Group1" Display="None"></asp:RequiredFieldValidator>

    

    <%--Client--%>
  
    <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="ddlClient"
        EnableClientScript="true" runat="server" InitialValue="--Select--" ErrorMessage="Please select Role"
        ValidationGroup="Group1" Display="None"></asp:RequiredFieldValidator>
    --%>
    <%--Phone No--%>
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatortxtPhone" ControlToValidate="txtPhoneNo"
        ErrorMessage="Please provide Phone no." Display="None" ValidationGroup="Group1" />
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ControlToValidate="txtPhoneNo"
        EnableClientScript="true" ValidationExpression="^[0-9]*$" Text="Please Provide only Numbers in Phone No Field. "
        Display="None" ValidationGroup="Group1" />
    <%--Phone Extension--%>
    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatortxtPhoneExtn"
        ControlToValidate="txtPhoneExtn" ErrorMessage="Please provide Phone Extn." Display="None"
        ValidationGroup="Group1" />
    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidatortxtPhoneExtn"
        ControlToValidate="txtPhoneExtn" EnableClientScript="true" ValidationExpression="^[0-9]*$"
        Text="Please Provide only Numbers in Phone Extn Field. " Display="None" ValidationGroup="Group1" />
    <%--Validation Summary--%>
    <asp:ValidationSummary ID="vsSample" runat="server" DisplayMode="BulletList" ShowMessageBox="true"
        ShowSummary="false" ValidationGroup="Group1" ForeColor="Red" HeaderText="Correct the following errors." />
</asp:Content>
