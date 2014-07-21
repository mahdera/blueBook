<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	long caseId = Long.parseLong(request.getParameter("caseId"));
	Case theCase = Case.getCase(caseId);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<table border="0" width="100%">
	<tr style="background:#fff">		
		<td>
			<label id="lblcasetheme">
			<strong>
			<%
				String lblCaseTheme = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasetheme");
				label = Label.getLabelUsingLabelId("lblcasetheme");
 				out.print(lblCaseTheme != null ? lblCaseTheme : label.getLabelCaption());
 			%>		
 			</strong>	
			</label>
			<br/>
			<%=theCase.getTheme() %>
		</td>
	</tr>
</table>
