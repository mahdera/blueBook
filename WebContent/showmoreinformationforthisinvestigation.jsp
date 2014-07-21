<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
	long investigationId = Long.parseLong(request.getParameter("investigationId"));
	Investigation invest = Investigation.getInvestigation(investigationId);
%>
<table border="0" width="100%" style="background:lightyellow">
	<tr>
		<td>Case/ጉዳይ:</td>
		<td><%=Case.getCase(invest.getCaseId()).getCaseIdNumber() %></td>
	</tr>
	<tr>
		<td>Respondent/መልስ ሰጭ:</td>
		<td><%=Respondent.getRespondent(invest.getRespondentId()).getName() %></td>
	</tr>
	<tr>
		<td>Case Theme/የጉዳዩ ጭብጥ:</td>
		<td><%=invest.getCaseTheme() %></td>
	</tr>
	<tr>
		<td>Registered Data/የተመዘገበ ዳታ:</td>
		<td><%=invest.getWhatRegister() %></td>
	</tr>
	<tr>
		<td>Termination Reason/የተቋረጠበት ምክንያት:</td>
		<td><%=invest.getTerminationReason() %></td>
	</tr>
	<tr>
		<td>Current Case Status/ጉዳዩ አሁን የደረሰበት ደረጃ:</td>
		<td><%=invest.getCurrentStatusOfCase() %></td>
	</tr>
	<tr>
		<td>Investigation Date/የምርመራ ቀን:</td>
		<td><%=invest.getInvestigationDate() %></td>
	</tr>
	<tr>
		<td>Next Job and Date/ቀጣይ ሥራ:</td>
		<td><%=invest.getNextJobAndDate() %></td>
	</tr>
</table>