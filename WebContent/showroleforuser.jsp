<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
    int uId = Integer.parseInt(request.getParameter("userId"));
    String ctrName = null;    
    User userObj = User.getUser(uId);    
    Account acctForUser = Account.getAccountForUser(userObj.getId());    
    List<Role> roleList = Role.getAllRolesForAccount(acctForUser);
    //now its time to display the roles in a greed the way Ermi wants it...with a check box
    Iterator<Role> roleItr = roleList.iterator();
    %>
    <table border='0' width='100%'>
    		<tr class='best-header'>
    		<th align='center'><label id="lblserialnumber"><%
					String lblSerialNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblserialnumber");
					label = Label.getLabelUsingLabelId("lblserialnumber");
					out.print(lblSerialNumber != null ? lblSerialNumber : label.getLabelCaption());
				%></label></th>
	    <th align='center'><label id="lblaccount"><%
					String lblAccount = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblaccount");
					label = Label.getLabelUsingLabelId("lblaccount");
					out.print(lblAccount != null ? lblAccount : label.getLabelCaption());
				%></label></th>
	    <th align='center'><label id="lblmenu"><%
					String lblMenu = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblmenu");
					label = Label.getLabelUsingLabelId("lblmenu");
					out.print(lblMenu != null ? lblMenu : label.getLabelCaption());
				%></label></th>
	    <th align='center'><label id="lblcanread"><%
					String lblCanRead = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcanread");
					label = Label.getLabelUsingLabelId("lblcanread");
					out.print(lblCanRead != null ? lblCanRead : label.getLabelCaption());
				%></label></th>
	    <th align='center'><label id="lblcanwrite"><%
					String lblCanWrite = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcanwrite");
					label = Label.getLabelUsingLabelId("lblcanwrite");
					out.print(lblCanWrite != null ? lblCanWrite : label.getLabelCaption());
				%></label></th>
	    <th align='center'><label id="lblcanupdate"><%
					String lblCanUpdate = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcanupdate");
					label = Label.getLabelUsingLabelId("lblcanupdate");
					out.print(lblCanUpdate != null ? lblCanUpdate : label.getLabelCaption());
				%></label></th>
	    <th align='center'><label id="lblcandelete"><%
					String lblCanDelete = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcandelete");
					label = Label.getLabelUsingLabelId("lblcandelete");
					out.print(lblCanDelete != null ? lblCanDelete : label.getLabelCaption());
				%></label></th>
	    <th align='center'><label id="lblupdate"><%
					String lblUpdate = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblupdate");
					label = Label.getLabelUsingLabelId("lblupdate");
					out.print(lblUpdate != null ? lblUpdate : label.getLabelCaption());
				%></label></th>
    <%
    int index = 1;    
    int totalNumberOfFunctionality = roleList.size();
    //out.print("there are "+totalNumberOfFunctionality);
    int roleIdContainer[] = new int[totalNumberOfFunctionality];
    int arrayIndex = 0;
    int accountIdPara = 0;
    
    while (roleItr.hasNext()) {
        Role role = roleItr.next();
        System.out.println(role.toString());
        int roleId = role.getId();
    	//roleIdContainer[arrayIndex] = roleId;    
        
        accountIdPara = role.getAccountId();
        int functionalityIdPara = role.getFunctionalityId();
        
        
        boolean canRead = role.isReadable();
        boolean canWrite = role.isWritable();
        boolean canUpdate = role.isUpdateable();
        boolean canDelete = role.isDeletable();
        
        Account acctObj = Account.getAccount(accountIdPara);
        User uObj = User.getUser(acctObj.getUserId());
        Functionality fun = Functionality.getFunctionality(functionalityIdPara);
        
        if (index % 2 == 0) {
            out.print("<tr class='bg'>");
        } else {
            out.print("<tr>");
        }
        out.print("<td align='center'>" + index + "</td>");
        out.print("<td align='center'>" + uObj.getUserType() + "</td>");
        out.print("<td align='center'>" + fun.getFunctionalityName() + "</td>");
%>
<td align="center">
	<%
		String hiddenControlName = "hiddenroleid"+index;
	%>
	<input type="hidden" name="<%=hiddenControlName %>" id="<%=hiddenControlName %>" value="<%=roleId %>"/>
    <%
        ctrName = "chkcanread"+roleId;
    	//out.print(ctrName);
        if (canRead == true) {
            %>
            <input type="checkbox" name="<%=ctrName%>" id="<%=ctrName%>" checked="checked"/>
            <%
        } else {
            %>
            <input type="checkbox" name="<%=ctrName%>" id="<%=ctrName%>" />
            <%
        }
    %>
</td>
<td align="center">	
    <%
        ctrName = "chkcanwrite"+roleId;
    	//out.print(ctrName);
        if (canWrite == true) {
            %>
            <input type="checkbox" name="<%=ctrName%>" id="<%=ctrName%>" checked="checked"/>
            <%
        } else {
            %>
            <input type="checkbox" name="<%=ctrName%>" id="<%=ctrName%>" />
            <%
        }
    %>
</td>
<td align="center">
	<%
		String hiddenFunctionalityControlName = "hiddenfunctionalityid"+index;
	%>
	<input type="hidden" name="<%=hiddenFunctionalityControlName %>" id="hiddenFunctionalityControlName" value="<%=functionalityIdPara %>"/>
    <%
        ctrName = "chkcanupdate"+roleId;
    	//out.print(hiddenFunctionalityControlName);
        if (canUpdate == true) {
            %>
            <input type="checkbox" name="<%=ctrName%>" id="<%=ctrName%>" checked="checked"/>
            <%
        } else {
            %>
            <input type="checkbox" name="<%=ctrName%>" id="<%=ctrName%>" />
            <%
        }
    %>
</td>
<td align="center">
    <%
        ctrName = "chkcandelete"+roleId;
        if (canDelete == true) {
            %>
            <input type="checkbox" name="<%=ctrName%>" id="<%=ctrName%>" checked="checked"/>
            <%
        } else {
            %>
            <input type="checkbox" name="<%=ctrName%>" id="<%=ctrName%>" />
            <%
        }
    %>
</td>
<td align="center">
    <%
        String readCheck = "chkcanread"+roleId;
        String writeCheck = "chkcanwrite"+roleId;
        String updateCheck = "chkcanupdate"+roleId;
        String deleteCheck = "chkcandelete"+roleId;
    %>
    <a href="#.jsp" onclick="updateRole(<%=roleId%>,<%=accountIdPara%>,<%=functionalityIdPara%>,document.getElementById('<%=readCheck%>'),document.getElementById('<%=writeCheck%>'),document.getElementById('<%=updateCheck%>'),document.getElementById('<%=deleteCheck%>'));"><img src="design/save-icon.gif" border="0" align="absmiddle"/></a>
</td>
<%
        out.print("</tr>");
        index++;
        arrayIndex++;
    }//end while loop
    out.print("<tr>");
    	out.print("<td colspan='7' align='left'>");
    		%>
    		<a href="#.jsp" onclick="selectAllCheckBoxes(<%=totalNumberOfFunctionality%>);">
    			<label id="lblcheckall"><%
					String lblCheckAll = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcheckall");
					label = Label.getLabelUsingLabelId("lblcheckall");
					out.print(lblCheckAll != null ? lblCheckAll : label.getLabelCaption());
				%></label>  
    		</a>
    		 |
    		<a href="#.jsp" onclick="disselectAllCheckBoxes(<%=totalNumberOfFunctionality%>);">
    			<label id="lbluncheckall"><%
					String lblUncheckAll = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbluncheckall");
					label = Label.getLabelUsingLabelId("lbluncheckall");
					out.print(lblUncheckAll != null ? lblUncheckAll : label.getLabelCaption());
				%></label>
    		</a>
    		<%
    	out.print("</td>");
    	out.print("<td>");
    		String lblUpdateButtonLabel = "lblupdateallbutton";
		String updateButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblupdateallbutton");
		label = Label.getLabelUsingLabelId("lblupdateallbutton");
		String updateButtonCaption = updateButtonLabel != null ? updateButtonLabel : label.getLabelCaption();
    		%>
    		<input type="button" value="<%=updateButtonCaption %>" onclick="updateAllRoles(<%=totalNumberOfFunctionality%>,<%=accountIdPara%>);"/>
    		<%
    	out.print("</td>");
    out.print("</tr>");
    out.print("</table>");
%>
<script type="text/javascript">
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
</script>