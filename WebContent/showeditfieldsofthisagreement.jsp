<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	long agreementId = Long.parseLong(request.getParameter("agreementId"));
	Agreement ag = Agreement.getAgreement(agreementId);
%>
<table border="0" width="100%" style="background:lightyellow">	
	<tr>
		<td>Case/ጉዳይ:</td>
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
							if(ag.getCaseId() == c.getId()){
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
		<td>Respondent/መልስ ሰጭ ክፍል:</td>
		<td>
			<select name="slctrespondent" id="slctrespondent" style="width:50%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<Respondent> respondentList = Respondent.getAllRespondents();
					if(!respondentList.isEmpty()){
						Iterator<Respondent> respondentItr = respondentList.iterator();
						while(respondentItr.hasNext()){
							Respondent respondent = respondentItr.next();
							if(ag.getRespondentId() == respondent.getId()){
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
		<td>Case Theme/የጉዳዩ ጭብጥ:</td>
		<td>
			<textarea name="textareacasetheme" id="textareacasetheme" cols="70" rows="4"><%=ag.getCaseTheme() %></textarea>
		</td>
	</tr>		
	<tr>
		<td>Investigator Point of View/የመርማሪው አስተያየት:</td>
		<td>
			<textarea name="textareainvestigatorpointofview" id="textareainvestigatorpointofview" cols="70" rows="4"><%=ag.getInvestigatorPointOfView() %></textarea>
		</td>
	</tr>
	<tr>
		<td>Applicant Stand/የአመልካቹ አስተያየት:</td>
		<td>
			<textarea name="textareaapplicantstand" id="textareaapplicantstand" cols="70" rows="4"><%=ag.getApplicantStand() %></textarea>
		</td>
	</tr>
	<tr>
		<td>Respondent Stand/የመልስ ሰጭ ክፍል አስተያየት:</td>
		<td>
			<textarea name="textarearespondentstand" id="textarearespondentstand" cols="70" rows="4"><%=ag.getRespondentStand() %></textarea>
		</td>
	</tr>
	<tr>
		<td>Agreement/ስምምነት:</td>
		<td>
			<textarea name="textareaagreement" id="textareaagreement" cols="70" rows="4"><%=ag.getTheAgreement() %></textarea>
		</td>
	</tr>	
	<tr>
		<td>Result/ውጤት:</td>
		<td>
			<select name="slctresult" id="slctresult" style="width:50%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<AdminField> resultList = AdminField.getAllOptionValuesForThisFieldName("Result");
					if(!resultList.isEmpty()){
						Iterator<AdminField> resultItr = resultList.iterator();
						while(resultItr.hasNext()){
							AdminField adminField = resultItr.next();
							if(ag.getResult().equalsIgnoreCase(adminField.getOptionValue())){
							%>
							<option value="<%=adminField.getOptionValue() %>" selected="selected"><%=adminField.getOptionValue() %></option>
							<%
							}else{
								%>
								<option value="<%=adminField.getOptionValue() %>"><%=adminField.getOptionValue() %></option>
								<%
							}
						}//end while loop
					}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<td>Agreement Date/የስምምነት ቀን:</td>
		<td>
			<input type="text" name="txtagreementdate" id="txtagreementdate" value="<%=ag.getAgreementDate() %>"/>
			<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtagreementdate')" /></td>
		</td>
	</tr>	
	<tr>
		<td></td>
		<td>
			<input type="button" value = "Update/አድስ" class="input-submit" onclick="updateAgreement(<%=agreementId %>,
				document.getElementById('slctcase').value,document.getElementById('slctrespondent').value,
				document.getElementById('textareacasetheme').value,
				document.getElementById('textareainvestigatorpointofview').value,document.getElementById('textareaapplicantstand').value,
				document.getElementById('textareaagreement').value,document.getElementById('slctresult').value,
				document.getElementById('txtagreementdate').value,document.getElementById('textarearespondentstand').value);"/>
			<input type="reset" value="Clear/አፅዳ" class="input-submit"/>
		</td>
	</tr>
</table>