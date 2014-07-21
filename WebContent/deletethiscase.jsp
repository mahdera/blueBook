<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
	long caseId = Long.parseLong(request.getParameter("caseId"));
	Case.delete(caseId);
%>
