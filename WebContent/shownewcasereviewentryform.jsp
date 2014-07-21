<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "caseReviewManagement";
	Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	if(true){
%>
<table border="0" width="100%">
	<tr>
		<td>Applicant Id Number/የአመልካች መለያ ቁጥር:</td>
		<td>
			<select name="slctapplicant" id="slctapplicant" style="width:100%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<Applicant> applicantList = Applicant.getAllApplicants();
					if(!applicantList.isEmpty()){
						Iterator<Applicant> applicantItr = applicantList.iterator();
						while(applicantItr.hasNext()){
							Applicant applicant = applicantItr.next();
							String applicantStr = applicant.getFullName()+" : "+applicant.getApplicantIdNumber();
							%>
							<option value="<%=applicant.getId() %>"><%=applicantStr %></option>
							<%
						}//end while loop
					}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<td>Case/ጉዳይ</td>
		<td>
			<select name="slctcase" id="slctcase" style="width:100%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<Case> caseList = Case.getAllCases();
					if(!caseList.isEmpty()){
						Iterator<Case> caseItr = caseList.iterator();
						while(caseItr.hasNext()){
							Case c = caseItr.next();
							String caseStr = c.getEvidenceType()+" : "+c.getCaseIdNumber();							
							%>
							<option value="<%=c.getId() %>"><%=caseStr %></option>
							<%
						}//end while loop
					}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<td>Respondent/መልስ ሠጭ ክፍል:</td>
		<td>
			<select name="slctrespondent" id="slctrespondent" style="width:50%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<Respondent> respondentList = Respondent.getAllRespondents();
					if(!respondentList.isEmpty()){
						Iterator<Respondent> respondentItr = respondentList.iterator();
						while(respondentItr.hasNext()){
							Respondent respondent = respondentItr.next();
							%>
							<option value="<%=respondent.getId() %>"><%=respondent.getName()+" : "+respondent.getRespondentIdNumber() %></option>
							<%
						}//end while loop
					}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<td>Case Theme/ጭብጥ</td>
		<td>
			<textarea rows="4" cols="70" name="textareacasetheme" id="textareacasetheme"></textarea>
		</td>
	</tr>
	<tr>
		<td>Investigation Required/ምርመራ ያስፈልገዋል?:</td>
		<td>
			<select name="slctinvestigationrequired" id="slctinvestigationrequired" style="width:30%">
				<option value="" selected="selected">--Select--</option>
				<option value="true">Yes/ያስፈልጋል</option>
				<option value="false">No/አያስፈልግም</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>Reason/ምክንያት:</td>
		<td>
			<textarea name="textareareason" id="textareareason" cols="70" rows="4"></textarea>
		</td>
	</tr>	
	<tr>		
		<td colspan="2" align="right">
			<input type="button" value = "Save/መዝግብ" class="input-submit"/>
			<input type="reset" value="Clear/አፅዳ" class="input-submit"/>
		</td>
	</tr>
</table>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
%>
<script type="text/javascript">
	$(document).ready(function(){
		CKEDITOR.replace('textareacasetheme');
		CKEDITOR.replace('textareareason');
	});//end document.ready function
</script>