<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	MenuTranslation.delete(id);
%>