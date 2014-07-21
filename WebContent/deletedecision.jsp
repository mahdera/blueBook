<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	long decisionId = Long.parseLong(request.getParameter("decisionId"));
	Decision.delete(decisionId);
%>
<p class="msg done">Decision deleted successfully!</p>