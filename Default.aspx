<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="win.txDesigner.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server"> 
  <script src="js/jquery-min.js" type="text/javascript"></script> 
  <script src="Scripts/global.js" type="text/javascript"></script> 
  <script src="Scripts/jquery-1.10.1.js" type="text/javascript"></script> 
  <script type="text/javascript">
      window.onload = function () {
          document.body.onselectstart = function () {
              return false;
          }
      }

      function jScript() {
          $(document).ready(function () {
              //User update and profile button
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

              ////Focus On Off Code
              var el = $('input[type=text], textarea, input[type=password]');
              el.focus(function (e) {
                  if (e.target.value == e.target.defaultValue)
                      e.target.value = '';
              });
              el.blur(function (e) {
                  if (e.target.value == '')
                      e.target.value = e.target.defaultValue;
              });

              //Brose File Code
              $('input#browseFile').change(function () {
                  var browseVal = $(this).val().replace(/C:\\fakepath\\/i, '');
                  $('input[name="displayFile"]').val(browseVal);
                  $('input#HdnFileName').val(browseVal);
                  $('#filenam').val(browseVal);
              });

              var aslFile = $('#filenam').val();
              $('span.fileNm').html(aslFile);
              $('.bVal, .bPro, .cGen').hide();

              //File type Check
              $('input#browseFile').change(function () {
                  var ext = this.value.substring(this.value.lastIndexOf('.') + 1);
                  switch (ext) {
                      case 'xlsx':
                      case 'xls':
                          $('input#stepOneNext').addClass('stepI-next-active').removeAttr('disabled', 'disabled');
                          $('span.browsefile-dis-icon').slideUp('fast');
                          $('span.browsefile-toltip').slideUp('fast');
                          $('span.browsefile-done-icon').slideDown('fast');
                          break;
                      default:
                          $('input#stepOneNext').removeClass('stepI-next-active').attr('disabled', 'disabled');
                          $('span.browsefile-dis-icon').slideDown('fast');
                          $('span.browsefile-toltip').slideDown('fast');
                          $('span.browsefile-done-icon').slideUp('slow');
                  }

                  var txt = $(this).val().replace(/C:\\fakepath\\/i, '');

                  if (txt.length > 40) {
                      $('input#stepOneNext').removeClass('stepI-next-active').attr('disabled', 'disabled');
                      $('span.browsefile-dis-icon').slideDown('fast');
                      $('span.browsefile-toltipFile').slideDown('fast');
                      $('span.browsefile-done-icon').slideUp('slow');
                  }
                  else {
                      $('span.browsefile-toltipFile').slideUp('fast');
                  }

              });

              //First step loader and slide action
              $('input#stepOneNext').click(function () {
                  $('div#step-one').slideUp('slow');
                  $('div#step-two').slideDown('slow');
              });

              //First step back button
              $('input.upload-newfile-btn').click(function () {
                  $('div#step-two').slideUp('slow');
                  $('div#step-three').slideUp('slow');
                  $('html, body').animate({ scrollTop: 0 }, 'slow');
                  $('div#step-one').slideDown('slow');
                  $('li.upload-als').removeClass('active-upload-als');
                  $('li.pick-active').removeClass('pick-active').addClass('pick');
                  $('li.select-active').removeClass('select-active').addClass('select');
                  $('input.browse-file-name').val('');
                  $('span.browsefile-done-icon').hide();
              });
              //Select Matrix loader and slide action
              $('input.pick-matrixsheet-btn').click(function () {
                  $('div#step-two').slideUp('slow');
                  $('div#step-three').slideDown('slow');
                  $('li.upload-als').addClass('active-upload-als');
                  $('.bVal').css('display', 'block');
              });

              //Multiple Checkbox action & Step 3 Start
//              $('input#ChkSkipMatrix:checkbox').change(function () {
//                  if ($(this).is(':checked')) {
//                      $('span.multiselectbox input:checkbox').removeAttr('checked');
//                      $('div#MainContent_pnlSelectedMatrix label').slideUp('fast');
//                      $('input#HdnSelectedMatrix').val('');
//                      //$('span#matrixNm').text('No matrix sheet have been selected');
//                  }
//              });
              //Customized checkbox
              $('span.cust-chck input:checkbox').change(function () {
                  if ($(this).is(':checked')) {
                      $(this).parent().addClass('cust-chck-active');
                  }
                  else {
                      $(this).parent().removeClass('cust-chck-active');
                  }
              });

              //Matrix Sheet Hover Names
              $("span#matrixNm1").text($("span#matrixNm1").text().substr(0, 27) + '...');
              $("#lblCurrentFileStep4").text($("#lblCurrentFileStep4").text().substr(0, 26) + '...');
              //$("#lblCurrentFileStep3").text($("#lblCurrentFileStep3").text().substr(0, 26) + '...');
//              $('#test').hide();
//              $('.matHover').hover(
//                  function () {
//                      var target = $('#test');
//                      target.slideDown('fast');
//                  },
//                  function () {
//                      var target = $('#test');
//                      target.delay(100).slideUp('fast');
//                  }
//              );

              //              $('input#slctAllmatrix:checkbox').click(function () {
              //                  var checkedStatus = this.checked;
              //                  $('span.multichecks input:checkbox').each(function () {
              //                      $(this).prop('checked', checkedStatus);
              //                      $('#ChkSkipMatrix').parent('span').removeClass('cust-chck-active');
              //                      $('#MainContent_pnlFileMatrix span.cust-chck').addClass('cust-chck-active');
              //                  });
              //                  $('span.multiselect-values label').css('display', 'block');

              //                  if ($(this).prop('checked') == false) {
              //                      $('span.multiselect-values label').removeAttr('style');
              //                      $('#MainContent_pnlFileMatrix span.cust-chck').removeClass('cust-chck-active');
              //                  }
              //                  selectMatrix();
              //              });

              //              $('span.multiselectbox input:checkbox').change(function () {
              //                  var c = $('span.multiselectbox input:checkbox:checked').length;
              //                  if (c !== 0) {
              //                      $('span.multiselect-val').removeClass('opacity');
              //                      $('input.format-type-btn').addClass('format-type-btn-active').removeAttr('disabled', 'disabled');
              //                      $('input#ChkSkipMatrix:checkbox').removeAttr('checked');
              //                      $('#ChkSkipMatrix').parent('span.cust-chck').removeClass('cust-chck-active');

              //                  }
              //                  else {
              //                      $('span.multiselect-val').addClass('opacity');
              //                      $('input.format-type-btn').removeClass('format-type-btn-active').attr('disabled', 'disabled');
              //                      $('li.pick-active').removeClass('pick-active').addClass('pick');
              //                  }

              //                  $('span.multichecks input:checkbox').click(function () {
              //                      $("input[name^='matrix_check']").each(function () {
              //                          if ($(this).is(":checked"))
              //                              $('label[resource-label="' + this.value + '"]').slideDown('fast');
              //                          else
              //                              $('label[resource-label="' + this.value + '"]').slideUp('fast');
              //                      });
              //                  });
              //                  selectMatrix();
              //              });

              function selectMatrix() {
                  var ccval = [];
                  $.each($('span.multichecks input:checkbox:checked'), function (a, b) {
                      ccval.push($(b).val());
                  });

                  $('input#HdnSelectedMatrix').val(ccval.toString());
                  $('#matrixNm1').val(ccval.toString());
              }
              //var cmat = $("#HdnSelectedMatrix").val().toString();
              selectMatrix();

              //Fourth step loader and slide action
              $('input.format-type-btn').click(function () {
                  $('div#step-three').slideUp('slow');
                  $('html, body').animate({ scrollTop: 0 }, 'slow');
                  $('div#step-four').slideDown('slow');
                  //$('span#matrixNm1').text(cmat);
                  $('.bPro').css('display', 'block');
              });

              //PDF Type checkboxes
              $('span.pdf-type-checks input:checkbox').change(function () {
                  //var pdfSel = $(this).val();
                  //$('#pdfTypeC').val(pdfSel);

                  var cc = $('span.pdf-type-checks input:checkbox:checked').length;
                  if ($(this).is(':checked')) {
                      $(this).parent('span').addClass('active-check');
                  }
                  else {
                      $(this).parent('span').removeClass('active-check');
                  }
                  if (cc !== 0) {
                      $('input.download-process-btn').addClass('download-process-btn-active').removeAttr('disabled', 'disabled');
                  }
                  else {
                      $('input.download-process-btn').removeClass('download-process-btn-active').attr('disabled', 'disabled');
                  }

                  if (cc == 5) {
                      $('#chckAll').attr('checked', 'checked');
                      $('#chckAll').parent('span').addClass('active-check');
                      $('.chckNm').html('All types of PDF');
                  }
              });

              //Checkbox Value in hidden field
              var $checkboxes = $('span.pdf-type-checks input:checkbox');
              $checkboxes.on('change', function () {
                  var ids = $checkboxes.filter(':checked').map(function () {
                      return this.value;
                  }).get().join(', ');
                  console.log(ids);
                  $('.chckNm').html(ids);
              });

              //Check all type of PDF
              $('#chckAll:checkbox').click(function () {
                  var checkedStatus = this.checked;
                  $('span.pdf-type-checks input:checkbox').each(function () {
                      $(this).prop('checked', checkedStatus);
                  });
              });
              $('#chckAll:checkbox').change(function () {
                  if ($(this).is(':checked')) {
                      $('.chckNm').html('All types of PDF');
                      $('span.pdf-type-checks input:checkbox').parent('span').addClass('active-check');
                  }
                  else {
                      $('span.pdf-type-checks input:checkbox').parent('span').removeClass('active-check');
                  }
              });

              //Fourth step back to select matrix slide action
              $('input.pick-matrixsheet-back-btn').click(function () {
                  $('div#step-four').slideUp('slow');
                  $('div#step-three').slideDown('slow');
                  $('.chckNm').val('');
              });

              //Fifth Step slide actions
              $('input.download-process-btn').click(function () {
                  $('div#step-four').slideUp('slow');
                  $('div#step-five').slideDown('slow');
                  $('.cGen').css('display', 'block');
              });

              //Fifth Step back slide action	
              $('input.format-type-back-btn').click(function () {
                  $('div#step-five').slideUp('slow');
                  $('div#step-four').slideDown('slow');

              });

              $('a.run_log').click(function () {
                  var hdn = $('#hdnCurrentPanel').val();
                  $("#" + hdn).slideUp();
                  $('div#step_six').slideDown('fast');
                  $('a.run_log').css('visibility', 'hidden');
              });

              $('a.run_log_down').click(function () {
                  var hdn = $('#hdnCurrentPanel').val();
                  $("#" + hdn).slideDown('fast');
                  $('div#step_six').slideUp('fast');
                  $('a.run_log').css('visibility', 'visible');
              });


              //              $('#ChkSkipMatrix').click(function () {
              //                  if ($(this).is(':checked')) {
              //                      $('input.format-type-btn').addClass('format-type-btn-active').removeAttr('disabled', 'disabled');
              //                      $('#matrixNm1').text('No matrix sheet(s) has been selected');
              //                      $('#slctAllmatrix').parent('span').removeClass('cust-chck-active');
              //                      $('#MainContent_pnlFileMatrix span.cust-chck').removeClass('cust-chck-active');
              //                  }
              //                  else {
              //                      $('input.format-type-btn').removeClass('format-type-btn-active').attr('disabled', 'disabled');
              //                  }
              //              });

          });
      }

  
</script>
<asp:HiddenField ID="filenam" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="pdfTypeC" runat="server" ClientIDMode="Static" />
  <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>
  <asp:UpdateProgress  DisplayAfter="0" ID="UpdateProgress2" DynamicLayout="true" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
    <ProgressTemplate>
      <div class="loader-bg loader">
        <div align="center" style="width: 100%; padding-top: 7%; opacity:0.7; filter:alpha(opacity=70);"><img src="images/ajax-loader.gif" alt="" /></div>
        <h3 class="light-grey bVal">The ALS file "<span class="blue fileNm"></span>" is being uploaded...</h3>
        <h3 class="light-grey bPro">The ALS file "<span class="blue fileNm"></span>" is being processed...</h3>
        <h3 class="light-grey cGen">
            <span class="orange chckNm"></span><br />
            is being generated for <span class="blue fileNm"></span>
        </h3>
      </div>
    </ProgressTemplate>
  </asp:UpdateProgress>
  <asp:UpdatePanel ID ="UpdatePanel1" runat="server" >
    <ContentTemplate >
      <asp:HiddenField ID="hdnMatrix" runat="server" />
      <asp:HiddenField ID="hdnRbutton" runat="server" />
      <asp:HiddenField ID="HdnFileName" runat="server"  ClientIDMode="Static"/>
      <asp:HiddenField ID="HdnSelectedMatrix" runat="server"  ClientIDMode="Static"/>
      <asp:HiddenField ID="hdnCurrentPanel" runat="server" ClientIDMode="Static"/>
      <script type="text/javascript" language="javascript">Sys.Application.add_load(jScript);</script>
      <div class="content">
        <span id="trialVersion" runat="server" clientidmode="Static"></span>
        <h1 class="process-tag">trial development Xccelerator...</h1>
        <br class="clear" />
        <br class="clear" />
        <ul class="process-steps">
          <li class="upload-als light-grey" id="liUploadImage" runat = "server">
            <h2 class="dark-grey">Upload</h2>
            browse/upload ALS file</li>
          <li class="light-grey pick" id="liPickImage" runat = "server">
            <h2 class="light-grey">Pick</h2>
            matrix sheet(s)</li>
          <li class="light-grey select" id="liSelectImage" runat = "server">
            <h2 class="light-grey">Select</h2>
            desired format types</li>
          <li class="last light-grey download"  id="liDownloadImage" runat = "server">
            <h2 class="light-grey">Download</h2>
            processed pdf file(s)</li>
        </ul>
        <br class="clear" />
        <!-- Step 1 Start -->
        <asp:Panel ID ="step1" runat ="server" ClientIDMode="Static">
          <div id="step-one"> <span class="process-pointer"></span> <span class="process-underline"></span>
            <p class="dark-grey process-info">Select ALS file to process</p>
            <span class="browsefile-toltip"></span> <span class="browsefile-toltipFile"></span> <span class="browse-button"> <span class="browsefile-done-icon"></span> <span class="browsefile-dis-icon"></span>
            <asp:FileUpload ID="browseFile" type="file"  runat="server" name="browseFile" CssClass="browse" ClientIDMode="Static" ToolTip="Browse" />
            <input type="text" name="displayFile" class="browse-file-name light-grey" value="Select the ALS file" readonly />
            </span>
            <asp:Button ID="stepOneNext" CssClass="stepI-next" disabled="disabled" OnClick="upload_Click" ToolTip="Upload ALS file"  runat ="server" ClientIDMode = "Static" Text =""  />
          </div>
        </asp:Panel>
        <!-- Step 1 End --> 
        
        <!-- Step 2 Start -->
        <asp:Panel ID ="step2" runat ="server" ClientIDMode="Static" >
          <div id="step-two"> <span class="process-pointer"></span> <span class="process-underline"></span>
            <p class="dark-grey process-info">Select ALS file to process</p>
            <span class="action-box">
            <asp:Button ID="btnBackStepTwoToOne" CssClass="upload-newfile-btn" OnClick="btnBackStepOne_Click" runat ="server" ClientIDMode="Static" Text ="" ToolTip="Upload new file"  />
            <span class="success-msg light-grey">
            <h3 class="dark-grey">"Congratulations"</h3>
            <asp:Label ID ="lblFileSuccess" runat ="server"></asp:Label>
            has been uploaded successfully.
            </p>
            </span>
            <asp:Button ID="stepTwoNext" CssClass="pick-matrixsheet-btn" OnClick="UploadSuccess_Click" runat="server" ClientIDMode="Static" Text ="" ToolTip="Pick matrix sheet(s)" />
            <br class="clear" />
            <br class="clear" />
            <asp:Label runat="server" ID="lblMessage" CssClass="error-user error-user-large" style="width:200px; margin:auto; color:red;"></asp:Label>
            </span> </div>
        </asp:Panel>
        <!-- Step 2 End --> 
        
        <!-- Step 3 Start -->
        <asp:Panel ID ="step3" runat ="server" ClientIDMode="Static">
          <div id="step-three"> <span class="process-pointer"></span> <span class="process-underline"></span>
            <p class="dark-grey process-info">Select matrix sheet(s)</p>
            <span class="action-box">
            <asp:Button ID="btnBackStepTwo" CssClass="upload-newfile-btn"  OnClick = "btnBackStepTwo_Click" runat ="server" ClientIDMode = "Static" Text ="" ToolTip="Upload new file" />
            <span class="multiselect-area"> <span class="file-info-btn"> <span class="file-info white"><strong>Current file: </strong>
            <asp:Label ID ="lblCurrentFileStep3" runat ="server" ClientIDMode="Static"></asp:Label>
            </span> <span class="file-info-pointer"></span> </span>
             <span class="matrix-info-btn" style="display:none;"> <span class="matrix-info dark-grey">
            <asp:CheckBox ID="ChkSkipMatrix" runat="server" ClientIDMode="Static" CssClass="cust-chck" />
            <label  for="ChkSkipMatrix"><strong>Continue without matrix sheet(s)</strong></label>
            </span> <span class="matrix-info-pointer"></span> </span>
            <div class="clear"></div>

            <span id="spn1" class="multiselectbox">
                <span class="multihead-grey light-grey">
                    <asp:CheckBox ID="slctAllmatrix" runat="server" ClientIDMode="Static" Checked="true" Enabled="false" CssClass="cust-chck cust-chck-active" /> Available Matrix Sheet(s)
                </span>
                <span class="multichecks dark-grey">
                    <asp:Panel ID="pnlFileMatrix" runat="server"><%=strMatrix1%></asp:Panel>
                </span>
            </span>
            
            <span class="multiselect-val"> <span class="arrow-yellow"></span> <span class="selected-val"> <span class="multihead-orange dark-grey">Selected Matrix Sheet(s) </span> <span id = "dd12" class="multiselect-values dark-grey">
            <asp:Panel ID ="pnlSelectedMatrix" runat ="server"><%=strMatrix%></asp:Panel>
            </span> </span> </span> </span>
            <asp:Button ID="stepThreeNext"  CssClass="format-type-btn format-type-btn-active" OnClick = "btnMattrix_Click" runat ="server" ClientIDMode = "Static" Text ="" ToolTip="Select format types"  />
            </span> </div>
        </asp:Panel>
        <!-- Step 3 End --> 
        
        <!-- Step 4 Start -->
        <asp:Panel ID ="step4" runat ="server" ClientIDMode="Static">
          <div id="step-four"> <span class="process-pointer"></span> <span class="process-underline"></span>
            <p class="dark-grey process-info">Desired output</p>
            <span class="action-box">
            <asp:Button ID="btnBackStepThree" CssClass="pick-matrixsheet-back-btn"  OnClick = "btnBackStepThree_Click" runat ="server" ClientIDMode="Static" Text =""  ToolTip="Pick matrix sheet(s)"   />
            <span class="multiselect-area"> <span class="file-info-btn"> <span class="file-info white"><strong>Current file: </strong>
            <asp:Label ID ="lblCurrentFileStep4" runat ="server" ClientIDMode="Static"></asp:Label>
            </span> <span class="file-info-pointer"></span> </span>
            
            <span class="matrix-info-btn">
                <span class="matrix-info dark-grey">
                    <strong runat="server" id="matCount"></strong>
                    <asp:Label ID="matrixNm1" runat="server" Text="Label" ClientIDMode="Static" CssClass="val"></asp:Label>
                </span>
                <span class="matrix-info-pointer"></span>
            </span>


            <div class="clear"></div>
            <span class="pdf-type-checks">
            <div class="left-pan">
              <asp:CheckBox ID="chkBlank" runat="server" ClientIDMode="Static" CssClass="dark-grey" ToolTip="Fields without any annotation" />
              <label for="chkBlank" class="dark-grey">Blank eCRF</label>
            </div>
            <div class="left-pan">
              <asp:CheckBox ID="chkNormal" runat="server" ClientIDMode="Static" CssClass="dark-grey" ToolTip="Fields annotated with OID" />
              <label for="chkNormal" class="dark-grey last">Annotated eCRF</label>
            </div>
            <br class="clear" />
            <br class="clear" />
            <div class="left-pan">
              <asp:CheckBox ID="chkEdit" runat="server" ClientIDMode="Static" CssClass="dark-grey" ToolTip="Fields with all the corresponding editchecks" />
              <label for="chkEdit" class="dark-grey">Edit Check Specs</label>
            </div>
            <div class="left-pan">
              <asp:CheckBox ID="ChkEDCDev" runat="server" ClientIDMode="Static" CssClass="dark-grey" ToolTip="Study Build specification"  />
              <label for="ChkEDCDev" class="dark-grey last">EDC Dev Specs</label>
            </div>
            <br class="clear" />
            <br class="clear" />
            <div class="left-pan">
              <asp:CheckBox ID="chkSDTM" runat="server" ClientIDMode="Static" CssClass="dark-grey" ToolTip="SDTM annotated CRF" />
              <label for="chkSDTM" class="dark-grey">SDTM eCRF</label>
            </div>
            <div class="left-pan">
              <asp:CheckBox ID="chckAll" runat="server" ClientIDMode="Static" CssClass="dark-grey"  />
              <label for="chckAll" class="dark-grey last">Select All</label>
            </div>
            </span> </span>
            <asp:Button ID="stepFourNext"  CssClass="download-process-btn"  OnClick = "btnStepFourNextDownload_Click" runat ="server" ClientIDMode = "Static" Text ="" OnClientClick ="return validate();" ToolTip="Process to download"/>
            </span>
            
            <div class="checkedChck"></div>

            <span class="matHover">
                <asp:Label ID="count" CssClass="matrix-count" runat="server" ClientIDMode="Static"></asp:Label>
                <div id ="test" runat="server" clientidmode="Static">
                    <ul runat ="server" ID="matrixul"></ul>
                </div>
            </span>
          </div>
        </asp:Panel>
        <!-- Step 4 End --> 
        
        <!-- Step 5 Start -->
        <asp:Panel ID ="step5" runat ="server" ClientIDMode="Static">
          <div id="step-five"> <span class="process-pointer"></span> <span class="process-underline"></span>
            <p class="dark-grey process-info">Processed file(s) ready for download</p>
            <span class="action-box">
            <asp:Button ID="btnBackStepFour" CssClass="format-type-back-btn" OnClick="btnBackStepFour_Click" runat ="server" ClientIDMode="Static" Text ="" ToolTip="Select format types"  />
            <span class="process-complete light-grey">
            <asp:Label runat ="server" ID ="lblerMsg"  Text =""></asp:Label>
            <h3 class="dark-grey" runat="server" id="headingText" clientidmode="Static">"ALS Processing Completed"</h3>
            <ul runat="server" id="pdfName" clientidmode="Static">
              <asp:Button ID="lnk2" runat="server" OnClick="lnkBlankPDFPath1_Click" class="dark-grey" />
              <asp:Button ID="lnk1" runat="server" OnClick="lnkOutputPath1_Click" class="dark-grey annotated-pdf" />
              <asp:Button ID="lnk3" runat="server" OnClick="lnkEditCheckPDF1_Click"  class="dark-grey edit-check-pdf" />
              <asp:Button ID="lnk4" runat="server" OnClick="lnkEDCDEV1_Click"  class="dark-grey edc-check-pdf" />
              <asp:Button ID="lnk5" runat="server" OnClick ="lnkSDTM_Click" class="dark-grey sdtm-pdf" />
            </ul>
            <div class="clear"></div>
            <p id="pdfInfo" runat="server" clientidmode="Static">Click below on <strong>"Run Log"</strong> to view processing details</p>
            </span>
            <asp:Button ID="btnBackStepOne"  CssClass="upload-new-file-btn"  OnClick = "btnBackStepOne_Click" runat ="server" ClientIDMode="Static" Text="" ToolTip="Upload new file"  />
            </span> </div>
        </asp:Panel>

        <!-- Step 5 End -->
        <asp:Panel ID ="Panel6" runat ="server">
          <div id="step_six"  runat ="server" clientidmode ="Static"> <span class="process-underline"></span>
            <div class="run_log_block"  id="run_log_div"  runat ="server" clientidmode ="Static"> <a class="run_log_down" href="#" title="Close"></a>
              <div class="run_log_grid">
                <asp:GridView ID="gvLogs" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                    OnPageIndexChanging="gvLogs_PageIndexChanging" Width="100%" border="0" 
                    CellSpacing="0" CellPadding="0" bgcolor="#FFFFFF"  PageSize="5" 
                    PagerStyle-CssClass ="paging"  AllowSorting ="false" onsorting="gvLogs_Sorting"
                    CssClass="gridTbl" onrowcreated="gvLogs_RowCreated" >
                  <AlternatingRowStyle CssClass="grey" />
                  <RowStyle CssClass="first" />
                  <Columns>
                  <%--   <asp:BoundField DataField="UserName" HeaderText="User ID" SortExpression="UserName" HeaderStyle-Width ="15%" />--%>
                  
                 <asp:TemplateField HeaderText="" Visible="false">
                    <ItemTemplate>
                      <asp:Label ID="lblInputFileNameUnique" runat="server" Text=' <%#Eval("InputFileNameUnique") %>' />
                    </ItemTemplate>
                  </asp:TemplateField>

                  <asp:TemplateField HeaderText="ALS File"  SortExpression ="InputFileName" HeaderStyle-Width ="30%">
                    <ItemTemplate>
                      <asp:Button ID="btnDownload2" runat="server" OnClick="btnDownload2_Click" CssClass="download-excel-btn"  Text='<%#Eval("InputFileName") %>' />
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
              </div>
            </div>
          </div>
        </asp:Panel>
      </div>
    </ContentTemplate>
    <Triggers>
      <asp:PostBackTrigger ControlID="stepOneNext" />
      <asp:PostBackTrigger ControlID="lnk1" />
      <asp:PostBackTrigger ControlID="lnk2" />
      <asp:PostBackTrigger ControlID="lnk3" />
      <asp:PostBackTrigger ControlID="lnk4" />
      <asp:PostBackTrigger ControlID="lnk5" />
    </Triggers>
  </asp:UpdatePanel>
  
  <!-- Content End --> 
  
</asp:Content>
