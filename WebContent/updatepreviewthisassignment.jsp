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
	
	long investigatorAssignmentId = Long.parseLong(request.getParameter("investigatorAssignmentId"));
	String selectedDecision = request.getParameter("selectedDecision");
	InvestigatorAssignment investigatorAssignment = InvestigatorAssignment.getInvestigatorAssignment(investigatorAssignmentId);
	String fileNumber = investigatorAssignment.getFileNumber();
	//now update investigatorAssignment obj and save it back to the database...
	if(selectedDecision.equalsIgnoreCase("accept")){
		investigatorAssignment.setOpenDate(modificationDate);
		investigatorAssignment.setCaseStatus("Active");
		investigatorAssignment.setModifiedBy(modifiedBy);
		investigatorAssignment.setModificationDate(modificationDate);
		InvestigatorAssignment.update(investigatorAssignment);
	}
	
	if(selectedDecision.equalsIgnoreCase("reject")){
		String rejectionReason = request.getParameter("rejectionReason");	
		InvestigatorRejectedCases investigatorRejectedCases = new InvestigatorRejectedCases(fileNumber,
				rejectionReason,modifiedBy,modificationDate);
		investigatorRejectedCases.save();
		investigatorAssignment.setOpenDate(modificationDate);
		investigatorAssignment.setModifiedBy(modifiedBy);
		investigatorAssignment.setModificationDate(modificationDate);
		investigatorAssignment.setCaseStatus("Rejected");
		InvestigatorAssignment.update(investigatorAssignment);
	}
%>
<p class="msg done">Investigator assignment information updated successfully!</p>