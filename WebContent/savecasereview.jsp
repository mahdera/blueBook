<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	long applicantId = Long.parseLong(request.getParameter("applicantId"));
	long caseId = Long.parseLong(request.getParameter("caseId"));
	int respondentId = Integer.parseInt(request.getParameter("respondentId"));
	String caseTheme = request.getParameter("caseTheme");
	boolean investigationRequired = Boolean.parseBoolean(request.getParameter("investigationRequired"));
	String reason = request.getParameter("reason");
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	
	CaseReview caseReview = new CaseReview(applicantId,caseId,respondentId,caseTheme,investigationRequired,reason);
	caseReview.addCaseReview();
%>
<p class="msg done">
	<label id="lblcasereviewsavedsuccessfully">
		<%
			String lblCaseReviewSavedSuccessfully = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasereviewsavedsuccessfully");
			label = Label.getLabelUsingLabelId("lblcasereviewsavedsuccessfully");
			out.print(lblCaseReviewSavedSuccessfully != null ? lblCaseReviewSavedSuccessfully : label.getLabelCaption());
		%>
	</label>
</p>