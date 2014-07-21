<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	String fileNumber = request.getParameter("fileNumber");
	EarlyResolution earlyResolution = EarlyResolution.getAllEarlyResolutionsUsingFileNumber(fileNumber);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	if(earlyResolution != null){		
		%>
		<table border="0" width="100%">
			<tr style="background:#eee;font-size:12pt;font-weight:bolder">				
				<td><label id="lblofficereffort"><%
					String lblOfficerEffort = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblofficereffort");
					label = Label.getLabelUsingLabelId("lblofficereffort");
	 				out.print(lblOfficerEffort != null ? lblOfficerEffort : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblrespondentresponse"><%
					String lblRespondentResponse = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrespondentresponse");
					label = Label.getLabelUsingLabelId("lblrespondentresponse");
	 				out.print(lblRespondentResponse != null ? lblRespondentResponse : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblapplicantreaction"><%
					String lblApplicantReaction = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblapplicantreaction");
					label = Label.getLabelUsingLabelId("lblapplicantreaction");
	 				out.print(lblApplicantReaction != null ? lblApplicantReaction : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblresolutiondate"><%
					String lblResolutionDate = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblresolutiondate");
					label = Label.getLabelUsingLabelId("lblresolutiondate");
	 				out.print(lblResolutionDate != null ? lblResolutionDate : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblresult"><%
					String lblResult = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblresult");
					label = Label.getLabelUsingLabelId("lblresult");
	 				out.print(lblResult != null ? lblResult : label.getLabelCaption());
	 			%></label></td>
			</tr>			
			<tr>					
				<td><%=earlyResolution.getOfficerEffort() %></td>
				<td><%=earlyResolution.getRespondentResponse() %></td>
				<td><%=earlyResolution.getApplicantReaction() %></td>
				<td><%=earlyResolution.getResolutionDate() %></td>
				<td><%=earlyResolution.getResult() %></td>
			</tr>
		</table>
		<%
	}else{
		%>
			<p class="msg warning">
				<label id="lblnoinformationfound">
					<%
					String lblEnterFileNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblenterafilenumber");
					label = Label.getLabelUsingLabelId("lblenterafilenumber");
	 				out.print(lblEnterFileNumber != null ? lblEnterFileNumber : label.getLabelCaption());
	 			%>
				</label>
			</p>
		<%
	}
%>