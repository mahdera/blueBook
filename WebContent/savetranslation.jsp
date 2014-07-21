<%@page import="com.signetitsolutions.bluebook.server.classes.LanguageTranslation"%>
<%
	int labelId = Integer.parseInt(request.getParameter("labelId"));
	int languageId = Integer.parseInt(request.getParameter("languageId"));
	String translatedValue = request.getParameter("translatedValue");
	
	LanguageTranslation languageTranslation = new LanguageTranslation(languageId,labelId,translatedValue);
	languageTranslation.save();
%>