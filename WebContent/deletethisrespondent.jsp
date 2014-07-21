<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
	int respondentId = Integer.parseInt(request.getParameter("respondentId"));
	Respondent.delete(respondentId);
%>