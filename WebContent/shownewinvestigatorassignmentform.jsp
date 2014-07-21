<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "investigationManagement";
	Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	if(true){
%>
<form>
	<table border="0" width="100%" style="background:#eee">
		<tr>		
			<td><font color="red">*</font><label id="lblfilenumber"><%
					String lblFileNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfilenumber");
					label = Label.getLabelUsingLabelId("lblfilenumber");
	 				out.print(lblFileNumber != null ? lblFileNumber : label.getLabelCaption());
	 			%></label></td>
			<td>
				<%
					String lblShowButtonLabel = "lblsearchbutton";
					String showButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblsearchbutton");
					label = Label.getLabelUsingLabelId("lblsearchbutton");
					String showButtonCaption = showButtonLabel != null ? showButtonLabel : label.getLabelCaption();					
				%>
				<input type="text" name="txtfilenumber" id="txtfilenumber" size="30"/>
				<input type="button" id="btnsearch" value="<%=showButtonCaption%>"/>
			</td>
		</tr>	
	</table>
	<div id="investigatorAssignmentDetailDiv"></div>
</form>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
%>
<script type="text/javascript">
	$('#txtfilenumber').focus();
	$('#btnsearch').click(function(){
		var fileNumber = $('#txtfilenumber').val();
		if(fileNumber != ""){
			$('#investigatorAssignmentDetailDiv').load('searchandshowdetailsofthisfilenumberinvestigatorassignment.jsp?fileNumber='+fileNumber);
		}
	});
</script>