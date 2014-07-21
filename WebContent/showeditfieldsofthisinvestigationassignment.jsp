<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	long assId = Long.parseLong(request.getParameter("assId"));
	InvestigatorAssignment investAss = InvestigatorAssignment.getInvestigatorAssignment(assId);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	//now define the control names in here...
	String caseIdControlName = "slctcase" + assId;
	String respondentIdControlName = "slctrespondent" + assId;
	String fileSourceControlName = "flefilesource" + assId;
	String investigatorIdControlName = "slctinvestigator" + assId;
	String investigatorLevelControlName = "slctinvestigatorlevel" + assId;
	String caseStatusControlName = "slctcasestatus" + assId;
	String dateAssignedControlName = "txtdateassigned" + assId;
	String dateOpenedControlName = "txtdateopened" + assId;
%>
<form method="post" enctype="multipart/form-data" action="updateinvestigationassignmentform.jsp">
<table border="0" width="100%" style="background:lightyellow">	
	<tr>
		<td><label id="">Case</label></td>
		<td>
			<input type="hidden" name="hiddenid" id="hiddenid" value="<%=assId %>"/>
			<select name="<%=caseIdControlName %>" id="<%=caseIdControlName %>" style="width:100%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<Case> caseList = Case.getAllCases();
					if(!caseList.isEmpty()){
						Iterator<Case> caseItr = caseList.iterator();
						while(caseItr.hasNext()){
							Case c = caseItr.next();
							String caseStr = c.getEvidenceType()+" : "+c.getCaseIdNumber();
							if(investAss.getCaseId() == c.getId()){
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
		<td><label id="">Respondent</label></td>
		<td>
			<select name="<%=respondentIdControlName %>" id="<%=respondentIdControlName %>" style="width:50%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<Respondent> respondentList = Respondent.getAllRespondents();
					if(!respondentList.isEmpty()){
						Iterator<Respondent> respondentItr = respondentList.iterator();
						while(respondentItr.hasNext()){
							Respondent respondent = respondentItr.next();
							if(investAss.getRespondentId() == respondent.getId()){
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
		<td><label id="">File Source</label></td>
		<td>
			<input type="file" name="<%=fileSourceControlName %>" id="<%=fileSourceControlName %>"/>
			<%
				if(investAss.getFileSource() != ""){
					%>
					<a href="assignment_import_data/<%=investAss.getFileSource() %>" target="_blank">See Current File/ፋይሉን ተመልከት</a>
					<%
				}else{
					%>
					No file/ፋይል የለም
					<%
				}
			%>
		</td>
	</tr>
	<tr>
		<td><label id="">Investigator</label></td>
		<td>
			<select name="<%=investigatorIdControlName %>" id="<%=investigatorIdControlName %>" style="width:50%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<AdminField> investigatorList = AdminField.getAllOptionValuesForThisFieldName("Investigator");
					if(!investigatorList.isEmpty()){
						Iterator<AdminField> investigatorItr = investigatorList.iterator();
						while(investigatorItr.hasNext()){
							AdminField adminField = investigatorItr.next();
							if(adminField.getOptionValue().equalsIgnoreCase(investAss.getInvestigator())){
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
		<td colspan="2">
			<div id="allCasesOfInvestigatorDiv"></div>
		</td>
	</tr>
	<tr>
		<td><label id="">Investigator Level</label></td>
		<td>
			<select name="<%=investigatorLevelControlName %>" id="<%=investigatorLevelControlName %>" style="width:50%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<AdminField> investigatorLevelList = AdminField.getAllOptionValuesForThisFieldName("Investigator Level");
					if(!investigatorLevelList.isEmpty()){
						Iterator<AdminField> investigatorLevelItr = investigatorLevelList.iterator();
						while(investigatorLevelItr.hasNext()){
							AdminField adminField = investigatorLevelItr.next();
							if(adminField.getOptionValue().equalsIgnoreCase(investAss.getInvestigatorLevel())){
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
		<td><label id="">Case Status</label></td>
		<td>
			<select name="<%=caseStatusControlName %>" id="<%=caseStatusControlName %>" style="width:50%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<AdminField> caseStatusList = AdminField.getAllOptionValuesForThisFieldName("Case Status");
					if(!caseStatusList.isEmpty()){
						Iterator<AdminField> caseStatusItr = caseStatusList.iterator();
						while(caseStatusItr.hasNext()){
							AdminField adminField = caseStatusItr.next();
							if(adminField.getOptionValue().equalsIgnoreCase(investAss.getCaseStatus())){
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
		<td><label id="">Date Assigned</label></td>
		<td>
			<input type="text" name="<%=dateAssignedControlName %>" id="<%=dateAssignedControlName %>" value="<%=investAss.getDateAssigned() %>"/>
			<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('<%=dateAssignedControlName %>')" /></td>
		</td>
	</tr>
	<tr>
		<td><label id="">Date Opened</label></td>
		<td>
			<input type="text" name="<%=dateOpenedControlName %>" id="<%=dateOpenedControlName %>" value="<%=investAss.getOpenDate() %>"/>
			<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('<%=dateOpenedControlName %>')" /></td>
		</td>
	</tr>	
	<tr>		
		<td colspan="2" align="right">
			<%
				String buttonId = "btnupdate" + assId;
			
				String lblUpdateButtonLabel = "lblupdatebutton";
				String updateButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblupdateallbutton");
				label = Label.getLabelUsingLabelId("lblupdatebutton");
				String updateButtonCaption = updateButtonLabel != null ? updateButtonLabel : label.getLabelCaption();
				
				String lblUndoButtonLabel = "lblundobutton";
				String undoButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblundobutton");
				label = Label.getLabelUsingLabelId("lblupdatebutton");
				String undoButtonCaption = undoButtonLabel != null ? undoButtonLabel : label.getLabelCaption();
			%>
			<input type="submit" value = "<%=updateButtonCaption %>" class="input-submit" id="<%=buttonId %>"/>
			<input type="reset" value="<%=undoButtonCaption %>" class="input-submit"/>
		</td>
	</tr>
</table>
</form>