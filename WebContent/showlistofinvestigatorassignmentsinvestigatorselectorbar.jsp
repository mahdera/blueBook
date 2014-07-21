<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "investigatorAssignmentManagement";
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	//Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	//Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	if(true){
%>
<form>
	<table border="0" width="100%" style="background:#eee">
		<tr>
			<td width="30%"><label id="lblselectinvestigator"><%
					String lblApplicantName = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblselectinvestigator");
					label = Label.getLabelUsingLabelId("lblselectinvestigator");
	 				out.print(lblApplicantName != null ? lblApplicantName : label.getLabelCaption());
	 			%></label></td>
			<td width="40%">
				<select name="slctinvestigator" id="slctinvestigator" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<Investigator> investigatorList = Investigator.getAllInvestigator();
						if(!investigatorList.isEmpty()){
							Iterator<Investigator> investigatorItr = investigatorList.iterator();
							while(investigatorItr.hasNext()){
								Investigator investigator = investigatorItr.next();
								%>
									<option value="<%=investigator.getId() %>"><%=investigator.getFullName() %></option>
								<%
							}//end while loop
						}
					%>
				</select>
			</td>
			<td>
				<%
					String lblShowButtonLabel = "lblshowbutton";
					String showButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblshowbutton");
					label = Label.getLabelUsingLabelId("lblshowbutton");
					String showButtonCaption = showButtonLabel != null ? showButtonLabel : label.getLabelCaption();
					//////
					String lblResetButtonLabel = "lblresetbutton";
					String resetButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId, "lblresetbutton");
					label = Label.getLabelUsingLabelId("lblresetbutton");
					String resetButtonCaption = resetButtonLabel != null ? resetButtonLabel : label.getLabelCaption();
				%>
				<input type="button" value="<%=showButtonCaption %>" id="btnshow" class="input-submit"/>
				<input type="reset" value="<%=resetButtonCaption %>" class="input-submit"/>
			</td>
		</tr>
	</table>
</form>
<div id="investigatorAssignmentDetailDiv"></div>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
%>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btnshow').click(function(){
			var investigatorId = $('#slctinvestigator').val();
			$('#investigatorAssignmentDetailDiv').load('showallcasesassignedtothisinvestigator.jsp?investigatorId='+investigatorId);
		});
	});//end document.ready function
</script>