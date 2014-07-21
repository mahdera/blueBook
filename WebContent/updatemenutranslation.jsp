<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	int languageId = Integer.parseInt(request.getParameter("languageId"));
	int menuId = Integer.parseInt(request.getParameter("menuId"));
	String translatedValue = request.getParameter("translatedValue");
	int id = Integer.parseInt(request.getParameter("id"));
	String translatedDescrption = request.getParameter("translatedDescription");
	
	MenuTranslation menuTranslation = MenuTranslation.getMenuTranslation(id);
	menuTranslation.setLanguageId(languageId);
	menuTranslation.setMenuId(menuId);
	menuTranslation.setTranslatedValue(translatedValue);
	menuTranslation.setTranslatedDescription(translatedDescrption);
	MenuTranslation.update(menuTranslation);
%>