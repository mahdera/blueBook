<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	long investigatorAssignmentId = Long.parseLong(request.getParameter("investigatorAssignmentId"));
	InvestigatorAssignment.delete(investigatorAssignmentId);
%>
<p class="msg done">Investigator assignment record deleted successfully!</p>