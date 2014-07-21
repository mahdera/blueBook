<%@page import="com.signetitsolutions.bluebook.server.classes.LanguageTranslation"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	int labelId = Integer.parseInt(request.getParameter("labelId"));
	int languageId = Integer.parseInt(request.getParameter("languageId"));
	String translatedValue = request.getParameter("translatedValue");
	
	LanguageTranslation languageTranslation = LanguageTranslation.getLanguageTranslation(id);
	languageTranslation.setLabelId(labelId);
	languageTranslation.setLangaugeId(languageId);
	languageTranslation.setTranslatedValue(translatedValue);
	LanguageTranslation.update(languageTranslation);
%>
<p class="msg done">Language translation information updated successfully!</p>