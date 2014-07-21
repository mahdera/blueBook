<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	AdminField.delete(id);
%>
<p class="msg done">Admin field option deleted successfully!</p>