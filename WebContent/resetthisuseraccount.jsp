<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
	int accountId = Integer.parseInt(request.getParameter("accountId"));
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	Account.resetThisAccount(accountId, username, password);
%>
<p class="msg done">User account successfully reset/የተጠቃሚው አካውንት በተሣካ ሁኔታ ተቀይሯል</p>