<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*" %>
<%
	long applicantId = Long.parseLong(request.getParameter("applicantId"));
	List<Agreement> agreementList = Agreement.getAllAgreementsForThisApplicant(applicantId);
	if(!agreementList.isEmpty()){
		Iterator<Agreement> agreementItr = agreementList.iterator();
		%>
		<table border="0" width="100%">
			<tr style="background:#eee;font-weight:bolder;font-size:11pt">
				<td>Ser.No/<br/>ተራ.ቁ:</td>
				<td>Case/<br/>ጉዳይ:</td>
				<td>Respondent/<br/>መልስ ሰጭ ክፍል:</td>
				<td>Case Theme/<br/>የጉዳዩ ጭብጥ:</td>
				<td>Investigator Point of View/<br/>የመርማሪው አስተያየት:</td>
				<td>Applicant Stand/<br/>የአመልካቹ አስተያየት:</td>
				<td>Respondent Stand/<br/>የመልስ ሰጭ ክፍል አስተያየት</td>
				<td>Agreement/<br/>ስምምነት</td>
				<td>Result/<br/>ውጤት</td>
				<td>Agreement Date/<br/>የስምምነት ቀን</td>
				<td>Delete/አጥፋ</td>
			</tr>
			<%
				int ctr=1;
				while(agreementItr.hasNext()){
					Agreement a = agreementItr.next();
					%>
					<tr>
						<td><%=ctr++ %></td>
						<td><%=Case.getCase(a.getCaseId()).getCaseIdNumber() %></td>
						<td><%=Respondent.getRespondent(a.getRespondentId()).getName() %></td>
						<td><%=a.getCaseTheme().substring(0, 3)+"..." %></td>
						<td><%=a.getInvestigatorPointOfView().substring(0, 3)+"..." %></td>
						<td><%=a.getApplicantStand().substring(0, 3)+"..." %></td>
						<td><%=a.getRespondentStand() %></td>
						<td><%=a.getTheAgreement().substring(0, 3)+"..." %></td>
						<td><%=a.getResult().substring(0, 3)+"..." %></td>
						<td><%=a.getAgreementDate() %></td>
						<td>
							<a href="#.jsp" onclick="deleteThisAgreement(<%=a.getId() %>);">Delete</a>
						</td>
					</tr>
					<%
						String divId = "agreementEditDiv"+a.getId();
					%>
					<tr>
						<td colspan="11">
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