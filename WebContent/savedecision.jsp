<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.sql.Date"%>
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
	long applicantId = Long.parseLong(request.getParameter("applicantId"));
	long caseId = Long.parseLong(request.getParameter("caseId"));
	int respondentId = Integer.parseInt(request.getParameter("respondentId"));
	String decisionGiven = request.getParameter("decisionGiven");
	String notes = request.getParameter("notes");
	String focus = request.getParameter("focus");
	int caseTypeId = Integer.parseInt(request.getParameter("caseType"));
	Date registrationDate = Date.valueOf(request.getParameter("registrationDate"));
	
	Decision decision = new Decision(fileNumber,applicantId,caseId,respondentId,decisionGiven,notes,focus,
			caseTypeId,registrationDate,modifiedBy,modifiedBy,modificationDate);
	decision.save();
	
	if(decisionGiven.equalsIgnoreCase("Rejected") || decisionGiven.startsWith("ውድቅ")){
		int rejectionReasonId = Integer.parseInt(request.getParameter("rejectionNotes"));
		Decision fetchedDecision = Decision.fetchDecisionUsingFileNumber(fileNumber);
		//now save the rejection notes to the database...
		RejectionReason rejectionReason = new RejectionReason(fetchedDecision.getId(),rejectionReasonId,modifiedBy,modificationDate);;
		rejectionReason.save();
	}
%>
<p class="msg done">Decision saved successfully/የውሣኔ መረጃ በተሳካ ሁኔታ ተመዝግቦአል</p>