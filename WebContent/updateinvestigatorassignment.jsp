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
	String caseSource = request.getParameter("caseSource");
	int investigatorId = Integer.parseInt(request.getParameter("investigatorId"));
	Date dateAssigned = Date.valueOf(request.getParameter("dateAssigned"));
	//now fetch this particular investigator assignemtn object and update its value and save it back to the database again...
	InvestigatorAssignment investigatorAssignment = InvestigatorAssignment.getInvestigatorAssignment(investigatorAssignmentId);
	if(investigatorAssignment != null){
		investigatorAssignment.setFileSource(caseSource);
		investigatorAssignment.setInvestigatorId(investigatorId);
		investigatorAssignment.setDateAssigned(dateAssigned);
		investigatorAssignment.setModifiedBy(modifiedBy);
		investigatorAssignment.setModificationDate(modificationDate);
		InvestigatorAssignment.update(investigatorAssignment);
	}
%>
<p class="msg done">Investigator assignment record has been updated successfully!</p>