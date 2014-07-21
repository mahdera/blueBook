<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
	long decisionId = Long.parseLong(request.getParameter("decisionId"));
	Decision.deleteDecision(decisionId);
%>
<p class="msg done">Decision information deleted successfully/የውሣኔ መረጃ በተሳካ ሁኔታ ተሠርዟል</p>