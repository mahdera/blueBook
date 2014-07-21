<%@page import="com.signetitsolutions.bluebook.server.classes.Language"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	Language.delete(id);
%>