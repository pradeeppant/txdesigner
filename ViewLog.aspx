<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true"
    CodeBehind="ViewLog.aspx.cs" Inherits="win.txDesigner.ViewLog" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MasterHead" runat="server">
  <title>txDESIGNER - View Logs</title>
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="MasterContent" runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>
  <h2>Logs</h2>
  <span class="info-text blue log-info">Select Client and User ID to view Logs</span>
  <div class="clear"> </div>
  <span class="select-options">
    <span class="left-pan">
        <span class="raw">
            <span class="dark-grey field-left-text"><strong>Client</strong></span>
            <span class="field-right-obj">
                <asp:DropDownList ID="ddlClientName" runat="server" OnSelectedIndexChanged="ddlClientName_SelectedIndexChanged"
                AutoPostBack="true" onfocus="ClearAll()" CssClass="light-grey form-txtfld"></asp:DropDownList>
                <br />
                <span id="errorClient" class="ErrorMsg"></span>
            </span>
       </span>
       <div class="clear"> </div>
       <span class="raw">
            <span class="dark-grey field-left-text"><strong>User ID</strong></span>
            <span class="field-right-obj">
                <asp:DropDownList ID="ddlUserName" runat="server" onfocus=" ClearAll()" CssClass="light-grey form-txtfld"> </asp:DropDownList><br />
                <span id="errorUser" class="ErrorMsg"></span>
            </span>
      </span>
  </span>
  <span class="right-pan">
    <span class="raw">
        <span class="dark-grey field-left-text"><strong>Date</strong></span>
        <span class="field-right-obj">
            <asp:TextBox ID="txtFromDate" runat="server" class="date form-txtfld" value="From" onfocus="ClearAll()"></asp:TextBox>
        </span>
        <span class="field-right-obj">
        <em> </em>
            <asp:TextBox ID="txtToDate" runat="server" class="date form-txtfld" value="To" onfocus="ClearAll()"></asp:TextBox>
        </span>
        <span class="error-right">
            <span id="fromDate" class="ErrorMsg" runat="server"></span>
            <span id="toDate" class="ErrorMsg"></span>
        </span>
    </span>
    <span class="raw">
        <span class="dark-grey field-left-text"></span>
        <span class="field-right-obj right-float">
            <asp:Button ID="btnSubmit" runat="server" OnClientClick="return ValidateClient()" OnClick="btnSubmit_Click" Text="Search" ToolTip="Search Logs" CssClass="btn-add white" />
        </span>
    </span>
  </span>
 </span> 
  <!-- Grid table starts --> 
  <!-- Grid table ends -->
  <div class="clear"> </div>
  <div id="SearchResults" runat="server" style="width: 100%">
    <div class="page-heading"> Search Results</div>
    <asp:Label ID="lblMessage" runat="server" Visible="False" ForeColor="Red"></asp:Label>
    <!-- Data Grid Start -->
    <asp:GridView ID="gvLogs" runat="server" AutoGenerateColumns="False" AllowPaging="True"
            OnPageIndexChanging="gvLogs_PageIndexChanging" Width="100%" border="0" CellSpacing="0"
            CellPadding="0" bgcolor="#FFFFFF" PageSize="7" AllowSorting="True" OnSorting="gvLogs_Sorting"
            CssClass="gridTbl">
      <AlternatingRowStyle CssClass="grey" />
      <Columns>
      <asp:TemplateField HeaderText="User ID" HeaderStyle-Width="10%" SortExpression="UserName">
        <ItemTemplate>
          <asp:Label ID="lblUserName" runat="server" Text=' <%#Eval("UserName") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Login Status" SortExpression="LoginStatus" HeaderStyle-Width="15%">
        <ItemTemplate>
          <asp:Label ID="lblLoginSuccess" runat="server" Text=' <%#Eval("LoginStatus") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Sign In Date" SortExpression="LoginDate" HeaderStyle-Width="30%">
        <ItemTemplate>
          <asp:Label ID="lblLoginDate" runat="server" Text=' <%#Eval("LoginDate" , "{0:MM/dd/yyyy HH:mm:ss}") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="Sign Out Date" HeaderStyle-Width="16%" SortExpression="LogOutDate">
        <ItemTemplate>
          <asp:Label ID="lblLoginDate" runat="server" Text=' <%#Eval("LogOutDate" , "{0:MM/dd/yyyy HH:mm:ss}") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText="IP Address" HeaderStyle-Width="22%" SortExpression="LoginIP">
        <ItemTemplate>
          <asp:Label ID="lblLoginIP" runat="server" Text=' <%#Eval("LoginIP") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      </Columns>
      <PagerStyle CssClass="paging" HorizontalAlign="Right" />
    </asp:GridView>
  </div>
  <!-- Data Grid End --> 
  <script type="text/javascript">
      function ValidateClient() {
          var a = $("#<%= ddlClientName.ClientID %>").val();

          if (a.trim() == "" || a == "--Select--" || a == 0) {
              $("#<%= ddlClientName.ClientID %>").css("background-color", "#FFDCDC");
              $("#errorClient").text('Select Client');
              return false;
          }

          a = $("#<%= ddlUserName.ClientID %>").val();

          if (a.trim() == "" || a == "--Select--" || a == 0) {
              $("#<%= ddlUserName.ClientID %>").css("background-color", "#FFDCDC");
              $("#errorUser").text('Select User ID');
              return false;
          }
          a = $("#<%= txtFromDate.ClientID %>").val();
          var b = $("#<%= txtFromDate.ClientID %>").val();
          if (a.trim() == "" || a == "From" || a == 0) {
              $("#<%= txtFromDate.ClientID %>").css("background-color", "#FFDCDC");
              $("#MasterContent_fromDate").text('Define "From" Date');
              return false;
          }
          a = $("#<%= txtToDate.ClientID %>").val();
          if (a.trim() == "" || a == "To" || a == 0) {
              $("#<%= txtToDate.ClientID %>").css("background-color", "#FFDCDC");
              $("#toDate").text('Define "To" Date');
              return false;
          }
          return true;
      }

      function ClearAll() {

          $("#<%= ddlClientName.ClientID %>").css("background-color", "#FFFFFF");
          $("#errorClient").text('');

          $("#<%= txtFromDate.ClientID %>").css("background-color", "#FFFFFF");
          $("#MasterContent_fromDate").text('');

          $("#<%= ddlUserName.ClientID %>").css("background-color", "#FFFFFF");
          $("#errorUser").text('');

          $("#<%= txtToDate.ClientID %>").css("background-color", "#FFFFFF");
          $("#toDate").text('');
          // $("#<%= lblMessage.ClientID %>").text('');
      }

    </script>
  <ajaxToolkit:CalendarExtender ID="ceFromDate" runat="server" TargetControlID="txtFromDate"
        PopupButtonID="txtFromDate" Format="MM/dd/yyyy" CssClass="red"> </ajaxToolkit:CalendarExtender>
  <ajaxToolkit:CalendarExtender ID="ceToDate" runat="server" TargetControlID="txtToDate"
        PopupButtonID="txtToDate" Format="MM/dd/yyyy" CssClass="red second-picker"> </ajaxToolkit:CalendarExtender>
  <script type="text/javascript">
      $(document).ready(function () {

          $("#<%= btnSubmit.ClientID %>").click(function (e) {
              var a = $("#<%= ddlClientName.ClientID %>").val();
          });
          $('input:text').change(function () {
              //$(this).css({ 'border': '1px solid #757575', 'color': '#333' });
              $(this).removeAttr('style');
          });
          $('select').change(function () {
              $(this).removeAttr('style');
          });
          $("#<%= ddlClientName.ClientID %>").focus(function (e) {

              $("#<%= ddlClientName.ClientID %>").css("background-color", "#FFFFFF");
              $("#errorClient").text('');
          });

          $("#<%= ddlUserName.ClientID %>").focus(function (e) {

              $("#<%= ddlUserName.ClientID %>").css("background-color", "#FFFFFF");
              $("#errorClient").text('');
          });
      });
   
    </script> 
</asp:Content>
