<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
	long assId = Long.parseLong(request.getParameter("assId"));
	InvestigatorAssignment.deleteInvestigatorAssignment(assId);
%>
<p class="msg done">Investigator assignment deleted successfully/የመርማሪ ምደባ መረጃ በተሣካ ሁኔታ ተሠርዟል</p>