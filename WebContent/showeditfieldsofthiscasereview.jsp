<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	long caseReviewId = Long.parseLong(request.getParameter("caseReviewId"));
	CaseReview caseReviewObj = CaseReview.getCaseReview(caseReviewId);
	//now define the control names in here...
	String caseIdControlName = "slctcase" + caseReviewId;
	String respondentIdControlName = "slctrespondent" + caseReviewId;
	String caseThemeControlName = "textareacasetheme" + caseReviewId;
	String investigationRequiredControlName = "slctinvestigationrequired" + caseReviewId;
	String reasonControlName = "textareareason" + caseReviewId;
%>
<form>
<table border="0" width="100%" style="background:lightyellow">	
	<tr>
		<td>Case/ጉዳይ</td>
		<td>
			<select name="<%=caseIdControlName %>" id="<%=caseIdControlName %>" style="width:100%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<Case> caseList = Case.getAllCases();
					if(!caseList.isEmpty()){
						Iterator<Case> caseItr = caseList.iterator();
						while(caseItr.hasNext()){
							Case c = caseItr.next();
							String caseStr = c.getEvidenceType()+" : "+c.getCaseIdNumber();
							if(caseReviewObj.getCaseId() == c.getId()){
							%>
							<option value="<%=c.getId() %>" selected="selected"><%=caseStr %></option>
							<%
							}else{
								%>
								<option value="<%=c.getId() %>"><%=caseStr %></option>
								<%
							}
						}//end while loop
					}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<td>Respondent/መልስ ሠጭ ክፍል:</td>
		<td>
			<select name="<%=respondentIdControlName %>" id="<%=respondentIdControlName %>" style="width:50%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<Respondent> respondentList = Respondent.getAllRespondents();
					if(!respondentList.isEmpty()){
						Iterator<Respondent> respondentItr = respondentList.iterator();
						while(respondentItr.hasNext()){
							Respondent respondent = respondentItr.next();
							if(caseReviewObj.getRespondentId()==respondent.getId()){
							%>
							<option value="<%=respondent.getId() %>" selected="selected"><%=respondent.getName()+" : "+respondent.getRespondentIdNumber() %></option>
							<%
							}else{
								%>
								<option value="<%=respondent.getId() %>"><%=respondent.getName()+" : "+respondent.getRespondentIdNumber() %></option>
								<%
							}
						}//end while loop
					}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<td>Case Theme/ጭብጥ</td>
		<td>
			<textarea rows="4" cols="70" name="<%=caseThemeControlName %>" id="<%=caseThemeControlName %>"><%=caseReviewObj.getCaseTheme() %></textarea>
		</td>
	</tr>
	<tr>
		<td>Investigation Required/ምርመራ ያስፈልገዋል?:</td>
		<td>
			<select name="<%=investigationRequiredControlName %>" id="<%=investigationRequiredControlName %>" style="width:30%">				
				<%
				if(caseReviewObj.isInvestigationRequired()==true){
				%>
				<option value="true" selected="selected">Yes/ያስፈልጋል</option>
				<option value="false">No/አያስፈልግም</option>
				<%
				}else if(caseReviewObj.isInvestigationRequired()==false){
					%>
					<option value="true">Yes/ያስፈልጋል</option>
					<option value="false" selected="selected">No/አያስፈልግም</option>
					<%
				}else{
					%>
					<option value="" selected="selected">--Select--</option>
					<%
				}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<td>Reason/ምክንያት:</td>
		<td>
			<textarea name="<%=reasonControlName %>" id="<%=reasonControlName %>" cols="70" rows="4"><%=caseReviewObj.getReason() %></textarea>
		</td>
	</tr>	
	<tr>
		<td></td>
		<td>
			<%
				String buttonId = "btnupdate" + caseReviewId;
			%>
			<input type="button" value = "Update/አድስ" class="input-submit" id="<%=buttonId %>"/>
			<input type="reset" value="Clear/አፅዳ" class="input-submit"/>
		</td>
	</tr>
</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var caseReviewId = "<%=caseReviewId%>";
		var textareaReason = "textareareason" + caseReviewId;
		var textareaCaseTheme = "textareacasetheme" + caseReviewId;		
		CKEDITOR.replace(textareaReason);
		CKEDITOR.replace(textareaCaseTheme);
	});//end document.ready function
</script>