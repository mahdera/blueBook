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
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	
	String fileNumber = request.getParameter("fileNumber").trim();
	String investigatorSuggestion = request.getParameter("investigatorSuggestion");
	String applicantPosition = request.getParameter("applicantPosition");
	String respondentPosition = request.getParameter("respondentPosition");
	String agreementText = request.getParameter("agreementText");	
	Date agreementDate = Date.valueOf(request.getParameter("agreementDate"));
	
	Agreement agreement = new Agreement(fileNumber,investigatorSuggestion,applicantPosition,respondentPosition,
			agreementText,agreementDate,modifiedBy,modificationDate);
	agreement.save();
	//now change the case status to closed.
	InvestigatorAssignment investigatorAssignment = InvestigatorAssignment.fetchInvestigatorAssignmentUsingFileNumber(fileNumber);
	investigatorAssignment.setModifiedBy(modifiedBy);
	investigatorAssignment.setModificationDate(modificationDate);
	investigatorAssignment.setCaseStatus("Closed");
	InvestigatorAssignment.update(investigatorAssignment);
%>
<p class="msg done">
	<label id="lblagreementsavedsuccessfully">
		<%
			String lblAgreementSavedSuccessfully = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblagreementsavedsuccessfully");
			label = Label.getLabelUsingLabelId("lblagreementsavedsuccessfully");
			out.print(lblAgreementSavedSuccessfully != null ? lblAgreementSavedSuccessfully : label.getLabelCaption());
		%>
	</label>
</p>