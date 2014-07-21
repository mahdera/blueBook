<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*" %>
<%
	long applicantId = Long.parseLong(request.getParameter("applicantId"));
	List<Followup> followUpList = Followup.getAllFollowUpsForThisApplicant(applicantId);
	if(!followUpList.isEmpty()){
		Iterator<Followup> followUpItr = followUpList.iterator();
		%>
		<table border="0" width="100%">
			<tr style="background:#eee;font-weight:bolder;font-size:11pt">
				<td>Ser.No/<br/>ተራ.ቁ:</td>
				<td>Case/<br/>ጉዳይ:</td>
				<td>Respondent/<br/>መልስ ሰጭ ክፍል:</td>
				<td>Case Theme/<br/>የጉዳዩ ጭብጥ:</td>
				<td>Decision Given/<br/>የተሠጠ ውሳኔ:</td>
				<td>Follow up Date/<br/>የክትትል ቀን:</td>
				<td>Edit/አስተካክል</td>
			</tr>
			<%	
				int ctr=1;
				while(followUpItr.hasNext()){
					Followup f = followUpItr.next();
					%>
					<tr>
						<td><%=ctr++ %></td>
						<td><%=Case.getCase(f.getCaseId()).getCaseIdNumber() %></td>
						<td><%=Respondent.getRespondent(f.getRespondentId()).getName() %></td>
						<td><%=f.getCaseTheme() %></td>
						<td><%=f.getDecisionGiven() %></td>
						<td><%=f.getFollowupDate() %></td>
						<td align="center">
							<a href="#.jsp" onclick="showEditFieldsOfThisFollowUp(<%=f.getId() %>);">Edit</a>
						</td>
					</tr>
					<%
						String divId = "followUpEditDiv"+f.getId();
					%>
					<tr>
						<td colspan="7">
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
<script type="text/javascript">
	function showEditFieldsOfThisFollowUp(followUpId){
		var divId = "followUpEditDiv"+followUpId;
		$('#'+divId).load('showeditfieldsofthisfollowup.jsp?followUpId='+followUpId);		
	}
</script>