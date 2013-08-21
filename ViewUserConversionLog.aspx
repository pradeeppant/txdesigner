<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true"
    CodeBehind="ViewUserConversionLog.aspx.cs" Inherits="win.txDesigner.ViewUserConversionLog" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MasterHead" runat="server">
    <title>txDESIGNER - View Run Logs</title>
</asp:Content>
<asp:Content ID="ContentBody" ContentPlaceHolderID="MasterContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <%--<a class="converter-pdf" target="_blank" href="Default.aspx" title="Run Wizard"></a>--%>
    <h2>Audit Trail</h2>
    <span class="info-text blue log-info">Select Client and User ID to view Audit Trail</span>
    <div class="clear">
    </div>


    <span class="select-options">
    <span class="left-pan">
        <span class="raw">
            <span class="dark-grey field-left-text"><strong>Client</strong></span>
            <span class="field-right-obj">
                <asp:DropDownList ID="ddlClientName" runat="server" OnSelectedIndexChanged="ddlClientName_SelectedIndexChanged" CssClass="light-grey form-txtfld" AutoPostBack="true" onchange="ClearAll()"></asp:DropDownList>
                <br class="clear" />
                <span id="errorClient" class="ErrorMsg"></span>
            </span>
       </span>
       <div class="clear"></div>
       <span class="raw">
            <span class="dark-grey field-left-text"><strong>User ID</strong></span>
            <span class="field-right-obj">
                <asp:DropDownList ID="ddlUserName" runat="server" onfocus="ClearAll()" CssClass="light-grey form-txtfld"></asp:DropDownList><br />
                <span id="errorUser" class="ErrorMsg"></span>
            </span>
       </span>
   </span>
   <span class="right-pan">
    <span class="raw">
        <span class="dark-grey field-left-text"><strong>Date</strong></span>
        <span class="field-right-obj">
            <asp:TextBox ID="txtFromDate" runat="server" class="date light-grey form-txtfld" value="From" onchange="ClearAll()"></asp:TextBox>
        </span>
        <span class="field-right-obj">
        <em> </em>
            <asp:TextBox ID="txtToDate" runat="server" class="date light-grey form-txtfld" value="To" onchange="ClearAll()"></asp:TextBox>
        </span>
        <span class="error-right">
            <span id="fromDate" class="ErrorMsg" runat="server"></span>
            <span id="toDate" class="ErrorMsg"></span>
        </span>
    </span>
    <span class="raw">
        <span class="dark-grey field-left-text"></span>
        <span class="field-right-obj right-float">
            <asp:Button ID="btnSubmit" runat="server" OnClientClick="return ValidateClient()" OnClick="btnSubmit_Click" Text="Search" CssClass="btn-add white" ToolTip="Search Logs" />
        </span>
    </span>
  </span>
 </span>   


    <br class="clear" />
    <div id="SearchResults" runat="server" style="width: 100%" clientidmode="Static">
        <div class="page-heading">
            Search Results</div>
        <asp:Label ID="lblMessage" runat="server" Visible="False" ForeColor="Red"></asp:Label>
        <!-- Data Grid Start -->
        <%--     <asp:UpdatePanel ID="UpdatePanel1" runat ="server" >
        <ContentTemplate> --%>
           <asp:GridView ID="gvLogs" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                    OnPageIndexChanging="gvLogs_PageIndexChanging" Width="100%" border="0" 
                    CellSpacing="0" CellPadding="0" bgcolor="#FFFFFF"  PageSize="7" 
                    PagerStyle-CssClass ="paging"  AllowSorting ="true" onsorting="gvLogs_Sorting"
                    CssClass="gridTbl" onrowcreated="gvLogs_RowCreated" >
                  <AlternatingRowStyle CssClass="grey" />
                  <RowStyle CssClass="first" />
                  <Columns>
               <%--   <asp:BoundField DataField="UserName" HeaderText="User ID" SortExpression="UserName" HeaderStyle-Width ="15%" />--%>
               <asp:BoundField DataField="ConversionDate" HeaderText="Conversion Date" SortExpression="ConversionDate" HeaderStyle-Width ="15%" />
                 
                  <asp:TemplateField HeaderText="" Visible="false">
                    <ItemTemplate>
                      <asp:Label ID="lblInputFileNameUnique" runat="server" Text=' <%#Eval("InputFileNameUnique") %>' />
                    </ItemTemplate>
                  </asp:TemplateField>

                 <asp:TemplateField HeaderText="ALS File"  SortExpression ="InputFileName" HeaderStyle-Width ="30%">
                    <ItemTemplate>
                      <asp:Button ID="btnDownLoadAlsFile" runat="server"  OnClick="btnDownLoadAlsFile_Click" CssClass="download-excel-btn"  Text='<%#Eval("InputFileName") %>' />
                    </ItemTemplate>
                  </asp:TemplateField> 
              
                 
                  <asp:TemplateField HeaderText="Download <em>(.pdf)</em>" SortExpression ="OutputFileName1" HeaderStyle-Width ="30%">
                    <ItemTemplate>
                      <asp:Button ID="btnDownload1" runat="server" OnClick="btnDownload1_Click" CssClass="download-pdf-btn"
                                Text='<%#Eval("OutputFileName1") %>' />
                    </ItemTemplate>
                  </asp:TemplateField>
                  <asp:BoundField DataField="Type" HeaderText="Type" Visible="true" SortExpression ="Type" HeaderStyle-Width ="15%" />
                  <asp:BoundField DataField="Status" HeaderText="Status" Visible="false" />
                  <asp:TemplateField HeaderText="" Visible="false">
                    <ItemTemplate>
                      <asp:Label ID="lblkey" runat="server" Text=' <%#Eval("pdfEncryptKey") %>' />
                    </ItemTemplate>
                  </asp:TemplateField>
                  </Columns>
                  <PagerStyle CssClass="paging" HorizontalAlign="Right" />
                </asp:GridView>

     <%--   <asp:GridView ID="gvLogs" runat="server" AutoGenerateColumns="False" PageSize="7" OnRowDataBound ="gvLogs_OnRowDataBound"
            AllowPaging="True" OnPageIndexChanging="gvLogs_PageIndexChanging" PagerStyle-CssClass="paging"
            Width="100%" border="0" CellSpacing="0" CellPadding="0" bgcolor="#FFFFFF" AllowSorting="true"
            OnSorting="gvLogs_Sorting" CssClass="gridTbl">
            <AlternatingRowStyle CssClass="grey" />
            <Columns>
     
                <asp:BoundField DataField="InputFileName" HeaderText="ALS File" HeaderStyle-Width="20%" 
                    SortExpression="InputFileName" />
                <asp:TemplateField HeaderText="Annotated PDF" SortExpression="OutputFileName1" HeaderStyle-Width="20%">
                    <ItemTemplate>
                        <asp:Button ID="btnDownload1" runat="server" OnClick="btnDownload1_Click" CssClass="download-pdf-btn WrapText"
                            Text='<%#Eval("OutputFileName1") %>'  />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Blank PDF" SortExpression="OutputFileName2" HeaderStyle-Width="20%" >
                    <ItemTemplate>
                        <asp:Button ID="btnDownload2" runat="server" OnClick="btnDownload2_Click" CssClass="download-pdf-btn WrapText"
                            Text='<%#Eval("OutputFileName2") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Edit Checks PDF" SortExpression="OutputFileName3" HeaderStyle-Width="20%">
                    <ItemTemplate>
                        <asp:Button ID="btnDownload3" runat="server" OnClick="btnDownload3_Click" CssClass="download-pdf-btn WrapText"
                            Text='<%#Eval("OutputFileName3") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Status" HeaderText="Status" Visible="false" SortExpression="Status"  />
                <asp:TemplateField HeaderText="" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lblkey" runat="server" Text=' <%#Eval("pdfEncryptKey") %>' CssClass="WrapText" />
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField HeaderText="EDC PDF" SortExpression="OutputFileName4" HeaderStyle-Width="20%">
                    <ItemTemplate>
                        <asp:Button ID="btnDownload4" runat="server" OnClick="btnDownload4_Click" CssClass="download-pdf-btn WrapText"  
                            Text='<%#Eval("OutputFileName4") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle CssClass="paging" HorizontalAlign="Right" />
        </asp:GridView>--%>
        <%--         </ContentTemplate>  <Triggers>
                    <asp:PostBackTrigger ControlID="gvLogs" />
                    
                </Triggers>

  </asp:UpdatePanel> --%>
        <!-- Data Grid End -->
    </div>
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
            $("#<%= lblMessage.ClientID %>").text('');
        }

    </script>
    <!-- Page Content End -->
    <ajaxToolkit:CalendarExtender ID="ceFromDate" runat="server" TargetControlID="txtFromDate"
        PopupButtonID="txtFromDate" Format="MM/dd/yyyy" CssClass="red">
    </ajaxToolkit:CalendarExtender>
    <ajaxToolkit:CalendarExtender ID="ceToDate" runat="server" TargetControlID="txtToDate"
        PopupButtonID="txtToDate" Format="MM/dd/yyyy" CssClass="red second-picker">
    </ajaxToolkit:CalendarExtender>
</asp:Content>
