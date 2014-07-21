<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
	int caseCategoryId = Integer.parseInt(request.getParameter("caseCategoryId"));
	CaseCategory.delete(caseCategoryId);
%>