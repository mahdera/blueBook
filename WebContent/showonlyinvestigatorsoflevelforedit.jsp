<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	String investigatorLevel = request.getParameter("investigatorLevel");
	long investigatorAssignmentId = Long.parseLong(request.getParameter("investigatorAssignmentId"));
	//now define the control name in here...
	String investigatorControlName = "slctinvestigator" + investigatorAssignmentId;
%>
<select name="<%=investigatorControlName %>" id="<%=investigatorControlName %>" style="width:100%;height: 200px;" multiple="multiple">
	<option value="" selected="selected">--Select--</option>
	<%
		List<Investigator> investigatorList = Investigator.getAllInvestigatorForInvestigatorAssignment(investigatorLevel);
		Iterator<Investigator> investigatorItr = investigatorList.iterator();
		while(investigatorItr.hasNext()){
			Investigator investigator = investigatorItr.next();											
			//now count the number of assignments to each investigators....with date of assignment.
			int investigatorLoad = InvestigatorAssignment.getInvestigatorAssignmentCount(investigator.getId());
			String stringValue = "";
			if(investigatorLoad != 0){
				Date lastDateAssigned = InvestigatorAssignment.getLastMaxDateAssignedForInvestigator(investigator.getId());
				stringValue = investigator.getFullName()+"            active cases ("+investigatorLoad+"):             Last date case assigned: ["+lastDateAssigned+"]";
			}else{
				stringValue = investigator.getFullName()+"            active cases ("+investigatorLoad+")";
			}
			%>
				<option value="<%=investigator.getId() %>"><%=stringValue %></option>
			<%
		}//end while loop
	%>
</select>