<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%
	String investigatorName = request.getParameter("investigatorName");
	//now get all the assigned cases numbers for this investigatorName
	List<InvestigatorAssignment> assignmentList = InvestigatorAssignment.getAllInvestigatorAssignmentsForThisInvestigator(investigatorName);
	if(!assignmentList.isEmpty()){
		Iterator<InvestigatorAssignment> assignmentItr = assignmentList.iterator();
		%>
		<table border="0" width="100%">
			<tr style="background:#eee;font-style:bolder;font-size:11pt">
				<td>Ser.No/ተራ.ቁ</td>
				<td>Case Id Number/መለያ ቁጥር</td>
				<td>Case Status When Assigned/በምደባ ወቅት ጉዳዩ የደረሰበት ደረጃ</td>
				<td>Decision Given/የተሠጠ ውሣኔ</td>
				<td>View Case Detail/የጉዳዩን ዝርዝር ተመልከት</td>
				<td>View Case Detail in Assignment Process/በምደባ ወቅት የነበረውን የጉዳይ ዝርዝር ተመልከት</td>
			</tr>
			<%
				int ctr=1;
				while(assignmentItr.hasNext()){
					InvestigatorAssignment ass = assignmentItr.next();
					Case c = Case.getCase(ass.getCaseId());
					Decision d = Decision.getDecisionForThisCase(c.getId());
					%>
					<tr style="background:lightyellow">
						<td><%=ctr++ %></td>
						<td><%=c.getCaseIdNumber() %></td>
						<td><%=ass.getCaseStatus() %></td>
						<td>
							<%
								if(d != null){
									out.print(d.getDecisionGiven());
								}else{
									out.print("No decision given yet/ምንም የተሠጠ ውሣኔ የለም");
								}
							%>
						</td>
						<td>
							<a href="#.jsp" onclick="showCaseDetailsForThisCase(<%=c.getId() %>);">View Case Detail</a>
						</td>
						<td>
							<a href="#.jsp" onclick="showCaseDetailsDuringInvestigatorAssignment(<%=c.getId() %>);">View Case Detail During Assignment</a>
						</td>
					</tr>
					<%
						String divId = "assignmentDetailDiv"+c.getId();
					%>
					<tr>
						<td colspan="6">
							<div id="<%=divId %>"></div>
						</td>
					</tr>
					<%
				}//end while loop
			%>			
		</table>
		<%
	}else{
		%>
		<p class="msg info">This investigator has not been assigned any case so far/ይህ መርማሪ እስከ አሁን ድረስ ምንም ጉዳይ አልተሠጠውም</p>
		<%
	}
%>