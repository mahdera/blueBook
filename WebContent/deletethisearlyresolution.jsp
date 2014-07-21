<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	long earlyResolutionId = Long.parseLong(request.getParameter("earlyResolutionId"));
	EarlyResolution.delete(earlyResolutionId);
%>
<p class="msg done">Early resolution information deleted successfully/ቅድመ ምርመራ መረጃ በተሳካ ሁኔታ ተሠርዟል</p>