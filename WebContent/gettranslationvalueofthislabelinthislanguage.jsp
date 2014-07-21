<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	int languageId = Integer.parseInt(request.getParameter("languageId"));
	int labelId = Integer.parseInt(request.getParameter("labelId"));
	LanguageTranslation languageTranslation = LanguageTranslation.getLanguageTranslationForLanguageAndLabelId(languageId,labelId);
	
	if(languageTranslation != null){
		out.print(languageTranslation.getTranslatedValue());
	}else{
		out.print("Not");
	}
%>