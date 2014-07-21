<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.sql.Date" %>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "decisionManagement";
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	if(true){		
%>
<form id="frmeditdecision">
<table border="0" width="100%" style="background:#eee">
	<tr>
		<td width="30%"><label id="lblfilenumber"><%
					String lblFileNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfilenumber");
					label = Label.getLabelUsingLabelId("lblfilenumber");
	 				out.print(lblFileNumber != null ? lblFileNumber : label.getLabelCaption());
	 			%></label></td>
		<td>
			<input type="text" name="txtfilenumber" id="txtfilenumber" style="width:35%" readonly="readonly"/>
		</td>
	</tr>
	<tr>
		<td><label id="lblapplicantidnumber"><%
					String lblApplicantIdNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblapplicantidnumber");
					label = Label.getLabelUsingLabelId("lblapplicantidnumber");
	 				out.print(lblApplicantIdNumber != null ? lblApplicantIdNumber : label.getLabelCaption());
	 			%></label></td>
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
		<td><label id="lblcase"><%
					String lblCase = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcase");
					label = Label.getLabelUsingLabelId("lblcase");
	 				out.print(lblCase != null ? lblCase : label.getLabelCaption());
	 			%></label></td>
		<td>
			<select name="slctcase" id="slctcase" style="width:100%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<Case> caseList = Case.getAllCases();
					if(!caseList.isEmpty()){
						Iterator<Case> caseItr = caseList.iterator();
						while(caseItr.hasNext()){
							Case c = caseItr.next();
							AdminField adminField = AdminField.getAdminField(c.getEvidenceTypeId());							
							String caseStr = (adminField != null ? adminField.getOptionValue() : "---") + c.getCaseIdNumber(); 
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
		<td colspan="2">
			<div id="caseThemeDiv"></div>
		</td>
	</tr>
	<tr>
		<td><label id="lblrespondent"><%
					String lblRespondent = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrespondent");
					label = Label.getLabelUsingLabelId("lblrespondent");
	 				out.print(lblRespondent != null ? lblRespondent : label.getLabelCaption());
	 			%></label></td>
		<td>
			<select name="slctrespondent" id="slctrespondent" style="width:100%">
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
							String lblReject = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblreject");
						%>
						<input type="radio" name="raddecision" id="radreject" value="<%					
						label = Label.getLabelUsingLabelId("lblreject");
		 				out.print(lblReject != null ? lblReject : label.getLabelCaption());%>"/> <label id="lblreject"><%					
						label = Label.getLabelUsingLabelId("lblreject");
		 				out.print(lblReject != null ? lblReject : label.getLabelCaption());%></label>
					</td>
					<td>
						<%
							String lblAccepted = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblaccept");
						%>
						<input type="radio" name="raddecision" id="radaccept" value="<%							
							label = Label.getLabelUsingLabelId("lblaccept");
			 				out.print(lblAccepted != null ? lblAccepted : label.getLabelCaption());
			 			%>"/> <label id="lblaccept"><%							
							label = Label.getLabelUsingLabelId("lblaccept");
			 				out.print(lblAccepted != null ? lblAccepted : label.getLabelCaption());
			 			%></label>
					</td>
					<td>
						<%
							String lblEarlyResolution = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblearlyresolution");
						%>
								<input type="radio" name="raddecision" id="radearlyresolution" value="<%							
							label = Label.getLabelUsingLabelId("lblearlyresolution");
			 				out.print(lblEarlyResolution != null ? lblEarlyResolution : label.getLabelCaption());
			 			%>"/> <label id="lblearlyresolution"><%							
							label = Label.getLabelUsingLabelId("lblearlyresolution");
			 				out.print(lblEarlyResolution != null ? lblEarlyResolution : label.getLabelCaption());
			 			%></label>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<div id="rejectReasonDiv"></div>
		</td>
	</tr>
	<tr>
		<td style="vertical-align:middle"><label id="lblnotes"><%
					String lblNotes = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnotes");
					label = Label.getLabelUsingLabelId("lblnotes");
	 				out.print(lblNotes != null ? lblNotes : label.getLabelCaption());
	 			%></label></td>
		<td>
			<textarea class="jqte-test" name="textareanotes" id="textareanotes" cols="70" rows="4"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<fieldset>
				<legend><label id="lblinvestigation"><%
					String lblInvestigation = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblinvestigation");
					label = Label.getLabelUsingLabelId("lblinvestigation");
	 				out.print(lblInvestigation != null ? lblInvestigation : label.getLabelCaption());
	 			%></label></legend>
				<table border="0" width="100%">
					<tr>
						<td width="34%" style="vertical-align:middle"><label id="lblfocus"><%
					String lblFocus = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfocus");
					label = Label.getLabelUsingLabelId("lblfocus");
	 				out.print(lblFocus != null ? lblFocus : label.getLabelCaption());
	 			%></label></td>
						<td>
							<textarea name="textareafocus" id="textareafocus" rows="3" style="width:100%" class="jqte-test"></textarea>
						</td>
					</tr>
					<tr>
						<td><label id="lblcasetype"><%
					String lblCaseType = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasetype");
					label = Label.getLabelUsingLabelId("lblcasetype");
	 				out.print(lblCaseType != null ? lblCaseType : label.getLabelCaption());
	 			%></label></td>
						<td>
							<select name="slctcasetype" id="slctcasetype" style="width:100%">
								<option value="" selected="selected">--Select--</option>
								<%
									List<AdminField> caseTypeList = AdminField.getAllOptionValuesForThisFieldName("Case Type");
									if(!caseTypeList.isEmpty()){
										Iterator<AdminField> caseTypeItr = caseTypeList.iterator();
										while(caseTypeItr.hasNext()){
											AdminField adminField = caseTypeItr.next();
											AdminFieldTranslation caseTypeAdminField = AdminFieldTranslation.
													getAdminFieldTranslationForThisLanguageAndAdminField(langId,adminField.getId());
											if(caseTypeAdminField != null){
											%>
												<option value="<%=caseTypeAdminField.getAdminFieldId() %>"><%=caseTypeAdminField.getTranslatedValue() %></option>
											<%
											}else{
											%>
												<option value="<%=adminField.getId() %>"><%=adminField.getOptionValue() %></option>
											<%
											}
										}//end while loop
									}
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
					%>
						<table border="0" width="100%">
        						<tr style="background:#ccc">
        							<td>ቀን</td>
        							<td>ወር</td>
        							<td>ዓመት</td>
        						</tr>
        						<tr>
        							<td>
        								<select name="slctregistrationdate" id="slctregistrationdate" style="width:100%">
        									<option value="" selected="selected">--Select--</option>
        									<%
        										for(int i=1;i<=30;i++){
        											%>
        												<option value="<%=i %>"><%=i %></option>
        											<%
        										}//end for...loop
        									%>
        								</select>
        							</td>
        							<td>
        								<select name="slctregistrationmonth" id="slctregistrationmonth" style="width:100%">
        									<option value="" selected="selected">--Select--</option>
        									<%
        										List<EthiopicMonth> ethiopicMonthList = EthiopicMonth.getAllEthiopicMonths();
        										Iterator<EthiopicMonth> ethiopicMonthItr = ethiopicMonthList.iterator();
        										while(ethiopicMonthItr.hasNext()){
        											EthiopicMonth ethiopicMonth = ethiopicMonthItr.next();
        											%>
        												<option value="<%=ethiopicMonth.getMonthIndex() %>"><%=ethiopicMonth.getMonthName() %></option>
        											<%
        										}//end while loop
        									%>
        								</select>
        							</td>
        							<td>
        								<select name="slctregistrationyear" id="slctregistrationyear" style="width:100%">
        									<option value="" selected="selected">--Select--</option>
        									<%
         									int startYear = year - 5;
         									for(int i=year;i>=startYear;i--){
         										Day ethiopicDay = DateConverter.toEthiopian(1, 1, i);
         										int ethYear = ethiopicDay.getYear();
         										%>
         											<option value="<%=ethYear%>"><%=ethYear %></option>
         										<%
         									}//end for...loop
        									%>
        								</select>
        								<input type="hidden" name="txtregistrationdate" id="txtregistrationdate"/>
        							</td>
        						</tr>
        					</table>
					<%
				}else{
			%>
					<input type="text" name="txtregistrationdate" id="txtregistrationdate"/>					
			<%
				}
			%>
		</td>
	</tr>	
	<tr>		
		<td colspan="2" align="right">
			<%
					String lblSaveButtonLabel = "lblsavebutton";
					String saveButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblsavebutton");
					label = Label.getLabelUsingLabelId("lblsavebutton");
					String saveButtonCaption = saveButtonLabel != null ? saveButtonLabel : label.getLabelCaption();
					//////
					String lblResetButtonLabel = "lblresetbutton";
					String resetButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId, "lblresetbutton");
					label = Label.getLabelUsingLabelId("lblresetbutton");
					String resetButtonCaption = resetButtonLabel != null ? resetButtonLabel : label.getLabelCaption();
				%>
			<input type="button" value = "<%=saveButtonCaption %>" id="btnsave" class="input-submit"/>
			<input type="reset" value="<%=resetButtonCaption %>" class="input-submit"/>
		</td>
	</tr>
</table>
</form>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
%>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#txtregistrationdate').Zebra_DatePicker();
		
		$('.jqte-test').jqte();			
		// settings of status
		var jqteStatus = true;
		$(".status").click(function()
		{
			jqteStatus = jqteStatus ? false : true;
			$('.jqte-test').jqte({"status" : jqteStatus})
		});
		
		var fieldName = "txtfilenumber";
		$.ajax({
		    url: 'generatenewdecisionidnumber.jsp',		
		    data: null,
		    type:'POST',
		    success:function(response){		    		
		    		$('#'+fieldName).val(response);					
		    },
		    error:function(error){
				alert(error);
		    }
		});
		
		$('#slctcase').change(function(){
			var caseId = $(this).val();
			if(caseId != ""){
				$('#caseThemeDiv').load('showthecasethemeofthiscase.jsp?caseId='+caseId);
			}
		});
		
		$('#radreject').click(function(){
			$('#rejectReasonDiv').load('showrejectreasontextarea.jsp');
		});
		
		$('#radaccept').click(function(){
			$('#rejectReasonDiv').html('');
		});
		
		$('#radearlyresolution').click(function(){
			$('#rejectReasonDiv').html('');
		});
		
		$('#slctregistrationyear').change(function(){
			//ethiopic start date
			var ethiopicRegistrationDate = $('#slctregistrationdate').val();
			var ethiopicRegistrationMonth = $('#slctregistrationmonth').val();
			var ethiopicRegistrationYear = $('#slctregistrationyear').val();
			
			//now do the convertion in here...	
			if(ethiopicRegistrationDate != "" && ethiopicRegistrationMonth != "" && ethiopicRegistrationYear != ""){
				var registrationDateDataString = "dateDataString="+ethiopicRegistrationDate+":"+ethiopicRegistrationMonth+":"+ethiopicRegistrationYear;
								
				$.ajax({
					type:'POST',
					data:registrationDateDataString,
					url: 'convertthisethiopicdatetogregorian.jsp',
					success:function(data){
						$('#txtregistrationdate').val(data);
					}
				});				
			}//end if condition...
		});
		
		$('#slctregistrationmonth').change(function(){
			//ethiopic start date
			var ethiopicRegistrationDate = $('#slctregistrationdate').val();
			var ethiopicRegistrationMonth = $('#slctregistrationmonth').val();
			var ethiopicRegistrationYear = $('#slctregistrationyear').val();
			
			//now do the convertion in here...	
			if(ethiopicRegistrationDate != "" && ethiopicRegistrationMonth != "" && ethiopicRegistrationYear != ""){
				var registrationDateDataString = "dateDataString="+ethiopicRegistrationDate+":"+ethiopicRegistrationMonth+":"+ethiopicRegistrationYear;
								
				$.ajax({
					type:'POST',
					data:registrationDateDataString,
					url: 'convertthisethiopicdatetogregorian.jsp',
					success:function(data){
						$('#txtregistrationdate').val(data);
					}
				});				
			}//end if condition...
		});
		
		$('#slctregistrationdate').change(function(){
			//ethiopic start date
			var ethiopicRegistrationDate = $('#slctregistrationdate').val();
			var ethiopicRegistrationMonth = $('#slctregistrationmonth').val();
			var ethiopicRegistrationYear = $('#slctregistrationyear').val();
			
			//now do the convertion in here...	
			if(ethiopicRegistrationDate != "" && ethiopicRegistrationMonth != "" && ethiopicRegistrationYear != ""){
				var registrationDateDataString = "dateDataString="+ethiopicRegistrationDate+":"+ethiopicRegistrationMonth+":"+ethiopicRegistrationYear;
								
				$.ajax({
					type:'POST',
					data:registrationDateDataString,
					url: 'convertthisethiopicdatetogregorian.jsp',
					success:function(data){
						$('#txtregistrationdate').val(data);
					}
				});				
			}//end if condition...
		});
		
		$('#btnsave').click(function(){
			var fileNumber = $('#txtfilenumber').val();
			var applicantId = $('#slctapplicant').val();
			var caseId = $('#slctcase').val();
			var respondentId = $('#slctrespondent').val();
			var radioButtonName = "raddecision";
			var formId = "frmeditdecision";
			var decisionGiven = $('input[name=' + radioButtonName + ']:checked', '#' + formId).val();			
			var notes = $('#textareanotes').val();
			var focus = $('#textareafocus').val();
			var caseType = $('#slctcasetype').val();		
			var registrationDate = $('#txtregistrationdate').val().trim();			
			
			var dataString = "fileNumber="+fileNumber+"&applicantId="+applicantId+"&caseId="+caseId+
			"&respondentId="+respondentId+"&decisionGiven="+decisionGiven+"&notes="+notes+
			"&focus="+focus+"&caseType="+caseType+"&registrationDate="+registrationDate;
			
			if(decisionGiven == "Rejected" || decisionGiven == "ውድቅ አድርግ"){
				var rejectionNotes = $('#slctrejectionreason').val();
				dataString += "&rejectionNotes="+rejectionNotes;
			}
			
			$.ajax({					
			    url: 'savedecision.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){			    		
			    		$('#errorDiv').html('');
			    		$('#subTabDetailDiv').html(response);				    		
			    },
			    error:function(error){
					alert(error);
			    }
			});
		});
	});//end document.ready function
</script>