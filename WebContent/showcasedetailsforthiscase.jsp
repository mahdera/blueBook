<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
	long caseId = Long.parseLong(request.getParameter("caseId"));
	Case ca = Case.getCase(caseId);
%>
<table border="0" width="100%" style="background:lightgreen">
	<tr>
		<td>Theme/ጭብጥ:</td>
		<td><%=ca.getTheme() %></td>
	</tr>
	<tr>
		<td>Relief Sought/የመፍትሄ ሃሣብ:</td>
		<td><%=ca.getReliefSought() %></td>
	</tr>
	<tr>
		<td>Case Category/የጉዳይ ምድብ:</td>
		<td><%=CaseCategory.getCaseCategory(ca.getCaseCategoryId()).getCaseCategoryName() %></td>
	</tr>
	<tr>
		<td>Linkage/ተያያዥነት:</td>
		<td><%=ca.getLinkage() %></td>
	</tr>
	<tr>
		<td>Evidence Type/የፍንጭ ዓይነት:</td>
		<td><%=ca.getEvidenceType() %></td>
	</tr>
	<tr>
		<td>Number of Pages/የገፅ ብዛት:</td>
		<td><%=ca.getNumberOfPages() %></td>
	</tr>
	<tr>
		<td>Means of Application/ጉዳይ የቀረበበት መንገድ:</td>
		<td><%=ca.getMeansOfApplication() %></td>
	</tr>
	<tr>
		<td>Applied By/ጉዳይ ያመለከተው:</td>
		<td><%=ca.getAppliedBy() %></td>
	</tr>
</table>