/***************************************************************************************************************
 Created:	01/02/08	Daniel Hartley  - IP2236. .Net Integration. Javascript file included on .Net MasterPage
 Modified:	<see VSS for prior release history>
            02/02/10    Daniel Hartley  - IB2745. Fix Two Digit Date Validation and Conversion. Added isValidDate functions
            08/29/11    Derek Takamine  - B4653.  window.open error in javascript.js when name of host has a dash in it
            11/17/11    Daniel Hartley  - B4882.  Fix window.open error caused by dash not being replaced completely.
            01/11/12    Daniel Hartley  - B5099. Better enforce Level of Care entries to cover all Auth days
            09/12/2012	Daniel Hartley  - F5529. Fix fireOnChangeEvent.
****************************************************************************************************************/

var trToPrompt = null;
function promptForRow(btn, prompt){
    trToPrompt = btn.parentNode.parentNode;
    if(trToPrompt.getAttribute("orgClassName") == null || trToPrompt.getAttribute("orgClassName") == undefined) trToPrompt.setAttribute("orgClassName", trToPrompt.className);
    trToPrompt.className = "GridViewDeleteRow";
    
    isConfirmed = false;
    
    if(confirm(prompt))
        isConfirmed = true;
    else{
        trToPrompt.className = trToPrompt.getAttribute("orgClassName");
    }
    
    trToPrompt = null;
    return isConfirmed;
}

function deleteRowFromGridView(btn, itemName){
    return promptForRow(btn, "Are you sure you want to delete this " + itemName + "?");
}

function mouseOverRow(tr){
    // Only do MouseOvers if not prompting for delete
    if(trToPrompt == null){
        tr.setAttribute("orgClassName", tr.className);
        tr.className = "GridViewHoverRow";
    }
}

function mouseOutRow(tr){
    // Only do MouseOvers if not prompting for delete
    if(trToPrompt == null) tr.className = tr.getAttribute("orgClassName");
}

// Utility function used mostly by side menu navigation to show content in iframe.
// If necessary, re-routes to home.aspx to insure iframe exists since .aspx pages do not include iframe by default.
function navigateTo(url){
    var ifrm = $get("ifrm_Main");
    if(ifrm != null && ifrm != undefined){
        ifrm.src = url + (url.indexOf("?") >= 0 ? "&" : "?") + "dt=" + (new Date()).valueOf();
    }
    else{
        location.href = "home.aspx?iframeURL=" + escape(url);
    }
}

function resetParentSessionTimeRemaining(){
    var p = parent;
    var cur = document;
    while(p != null && p != undefined){
        if(p.resetSessionTimeRemaining != null && p.resetSessionTimeRemaining != undefined){ 
            p.resetSessionTimeRemaining();
            break;
        }
        else if(p.location.href == cur.location.href){
            break;
        }
        cur = p;
        p = p.parent;
    }
}

var isInitialResize = true;
var minIframeDocHeight = null; // Parent and iframed child have their own copy of this var.
function resizeParentIframe(minHeight){
    if (parent != null && parent != undefined) {
        if (parent.resizeIframe != null && parent.resizeIframe != undefined) {
            parent.minIframeDocHeight = null; // Always start by resetting parent's var to null.

            if (minHeight != null && minHeight != undefined) {
                if ((typeof minHeight) != "object") {
                    // If minHeight is specified, hold in iframed child var until explicitly 
                    // overwritten with another minHeight value. Once minHeight has been
                    // specified, it will never be null again for the iframed page's client-side lifetime
                    minIframeDocHeight = minHeight;
                }
            }

            // Assign minHeight to parent for use when resizing.
            // Will either be null if never specified, or the specified minHeight from a previous call.
            parent.minIframeDocHeight = minIframeDocHeight;

            if (isInitialResize) {
                parent.resizeIframe(true, false, true);
                isInitialResize = false;
            }
            else {
                parent.resizeIframe(false, false);
            }
        }
    }        
}


var orgSiteContentContainerWidth = null;

/*
resizeIframe notes:

Set jumpToTop to true in situations where you need to resize the iframe but after the resize is complete,
you don't want the browser to return to its pre-resize vertical scroll position (i.e. you don't mind if the resize
cause the browser to jump to the top of the screen).  The default behavior is to remember the scroll positions.
So, for example, when a user is scrolled to the bottom of the page and then resizes their window, you don't want to 
jump to the top of the page so you use the default behavior.  Also, if the page dynamically adds content 
via javascript that requires the iframe to be resized, you don't want to jump to the top of the page and disrupt what
the user was doing so you use the default behavior.  In other cases such as when a new page is first loaded in the iframe
you don't mind if the browser jumps to the top of the page so you set jumpToTop to true.

The resizing of the iframe may trigger the parent window's onresize event. So, by default, inside resizeIframe we set
disableNextResizeByParent to true, and in the onresize event in Home.aspx, we only call resizeIframe if 
disableNextResizeByParent is false. If it is true, we don't resize.  Inside resizeIframe, we use setInterval to reset
disableNextResizeByParent to true after 1 second, so the next time a user does resize their browser window, it will 
trigger the resizing of the iframe.  If we want to override this behavior we set enableNextParentResize to true.  
You'd really only want to override it in the call to resizeIframe from the parent window's onresize event.
*/

// Will prevent onresize event for parent window from resizingIframe
// This is for situations where the iframed document resizes the iframe, 
// which triggers the parent window's onresize event, which needlessly resizes the iframe again.
var disableNextResizeByParent = true;

function resizeIframe(jumpToTop, enableNextResizeByParent, doFullResize){
    disableNextResizeByParent = (!enableNextResizeByParent);
    
    var iframeName = "ifrm_Main";
    var iframeWin = window.frames[iframeName];
    var iframeEl = ($get ? $get(iframeName) : (document.all ? document.all[iframeName]: null));
    if (iframeEl && iframeWin){
        var scrollTop = 0;
        if(doFullResize){
            if(!jumpToTop){
                // remember vertical scroll position
                scrollTop = document.body.scrollTop;
                if (scrollTop == 0)
                {
                    if (window.pageYOffset)
                        scrollTop = window.pageYOffset;
                    else
                        scrollTop = (document.body.parentElement) ? document.body.parentElement.scrollTop : 0;
                }
            }
        
            if(minIframeDocHeight != null && minIframeDocHeight != undefined) 
                iframeEl.style.height = minIframeDocHeight + 40 + "px";
            else
                iframeEl.style.height = "auto"; // helps resize (for some) if new doc shorter than previous  
            
            var divSiteContentContainer = $get("divSiteContentContainer");
            if(orgSiteContentContainerWidth == null) // hold original container width
                orgSiteContentContainerWidth = divSiteContentContainer.style.width;
                
            // resize iframe to auto, to get the min width iframed document needs
            iframeEl.style.width = "auto";
            
            // resize site container width to original container width before attempting to resize iframe
            divSiteContentContainer.style.width = orgSiteContentContainerWidth;
        }
        
        // First Resize Height
        var docHt = getDocHeight(iframeWin.document);
        // need to add to height to be sure it will all show
        if (docHt){
            if(minIframeDocHeight != null && minIframeDocHeight != undefined) docHt = (docHt > minIframeDocHeight ? docHt : minIframeDocHeight);
            iframeEl.style.height = docHt + 40 + "px";
        }
        
        if(doFullResize){
            // Now Resize Width
            // hold min width needed
            var docWt = getDocWidth(iframeWin.document);        
            
            // resize iframe to 100%, to see if expanding to 100% is enough
            iframeEl.style.width = "100%";
            
            // if 100% is not enough, expand to min width needed, add 10px for IE
            if(iframeEl.offsetWidth < docWt) iframeEl.style.width = docWt + 10 + "px";
            
            // if resized iframe pushes width out, resize site container to new width
            var tblSiteMainContent = $get("tblSiteMainContent");
            divSiteContentContainer.style.width = tblSiteMainContent.offsetWidth + "px";        
            
            // Once Width has been adjusted resize Height again.
            iframeEl.style.height = "auto"; // helps resize (for some) if new doc shorter than previous        
            
            docHt = getDocHeight(iframeWin.document);
        }
        else{
            // Need to find height without using auto, use increments of 40            
            var curHt = parseInt(iframeEl.style.height.replace("px",""));
            docHt = getDocHeight(iframeWin.document);            
            while(curHt >= docHt){
                curHt -= 40;
                iframeEl.style.height = curHt + "px";
                docHt = getDocHeight(iframeWin.document);
            }
        }
            
        // need to add to height to be sure it will all show
        if (docHt){
            if(minIframeDocHeight != null && minIframeDocHeight != undefined) docHt = (docHt > minIframeDocHeight ? docHt : minIframeDocHeight);
            iframeEl.style.height = docHt + 40 + "px";
            
            if(doFullResize){
                if(document.all){
                    // IE 6 does some weird recursive firing of the resize event
                    // scrolling the window prevents this from happening, so we scroll down and 1, then back up 1
                    window.scrollBy(0, 1);
                    window.scrollBy(0, -1);
                }
            }
        }
            
        if(doFullResize){
            // return to original vertical scroll position
            if(!jumpToTop && scrollTop > 0) window.scrollBy(0, scrollTop);  // set the scroll position
        }
        
        // re-Enable Next resize of Parent.
        if(disableNextResizeByParent) setTimeout(reEnableNextResizeByParent, 1000);
    }
}

function reEnableNextResizeByParent(){
    disableNextResizeByParent = false;
}

function getDocHeight(doc) {
    var docHt = 0, sh, oh;
    if (doc.height)
        docHt = doc.height;
    else if (doc.body) {
        if (doc.body.scrollHeight) docHt = sh = doc.body.scrollHeight;
        if (doc.body.offsetHeight) docHt = oh = doc.body.offsetHeight;
        if (sh && oh) docHt = Math.max(sh, oh);
    }
    return docHt;
}

function getDocWidth(doc) {
    var docWt, sw, ow;
    if(doc.body){
        docWt = 0;
        if (doc.body.scrollWidth) docWt = sw = doc.body.scrollWidth;
        if (doc.body.offsetWidth) docWt = ow = doc.body.offsetWidth;
        if (sw && ow) docWt = Math.max(sw, ow);
    }
    return docWt;
}

function getQueryStringVariable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i=0;i<vars.length;i++) {
        var pair = vars[i].split("=");
        if (pair[0] == variable) {
            return pair[1];
        }
    }
    return null;
}


function displayInfoMessage(mess){
    if($get("InfoMessage") == null)
        alert(mess);
    else
        $get("InfoMessage").innerHTML = mess;
}

function displayErrorMessage(mess){
    alert(mess);
}

function displayMessageAndRedirect(mess, url){
    alert(mess);
    location.href = url;
}

function centerElement(objCtrl, topAdjustment){
    var objCtrlWidth = 0;
    var objCtrlHeight = 0;
    
    if(objCtrl.style.width != null && objCtrl.style.width != "")
        objCtrlWidth = parseInt(objCtrl.style.width.replace("px",""));
    else
        objCtrlWidth = objCtrl.offsetWidth;
        
    if(objCtrl.style.height != null && objCtrl.style.height != "")
        objCtrlHeight = parseInt(objCtrl.style.height.replace("px",""));
    else
        objCtrlHeight = objCtrl.offsetHeight;
    
    var hasParent = (parent != null && parent != undefined);
    
    if(hasParent) hasParent = (parent.document.location.href != document.location.href);
    
    var scrollTop;    
    
    if(hasParent){
        scrollTop = parent.document.body.scrollTop;
            
        if (scrollTop == 0)
        {
            if (parent.window.pageYOffset)
                scrollTop = parent.window.pageYOffset;
            else
                scrollTop = (parent.document.body.parentElement) ? parent.document.body.parentElement.scrollTop : 0;
        }
        
        objTop = scrollTop;
        
        if(scrollTop > 65) topAdjustment = -65;
    }
    else{
        scrollTop = document.body.scrollTop;
        if (scrollTop == 0)
        {
            if (window.pageYOffset)
                scrollTop = window.pageYOffset;
            else
                scrollTop = (document.body.parentElement) ? document.body.parentElement.scrollTop : 0;
        }
    }
        
    if(document.all){
	    objLeft = ((document.body.offsetWidth/2) - (objCtrlWidth/2));
	    if(!hasParent) objTop = ((document.body.offsetHeight/2) - (objCtrlHeight/2)) + scrollTop;
    }
    else{
	    objLeft = ((window.innerWidth/2) - (objCtrlWidth/2));
	    if(!hasParent) objTop = ((window.innerHeight/2) - (objCtrlHeight/2)) + scrollTop;
    }
    if(objLeft < 0) objLeft = 0;
    if(objTop < 0) objTop = 0;
    
    if(topAdjustment != null && topAdjustment != undefined) objTop += topAdjustment;
	
    objCtrl.style.left = objLeft + "px";
    objCtrl.style.top = objTop + "px";
}


// open new window centered on the screen
function openInNewWindow(url, name, w, h, options) {
    var left = 0;
    var top = 0;
    var opt;
 
    // determine if specific window.open options were passed...
    if (openInNewWindow.arguments.length > 4)
        opt = openInNewWindow.arguments[4];
    else
        opt = 'status=1,resizable=1,scrollbars=1,menubar=1';

    if (window.navigator.appName == "Microsoft Internet Explorer") {
        left = parent.window.screenLeft + ((parent.document.body.offsetWidth / 2) - (w / 2));
        top = parent.window.screenTop + ((parent.document.body.offsetHeight / 2) - (h / 2));
    }
    else {
        left = parent.window.screenX + ((parent.window.innerWidth / 2) - (w / 2));
        top = parent.window.screenY + ((parent.window.innerHeight / 2) - (h / 2));
    }

    name = name.toString().replace(/-/g, "");  // a Dash in tne name causes an invalid argument error.
    var newWin = window.open(url, name, opt + ",width=" + w + ",height=" + h + ",left=" + left + ",top=" + top);

    // pop-up blocked!
    if (newWin == null)
        alert("A popup window has been blocked.  Please make sure that any popup blockers are configured to allow popups from this site.");
    else
        newWin.focus();

    return newWin;
}


        
function popupRadioButtonSelected(lst, cnt, targetControlID, popExtBehaviorID){
    var btnPrefixID = lst.id;
    for(var i = 0; i < cnt; i++){
        var rdo = $get(btnPrefixID + "_" + i);
        if(rdo.checked){
            $get(targetControlID).value = rdo.value;
            $find(popExtBehaviorID).hidePopup();
            rdo.checked = false;
            break;
        }
    }
}


function popupCheckBoxSelected(chk, chkValue, chkDesc, targetValControlID, targetDescControlID){
    var targetValControl = $get(targetValControlID);
    var targetDescControl = $get(targetDescControlID);
    
    if(chk.checked){
        targetValControl.value += (targetValControl.value != "" ? "," : "") + chkValue;
        targetDescControl.value += (targetDescControl.value != "" ? "," : "") + chkDesc;
    }
    else{
        var vals = "," + targetValControl.value + ",";
        var descs = "," + targetDescControl.value + ",";
        vals = vals.replace("," + chkValue + ",", ",");        
        descs = descs.replace("," + chkDesc + ",", ",");
        if(vals.length > 1){
            targetValControl.value = vals.substring(1, vals.length - 1);
            targetDescControl.value = descs.substring(1, descs.length - 1);
        }
        else{
            targetValControl.value = "";
            targetDescControl.value = "";            
        }
    }
}


function closePopupCheckBox(popExtBehaviorID){
    $find(popExtBehaviorID).hidePopup();
}

/*
The following vars and functions enable multiple controls to reuse a single popup list.

For example, if you had a DataBound GridView with a TextBox in each row, where each TextBox
needed to popup an identical list of options to choose from.  You would define a single 
Panel/div to be popped up outside of the GridView, and set its appropriate javascript event
(i.e. onclick) to call the popupGlobalRadioButtonSelected function when the user selects an option.
Then add a PopupControlExtender to each GridViewRow next to each TextBox. Then in the 
RowDataBound event, for each row, you'd give each TextBox an onfocus attribute that calls 
setGlobalPopupExtVars passing the appropriate values.

The benefit is that only a single popup list needs to exist on the page, otherwise, a list 
would need to exist in each row, and if there are a lot of rows, the page would increase in size
dramatically.
*/
var globalPopupTargetControlID = "";
var globalPopupBhvr = null;

function setGlobalPopupExtVars(targetControlID, behaviorID){
    globalPopupTargetControlID = targetControlID;
    globalPopupBhvr = $find(behaviorID);
    
    var globalTargetCtrl = $get(targetControlID);
    
    $clearHandlers(globalTargetCtrl);
    
    //globalPopupBhvr._element = globalTargetCtrl;
    globalPopupBhvr._popupBehavior.set_parentElementID(targetControlID);
    
    globalPopupBhvr._popupBehavior.set_positioningMode(AjaxControlToolkit.PositioningMode.prototype.BottomLeft);
    //$find(globalPopupExtBehaviorID)._popupBehavior.setupPopup();
    
    $addHandler(globalTargetCtrl, 'focus', globalPopupBhvr._focusHandler);
    $addHandler(globalTargetCtrl, 'click', globalPopupBhvr._focusHandler);  // So that a dismissed popup can be more easily re-popped
    
    globalPopupBhvr.showPopup();
}

function popupGlobalRadioButtonSelected(rdoBtnLst, cnt, codeToExecuteAfterSelection){
    var rdoBtnLstPrefixID = rdoBtnLst.id;
    for(var i = 0; i < cnt; i++){
        var rdo = $get(rdoBtnLstPrefixID + "_" + i);
        if(rdo.checked){
            var globalTargetCtrl = $get(globalPopupTargetControlID);
            globalTargetCtrl.value = rdo.value;
            globalPopupBhvr.hidePopup();
            rdo.checked = false;
            if(codeToExecuteAfterSelection != null && codeToExecuteAfterSelection != undefined){
                eval(codeToExecuteAfterSelection);
            }
            break;
        }
    }
}


function popupGlobalCheckBoxSelected(chkBtnLst, cnt, codeToExecuteAfterSelection){
    var chkBtnLstPrefixID = chkBtnLst.id;
    for(var i = 0; i < cnt; i++){
        var chk = $get(chkBtnLstPrefixID + "_" + i);
        if(chk.checked){
            var globalTargetCtrl = $get(globalPopupTargetControlID);
            globalTargetCtrl.value = rdo.value;
            
        }
    }
}

function closeGlobalPopupCheckBox(codeToExecuteAfterSelection){
    globalPopupBhvr.hidePopup();            
    if(codeToExecuteAfterSelection != null && codeToExecuteAfterSelection != undefined){
        eval(codeToExecuteAfterSelection);
    }
}




var isUploading = false;
function showProgressBar(btnUpload, fileID, fileErrMessageID, checkForDesc, descElementID, descErrMessageID, actionOverrideURL){
    if(isUploading) return false;
    
    var errExists = false;
    
    var fileErrMessage = $get(fileErrMessageID);        
    if($get(fileID).value != ""){
        if(fileErrMessage != null && fileErrMessage != undefined) fileErrMessage.style.display = "none";
    }
    else{
        if(fileErrMessage != null && fileErrMessage != undefined) fileErrMessage.style.display = "";
        errExists = true;
    }
    
    if(checkForDesc){
        var descErrMessage = $get(descErrMessageID);
        if($get(descElementID).value != ""){
            descErrMessage.style.display = "none";
        }
        else{
            descErrMessage.style.display = "";
            errExists = true;
        }
    }
    
    if(errExists) return false;
        
    isUploading = true;
    btnUpload.readonly = true;
    btnUpload.value = "Uploading, please wait....";
    
    if(document.all)
        btnUpload.width = "170"
    else
        btnUpload.style.width = "170px;"
    
    var form = document.forms[0];
    
    var action = decodeURI(form.action);
    
    if(actionOverrideURL != null && actionOverrideURL != undefined && actionOverrideURL != ""){
        action = actionOverrideURL;
    }
    
    // Remove old UploadID if it exists.
    var orgStartPos = action.indexOf("?UploadID=");            
    wasFirstParam = (orgStartPos >= 0);            
    if(!wasFirstParam) orgStartPos = action.indexOf("&UploadID=");            
    
    if(orgStartPos >= 0){
        var orgEndPos = action.indexOf("&", orgStartPos + 1);                
        var hasOtherParam = (orgEndPos >= 0);                
        if(!hasOtherParam) orgEndPos = action.length; 
        
        var orgUploadID = action.substring(orgStartPos, orgEndPos);
        
        action = action.replace(orgUploadID, "");
        
        if(wasFirstParam && hasOtherParam) action = "?" + action.substring(1);
    }
    
    // Generate Unique UploadID
    var uploadID = (new Date()).getTime() % 1000000000;            
    
    // Append UploadID to form's action
    // Allows the upload to be tracked via query string by UploadModule.cs
    action = action + (action.indexOf("?") >= 0 ? "&" : "?") + "UploadID=" + uploadID
    
    form.action = action;
    
    // Append UploadID to querystring for ProgressBar.aspx.
    // ProgressBar.aspx will refresh itself and request upload information using the UploadID querystring parameter
    window.open("ProgressBar.aspx?UploadID=" + uploadID, uploadID, "toolbar=0,scrollbars=0,location=0,status=0,menubar=0,resizable=0,height=130,width=400,top=70,left=100");
    
    return true;
}


function decodeHTML(s) {
    return s.toString().replace(/&amp;/g,"&").replace(/&quot;/g,"\"").replace(/&lt;/g,"<").replace(/&gt;/g,">");
}


function resizeParentIframeForCalendar(sender, e){
    var heightWithCal = getDocHeight(document);
    heightWithCal += 150;
    resizeParentIframe(heightWithCal);
}

// AJAX call to search Milliman's site for results.  Returns clickable image icon.
// Added dummy datetime parameter to prevent caching of requests to troubleshoot IE freezing during asynch calls...
function careGuideline_PostRequest(strCategory, strArgument, intMode, strSpanResultsName){
    var response, el;
    var now = new Date();
    var nocache = now.getYear().toString() + now.getMonth().toString() + now.getDate().toString() + now.getHours().toString() + now.getMinutes().toString() + now.getSeconds().toString();
	
    var url = "careGuideline_Search.asp?strCategory=" + strCategory + "&strArgument=" + strArgument + "&intMode=" + intMode + "&Now=" + nocache;

    var objXMLHttp = getXMLHttp();
    if (objXMLHttp != null) {				
        objXMLHttp.open("GET", url, true);
        // Register a callback for the call		
        objXMLHttp.onreadystatechange = function() {	
												        if (objXMLHttp.readyState == 4 && objXMLHttp.status == 200) {  //TODO: NEED TO WRAP IN A TRY / CATCH BLOCK HERE?
													        response = objXMLHttp.responseText;
													        if (response != ""){
													            el = $get(strSpanResultsName);
														        el.innerHTML = response;   
													        }
													        objXMLHttp = null;
												        }
											       };

        // Send the actual request.  'true' specifies that it's an async call
        objXMLHttp.send(null);
    }
}

// Setup client-side XMLHTTP object
function getXMLHttp(){        	
    var objXMLHttp;        	   
    try
    {
        objXMLHttp = new XMLHttpRequest();  //IE7, Firefox, Safari
    }
    catch(e)
    {
        try
        {
	        objXMLHttp = new ActiveXObject("MSXML2.XMLHTTP"); //later IE
        }
        catch (e)
        {
	        objXMLHttp = null;
        }
    }

    if (objXMLHttp == null) objXMLHttp = new ActiveXObject("Microsoft.XMLHTTP"); //earlier IE

    return objXMLHttp;
}

// Generic ajax call, should cover most needs, needs to be tested more thoroughly
function makeXMLHttpRequest(url, isAsync, callbackFunc, postData){
    var objXMLHttp = getXMLHttp();
    if (objXMLHttp != null){
		if(postData == undefined) postData = null;
        objXMLHttp.open((postData != null ? "POST" : "GET"), url, isAsync);
        if(isAsync){
            // Register a callback for the call
            if(callbackFunc != null){
                objXMLHttp.onreadystatechange = function (){
			                                        if (objXMLHttp.readyState == 4 && objXMLHttp.status == 200)
				                                        callbackFunc(objXMLHttp);
						                        };
			}
        }

		if(postData != null) objXMLHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");			  
        
		objXMLHttp.send(postData);
        
        if(!isAsync && callbackFunc != null) callbackFunc(objXMLHttp);		
    }
}


/*
Returns object that with top and left properties that can be used like so:
var pos = getElementPosition(id);
alert(pos.top);
alert(pos.left);
*/
function getElementPosition(elemID){
    var obj = document.getElementById(elemID);
    var offsetLeft = 0;
    var offsetTop = 0;
    
    if(obj.x){
        offsetLeft = obj.x;
        offsetTop = obj.y;
    }
    else if(obj.offsetParent){
        while (obj){
            offsetLeft += obj.offsetLeft;
            offsetTop += obj.offsetTop;
            obj = obj.offsetParent;
        }
    }
    
    // Substract 7 for Safari? Seems to work not sure why?  
    // Other note: Safari has issue when text is wrapped in cell..doesn't calculate position correctly
    if (navigator.userAgent.indexOf('Safari') != -1){
        offsetTop -= 7;
    }
    
    // Add 7 for Chrome? Seems to work not sure why?
    if (navigator.userAgent.indexOf('Chrome') != -1){
        offsetTop += 7;
    }
    
    // Subtract 2 for Opera? Seems to work not sure why?
    if (navigator.userAgent.indexOf('Opera') != -1){
        offsetTop -= 1;
    }
    
    // Not sure if this is needed for Mac
    if (navigator.userAgent.indexOf('Mac') != -1 && typeof document.body.leftMargin != 'undefined'){
        offsetLeft += document.body.leftMargin;
        offsetTop += document.body.topMargin;
    }
    
    return {left:offsetLeft,top:offsetTop};
}


// shared/basic popup functionality goes here.
// adds background image to make it modal if desired
// Special IE6-specific logic to prevent certain controls from bleeding through 
function showPopupBase(divPopupID, isModal, useBGColor){
    resetParentSessionTimeRemaining();
    
    if(isModal) showModalBGBase(divPopupID, useBGColor);
    
    var divPopup = $get(divPopupID);
    centerElement(divPopup);
    divPopup.style.zIndex = 99;
    divPopup.style.display = "";
    
    //IE 6 needs to use tricks to block out background elements
    //was using iframe shim, but easier to just set visibility of all 
    //drop down lists to hidden. Except those that are marked with donothide="1" attribute (they may be on the popup)
    if(document.all && navigator.appVersion.indexOf("MSIE 6") >= 0){
        var ddls = document.getElementsByTagName("select");
        for(var i = 0; i < ddls.length; i++){
            var ddl = ddls.item(i);
            if(ddl.style.visibility != 'hidden' && ddl.getAttribute("donothide") != "1"){
                if(ddl.style.visibility != null && ddl.style.visibility != undefined){
                    ddl.setAttribute("oldVisibility", ddl.style.visibility);
                }
                ddl.style.visibility = 'hidden';
            }
        }
    }
}
function showModalBGBase(id, useBGColor){    
    var imgBck = $get(id + "_imgModalBG");
    if(imgBck == null || imgBck == undefined){
        imgBck = document.createElement("img");
        imgBck.id = id + "_imgModalBG";
        
        imgBck.src = "./images/spacer.gif";        
        imgBck.className = "PopupModalBackground";
        
        if(useBGColor != null && useBGColor != undefined && useBGColor) imgBck.style.backgroundColor = "#cccccc";
        
        imgBck.style.height = document.body.offsetHeight;
        
        document.body.appendChild(imgBck);
    }
    imgBck.style.width = "100%";
	imgBck.style.height = "100%";
    imgBck.style.display = "";
}
function hideModalBGBase(id){
    var imgBck = $get(id + "_imgModalBG");
    if(imgBck != null && imgBck != undefined) imgBck.style.display = "none";
    
}
function closePopupBase(divPopupID){
    resetParentSessionTimeRemaining();
    var div = $get(divPopupID);
    if(div != null && div != undefined){
        div.style.display = "none";
        hideModalBGBase(divPopupID);
        var ddls = document.getElementsByTagName("select");
        for(var i = 0; i < ddls.length; i++){
            var ddl = ddls.item(i);
            if(ddl.style.visibility == 'hidden' && ddl.getAttribute("donothide") != "1"){
                if(ddl.getAttribute("oldVisibility") != null && ddl.getAttribute("oldVisibility") != undefined){
                    ddl.style.visibility = ddl.getAttribute("oldVisibility");
                    ddl.removeAttribute("oldVisibility")
                }
                else{
                    ddl.style.visibility = '';
                }
            }
        }
    }
}


function clickOnce(itm, skipCSS){
    if(itm.getAttribute('WasClicked'))
        return false;
    else{
        itm.setAttribute('WasClicked', '1');
        if(skipCSS == null || skipCSS == undefined || !skipCSS) itm.className = 'ButtonStandardDisabled';
        return true;
    }
}


// functions for collapsing/expanding table row notes.
function showHideAllDetails(img, trID, colIndexWithIcon){
    var isCollapse = (img.src.toLowerCase().indexOf("collapse") >= 0);

    var i = 0;
    var tr = $get(trID);
    tr = getNextSibling(tr, "tr");         
    while(tr != null){
        if(tr.id.toLowerCase().indexOf("trrowgroupdetails") >= 0){
            tr.className = (isCollapse ? tr.getAttribute("org_class") : (i % 2 == 0 ? "GridViewAltRow" : "GridViewRow"));
            tr.style.display = (isCollapse ? "none" : "");
            i++;
        }
        else if(tr.id.toLowerCase().indexOf("trrowgroupheader") >= 0){
            tr.className = (isCollapse ? tr.getAttribute("org_class") : (i % 2 == 0 ? "GridViewAltRow" : "GridViewRow"));
            
            var isExpandable = false;
            
            var trTmp = getNextSibling(tr, "tr");
            if(trTmp != null) isExpandable = (trTmp.id.toLowerCase().indexOf("trrowgroupdetails") >= 0);
            
            if(isExpandable){
                tr.cells.item(colIndexWithIcon).innerHTML = tr.cells.item(colIndexWithIcon).innerHTML.replace((isCollapse ? "images/collapse_vert" : "images/expand_vert"), (isCollapse ? "images/expand_vert" : "images/collapse_vert"));
            }
            else{
                i++;
            }
            
        }
        
        tr = getNextSibling(tr, "tr");
    }
    
    img.src = img.src.toLowerCase().replace((isCollapse ? "collapse" : "expand"), (isCollapse ? "expand" : "collapse"));
}

function showHideDetails(img, trID, hdrClass){
    var isCollapse = (img.src.toLowerCase().indexOf("collapse") >= 0);

    var tr = $get(trID);
    tr.className = (isCollapse ? tr.getAttribute("org_class") : hdrClass);
    
    tr = getNextSibling(tr, "tr");    
    if(tr != null && tr.id.toLowerCase().indexOf("trrowgroupdetails") >= 0){
        var useExpandCollapseAnimation = true;
        if(useExpandCollapseAnimation){
            var td = tr.cells.item(0);
            var div = $get(tr.id + "_div");
            if(div != null && div != undefined){
                div.style.height = "auto";
                div.style.overflow = "visible";
            }
            
            tr.style.display = "";
            var contentHeight = td.offsetHeight;
            tr.style.display = "none";
            
            if(div == null || div == undefined){        
                td.innerHTML = "<div id=\"" + tr.id + "_div" + "\">" + td.innerHTML + "</div>";
                div = $get(tr.id + "_div");
            }
            
            div.style.overflow = "hidden";
            tr.style.display = "";            
            
            var heightInterval = 20;
            var numOfResizes = (contentHeight/heightInterval);
            while(numOfResizes > 10){ // limit to 10 loops
                heightInterval += 20;
                numOfResizes = (contentHeight/heightInterval);
            }
            var timeInterval = 50;
            /*
            alert("contentHeight: " + contentHeight + "\n"
                + "initialNumOfResizes: " + (contentHeight/heightInterval) + "\n"
                + "heightInterval: " + heightInterval + "\n"
                + "numOfResizes: " + numOfResizes + "\n"
                + "timeInterval: " + timeInterval + "\n");
            */
            
            if(!isCollapse){
                tr.className = hdrClass;
                expandTR(tr, div, 0, contentHeight, heightInterval, timeInterval);
            }
            else
                collapseTR(tr, div, contentHeight, heightInterval, timeInterval);
        }
        else{
            tr.className = (isCollapse ? tr.getAttribute("org_class") : hdrClass);
            tr.style.display = (isCollapse ? "none" : "");        
        }
    }
    
    img.src = img.src.toLowerCase().replace((isCollapse ? "collapse" : "expand"), (isCollapse ? "expand" : "collapse"));
}

function expandTR(tr, div, height, contentHeight, heightInterval, timeInterval){
    height += heightInterval;
    if(height < contentHeight){
        div.style.height = height + "px";
        setTimeout(function (){ expandTR(tr, div, height, contentHeight, heightInterval, timeInterval); }, timeInterval);
    }
    else{
        div.style.overflow = "visible";
        div.style.height = "auto";
    }
}

function collapseTR(tr, div, height, heightInterval, timeInterval){
    height -= heightInterval;
    if(height > 0){
        div.style.height = height + "px";
        setTimeout(function (){ collapseTR(tr, div, height, heightInterval, timeInterval); }, timeInterval);
    }
    else{
        tr.className = tr.getAttribute("org_class");
        tr.style.display = "none";
        div.style.height = "auto";
    }
}

function getNextSibling(element, tag){
    tag = tag.toLowerCase();
    
    var nxt = element.nextSibling;
    while(nxt != null){
        if(nxt != null && nxt.nodeName.toLowerCase() == tag) return nxt;
        nxt = nxt.nextSibling;
    }
    
    return null;
}
        
// programmatically fire onchange event
function fireOnChangeEvent(element) {
    //On Gecko based browsers
    if(document.createEvent)
    {
        var evt = document.createEvent("HTMLEvents");
        if(evt.initEvent)
        {
            evt.initEvent("change", true, true);
        }
        if(element.dispatchEvent)
        {
            element.dispatchEvent(evt);
        }
    }
    else if (element.fireEvent) {
        element.fireEvent("onchange");
    }
}












// Designed for HTML form validation.  Will trim leading and trailing spaces and convert
// a two-digit year to a four-digit year, affecting the original HTML form object.
// Optional params: argument[1] = force 4 digit year.
//					argument[2] = min year.
//					argument[3] = max year.
function isValidDate(objHTMLFormElem) {
    var strSeparatorArray = new Array("-", "/");
    var result = true;
    var i;
    var bln4Digits;
    var intMinYear = 1850;
    var intMaxYear = 9999;

    // Look for optional parameter that can force 4-digit years.
    if (isValidDate.arguments.length > 1) {
        bln4Digits = isValidDate.arguments[1];
        if (isValidDate.arguments.length == 4) {
            intMinYear = parseInt(isValidDate.arguments[2], 10);
            intMaxYear = parseInt(isValidDate.arguments[3], 10);
        }
    } else {
        bln4Digits = false;
    }

    // Trim spaces from left and right
    var strDate = objHTMLFormElem.value.replace(/^\s+/g, '').replace(/\s+$/g, '');
    objHTMLFormElem.value = strDate;

    // Loop through date separators...
    for (i = 0; i < strSeparatorArray.length; i++) {

        // matched separator
        if (strDate.indexOf(strSeparatorArray[i]) != -1) {

            // split into mm dd yyyy elements
            var elems = strDate.split(strSeparatorArray[i]);
            result = (elems.length == 3);

            // test each element.  must be all numbers + fit in proper range.
            if (result) {
                var month = parseInt(elems[0], 10);
                var day = parseInt(elems[1], 10);
                var year = parseInt(elems[2], 10);
                result = isAllDigits(elems[0]) && (month > 0) && (month < 13) && (elems[0].length <= 2) &&
						 isAllDigits(elems[1]) && (day > 0) && (day < 32) && (elems[1].length <= 2) &&
						 isAllDigits(elems[2]) && ((elems[2].length == 2) || (elems[2].length == 4));

                // Sometimes, we might require a 4-digit year input.
                if ((bln4Digits) && (elems[2].length != 4))
                    result = false;

                // if a two-digit year, assume it is 21st century, not 20th century.
                // set the value on the originating HMTL form object!
                if (result) {
                    if (elems[2].length == 2) {
                        strDate = elems[0] + '/' + elems[1] + '/' + (year + (year > 29 ? 1900 : 2000));
                        objHTMLFormElem.value = strDate;
                    } else {
                        //insure date is realistic
                        if ((year < intMinYear) || (year > intMaxYear)) {
                            result = false;
                        }

                    }

                    // Now verify that the date is actual real, i.e. 02/30/04 or 06/31/04 is invalid
                    // even though it matches a basic date format.  Take advantage of the fact that
                    // javascript Date() constructor will automatically convert 02/30/04 into 03/01/04.
                    if (result) {
                        var dateCheck = new Date(strDate);
                        var month2 = dateCheck.getMonth() + 1;
                        var day2 = dateCheck.getDate();
                        if ((month != month2) || (day != day2)) {
                            result = false;
                        }
                    }
                }
                return (result);
            }
        }
    }
    return false;
}

// Designed for HTML form validation.  Will trim leading and trailing spaces and convert
// a two-digit year to a four-digit year, affecting the original HTML form object.
// Optional params: argument[1] = force 4 digit year.
//					argument[2] = min year.
//					argument[3] = max year.
function isValidDateTime(objHTMLFormElem) {

    var result = true;
    var bln4Digits = false;

    // Look for optional parameter that can force 4-digit years.
    if (isValidDateTime.arguments.length > 1)
        bln4Digits = isValidDateTime.arguments[1];

    // Trim spaces from left and right
    var strDate = objHTMLFormElem.value.replace(/^\s+/g, '').replace(/\s+$/g, '');
    objHTMLFormElem.value = strDate;

    // Check for existence of separate date/time values (allow split for am/pm)
    var pos = strDate.indexOf(' ');
    if (pos != -1) {
        var strTime = strDate.substring(pos + 1);
        strDate = strDate.substr(0, pos);
    } else
        return (false);

    // Validate date
    objHTMLFormElem.value = strDate;
    if (!isValidDate(objHTMLFormElem, bln4Digits)) {
        objHTMLFormElem.value = strDate + ' ' + strTime;
        return (false);
    }

    // Add back the time since the date validation would have truncated it...
    objHTMLFormElem.value = objHTMLFormElem.value + ' ' + strTime;

    // Validate time
    if (!isValidTime(strTime))
        return (false);

    return (true);
}

// Validate time value.  Accept 12 hour clock format with am/pm, or 24 hour clock format.
function isValidTime(time) {

    var regex = /^(\d{1,2}):(\d{2})(?::?\d{2})?\s?([ap]m)?$/;  // Remember match of HH MM AM/PM.  Allow SS but do not remember for match.
    var parts;

    time = stripWhiteSpace(time).toLowerCase();
    if (time != '') {
        if (time.match(regex)) {
            parts = time.match(regex);
            hours = parts[1];
            minutes = parts[2];

            // 12-hour time format AM/PM
            if (parts[3]) {
                if (hours < 1 || hours > 12)
                    return (false);
            } else {
                if (hours > 23)
                    return (false);
            }

            if (minutes > 59)
                return (false);
        } else
            return (false);

        return (true);
    }
}

function isAllDigits(val) {
    var regExpDigits = new RegExp(/^\d+$/g);
    return regExpDigits.test(val);
}

// Designed for HTML form validation.  Will trim leading and trailing spaces and convert
// a two-digit year to a four-digit year, affecting the original HTML form object.
// Optional params: argument[1] = force 4 digit year.
//					argument[2] = min year.
//					argument[3] = max year.
function isValidDateFormat(theDate) {
    var strSeparatorArray = new Array("-", "/");
    var result = true;
    var i;

    // Trim spaces from left and right
    var strDate = theDate.replace(/^\s+/g, '').replace(/\s+$/g, '');
      
    // Loop through date separators...
    for (i = 0; i < strSeparatorArray.length; i++) {
        // matched separator
        if (strDate.indexOf(strSeparatorArray[i]) != -1) {

            //remove time
            var elemTime = strDate.split(' ');

            if (elemTime.length > 1)
                strDate = elemTime[0];

            // split into mm dd yyyy elements
            var elems = strDate.split(strSeparatorArray[i]);
            result = (elems.length == 3);

            // test each element.  must be all numbers + fit in proper range.
            if (result) {
                var month = parseInt(elems[0], 10);
                var day = parseInt(elems[1], 10);
                var year = parseInt(elems[2], 10);
                result = isAllDigits(elems[0]) && (month > 0) && (month < 13) && (elems[0].length <= 2) &&
						 isAllDigits(elems[1]) && (day > 0) && (day < 32) && (elems[1].length <= 2) &&
						 isAllDigits(elems[2]) && ((elems[2].length == 2) || (elems[2].length == 4));              

                // if a two-digit year, assume it is 21st century, not 20th century.
                // set the value on the originating HMTL form object!
                if (result) {
                    if (elems[2].length == 2) {
                        strDate = elems[0] + '/' + elems[1] + '/' + (year + (year > 29 ? 1900 : 2000));                        
                    }

                    // Now verify that the date is actual real, i.e. 02/30/04 or 06/31/04 is invalid
                    // even though it matches a basic date format.  Take advantage of the fact that
                    // javascript Date() constructor will automatically convert 02/30/04 into 03/01/04.
                    if (result) {
                        var dateCheck = new Date(strDate);
                        var month2 = dateCheck.getMonth() + 1;
                        var day2 = dateCheck.getDate();
                        if ((month != month2) || (day != day2)) {
                            result = false;
                        }
                    }
                }
                return (result);
            }
        }
    }
    return false;
}

