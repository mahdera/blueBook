<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	long applicantId = Long.parseLong(request.getParameter("applicantId"));
	List<CaseReview> caseReviewList = CaseReview.getAllCaseReviewsForThisApplicant(applicantId);
	if(!caseReviewList.isEmpty()){
		Iterator<CaseReview> caseReviewItr = caseReviewList.iterator();
		%>
		<table border="0" width="100%">
			<tr style="background:#eee;font-weight:12pt;font-style:bolder">
				<td>Ser.No/ተራ.ቁ</td>
				<td>Case No/የጉዳይ ቁጥር</td>
				<td>Respondent/መልስ ሰጭ ክፍል</td>
				<td>Case Theme/የጉዳዩ ጭብጥ</td>
				<td>Investigation Required/ምርመራ ያስፈልጋል?</td>
				<td>Reason/ምክንያት</td>
			</tr>
			<%
				int ctr=1;
				while(caseReviewItr.hasNext()){
					CaseReview caseReview = caseReviewItr.next();
					%>
					<tr>
						<td><%=ctr++ %></td>
						<td><%=Case.getCase(caseReview.getCaseId()).getCaseIdNumber() %></td>
						<td><%=Respondent.getRespondent(caseReview.getRespondentId()).getName() %></td>
						<td><%=caseReview.getCaseTheme() %></td>
						<td><%=(caseReview.isInvestigationRequired()==true?"Yes":"No") %></td>
						<td><%=caseReview.getReason() %></td>
					</tr>
					<%
				}//end while loop
			%>
		</table>
		<%
	}else{
		%>
		<p class="msg warning">There is no case review information/የጉዳይ ሪቪው መረጃ አልተገኝም</p>
		<%
	}
%>