<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.sql.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%
	Account account = (Account) session.getAttribute("account");
	int modifiedBy = account.getUserId();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String currentDate = dateFormat.format(cal.getTime());
	Date modificationDate = Date.valueOf(currentDate);
	
	String fileNumber = request.getParameter("fileNumber");
	String officerEffort = request.getParameter("officerEffort");
	String respondentResponse = request.getParameter("respondentResponse");
	String applicantReaction = request.getParameter("applicantReaction");
	Date resolutionDate = Date.valueOf(request.getParameter("resolutionDate"));
	String result = request.getParameter("result");
	
	EarlyResolution earlyResolution = new EarlyResolution(fileNumber,officerEffort,respondentResponse,
			applicantReaction,resolutionDate,result,modifiedBy,modificationDate);
	earlyResolution.save();
%>
<p class="msg done">Early resolution information saved successfully/የቅድመ ምርመራ መረጃ በተሳካ ሁኔታ ተመዝግቦአል</p>