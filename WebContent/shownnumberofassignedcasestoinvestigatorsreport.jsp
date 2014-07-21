<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.sql.Date" %>
<%
	Date fromDate = Date.valueOf(request.getParameter("fromDate"));
	Date toDate = Date.valueOf(request.getParameter("toDate"));
	
	int numberOfCasesAssigned = InvestigatorAssignment.getTotalNumberOfCasesAssignedToInvestigatorsDuring(fromDate,toDate);
	int totalFemale = InvestigatorAssignment.getHowManyOfThisSexGroupAssignedToInvestigatorDuring(fromDate,toDate,"Female");
	int totalMale = InvestigatorAssignment.getHowManyOfThisSexGroupAssignedToInvestigatorDuring(fromDate,toDate,"Male");
	int totalNotIdentified = InvestigatorAssignment.getHowManyOfThisSexGroupAssignedToInvestigatorDuring(fromDate,toDate,"NI");
	long totalSex = totalMale + totalFemale + totalNotIdentified;
	if(numberOfCasesAssigned > 0){
%>
<table border="0" width="100%">
	<thead>
		<tr>
			<th colspan="6">
				Number of Cases Assigned to Investigator Report/መርማሪ የተመደበላቸው ጉዳዮች/አቤቱታዎች ሪፖርት<br/>
				Starting Date/መነሻ ቀን:<%=fromDate %> End Date/መዳረሻ ቀን:<%=toDate %>
			</th>
		</tr>
		<tr>
			<th>Ser.No/ተራ.ቁ</th>
			<th>Number of Cases/የጉዳዮች/የአቤቱታ ብዛት</th>		
			<th>Female/ሴት</th>
			<th>Male/ወንድ</th>
			<th>Non Identified/ያልተለየ</th>
			<th>Total/አጠቃላይ ድምር</th>		
		</tr>
	</thead>
	<tbody>
				<tr>
					<td><%=1 %></td>
					<td><%=numberOfCasesAssigned %></td>
					<td><%=totalFemale %></td>
					<td><%=totalMale %></td>
					<td><%=totalNotIdentified %></td>
					<td><%=totalSex %></td>
				</tr>
	</tbody>
</table>
<%
	}else{
		%>
		<p class="msg info">No Data to Display/ምንም ዓይነት መረጃ አልተገኝም</p>
		<%
	}
%>