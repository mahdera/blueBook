<%@page import="com.signetitsolutions.bluebook.server.classes.Language"%>
<%
	int languageId = Integer.parseInt(request.getParameter("languageId"));
	String languageName = request.getParameter("languageName");
	Language language = Language.getLanguage(languageId);
	language.setLanguage(languageName);
	Language.update(language);
%>
<p class="msg done">Language updated successfully!</p>
