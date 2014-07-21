<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
	long followUpId = Long.parseLong(request.getParameter("followUpId"));
	Followup.deleteFollowup(followUpId);
%>
<p class="msg done">Follow up information deleted successfully/የክትትል መረጃ በተሣካ ሁኔታ ተሠርዟል</p>