<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.sql.Date" %>
<%
	Account account = (Account) session.getAttribute("account");
	int modifiedBy = account.getUserId();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String currentDate = dateFormat.format(cal.getTime());
	Date modificationDate = Date.valueOf(currentDate);	
	
	String officerEffort = request.getParameter("officerEffort");
	String respondentResponse = request.getParameter("respondentResponse");
	String applicantReaction = request.getParameter("applicantReaction");
	Date resolutionDate = Date.valueOf(request.getParameter("resolutionDate"));
	String result = request.getParameter("result");
	long earlyResolutionId = Long.parseLong(request.getParameter("earlyResolutionId"));
	//now find the early resolution obj and do the update process...
	EarlyResolution earlyResolution = EarlyResolution.getEarlyResolution(earlyResolutionId);	
	earlyResolution.setOfficerEffort(officerEffort);
	earlyResolution.setRespondentResponse(respondentResponse);
	earlyResolution.setApplicantReaction(applicantReaction);
	earlyResolution.setResolutionDate(resolutionDate);
	earlyResolution.setResult(result);
	earlyResolution.setModifiedBy(modifiedBy);
	earlyResolution.setModificationDate(modificationDate);
	EarlyResolution.update(earlyResolution);
%>
<p class="msg done">Early resolution information updated successfully/የቅድመ ምርመራ መረጃ በተሳካ ሁኔታ ታድሶአል</p>