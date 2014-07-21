<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	String languageName = request.getParameter("languageName");
	Language language = new Language(languageName);
	language.save();
%>
<p class="msg done">Language saved successfully!</p>