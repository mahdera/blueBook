<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
	long id = Long.parseLong(request.getParameter("id"));
	Investigation.delete(id);
%>