function performThisFunction(menuName) {
	if (menuName == "accountManagement") {
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("content").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "showaccountmanagement.jsp", true);
		xmlhttp.send();
	} else if (menuName == "applicantManagement") {
		
	} else if (menuName == "adminFieldsManagement") {
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("content").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "showadminfieldsmanagement.jsp", true);
		xmlhttp.send();
	} else if (menuName == "caseReviewManagement") {
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("content").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "showcasereviewmanagement.jsp", true);
		xmlhttp.send();
	} else if (menuName == "earlyResolutionManagement") {
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("content").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "showearlyresolutionmanagement.jsp", true);
		xmlhttp.send();
	} else if (menuName == "investigatorAssignmentManagement") {
		
	} else if (menuName == "investigationManagement") {
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("content").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "showinvestigationmanagement.jsp", true);
		xmlhttp.send();
	}else if(menuName == "caseManagement"){
		
	}else if(menuName == "followupManagement"){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("content").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "showfollowupmanagement.jsp", true);
		xmlhttp.send();
	}else if(menuName == "agreementManagement"){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("content").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "showagreementmanagement.jsp", true);
		xmlhttp.send();
	}else if(menuName == "caseCategoryManagement"){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("content").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "showcasecategorymanagement.jsp", true);
		xmlhttp.send();
	}else if(menuName == "respondentManagement"){
		
	}else if(menuName == "decisionManagement"){
		
	}else if(menuName == "reportManagement"){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("content").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "showreportmanagement.jsp", true);
		xmlhttp.send();
	}else if(menuName == "intakeProcessManagement"){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("content").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "showintakeprocessmanagementform.jsp", true);
		xmlhttp.send();
	}
}

function showApplicantsManagementInInnerDiv(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("intakeProcessDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showapplicantmanagement.jsp", true);
	xmlhttp.send();
}

function showCaseManagementInInnerDiv(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("intakeProcessDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showcasemanagement.jsp", true);
	xmlhttp.send();
}

function showDecisionManagementInInnerDiv(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("intakeProcessDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showdecisionmanagement.jsp", true);
	xmlhttp.send();
}

function showRespondentManagementInInnerDiv(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("intakeProcessDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showrespondentmanagement.jsp", true);
	xmlhttp.send();
}

function showAssignmentManagementInInnerDiv(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("intakeProcessDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showinvestigatorassignmentmanagement.jsp", true);
	xmlhttp.send();
}

function showReportDetailSelectionForThisReport(reportType){
	if(reportType == "intakeReportManagement"){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("reportDetailDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "showintakereportmanagementselectorbar.jsp", true);
		xmlhttp.send();
	}else{
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("reportDetailDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "showinvestigationreportmanagementselectorbar.jsp", true);
		xmlhttp.send();
	}
}

function showAddOptionsToFieldsForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showaddoptionstofieldsform.jsp", true);
	xmlhttp.send();
}

function showListOfOptionsOfFields(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofoptionsoffieldsselector.jsp", true);
	xmlhttp.send();
}

function showRoleManagement(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showrolemanagementuserselectorbar.jsp", true);
	xmlhttp.send();
}

function showEditFieldsOfThisApplicant(applicantId){	
	var divId = "applicantEditDiv"+applicantId;
	$('#'+divId).load('showeditfieldsofthisapplicant.jsp?applicantId='+applicantId);		
}

function hideEditFieldsOfThisApplicant(applicantId){	
	var divId = "applicantEditDiv"+applicantId;
	$('#'+divId).html('');
}

function showRoleForUser(userId) {
	// alert(userId);
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("roleDetailForEmployee").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showroleforuser.jsp?userId=" + userId, true);
	xmlhttp.send();
}

function showUserManagement(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showusermanagement.jsp", true);
	xmlhttp.send();
}

function createNewUser(fullName,userType,username,password){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "createnewuser.jsp?fullName="+fullName+"&userType="+userType+"&username="+username+
			"&password="+password, true);
	xmlhttp.send();
}





function updateUser(userId,fullName,userType){
	//alert(userId+":"+fullName+":"+userType);
	//var divId = "userEditDiv"+userId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updateuser.jsp?userId="+userId+"&fullName="+fullName+"&userType="+userType, true);
	xmlhttp.send();
}

function updateRole(roleId, accountId, functionalityId, chkRead, chkWrite,
		chkUpdate, chkDelete) {
	// now compose the check box names to get the actual selected item from the
	// list
	// alert(roleId+":"+accountId+":"+functionalityId+":"+chkRead+":"+chkWrite+":"+chkUpdate+":"+chkDelete);

	hasReadAccess = false;
	hasWriteAccess = false;
	hasUpdateAccess = false;
	hasDeleteAccess = false;

	if (chkRead.checked == true)
		hasReadAccess = true;
	if (chkWrite.checked == true)
		hasWriteAccess = true;
	if (chkUpdate.checked == true)
		hasUpdateAccess = true;
	if (chkDelete.checked == true)
		hasDeleteAccess = true;
	// ///////////////////////////////////////now comes the ajax...
	// alert("role id: "+roleId+"account id: "+accountId+" operation id:
	// "+operationId+" read : "+hasReadAccess+" : write : "+hasWriteAccess+" :
	// update : "+hasUpdateAccess+" : delete : "+hasDeleteAccess);
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("content").innerHTML = xmlhttp.responseText;
			document.getElementById("roleDetailForEmployee").innerHTML = "<strong><font color='green'>Role updated successfully!</font></strong>";
		}
	}
	xmlhttp.open("GET", "updaterole.jsp?roleId=" + roleId + "&accountId="
			+ accountId + "&functionalityId=" + functionalityId
			+ "&hasReadAccess=" + hasReadAccess + "&hasWriteAccess="
			+ hasWriteAccess + "&hasUpdateAccess=" + hasUpdateAccess
			+ "&hasDeleteAccess=" + hasDeleteAccess, true);
	xmlhttp.send();
}

function selectAllCheckBoxes(totalNumFun) {
	canReadChk = "";
	canWriteChk = "";
	canUpdateChk = "";
	canDeleteChk = "";

	hiddenRoleId = "";
	hiddenRoleIdVal = "";

	for (i = 1; i <= totalNumFun; i++) {
		hiddenRoleId = "hiddenroleid" + i;
		hiddenRoleIdVal = document.getElementById(hiddenRoleId).value;
		canReadChk = "chkcanread" + hiddenRoleIdVal;
		canWriteChk = "chkcanwrite" + hiddenRoleIdVal;
		canUpdateChk = "chkcanupdate" + hiddenRoleIdVal;
		canDeleteChk = "chkcandelete" + hiddenRoleIdVal;
		// alert(canReadChk);
		document.getElementById(canReadChk).checked = true;
		document.getElementById(canWriteChk).checked = true;
		document.getElementById(canUpdateChk).checked = true;
		document.getElementById(canDeleteChk).checked = true;
	}
}

function disselectAllCheckBoxes(totalNumFun) {
	// alert(totalNumFun);
	canReadChk = "";
	canWriteChk = "";
	canUpdateChk = "";
	canDeleteChk = "";

	hiddenRoleId = "";
	hiddenRoleIdVal = "";

	for (i = 1; i <= totalNumFun; i++) {
		hiddenRoleId = "hiddenroleid" + i;
		hiddenRoleIdVal = document.getElementById(hiddenRoleId).value;
		canReadChk = "chkcanread" + hiddenRoleIdVal;
		canWriteChk = "chkcanwrite" + hiddenRoleIdVal;
		canUpdateChk = "chkcanupdate" + hiddenRoleIdVal;
		canDeleteChk = "chkcandelete" + hiddenRoleIdVal;
		// alert(canReadChk);
		document.getElementById(canReadChk).checked = false;
		document.getElementById(canWriteChk).checked = false;
		document.getElementById(canUpdateChk).checked = false;
		document.getElementById(canDeleteChk).checked = false;
	}
}

function updateAllRoles(totalNumFun, accountId) {
	canReadChk = "";
	canWriteChk = "";
	canUpdateChk = "";
	canDeleteChk = "";
	hasReadAccess = false;
	hasWriteAccess = false;
	hasUpdateAccess = false;
	hasDeleteAccess = false;
	hiddenRoleId = "";
	hiddenRolIdVal = "";
	hiddenFunctionalityId = "";
	hiddenFunctionalityIdVal = "";

	// now i need to loop tru each check boxes....read thier value and save it
	// to the database...
	for (i = 1; i <= totalNumFun; i++) {
		hiddenRoleId = "hiddenroleid" + i;
		hiddenFunctionalityId = "hiddenfunctionalityid" + i;
		hiddenRoleIdVal = document.getElementById(hiddenRoleId).value;
		hiddenFunctionalityIdVal = document.getElementById(hiddenRoleId).value;

		canReadChk = "chkcanread" + hiddenRoleIdVal;
		canWriteChk = "chkcanwrite" + hiddenRoleIdVal;
		canUpdateChk = "chkcanupdate" + hiddenRoleIdVal;
		canDeleteChk = "chkcandelete" + hiddenRoleIdVal;

		if (document.getElementById(canReadChk).checked == true)
			hasReadAccess = true;
		if (document.getElementById(canWriteChk).checked == true)
			hasWriteAccess = true;
		if (document.getElementById(canUpdateChk).checked == true)
			hasUpdateAccess = true;
		if (document.getElementById(canDeleteChk).checked == true)
			hasDeleteAccess = true;
		// /////////now update the role value in the database...
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
			// Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				// document.getElementById("content").innerHTML =
				// xmlhttp.responseText;
				// document.getElementById("roleDetailForEmployee").innerHTML =
				// "<strong><font color='green'>Role updated
				// successfully!</font></strong>";
			}
		}
		xmlhttp
				.open("GET", "updaterole.jsp?roleId=" + hiddenRoleIdVal
						+ "&accountId=" + accountId + "&functionalityId="
						+ hiddenFunctionalityIdVal + "&hasReadAccess="
						+ hasReadAccess + "&hasWriteAccess=" + hasWriteAccess
						+ "&hasUpdateAccess=" + hasUpdateAccess
						+ "&hasDeleteAccess=" + hasDeleteAccess, true);
		xmlhttp.send();
		hasReadAccess = false;
		hasWriteAccess = false;
		hasUpdateAccess = false;
		hasDeleteAccess = false;
	}// end for loop

	document.getElementById("content").innerHTML = xmlhttp.responseText;
	document.getElementById("roleDetailForEmployee").innerHTML = "<strong><font color='green'>Role updated successfully!</font></strong>";
}

function showTheAllTheCasesThisInvestigatorHasBeenAssigned(investigatorName){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("allCasesOfInvestigatorDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showtheallthecasesthisinvestigatorhasbeenassigned.jsp?investigatorName="+investigatorName, true);
	xmlhttp.send();
}

function showCaseDetailsForThisCase(caseId){
	var divId = "assignmentDetailDiv"+caseId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showcasedetailsforthiscase.jsp?caseId="+caseId, true);
	xmlhttp.send();
}

function showCaseDetailsDuringInvestigatorAssignment(caseId){
	var divId = "assignmentDetailDiv"+caseId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showcasedetailsduringinvestigatorassignment.jsp?caseId="+caseId, true);
	xmlhttp.send();
}

function showListOfOptionsOfFieldsForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofoptionsoffieldsforeditselector.jsp", true);
	xmlhttp.send();
}

function showAllTheOptionValuesOfThisFieldName(fieldName){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("fieldDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showalltheoptionvaluesofthisfieldname.jsp?fieldName="+fieldName, true);
	xmlhttp.send();
}

function showListOfOptionsOfFieldsForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofoptionsoffieldsfordeleteselector.jsp", true);
	xmlhttp.send();
}

function showAllTheOptionValuesOfThisFieldNameForDelete(fieldName){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("fieldDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showalltheoptionvaluesofthisfieldnamefordelete.jsp?fieldName="+fieldName, true);
	xmlhttp.send();
}



function showAllTheOptionValuesOfThisFieldNameForEdit(fieldName){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("fieldDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showalltheoptionvaluesofthisfieldnameforedit.jsp?fieldName="+fieldName, true);
	xmlhttp.send();
}



function updateThisAdminFieldOption(id,optionValue,description){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("fieldDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updatethisadminfieldoption.jsp?id="+id+"&optionValue="+optionValue+"&description="+
			description, true);
	xmlhttp.send();
}



function generateNewFileNumber(fieldName){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(fieldName).value = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "generatenewfilenumber.jsp", true);
	xmlhttp.send();
}

function generateNewCaseIdNumber(fieldName){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(fieldName).value = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "generatenewcaseidnumber.jsp", true);
	xmlhttp.send();
}

function generateNewRespondentIdNumber(fieldName){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(fieldName).value = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "generatenewrespondentidnumber.jsp", true);
	xmlhttp.send();
}



function showTheReportDetailForSelectedReportTypeDuring(selectedReport,fromDate,toDate){
	//alert(selectedReport+":"+fromDate+":"+toDate);
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("TheReportDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", selectedReport+"?fromDate="+fromDate+"&toDate="+toDate, true);
	xmlhttp.send();
}

function updateApplicant(applicantId,applicantIdNumber,fullName,sex,ageCategory,maleApplicant,femaleApplicant,occupation,disability,
		region,zone,woreda,kebele,officeTelephone,homeTelephone,email,mobilePhone){
	var divId = "applicantEditDiv"+applicantId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updateapplicant.jsp?applicantIdNumber="+applicantIdNumber+"&fullName="+fullName+"&sex="+
			sex+"&ageCategory="+ageCategory+"&maleApplicant="+maleApplicant+"&femaleApplicant="+femaleApplicant+
			"&occupation="+occupation+"&disability="+disability+"&region="+region+"&zone="+zone+"&woreda="+
			woreda+"&kebele="+kebele+"&officeTelephone="+officeTelephone+"&homeTelephone="+homeTelephone+"&email="+email+
			"&mobilePhone="+mobilePhone+"&applicantId="+applicantId, true);
	xmlhttp.send();
}

function saveApplicant(applicantIdNumber,fullName,sex,ageCategory,maleApplicant,femaleApplicant,occupation,disability,
		region,zone,woreda,kebele,officeTelephone,homeTelephone,email,mobilePhone){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("content").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "saveapplicant.jsp?applicantIdNumber="+applicantIdNumber+"&fullName="+fullName+"&sex="+
			sex+"&ageCategory="+ageCategory+"&maleApplicant="+maleApplicant+"&femaleApplicant="+femaleApplicant+
			"&occupation="+occupation+"&disability="+disability+"&region="+region+"&zone="+zone+"&woreda="+
			woreda+"&kebele="+kebele+"&officeTelephone="+officeTelephone+"&homeTelephone="+homeTelephone+"&email="+email+
			"&mobilePhone="+mobilePhone, true);
	xmlhttp.send();
}

function saveAdminFieldValue(fieldName,optionValue,description){
	//alert(fieldName+":"+optionValue+":"+description);
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "saveadminfieldvalue.jsp?fieldName="+fieldName+"&optionValue="+optionValue+"&description="+
			description, true);
	xmlhttp.send();
}

function showNewAgreementForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "shownewagreementform.jsp", true);
	xmlhttp.send();
}

function showListOfAgreements(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofagreementsapplicantselectorbar.jsp", true);
	xmlhttp.send();
}

function showListOfAgreementsForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofagreementsapplicantforeditselectorbar.jsp", true);
	xmlhttp.send();
}

function showListOfAgreementsForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofagreementsapplicantfordeleteselectorbar.jsp", true);
	xmlhttp.send();
}

function showAllAgreementsForThisApplicant(applicantId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("agreementListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallagreementsforthisapplicant.jsp?applicantId="+applicantId, true);
	xmlhttp.send();
}

function showAllAgreementsForThisApplicantForEdit(applicantId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("agreementListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallagreementsforthisapplicantforedit.jsp?applicantId="+applicantId, true);
	xmlhttp.send();
}

function showAllAgreementsForThisApplicantForDelete(applicantId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("agreementListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallagreementsforthisapplicantfordelete.jsp?applicantId="+applicantId, true);
	xmlhttp.send();
}

function showEditFieldsOfThisAgreement(agreementId){
	var divId = "agreementEditDiv"+agreementId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showeditfieldsofthisagreement.jsp?agreementId="+agreementId, true);
	xmlhttp.send();
}

function deleteThisAgreement(agreementId){
	if(window.confirm("Are you sure you want to delete this agreement?")){
		var divId = "agreementEditDiv"+agreementId;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById(divId).innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "deletethisagreement.jsp?agreementId="+agreementId, true);
		xmlhttp.send();
	}
}

function updateAgreement(agreementId,caseId,respondentId,caseTheme,investigatorPointOfView,applicantStand,
		agreement,result,agreementDate,respondentStand){
	var divId = "agreementEditDiv"+agreementId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updateagreement.jsp?agreementId="+agreementId+"&caseId="+caseId+"&respondentId="+respondentId+
			"&caseTheme="+caseTheme+"&investigatorPointOfView="+investigatorPointOfView+"&applicantStand="+
			applicantStand+"&agreement="+agreement+"&result="+result+"&agreementDate="+agreementDate+"&respondentStand="+
			respondentStand, true);
	xmlhttp.send();
}

function saveAgreement(applicantId,caseId,respondentId,caseTheme,investigatorPointOfView,applicantStand,
		agreement,result,agreementDate,respondentStand){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "saveagreement.jsp?applicantId="+applicantId+"&caseId="+caseId+"&respondentId="+respondentId+
			"&caseTheme="+caseTheme+"&investigatorPointOfView="+investigatorPointOfView+
			"&applicantStand="+applicantStand+"&agreement="+agreement+"&result="+result+"&agreementDate="+agreementDate+
			"&respondentStand="+respondentStand, true);
	xmlhttp.send();
}

function showNewRespondentForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "shownewrespondentform.jsp", true);
	xmlhttp.send();
}

function showListOfRespondents(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofrespondents.jsp", true);
	xmlhttp.send();
}

function showListOfRespondentsForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofrespondentsforedit.jsp", true);
	xmlhttp.send();
}

function showListOfRespondentsForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofrespondentsfordelete.jsp", true);
	xmlhttp.send();
}





function updateRespondent(respondentId,name,structure,sector,region,woreda,kebele,telephone,mobile,fax,pobox,email,addressId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updaterespondent.jsp?respondentId="+respondentId+"&name="+name+
			"&structure="+structure+"&sector="+sector+"&region="+region+"&woreda="+woreda+"&kebele="+kebele+
			"&telephone="+telephone+"&mobile="+mobile+"&fax="+fax+"&pobox="+pobox+"&email="+email+"&addressId="+addressId, true);
	xmlhttp.send();
}

function saveRespondent(respondentIdNumber,name,structure,sector,region,woreda,kebele,telephone,mobile,fax,pobox,email){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "saverespondent.jsp?respondentIdNumber="+respondentIdNumber+"&name="+name+
			"&structure="+structure+"&sector="+sector+"&region="+region+"&woreda="+woreda+"&kebele="+kebele+
			"&telephone="+telephone+"&mobile="+mobile+"&fax="+fax+"&pobox="+pobox+"&email="+email, true);
	xmlhttp.send();
}

function showListOfApplicants(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofapplicantsfilterbar.jsp", true);
	xmlhttp.send();
}

function showListOfApplicantsForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofapplicantsfilterbarforedit.jsp", true);
	xmlhttp.send();
}

function showListOfApplicantsForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofapplicantsfilterbarfordelete.jsp", true);
	xmlhttp.send();
}

function deleteThisApplicantInformation(applicantId){
	if(window.confirm("Are you sure you want to delete this applicant?")){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "deletethisapplicantinformation.jsp?applicantId="+applicantId, true);
		xmlhttp.send();
	}
}

function showListOfApplicantsFromThisRegionZoneAndWoreda(region,zone,woreda){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("applicantListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofapplicantsfromthisregionzoneandworeda.jsp?region="+region+"&zone="+zone+
			"&woreda="+woreda, true);
	xmlhttp.send();
}

function showListOfApplicantsFromThisRegionZoneAndWoredaForEdit(region,zone,woreda){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("applicantListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofapplicantsfromthisregionzoneandworedaforedit.jsp?region="+region+"&zone="+zone+
			"&woreda="+woreda, true);
	xmlhttp.send();
}

function showListOfApplicantsFromThisRegionZoneAndWoredaForDelete(region,zone,woreda){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("applicantListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofapplicantsfromthisregionzoneandworedafordelete.jsp?region="+region+"&zone="+zone+
			"&woreda="+woreda, true);
	xmlhttp.send();
}




function showNewApplicantEntryForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "shownewapplicantentryform.jsp", true);
	xmlhttp.send();
}

function showNewDecisionEntryForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "shownewdecisionentryform.jsp", true);
	xmlhttp.send();
}

function showListOfDecisions(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofdecisionsapplicantselectorbar.jsp", true);
	xmlhttp.send();
}

function showListOfDecisionsForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofdecisionsapplicantforeditselectorbar.jsp", true);
	xmlhttp.send();
}

function showListOfDecisionsForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofdecisionsapplicantfordeleteselectorbar.jsp", true);
	xmlhttp.send();
}

function showAllDecisionsForThisApplicant(applicantId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("decisionListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showalldecisionsforthisapplicant.jsp?applicantId="+applicantId, true);
	xmlhttp.send();
}

function showAllDecisionsForThisApplicantForEdit(applicantId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("decisionListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showalldecisionsforthisapplicantforedit.jsp?applicantId="+applicantId, true);
	xmlhttp.send();
}

function showAllDecisionsForThisApplicantForDelete(applicantId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("decisionListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showalldecisionsforthisapplicantfordelete.jsp?applicantId="+applicantId, true);
	xmlhttp.send();
}

function updateDecision(decisionId,applicantId,caseId,respondentId,decisionGiven,notes,registrationDate){
	var divId = "decisionEditDiv"+decisionId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updatedecision.jsp?decisionId="+decisionId+"&applicantId="+applicantId+"&caseId="+caseId+
			"&respondentId="+respondentId+"&decisionGiven="+decisionGiven+"&notes="+notes+"&registrationDate="+registrationDate, true);
	xmlhttp.send();
}

function saveDecision(fileNumber,applicantId,caseId,respondentId,decisionGiven,notes,registrationDate){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "savedecision.jsp?fileNumber="+fileNumber+"&applicantId="+applicantId+"&caseId="+caseId+
			"&respondentId="+respondentId+"&decisionGiven="+decisionGiven+"&notes="+notes+"&registrationDate="+
			registrationDate, true);
	xmlhttp.send();
}

function showNewCaseCategoryForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "shownewcasecategoryform.jsp", true);
	xmlhttp.send();
}

function showListOfCaseCategories(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofcasecategories.jsp", true);
	xmlhttp.send();
}

function showListOfCaseCategoriesForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofcasecategoriesforedit.jsp", true);
	xmlhttp.send();
}

function showListOfCaseCategoriesForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofcasecategoriesfordelete.jsp", true);
	xmlhttp.send();
}

function updateCaseCategory(caseCategoryId,caseCategoryName,description){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updatecasecategory.jsp?caseCategoryId="+caseCategoryId+"&caseCategoryName="+
			caseCategoryName+"&description="+description, true);
	xmlhttp.send();
}

function saveCaseCategory(caseCategoryName,description){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "savecasecategory.jsp?caseCategoryName="+caseCategoryName+"&description="+description, true);
	xmlhttp.send();
}

function showNewFollowUpForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "shownewfollowupform.jsp", true);
	xmlhttp.send();
}

function showListOfFollowUps(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistoffollowupsapplicantselectorbar.jsp", true);
	xmlhttp.send();
}

function showListOfFollowUpsForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistoffollowupsapplicantforeditselectorbar.jsp", true);
	xmlhttp.send();
}

function showListOfFollowUpsForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistoffollowupsapplicantfordeleteselectorbar.jsp", true);
	xmlhttp.send();
}

function showAllFollowUpsForThisApplicantForEdit(applicantId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("followUpListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallfollowupsforthisapplicantforedit.jsp?applicantId="+applicantId, true);
	xmlhttp.send();
}

function showAllFollowUpsForThisApplicantForDelete(applicantId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("followUpListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallfollowupsforthisapplicantfordelete.jsp?applicantId="+applicantId, true);
	xmlhttp.send();
}



function deleteThisFollowUp(followUpId){
	if(window.confirm("Are you sure you want to delete this follow up information?")){
		var divId = "followUpEditDiv"+followUpId;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById(divId).innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "deletethisfollowup.jsp?followUpId="+followUpId, true);
		xmlhttp.send();
	}
}

function updateFollowUp(followUpId,caseId,respondentId,caseTheme,decisionGiven,followUpDate){
	var divId = "followUpEditDiv"+followUpId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updatefollowup.jsp?followUpId="+followUpId+"&caseId="+caseId+"&respondentId="+respondentId+
			"&caseTheme="+caseTheme+"&decisionGiven="+decisionGiven+"&followUpDate="+followUpDate, true);
	xmlhttp.send();
}

function showAllFollowUpsForThisApplicant(applicantId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("followUpListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallfollowupsforthisapplicant.jsp?applicantId="+applicantId, true);
	xmlhttp.send();
}

function saveFollowUp(applicantIdNumber,caseId,respondentId,caseTheme,decisionGiven,followUpDate){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "savefollowup.jsp?applicantIdNumber="+applicantIdNumber+"&caseId="+caseId+"&respondentId="+
			respondentId+"&caseTheme="+caseTheme+"&decisionGiven="+decisionGiven+"&followUpDate="+followUpDate, true);
	xmlhttp.send();
}

function showNewInvestigationForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "shownewinvestigationform.jsp", true);
	xmlhttp.send();
}

function showListOfInvestigations(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofinvestigationsapplicantselectorbar.jsp", true);
	xmlhttp.send();
}

function showListOfInvestigationsForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofinvestigationsapplicantforeditselectorbar.jsp", true);
	xmlhttp.send();
}

function showListOfInvestigationsForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofinvestigationsapplicantfordeleteselectorbar.jsp", true);
	xmlhttp.send();
}

function showAllInvestigationsForThisApplicant(applicantId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("investigationListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallinvestigationsforthisapplicant.jsp?applicantId="+applicantId, true);
	xmlhttp.send();
}

function showAllInvestigationsForThisApplicantForEdit(applicantId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("investigationListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallinvestigationsforthisapplicantforedit.jsp?applicantId="+applicantId, true);
	xmlhttp.send();
}

function showAllInvestigationsForThisApplicantForDelete(applicantId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("investigationListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallinvestigationsforthisapplicantfordelete.jsp?applicantId="+applicantId, true);
	xmlhttp.send();
}

function showMoreInformationForThisInvestigation(investigationId){
	var divId = "investigationDetailDiv"+investigationId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showmoreinformationforthisinvestigation.jsp?investigationId="+investigationId, true);
	xmlhttp.send();
}

function showEditFieldsOfThisInvestigation(investigationId){
	var divId = "investigationDetailDiv"+investigationId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showeditfieldsofthisinvestigation.jsp?investigationId="+investigationId, true);
	xmlhttp.send();
}

function deleteThisInvestigation(investigationId){
	if(window.confirm("Are you sure you want to delete this investigation?")){
		var divId = "investigationDetailDiv"+investigationId;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById(divId).innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "deleteinvestigation.jsp?investigationId="+investigationId, true);
		xmlhttp.send();
	}
}

function updateInvestigation(investigationId,caseId,respondentId,caseTheme,whatToRegister,terminationReason,caseStatus,
		investigationDate,nextJobAndDate){
	var divId = "investigationDetailDiv"+investigationId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updateinvestigation.jsp?investigationId="+investigationId+"&caseId="+caseId+"&respondentId="+
			respondentId+"&caseTheme="+caseTheme+"&whatToRegister="+whatToRegister+"&terminationReason="+terminationReason+
			"&caseStatus="+caseStatus+"&investigationDate="+investigationDate+"&nextJobAndDate="+nextJobAndDate, true);
	xmlhttp.send();
}

function showNewInvestigatorAssignmentForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "shownewinvestigatorassignmentform.jsp", true);
	xmlhttp.send();
}

function showListOfInvestigatorAssignments(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofinvestigatorassignmentsinvestigatorselectorbar.jsp", true);
	xmlhttp.send();
}

function showListOfInvestigatorAssignmentsForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofinvestigatorassignmentsinvestigatorforeditselectorbar.jsp", true);
	xmlhttp.send();
}

function showListOfInvestigatorAssignmentsForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofinvestigatorassignmentsinvestigatorfordeleteselectorbar.jsp", true);
	xmlhttp.send();
}

function showAllCasesAssignedToThisInvestigator(investigator){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("investigatorAssignmentDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallcasesassignedtothisinvestigator.jsp?investigator="+investigator, true);
	xmlhttp.send();
}

function showAllCasesAssignedToThisInvestigatorForEdit(investigator){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("investigatorAssignmentDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallcasesassignedtothisinvestigatorforedit.jsp?investigator="+investigator, true);
	xmlhttp.send();
}

function showAllCasesAssignedToThisInvestigatorForDelete(investigator){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("investigatorAssignmentDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallcasesassignedtothisinvestigatorfordelete.jsp?investigator="+investigator, true);
	xmlhttp.send();
}

function deleteThisInvestigationAssignment(assId){
	if(window.confirm("Are you sure you want to delete this investigator assignment?")){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById(divId).innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "deletethisinvestigatorassignment.jsp?assId="+assId, true);
		xmlhttp.send();
	}
}

function showNewEarlyResolutionEntryForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "shownewearlyresolutionentryform.jsp", true);
	xmlhttp.send();
}

function showListOfEarlyResolutionsForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofearlyresolutionfordeleteapplicantselectorbar.jsp", true);
	xmlhttp.send();
}

function showListOfEarlyResolutionsForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofearlyresolutionforeditapplicantselectorbar.jsp", true);
	xmlhttp.send();
}

function showListOfEarlyResolutions(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofearlyresolutionapplicantselectorbar.jsp", true);
	xmlhttp.send();
}

function showAllEarlyResolutionsForThisApplicant(applicantId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("earlyResolutionListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallearlyresolutionforthisapplicant.jsp?applicantId="+applicantId, true);
	xmlhttp.send();
}

function showAllEarlyResolutionsForThisApplicantForEdit(applicantId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("earlyResolutionListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallearlyresolutionforthisapplicantforedit.jsp?applicantId="+applicantId, true);
	xmlhttp.send();
}

function showAllEarlyResolutionsForThisApplicantForDelete(applicantId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("earlyResolutionListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallearlyresolutionforthisapplicantfordelete.jsp?applicantId="+applicantId, true);
	xmlhttp.send();
}

function updateEarlyResolution(earlyResolutionId,caseId,officerEffort,respondentResponse,applicantReaction,
		resolutionDate,result){
	var divId = "earlyResolutionEditDiv"+earlyResolutionId;
	//alert(divId);
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updateearlyresolution.jsp?earlyResolutionId="+earlyResolutionId+"&caseId="+caseId+
			"&officerEffort="+officerEffort+"&respondentResponse="+respondentResponse+"&applicantReaction="+
			applicantReaction+"&resolutionDate="+resolutionDate+"&result="+result, true);
	xmlhttp.send();
}

function saveEarlyResolution(applicantIdNumber,caseId,officerEffort,respondentResponse,applicantReaction,resolutionDate,
		result){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "saveearlyresolution.jsp?applicantIdNumber="+applicantIdNumber+"&caseId="+caseId+
			"&officerEffort="+officerEffort+"&respondentResponse="+respondentResponse+"&applicantReaction="+
			applicantReaction+"&resolutionDate="+resolutionDate+"&result="+result, true);
	xmlhttp.send();
}

function saveInvestigation(applicantId,caseId,respondent,caseTheme,registrationTheme,terminationReason,caseStatus,
		investigationDate,nextJobAndDate){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "saveinvestigation.jsp?applicantId="+applicantId+"&caseId="+caseId+
			"&respondent="+respondent+"&caseTheme="+caseTheme+"&registrationTheme="+
			registrationTheme+"&terminationReason="+terminationReason+"&caseStatus="+caseStatus+
			"&investigationDate="+investigationDate+"&nextJobAndDate="+nextJobAndDate, true);
	xmlhttp.send();
}

function showNewCaseEntryForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "shownewcaseentryform.jsp", true);
	xmlhttp.send();
}

function showListOfCases(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofcases.jsp", true);
	xmlhttp.send();
}

function showListOfCasesForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofcasesforedit.jsp", true);
	xmlhttp.send();
}

function showListOfCasesForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofcasesfordelete.jsp", true);
	xmlhttp.send();
}



function updateCase(caseId,theme,reliefSought,caseCategoryId,linkage,evidenceType,numberOfPages,meansOfApplication,appliedBy,applicantId){
	var divId = "caseEditDiv"+caseId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updatecase.jsp?caseId="+caseId+"&theme="+theme+"&reliefSought="+reliefSought+"&caseCategoryId="+
			caseCategoryId+"&linkage="+linkage+"&evidenceType="+evidenceType+"&numberOfPages="+numberOfPages+"&meansOfApplication="+
			meansOfApplication+"&appliedBy="+appliedBy+"&applicantId="+applicantId, true);
	xmlhttp.send();
}

function saveCase(caseIdNumber,theme,reliefSought,caseCategoryId,linkage,evedenceType,numberOfPages,meansOfApplication,
		appliedBy,applicantId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "savecase.jsp?caseIdNumber="+caseIdNumber+"&theme="+theme+"&reliefSought="+reliefSought+
			"&caseCategoryId="+caseCategoryId+"&linkage="+linkage+"&evedenceType="+evedenceType+"&numberOfPages="+
			numberOfPages+"&meansOfApplication="+meansOfApplication+"&appliedBy="+appliedBy+"&applicantId="+applicantId, true);
	xmlhttp.send();
}

function showNewCaseReviewEntryForm(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "shownewcasereviewentryform.jsp", true);
	xmlhttp.send();
}

function showListOfCaseReviews(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofcasereviewsapplicantselectorbar.jsp", true);
	xmlhttp.send();
}

function showAllCaseReviewsForThisApplicantForEdit(applicantId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("caseReviewListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallcasereviewsforthisapplicantforedit.jsp?applicantId="+applicantId, true);
	xmlhttp.send();
}

function deleteThisCaseReview(caseReviewId){
	if(window.confirm("Are you sure you want to delete this case review?")){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("caseReviewListDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "deletethiscasereview.jsp?caseReviewId="+caseReviewId, true);
		xmlhttp.send();
	}
}

function showAllCaseReviewsForThisApplicantForDelete(applicantId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("caseReviewListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallcasereviewsforthisapplicantfordelete.jsp?applicantId="+applicantId, true);
	xmlhttp.send();
}

function updateCaseReview(caseReviewId,caseId,respondentId,caseTheme,investigationRequired,reason){
	var divId = "caseReviewEditDiv"+caseReviewId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "updatecasereview.jsp?caseReviewId="+caseReviewId+"&caseId="+caseId+"&respondentId="+
			respondentId+"&caseTheme="+caseTheme+"&investigationRequired="+investigationRequired+"&reason="+reason, true);
	xmlhttp.send();
}

function showAllCaseReviewsForThisApplicant(applicantId){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("caseReviewListDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showallcasereviewsforthisapplicant.jsp?applicantId="+applicantId, true);
	xmlhttp.send();
}

function showListOfCaseReviewsForDelete(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofcasereviewsfordeleteapplicantselectorbar.jsp", true);
	xmlhttp.send();
}

function showListOfCaseReviewsForEdit(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showlistofcasereviewsforeditapplicantselectorbar.jsp", true);
	xmlhttp.send();
}

function saveCaseReview(applicantId,caseId,respondentId,caseTheme,investigationRequired,reason){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "savecasereview.jsp?applicantId="+applicantId+"&caseId="+caseId+"&respondentId="+respondentId+
			"&caseTheme="+caseTheme+"&investigationRequired="+investigationRequired+"&reason="+reason, true);
	xmlhttp.send();
}

function showChangeUsername(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showchangeusername.jsp", true);
	xmlhttp.send();
}

function changeUsername(currentUsername,newUsername,password){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "changeusername.jsp?currentUsername="+currentUsername+"&newUsername="+newUsername+"&password="+
			password, true);
	xmlhttp.send();
}

function showResetUsersAccount(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showresetuseraccount.jsp", true);
	xmlhttp.send();
}

function showResetUsernameAndPasswordFormForThisUser(userId){
	var divId = "userEditDiv"+userId;
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById(divId).innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showresetusernameandpasswordformforthisuser.jsp?userId="+userId, true);
	xmlhttp.send();
}

function resetThisUserAccount(userId,accountId,username,password){
	var divId = "userEditDiv"+userId;
	if(window.confirm("Are you sure you want to reset this user account?")){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById(divId).innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "resetthisuseraccount.jsp?accountId="+accountId+"&username="+username+"&password="+password, true);
		xmlhttp.send();
	}
}

function showChangePassword(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showchangepassword.jsp", true);
	xmlhttp.send();
}

function changePassword(currentUserame,currentPassword,newPassword,confirmationPassword){
	if(newPassword == confirmationPassword){
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "changepassword.jsp?currentUsername="+currentUsername+"&currentPassword="+currentPassword+
				"&newPassword="+newPassword+"&confirmationPassword="+confirmationPassword, true);
		xmlhttp.send();
	}
}

function showResetUsersAccount(){
	if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera,
		// Safari
		xmlhttp = new XMLHttpRequest();
	} else {// code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			document.getElementById("subTabDetailDiv").innerHTML = xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET", "showresetuseraccount.jsp", true);
	xmlhttp.send();
}

