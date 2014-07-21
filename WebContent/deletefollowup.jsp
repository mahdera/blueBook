<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	long id = Long.parseLong(request.getParameter("id"));
	Followup.delete(id);
%>