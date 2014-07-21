<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	int languageId = Integer.parseInt(request.getParameter("languageId"));
	int menuId = Integer.parseInt(request.getParameter("menuId"));
	String translatedValue = request.getParameter("translatedValue");
	String translatedDescription = request.getParameter("translatedDescription");
	
	MenuTranslation menuTranslation = new MenuTranslation(languageId,menuId,translatedValue,translatedDescription);
	menuTranslation.save();
%>