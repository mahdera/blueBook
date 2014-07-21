<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	Account account = (Account) session.getAttribute("account");
	int modifiedBy = account.getUserId();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String currentDate = dateFormat.format(cal.getTime());
	Date modificationDate = Date.valueOf(currentDate);

	long decisionId = Long.parseLong(request.getParameter("decisionId"));
	long applicantId = Long.parseLong(request.getParameter("applicantId"));
	long caseId = Long.parseLong(request.getParameter("caseId"));
	int respondentId = Integer.parseInt(request.getParameter("respondentId"));
	String decisionGiven = request.getParameter("decisionGiven");
	String notes = request.getParameter("notes");
	String focus = request.getParameter("focus");
	int caseTypeId = Integer.parseInt(request.getParameter("caseType"));
	Date registrationDate = Date.valueOf(request.getParameter("registrationDate"));	
	
	//now find the decision object and set it with the new data values and update it back to the database...
	Decision decision = Decision.getDecision(decisionId);
	decision.setApplicantId(applicantId);
	decision.setCaseId(caseId);
	decision.setRespondentId(respondentId);
	decision.setDecisionGiven(decisionGiven);
	decision.setNotes(notes);
	decision.setFocus(focus);
	decision.setCaseTypeId(caseTypeId);
	decision.setRegistrationDate(registrationDate);
	decision.setModifiedBy(modifiedBy);
	decision.setModificationDate(modificationDate);
	Decision.update(decision);
	
	//now do the same for rejection reason....
	
	if(decisionGiven.equalsIgnoreCase("Rejected") || decisionGiven.startsWith("ውድቅ")){
		int rejectionReasonId = Integer.parseInt(request.getParameter("rejectionNotes"));		
		RejectionReason rejectionReason = RejectionReason.getRejectionReasonForDecision(decisionId);
		if(rejectionReason != null){
			rejectionReason.setRejectionReasonId(rejectionReasonId);
			rejectionReason.setModifiedBy(modifiedBy);
			rejectionReason.setModificationDate(modificationDate);
			RejectionReason.update(rejectionReason);
		}else{
			//there is no rejection reason...so save it as a new record...
			RejectionReason rejReason = new RejectionReason(decisionId,rejectionReasonId,modifiedBy,modificationDate);
			rejReason.save();
		}
	}
%>
<p class="msg done">
	<label id="lbldecisionupdatedsuccessfully">
		<%
			String lblDecisionUpdatedSuccessfully = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldecisionupdatedsuccessfully");
			label = Label.getLabelUsingLabelId("lbldecisionupdatedsuccessfully");
			out.print(lblDecisionUpdatedSuccessfully != null ? lblDecisionUpdatedSuccessfully : label.getLabelCaption());
		%>
	</label>
</p>