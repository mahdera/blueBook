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
	
	long agreementId = Long.parseLong(request.getParameter("agreementId"));
	String investigatorSuggestion = request.getParameter("investigatorSuggestion");
	String applicantPosition = request.getParameter("applicantPosition");
	String respondentPosition = request.getParameter("respondentPosition");
	String agreementText = request.getParameter("agreementText");
	Date agreementDate = Date.valueOf(request.getParameter("agreementDate"));
	//now find the agreement obj...set the new data values and update it back to the database...
	Agreement agreement = Agreement.getAgreement(agreementId);
	agreement.setInvestigatorSuggestion(investigatorSuggestion);
	agreement.setApplicantPosition(applicantPosition);
	agreement.setRespondentPosition(respondentPosition);
	agreement.setAgreementText(agreementText);
	agreement.setAgreementDate(agreementDate);
	agreement.setModifiedBy(modifiedBy);
	agreement.setModificationDate(modificationDate);
	Agreement.update(agreement);
%>
<p class="msg done">Agreement information update successfully/የስምምነት መረጃ በተሳካ ሁኔታ ታድሷል</p>