<%@page import="com.signetitsolutions.bluebook.server.classes.Label"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	Label.delete(id);
%>