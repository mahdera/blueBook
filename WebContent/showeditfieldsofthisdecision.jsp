<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.sql.Date" %>
<%
	long decisionId = Long.parseLong(request.getParameter("decisionId"));
	Decision d = Decision.getDecision(decisionId);
	//List<Decision> decisionList = Decision.getAllDecisionsForThisApplicant(applicantId);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	//now define the control names in here...
	String applicantControlName = "slctapplicant" + decisionId;
	String caseControlName = "slctcase" + decisionId;
	String respondentControlName = "slctrespondent" + decisionId;
	String decisionControlName = "raddecision" + decisionId;
	String decisionRejectedControlName = "radreject" + decisionId;
	String decisionAcceptedControlName = "radaccept" + decisionId;
	String decisionEarlyResolutionControlName = "radearlyresolution" + decisionId;
	String notesControlName = "textareanotes" + decisionId;
	String focusControlName = "textareafocus" + decisionId;
	String registrationDateControlName = "txtregistrationdate" + decisionId;
	String registrationDateControlNameEthiopic = "txtregistrationdateethiopic" + decisionId;
	String caseTypeControlName = "slctcasetype" + decisionId;
	String formId = "frmeditdecision" + decisionId;
	String registrationDateSelectControlName = "slctregistrationdate" + decisionId;
	String registrationMonthSelectControlName = "slctregistrationmonth" + decisionId;
	String registrationYearSelectControlName = "slctregistrationyear" + decisionId;
%>
<form id="<%=formId%>">
<table border="0" width="100%" style="background:#eee">
	<tr>
		<td width="30%"><label id="lblfilenumber"><%
					String lblFileNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfilenumber");
					label = Label.getLabelUsingLabelId("lblfilenumber");
	 				out.print(lblFileNumber != null ? lblFileNumber : label.getLabelCaption());
	 			%></label></td>
		<td>
			<input type="text" name="txtfilenumber" id="txtfilenumber" style="width:35%" readonly="readonly" value="<%=d.getFileNumber() %>"/>
		</td>
	</tr>
	<tr>
		<td><label id="lblapplicantidnumber"><%
					String lblApplicantIdNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblapplicantidnumber");
					label = Label.getLabelUsingLabelId("lblapplicantidnumber");
	 				out.print(lblApplicantIdNumber != null ? lblApplicantIdNumber : label.getLabelCaption());
	 			%></label></td>
		<td>
			<select name="<%=applicantControlName %>" id="<%=applicantControlName %>" style="width:100%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<Applicant> applicantList = Applicant.getAllApplicants();
					if(!applicantList.isEmpty()){
						Iterator<Applicant> applicantItr = applicantList.iterator();
						while(applicantItr.hasNext()){
							Applicant applicant = applicantItr.next();
							String applicantStr = applicant.getFullName()+" : "+applicant.getApplicantIdNumber();
							if(applicant.getId() == d.getApplicantId()){
							%>
								<option value="<%=applicant.getId() %>" selected="selected"><%=applicantStr %></option>
							<%
							}else{
							%>
								<option value="<%=applicant.getId() %>"><%=applicantStr %></option>
							<%
							}
						}//end while loop
					}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<td><label id="lblcase"><%
					String lblCase = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcase");
					label = Label.getLabelUsingLabelId("lblcase");
	 				out.print(lblCase != null ? lblCase : label.getLabelCaption());
	 			%></label></td>
		<td>
			<select name="<%=caseControlName %>" id="<%=caseControlName %>" style="width:100%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<Case> caseList = Case.getAllCases();
					if(!caseList.isEmpty()){
						Iterator<Case> caseItr = caseList.iterator();
						while(caseItr.hasNext()){
							Case c = caseItr.next();
							AdminField adminField = AdminField.getAdminField(c.getEvidenceTypeId());							
							String caseStr = (adminField != null ? adminField.getOptionValue() : "---") + c.getCaseIdNumber();
							if(c.getId() == d.getCaseId()){
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
		<td colspan="2">
			<%
				String caseThemeDivId = "caseThemeDiv" + decisionId;
			%>
			<div id="<%=caseThemeDivId %>"></div>
		</td>
	</tr>
	<tr>
		<td><label id="lblrespondent"><%
					String lblRespondent = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrespondent");
					label = Label.getLabelUsingLabelId("lblrespondent");
	 				out.print(lblRespondent != null ? lblRespondent : label.getLabelCaption());
	 			%></label></td>
		<td>
			<select name="<%=respondentControlName %>" id="<%=respondentControlName %>" style="width:100%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<Respondent> respondentList = Respondent.getAllRespondents();
					if(!respondentList.isEmpty()){
						Iterator<Respondent> respondentItr = respondentList.iterator();
						while(respondentItr.hasNext()){
							Respondent respondent = respondentItr.next();
							if(respondent.getId() == d.getRespondentId()){
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
		<td><label id="lbldecisiongiven"><%
					String lblDecisionGiven = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldecisiongiven");
					label = Label.getLabelUsingLabelId("lbldecisiongiven");
	 				out.print(lblDecisionGiven != null ? lblDecisionGiven : label.getLabelCaption());
	 			%></label></td>
		<td>
			<table border="0" width="100%">
				<tr>
					<td>
						<%						
							if(d.getDecisionGiven().equalsIgnoreCase("rejected") || d.getDecisionGiven().startsWith("ውድቅ")){
								String lblReject = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblreject");
						%>
								<input type="radio" name="<%=decisionControlName %>" id="<%=decisionRejectedControlName %>" value="<%label = Label.getLabelUsingLabelId("lblreject");
				 				out.print(lblReject != null ? lblReject : label.getLabelCaption());%>" checked="checked"/> <label id="lblreject">
								<%label = Label.getLabelUsingLabelId("lblreject");
				 				out.print(lblReject != null ? lblReject : label.getLabelCaption());%>
				 				</label>
						<%
							}else{
								String lblReject = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblreject");
						%>
								<input type="radio" name="<%=decisionControlName %>" id="<%=decisionRejectedControlName %>" value="<%label = Label.getLabelUsingLabelId("lblreject");
	 							out.print(lblReject != null ? lblReject : label.getLabelCaption());%>"/> <label id="lblreject">
								<%label = Label.getLabelUsingLabelId("lblreject");
	 							out.print(lblReject != null ? lblReject : label.getLabelCaption());%>
	 							</label>
						<%
							}
						%>
					</td>
					<td>
						<%
							if(d.getDecisionGiven().equalsIgnoreCase("accepted") || d.getDecisionGiven().startsWith("ተቀ")){
								String lblAccepted = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblaccept");
						%>
								<input type="radio" name="<%=decisionControlName %>" id="<%=decisionAcceptedControlName %>" value="<%label = Label.getLabelUsingLabelId("lblaccept");
				 				out.print(lblAccepted != null ? lblAccepted : label.getLabelCaption());%>" checked="checked"/> <label id="lblaccept">
								<%label = Label.getLabelUsingLabelId("lblaccept");
				 				out.print(lblAccepted != null ? lblAccepted : label.getLabelCaption());%>
				 				</label>
						<%
							}else{
								String lblAccepted = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblaccept");
						%>
								<input type="radio" name="<%=decisionControlName %>" id="<%=decisionAcceptedControlName %>" value="<%label = Label.getLabelUsingLabelId("lblaccept");
					 				out.print(lblAccepted != null ? lblAccepted : label.getLabelCaption());%>"/> <label id="lblaccept">
								<%label = Label.getLabelUsingLabelId("lblaccept");
					 				out.print(lblAccepted != null ? lblAccepted : label.getLabelCaption());%>
					 			</label>
						<%
							}
						%>
					</td>
					<td>
						<%
							if(d.getDecisionGiven().equalsIgnoreCase("early resolution") || d.getDecisionGiven().startsWith("አፋጣኝ")){
								String lblEarlyResolution = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblearlyresolution");
						%>
								<input type="radio" name="<%=decisionControlName %>" id="<%=decisionEarlyResolutionControlName %>" value="<%label = Label.getLabelUsingLabelId("lblearlyresolution");
					 				out.print(lblEarlyResolution != null ? lblEarlyResolution : label.getLabelCaption());%>" checked="checked"/> <label id="lblearlyresolution">
								<%label = Label.getLabelUsingLabelId("lblearlyresolution");
					 				out.print(lblEarlyResolution != null ? lblEarlyResolution : label.getLabelCaption());%>
					 			</label>
						<%
							}else{
								String lblEarlyResolution = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblearlyresolution");
						%>
								<input type="radio" name="<%=decisionControlName %>" id="<%=decisionEarlyResolutionControlName %>" value="<%label = Label.getLabelUsingLabelId("lblearlyresolution");
					 			out.print(lblEarlyResolution != null ? lblEarlyResolution : label.getLabelCaption());%>"/> <label id="lblearlyresolution">
								<%label = Label.getLabelUsingLabelId("lblearlyresolution");
					 			out.print(lblEarlyResolution != null ? lblEarlyResolution : label.getLabelCaption());%>
					 			</label>
						<%	
							}
						%>		
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<%
			String rejectReasonDivId = "rejectReasonDiv" + decisionId;
		%>
		<td colspan="2">
			<div id="<%=rejectReasonDivId%>">
				<%
					if(d.getDecisionGiven().equalsIgnoreCase("rejected") || d.getDecisionGiven().startsWith("ውድቅ")){
						String rejectSelectControlName = "slctrejectionreason" + decisionId;
						RejectionReason rejectionReason = RejectionReason.getRejectionReasonForDecision(decisionId);
						%>
							<label id="lblrejectionreason"><%
					String lblRejectionReason = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrejectionreason");
					label = Label.getLabelUsingLabelId("lblrejectionreason");
	 				out.print(lblRejectionReason != null ? lblRejectionReason : label.getLabelCaption());
	 			%></label>
							<br/>
							<select name="<%=rejectSelectControlName %>" id="<%=rejectSelectControlName %>" style="width:100%">
			<option value="" selected="selected">--Select--</option>
			<%
				List<AdminField> rejectionReasonList = AdminField.getAllOptionValuesForThisFieldName("Rejection Reason");
				if(!rejectionReasonList.isEmpty()){
					if(rejectionReason != null){
						Iterator<AdminField> rejectionReasonItr = rejectionReasonList.iterator();
						while(rejectionReasonItr.hasNext()){
							AdminField adminField = rejectionReasonItr.next();
							AdminFieldTranslation rejectionReasonAdminField = AdminFieldTranslation.
									getAdminFieldTranslationForThisLanguageAndAdminField(langId,adminField.getId());
							if(rejectionReasonAdminField != null){							
								if(rejectionReasonAdminField.getAdminFieldId() == rejectionReason.getRejectionReasonId()){
							%>
								<option value="<%=rejectionReasonAdminField.getAdminFieldId() %>" selected="selected"><%=rejectionReasonAdminField.getTranslatedValue() %></option>
							<%
								}else{
							%>
								<option value="<%=rejectionReasonAdminField.getAdminFieldId() %>"><%=rejectionReasonAdminField.getTranslatedValue() %></option>
							<%
								}
							}else{
								if(adminField.getId() == rejectionReason.getRejectionReasonId()){
							%>
								<option value="<%=adminField.getId() %>" selected="selected"><%=adminField.getOptionValue() %></option>
							<%
								}else{
							%>
								<option value="<%=adminField.getId() %>"><%=adminField.getOptionValue() %></option>
							<%
								}
							}
						}//end while loop
					}else{
						%>
						<option value="" selected="selected">--Select--</option>
						<%
							rejectionReasonList = AdminField.getAllOptionValuesForThisFieldName("Rejection Reason");
							if(!rejectionReasonList.isEmpty()){
								Iterator<AdminField> rejectionReasonItr = rejectionReasonList.iterator();
								while(rejectionReasonItr.hasNext()){
									AdminField adminField = rejectionReasonItr.next();
									AdminFieldTranslation rejectionReasonAdminField = AdminFieldTranslation.
											getAdminFieldTranslationForThisLanguageAndAdminField(langId,adminField.getId());
									if(rejectionReasonAdminField != null){
									%>
										<option value="<%=rejectionReasonAdminField.getAdminFieldId() %>"><%=rejectionReasonAdminField.getTranslatedValue() %></option>
									<%
									}else{
									%>
										<option value="<%=adminField.getId() %>"><%=adminField.getOptionValue() %></option>
									<%
									}
								}//end while loop
							}					
					}
				}//end if empty list checking condition...
			%>
		</select>
						<%
					}
				%>
			</div>
		</td>
	</tr>
	<tr>
		<td><label id="lblnotes"><%
					String lblNotes = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnotes");
					label = Label.getLabelUsingLabelId("lblnotes");
	 				out.print(lblNotes != null ? lblNotes : label.getLabelCaption());
	 			%></label></td>
		<td>
			<textarea class="jqte-test" name="<%=notesControlName %>" id="<%=notesControlName %>" cols="70" rows="4"><%=d.getNotes() %></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<fieldset>
				<legend><label id="lblfocus"><%
					String lblFocus = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfocus");
					label = Label.getLabelUsingLabelId("lblfocus");
	 				out.print(lblFocus != null ? lblFocus : label.getLabelCaption());
	 			%></label></legend>
				<table border="0" width="100%">
					<tr>
						<td width="34%">
							<label id="lblfocus">
								<%
									label = Label.getLabelUsingLabelId("lblfocus");
					 				out.print(lblFocus != null ? lblFocus : label.getLabelCaption());
								%>
							</label>
						</td>
						<td>
							<textarea name="<%=focusControlName %>" id="<%=focusControlName %>" rows="3" style="width:100%" class="jqte-test"><%=d.getFocus() %></textarea>
						</td>
					</tr>
					<tr>
						<td><label id="lblcasetype"><%
					String lblCaseType = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasetype");
					label = Label.getLabelUsingLabelId("lblcasetype");
	 				out.print(lblCaseType != null ? lblCaseType : label.getLabelCaption());
	 			%></label></td>
						<td>
							<select name="<%=caseTypeControlName %>" id="<%=caseTypeControlName %>" style="width:100%">
								<option value="" selected="selected">--Select--</option>
								<%
									List<AdminField> caseTypeList = AdminField.getAllOptionValuesForThisFieldName("Case Type");
									if(!caseTypeList.isEmpty()){
										Iterator<AdminField> caseTypeItr = caseTypeList.iterator();
										while(caseTypeItr.hasNext()){
											AdminField adminField = caseTypeItr.next();											
											AdminFieldTranslation caseTypeAdminField = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, adminField.getId());
												if(caseTypeAdminField != null){
													if(caseTypeAdminField.getAdminFieldId() == d.getCaseTypeId()){
													%>
														<option value="<%=caseTypeAdminField.getAdminFieldId() %>" selected="selected"><%=caseTypeAdminField.getTranslatedValue() %></option>
													<%
													}else{
													%>
														<option value="<%=caseTypeAdminField.getAdminFieldId() %>"><%=caseTypeAdminField.getTranslatedValue() %></option>
													<%
													}
												}else{
													if(adminField.getId() == d.getCaseTypeId()){
													%>
														<option value="<%=adminField.getId() %>" selected="selected"><%=adminField.getOptionValue() %></option>
													<%
													}else{
													%>
														<option value="<%=adminField.getId() %>"><%=adminField.getOptionValue() %></option>
													<%
													}
												}											
										}//end while loop
									}//end caseTypeList empty condition checker if logic...
								%>
							</select>
						</td>
					</tr>
				</table>
			</fieldset>
		</td>
	</tr>
	<tr>
		<td><label id="lblregistrationdate"><%
					String lblRegistrationDate = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblregistrationdate");
					label = Label.getLabelUsingLabelId("lblregistrationdate");
	 				out.print(lblRegistrationDate != null ? lblRegistrationDate : label.getLabelCaption());
	 			%></label></td>
		<td>
			<%
				if(langId == 1){
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					Calendar cal = Calendar.getInstance();
					String currentDate = dateFormat.format(cal.getTime());
					Date modificationDate = Date.valueOf(currentDate);
					StringTokenizer token = new StringTokenizer(currentDate,"-");
					String strYear = token.nextToken();	
					int year = Integer.parseInt(strYear);
					///now convert the greg date to ethiopic date and show the values in the 
					//drop down controls...
					StringTokenizer tokenD = new StringTokenizer(String.valueOf(d.getRegistrationDate()),"-");
					String gregStrYear = tokenD.nextToken();
					String gregStrMonth = tokenD.nextToken();
					String gregStrDate = tokenD.nextToken();
					//now convert this to Ethiopic date...
					Day day = DateConverter.toEthiopian(Integer.parseInt(gregStrDate), Integer.parseInt(gregStrMonth), 
							Integer.parseInt(gregStrYear));
					if(day != null){
						String ethDblMonth = "";
						String ethDblDate = "";
						if(day.getMonth() < 10){
							ethDblMonth = "0" + day.getMonth();
						}else{
							ethDblMonth = String.valueOf(day.getMonth());
						}
						
						if(day.getDate() < 10){
							ethDblDate = "0" + day.getDate();	
						}else{
							ethDblDate = String.valueOf(day.getDate());
						}
						
						String strEthDate = day.getYear()+"-"+ethDblMonth+"-"+ethDblDate;		
						Date ethDate = Date.valueOf(strEthDate.trim());						
					}				
					%>
						<table border="0" width="100%">
        						<tr style="background:#ccc">
        							<td>ቀን</td>
        							<td>ወር</td>
        							<td>ዓመት</td>
        						</tr>
        						<tr>
        							<td>
        								<select name="<%=registrationDateSelectControlName %>" id="<%=registrationDateSelectControlName %>" style="width:100%">
        									<option value="" selected="selected">--Select--</option>
        									<%
        										for(int i=1;i<=30;i++){
        											if(day.getDate() == i){
        											%>
        												<option value="<%=i %>" selected="selected"><%=i %></option>
        											<%
        											}else{
        											%>
        												<option value="<%=i %>"><%=i %></option>
        											<%
        											}
        										}//end for...loop
        									%>
        								</select>
        							</td>
        							<td>
        								<select name="<%=registrationMonthSelectControlName %>" id="<%=registrationMonthSelectControlName %>" style="width:100%">
        									<option value="" selected="selected">--Select--</option>
        									<%
        										List<EthiopicMonth> ethiopicMonthList = EthiopicMonth.getAllEthiopicMonths();
        										Iterator<EthiopicMonth> ethiopicMonthItr = ethiopicMonthList.iterator();
        										while(ethiopicMonthItr.hasNext()){
        											EthiopicMonth ethiopicMonth = ethiopicMonthItr.next();
        											if(day.getMonth() == ethiopicMonth.getMonthIndex()){
        											%>
        												<option value="<%=ethiopicMonth.getMonthIndex() %>" selected="selected"><%=ethiopicMonth.getMonthName() %></option>
        											<%
        											}else{
        											%>
        												<option value="<%=ethiopicMonth.getMonthIndex() %>"><%=ethiopicMonth.getMonthName() %></option>
        											<%
        											}
        										}//end while loop
        									%>
        								</select>
        							</td>
        							<td>
        								<select name="<%=registrationYearSelectControlName %>" id="<%=registrationYearSelectControlName %>" style="width:100%">
        									<option value="" selected="selected">--Select--</option>
        									<%
         									int startYear = year - 5;
         									for(int i=year;i>=startYear;i--){
         										Day ethiopicDay = DateConverter.toEthiopian(1, 1, i);
         										int ethYear = ethiopicDay.getYear();
         										if(day.getYear() == ethYear){
         										%>
         											<option value="<%=ethYear%>" selected="selected"><%=ethYear %></option>
         										<%
         										}else{
         										%>
         											<option value="<%=ethYear%>"><%=ethYear %></option>
         										<%
         										}
         									}//end for...loop
        									%>
        								</select>        								
        							</td>
        						</tr>
        					</table>
					<%
				}else{
			%>							
					<input type="text" name="<%=registrationDateControlName %>" id="<%=registrationDateControlName %>" value="<%=d.getRegistrationDate() %>"/>
			<%
				}
			%>			
		</td>
	</tr>	
	<tr>		
		<td colspan="2" align="right">
			<input type="hidden" name="<%=registrationDateControlNameEthiopic %>" id="<%=registrationDateControlNameEthiopic %>" value="<%=d.getRegistrationDate() %>"/>			
			<%
					String buttonId = "btnupdate" + decisionId;
				
					String lblUpdateButtonLabel = "lblupdatebutton";
					String updateButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblupdateallbutton");
					label = Label.getLabelUsingLabelId("lblupdatebutton");
					String updateButtonCaption = updateButtonLabel != null ? updateButtonLabel : label.getLabelCaption();
					
					String lblUndoButtonLabel = "lblundobutton";
					String undoButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblundobutton");
					label = Label.getLabelUsingLabelId("lblupdatebutton");
					String undoButtonCaption = undoButtonLabel != null ? undoButtonLabel : label.getLabelCaption();
				%>
			<input type="button" value = "<%=updateButtonCaption %>" id="<%=buttonId %>" class="input-submit"/>
			<input type="reset" value="<%=undoButtonCaption %>" class="input-submit"/>
		</td>
	</tr>
</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var decisionId = "<%=decisionId%>";
		var langId = "<%=langId%>";
		var registrationDateControlName = "txtregistrationdate" + decisionId;
		$('#'+registrationDateControlName).Zebra_DatePicker();
		
		$('.jqte-test').jqte();			
		// settings of status
		var jqteStatus = true;
		$(".status").click(function()
		{
			jqteStatus = jqteStatus ? false : true;
			$('.jqte-test').jqte({"status" : jqteStatus})
		});		

		
		
		//define the control names in here...
		var caseControlName = "slctcase" + decisionId;
		$('#'+caseControlName).change(function(){
			var caseId = $(this).val();
			if(caseId != ""){
				var caseThemeDivId = "caseThemeDiv" + decisionId;
				$('#'+caseThemeDivId).load('showthecasethemeofthiscase.jsp?caseId='+caseId);
			}
		});
		
		var decisionRejectControlName = "radreject" + decisionId;
		var rejectReasonDivId = "rejectReasonDiv" + decisionId;
		$('#'+decisionRejectControlName).click(function(){			
			$('#'+rejectReasonDivId).load('showrejectreasontextareaforedit.jsp?id='+decisionId);
		});
		
		var decisionAcceptControlName = "radaccept" + decisionId;
		$('#'+decisionAcceptControlName).click(function(){
			$('#'+rejectReasonDivId).html('');
		});
		
		var decisionEarlyResolutionControlName = "radearlyresolution" + decisionId;
		$('#'+decisionEarlyResolutionControlName).click(function(){
			$('#'+rejectReasonDivId).html('');
		});
		
		//here define the control names...
		var registrationDateSelectControlName = "slctregistrationdate" + decisionId;
		var registrationMonthSelectControlName = "slctregistrationmonth" + decisionId;
		var registrationYearSelectControlName = "slctregistrationyear" + decisionId;		
		var registrationDateControlNameEthiopic = "txtregistrationdateethiopic" + decisionId;
		
		$('#'+registrationDateSelectControlName).change(function(){
			//ethiopic start date
			var ethiopicRegistrationDate = $('#'+registrationDateSelectControlName).val();
			var ethiopicRegistrationMonth = $('#'+registrationMonthSelectControlName).val();
			var ethiopicRegistrationYear = $('#'+registrationYearSelectControlName).val();
			
			//now do the convertion in here...	
			if(ethiopicRegistrationDate != "" && ethiopicRegistrationMonth != "" && ethiopicRegistrationYear != ""){
				var registrationDateDataString = "dateDataString="+ethiopicRegistrationDate+":"+ethiopicRegistrationMonth+":"+ethiopicRegistrationYear;
							
				$.ajax({
					type:'POST',
					data:registrationDateDataString,
					url: 'convertthisethiopicdatetogregorian.jsp',
					success:function(data){
						$('#'+registrationDateControlNameEthiopic).val(data);
					}
				});				
			}//end if condition...
		});
		
		$('#'+registrationMonthSelectControlName).change(function(){
			//ethiopic start date
			var ethiopicRegistrationDate = $('#'+registrationDateSelectControlName).val();
			var ethiopicRegistrationMonth = $('#'+registrationMonthSelectControlName).val();
			var ethiopicRegistrationYear = $('#'+registrationYearSelectControlName).val();
			
			//now do the convertion in here...	
			if(ethiopicRegistrationDate != "" && ethiopicRegistrationMonth != "" && ethiopicRegistrationYear != ""){
				var registrationDateDataString = "dateDataString="+ethiopicRegistrationDate+":"+ethiopicRegistrationMonth+":"+ethiopicRegistrationYear;
								
				$.ajax({
					type:'POST',
					data:registrationDateDataString,
					url: 'convertthisethiopicdatetogregorian.jsp',
					success:function(data){
						$('#'+registrationDateControlNameEthiopic).val(data);
					}
				});				
			}//end if condition...
		});
		
		$('#'+registrationYearSelectControlName).change(function(){
			//ethiopic start date
			var ethiopicRegistrationDate = $('#'+registrationDateSelectControlName).val();
			var ethiopicRegistrationMonth = $('#'+registrationMonthSelectControlName).val();
			var ethiopicRegistrationYear = $('#'+registrationYearSelectControlName).val();
			
			//now do the convertion in here...	
			if(ethiopicRegistrationDate != "" && ethiopicRegistrationMonth != "" && ethiopicRegistrationYear != ""){
				var registrationDateDataString = "dateDataString="+ethiopicRegistrationDate+":"+ethiopicRegistrationMonth+":"+ethiopicRegistrationYear;
								
				$.ajax({
					type:'POST',
					data:registrationDateDataString,
					url: 'convertthisethiopicdatetogregorian.jsp',
					success:function(data){
						$('#'+registrationDateControlNameEthiopic).val(data);
					}
				});				
			}//end if condition...
		});
		
		var buttonId = "btnupdate" + decisionId;
		$('#'+buttonId).click(function(){
			//now define the control names in here...
			var applicantControlName = "slctapplicant" + decisionId;
			var caseControlName = "slctcase" + decisionId;
			var respondentControlName = "slctrespondent" + decisionId;			
			var notesControlName = "textareanotes" + decisionId;
			var focusControlName = "textareafocus" + decisionId;
			var registrationDateControlName = "txtregistrationdate" + decisionId;
			var registrationDateControlNameEthiopic = "txtregistrationdateethiopic" + decisionId;
			var caseTypeControlName = "slctcasetype" + decisionId;
			////
			var applicantId = $('#'+applicantControlName).val();
			var caseId = $('#'+caseControlName).val();
			var respondentId = $('#'+respondentControlName).val();
			var radioButtonName = "raddecision" + decisionId;
			var formId = "frmeditdecision" + decisionId;
			var decisionGiven = $('input[name=' + radioButtonName + ']:checked', '#' + formId).val();			
			var notes = $('#'+notesControlName).val();
			var focus = $('#'+focusControlName).val();
			var caseType = $('#'+caseTypeControlName).val();			
			var registrationDate = null;
			if(langId == 1){
				registrationDate = $('#'+registrationDateControlNameEthiopic).val().trim();
			}else{
				registrationDate = $('#'+registrationDateControlName).val().trim();
			}
			
			var dataString = "decisionId="+decisionId+"&applicantId="+applicantId+"&caseId="+caseId+
			"&respondentId="+respondentId+"&decisionGiven="+decisionGiven+"&notes="+notes+
			"&focus="+focus+"&caseType="+caseType+"&registrationDate="+registrationDate;
			
			if(decisionGiven == "Rejected" || decisionGiven == "ውድቅ አድርግ"){
				var rejectionReasonControlName = "slctrejectionreason" + decisionId;
				var rejectionNotes = $('#'+rejectionReasonControlName).val();
				dataString += "&rejectionNotes="+rejectionNotes;
			}			
			
			$.ajax({					
			    url: 'updatedecision.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){			    		
			    		var divId = "decisionEditDiv"+decisionId;
			    		$('#'+divId).html(response);				    		
			    },
			    error:function(error){
					alert(error);
			    }
			});
		});
	});//end document.ready function
</script>