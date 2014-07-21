<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	String fileNumber = request.getParameter("fileNumber");
	//now find the decision object from the database...
	Decision decision = Decision.fetchDecisionUsingFileNumber(fileNumber);
	if(decision != null){
	Applicant applicant = Applicant.getApplicant(decision.getApplicantId());
	Case theCase = Case.getCase(decision.getCaseId());
	Respondent respondent = Respondent.getRespondent(decision.getRespondentId());	
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<table border="0" width="100%" style="background:#fff">
	<tr>
		<td><label id="lblapplicantname"><%
					String lblApplicantName = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblapplicantname");
					label = Label.getLabelUsingLabelId("lblapplicantname");
	 				out.print(lblApplicantName != null ? lblApplicantName : label.getLabelCaption());
	 			%></label></td>
		<td>
			<%=applicant.getFullName()%>
		</td>
	</tr>
	<tr>
		<td><label id="lblrespondentname"><%
					String lblRespondentName = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrespondentname");
					label = Label.getLabelUsingLabelId("lblrespondentname");
	 				out.print(lblRespondentName != null ? lblRespondentName : label.getLabelCaption());
	 			%></label></td>
		<td>
			<%=respondent.getName() %>
		</td>
	</tr>
	<tr>
		<td><label id="lblcasetheme"><%
					String lblCaseTheme = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasetheme");
					label = Label.getLabelUsingLabelId("lblcasetheme");
	 				out.print(lblCaseTheme != null ? lblCaseTheme : label.getLabelCaption());
	 			%></label></td>
		<td>
			<%=theCase.getTheme() %>
		</td>
	</tr>
</table>
<%
	}else{
%>
		<p class="msg warning">No record found with file number "<%=fileNumber %>" !</p>
<%
	}
%>