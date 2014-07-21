<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	long agreementId = Long.parseLong(request.getParameter("agreementId"));
	Agreement.delete(agreementId);
%>