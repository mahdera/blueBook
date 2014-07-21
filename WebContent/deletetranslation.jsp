<%@page import="com.signetitsolutions.bluebook.server.classes.LanguageTranslation"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	LanguageTranslation.delete(id);
%>
<p class="msg done">Language translation deleted successfully!</p>