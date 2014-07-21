<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%	
	long caseReviewId = Long.parseLong(request.getParameter("caseReviewId"));
	long caseId = Long.parseLong(request.getParameter("caseId"));
	int respondentId = Integer.parseInt(request.getParameter("respondentId"));
	String caseTheme = request.getParameter("caseTheme");
	boolean investigationRequired = Boolean.parseBoolean(request.getParameter("investigationRequired"));
	String reason = request.getParameter("reason");
	
	CaseReview.updateCaseReview(caseReviewId, caseId, respondentId, caseTheme, investigationRequired, reason);
%>
<p class="msg done">Case review information updated successfully/የጉዳይ ክለሳ መረጃ በተሳካ ሁኔታ ታድሶአል</p>