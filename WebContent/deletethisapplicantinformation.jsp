<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	long applicantId = Long.parseLong(request.getParameter("applicantId"));
	Applicant.delete(applicantId);
%>
<p class="msg done">Applicant information deleted successfully/የአመልካች መረጃ በተሳካ ሁኔታ ተሠርዟል</p>