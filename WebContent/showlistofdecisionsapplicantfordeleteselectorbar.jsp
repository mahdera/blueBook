<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "decisionManagement";
	//Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	//Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	if(true){
		int langId = Integer.parseInt(session.getAttribute("langId").toString());
		Label label = null;
%>
<form>
	<table border="0" width="100%">
		<tr>
			<td><label id="lblselecttheapplicant"><%
					String lblSelectTheApplicant = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblselecttheapplicant");
					label = Label.getLabelUsingLabelId("lblselecttheapplicant");
	 				out.print(lblSelectTheApplicant != null ? lblSelectTheApplicant : label.getLabelCaption());
	 			%></label></td>
			<td>
				<select name="slctapplicant" id="slctapplicant" style="width:100%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<Applicant> applicantList = Applicant.getAllApplicants();
					if(!applicantList.isEmpty()){
						Iterator<Applicant> applicantItr = applicantList.iterator();
						while(applicantItr.hasNext()){
							Applicant applicant = applicantItr.next();
							String applicantStr = applicant.getFullName()+" : "+applicant.getApplicantIdNumber();
							%>
							<option value="<%=applicant.getId() %>"><%=applicantStr %></option>
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
				<input type="button" value="<%=showButtonCaption %>" class="input-submit" id="btnshow"/>
				<input type="reset" value="<%=resetButtonCaption %>" class="input-submit"/>
			</td>
		</tr>
	</table>
</form>
<div id="decisionListDiv"></div>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
%>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btnshow').click(function(){
			var applicantId = $('#slctapplicant').val();
			if(applicantId != ""){
				$('#decisionListDiv').load('showalldecisionsforthisapplicantfordelete.jsp?applicantId='+applicantId);
			}
		});
	});//end document.ready function
</script>