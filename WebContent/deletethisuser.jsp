<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
	int userId = Integer.parseInt(request.getParameter("userId"));
	User.delete(userId);
%>