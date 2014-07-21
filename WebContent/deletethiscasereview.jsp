<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	long caseReviewId = Long.parseLong(request.getParameter("id"));
	CaseReview.deleteCaseReview(caseReviewId);
%>
<p class="msg done">Case review information deleted successfully/የጉዳይ ሪቪው መረጃ በተሣካ ሁኔታ ተሠርዟል</p>