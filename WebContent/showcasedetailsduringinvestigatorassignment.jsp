<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%
	long caseId = Long.parseLong(request.getParameter("caseId"));
	List<InvestigatorAssignment> investAssList = InvestigatorAssignment.getAllInvestigatorAssignmentsForThisCase(caseId);
	if(!investAssList.isEmpty()){
		Iterator<InvestigatorAssignment> investAssItr = investAssList.iterator();
		%>
		<table border="0" width="100%" style="background:lightgreen">
			<tr style="background:#eee;font-size:11pt;font-weight:bolder">
				<td>Ser.No/ተራ.ቁ</td>
				<td>Respondent/መልስ ሰጭ</td>
				<td>Investigator/መርማሪ</td>
				<td>Investigator Level/የመርማሪው ደረጃ</td>
				<td>Case Status/ጉዳዩ የደረሰበት ደረጃ</td>
				<td>Date Assigned/የምደባ ቀን</td>
				<td>Date Opened/የተከፈተበት ቀን</td>
			</tr>
			<%
				int ctr=1;
				while(investAssItr.hasNext()){
					InvestigatorAssignment iAss = investAssItr.next();
					%>
					<tr>
						<td><%=ctr++ %></td>
						<td><%=Respondent.getRespondent(iAss.getRespondentId()).getName() %></td>
						<td><%=iAss.getInvestigator() %></td>
						<td><%=iAss.getInvestigatorLevel() %></td>
						<td><%=iAss.getCaseStatus() %></td>
						<td><%=iAss.getDateAssigned() %></td>
						<td><%=iAss.getOpenDate() %></td>
					</tr>
					<%
				}//end while loop
			%>
		</table>
		<%
	}else{
		%>
		<p class="msg warning">There is no information found/ምንም የተገኝ መረጃ የለም</p>
		<%
	}
%>