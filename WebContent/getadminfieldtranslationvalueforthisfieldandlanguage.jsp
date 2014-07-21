<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	int adminFieldId = Integer.parseInt(request.getParameter("adminFieldId"));
	int languageId = Integer.parseInt(request.getParameter("languageId"));	
	//now check if there exists an admin field translation value for this field and language
	AdminFieldTranslation adminFieldTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(languageId, adminFieldId);
	if(adminFieldTranslation != null){
		out.print(adminFieldTranslation.getTranslatedValue());
	}else{
		out.print("");
	}
%>