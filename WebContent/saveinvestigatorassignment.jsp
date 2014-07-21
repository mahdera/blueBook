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
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	
	String fileNumber = request.getParameter("fileNumber");
	String caseSource = request.getParameter("caseSource");
	int investigatorId = Integer.parseInt(request.getParameter("investigatorId"));
	Date dateAssigned = Date.valueOf(request.getParameter("dateAssigned"));
	
	InvestigatorAssignment investigatorAssignment = new InvestigatorAssignment(fileNumber,caseSource,
			modifiedBy,investigatorId,"New",dateAssigned,null,modifiedBy,modificationDate);
	investigatorAssignment.save();
%>
<p class="msg done">
	<label id="lblinvestigatorassignmentsavedsuccessfully">
		<%
			String lblInvestigatorAssignmentSavedSuccessfully = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblinvestigatorassignmentsavedsuccessfully");
			label = Label.getLabelUsingLabelId("lblinvestigatorassignmentsavedsuccessfully");
			out.print(lblInvestigatorAssignmentSavedSuccessfully != null ? lblInvestigatorAssignmentSavedSuccessfully : label.getLabelCaption());
		%>
	</label>
</p>