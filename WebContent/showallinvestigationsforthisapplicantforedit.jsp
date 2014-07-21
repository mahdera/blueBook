<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%
	long applicantId = Long.parseLong(request.getParameter("applicantId"));
	//now get all the investigation done for this applicant
	List<Investigation> investigationList = Investigation.getAllInvestigationsForThisApplicant(applicantId);
	if(!investigationList.isEmpty()){
		Iterator<Investigation> investigationItr = investigationList.iterator();
		%>
		<table border="0" width="100%">
			<tr style="background:#eee;font-size:11pt;font-weight:bolder">
				<td>Ser.No/<br/>ተራ.ቁ</td>
				<td>Case/<br/>ጉዳይ</td>
				<td>Respondent/<br/>መልስ ሰጭ</td>
				<td>Case Theme/<br/>የጉዳዩ ጭብጥ</td>
				<td>Registered Data/<br/>የተመዘገበ ዳታ</td>
				<td>Termination Reason/<br/>የተቋረጠበት ምክንያት</td>
				<td>Current Case Status/<br/>ጉዳዩ አሁን የደረሰበት ደረጃ</td>
				<td>Investigation Date/<br/>የምርመራ ቀን</td>
				<td>Next Job/<br/>ቀጣይ ሥራ</td>
				<td>Edit/አስተካክል</td>
			</tr>
			<%
				int ctr=1;
				while(investigationItr.hasNext()){
					Investigation i = investigationItr.next();
					Case c = Case.getCase(i.getCaseId());
					Respondent r = Respondent.getRespondent(i.getRespondentId());
					%>
					<tr>
						<td>
							<%=ctr++ %>|
							<a href="#.jsp" onclick="showMoreInformationForThisInvestigation(<%=i.getId() %>);">More</a>
						</td>
						<td><%=c.getCaseIdNumber() %></td>
						<td><%=r.getName() %></td>
						<td><%=i.getCaseTheme().substring(0, 5)+"..." %></td>
						<td><%=i.getWhatRegister().substring(0,5)+"..." %></td>
						<td><%=i.getTerminationReason().substring(0, 5)+"..." %></td>
						<td><%=i.getCurrentStatusOfCase() %></td>
						<td><%=i.getInvestigationDate() %></td>
						<td><%=i.getNextJobAndDate().substring(0,5)+"..." %></td>
						<td>
							<a href="#.jsp" onclick="showEditFieldsOfThisInvestigation(<%=i.getId() %>);">Edit</a>
						</td>
					</tr>
					<%
						String divId = "investigationDetailDiv"+i.getId();
					%>
					<tr>
						<td colspan="10">
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
		<p class="msg warning">There is no information found/ምንም የተገኝ መረጃ የለም</p>
		<%
	}
%>