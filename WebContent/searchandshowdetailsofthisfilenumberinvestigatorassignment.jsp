<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	String fileNumber = request.getParameter("fileNumber");
	//now find the decision object from the database...
	Decision decision = Decision.fetchDecisionUsingFileNumber(fileNumber);
	if(decision != null){
	Applicant applicant = Applicant.getApplicant(decision.getApplicantId());
	Case theCase = Case.getCase(decision.getCaseId());
	Respondent respondent = Respondent.getRespondent(decision.getRespondentId());	
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<form id="frminvestigatorassignment">
	<table border="0" width="100%" style="background:#fff">
		<tr>
			<td colspan="2">
				<div id="errorDiv"></div>
			</td>
		</tr>
		<tr>
			<td><label id="lblapplicantname"><%
					String lblApplicantName = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblapplicantname");
					label = Label.getLabelUsingLabelId("lblapplicantname");
	 				out.print(lblApplicantName != null ? lblApplicantName : label.getLabelCaption());
	 			%></label></td>
			<td>
				<%=applicant.getFullName()%>
			</td>
		</tr>
		<tr>
			<td><label id="lblrespondentname"><%
					String lblRespondentName = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrespondentname");
					label = Label.getLabelUsingLabelId("lblrespondentname");
	 				out.print(lblRespondentName != null ? lblRespondentName : label.getLabelCaption());
	 			%></label></td>
			<td>
				<%=respondent.getName() %>
			</td>
		</tr>
		<tr>
			<td><label id="lblcasetheme"><%
					String lblCaseTheme = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasetheme");
					label = Label.getLabelUsingLabelId("lblcasetheme");
	 				out.print(lblCaseTheme != null ? lblCaseTheme : label.getLabelCaption());
	 			%></label></td>
			<td>
				<%=theCase.getTheme() %>
			</td>
		</tr>
		<tr style="background:#eee">
			<td colspan="2">
				<fieldset>
					<legend><font color="red">*</font><label id="lblsource"><%
					String lblSource = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblsource");
					label = Label.getLabelUsingLabelId("lblsource");
	 				out.print(lblSource != null ? lblSource : label.getLabelCaption());
	 			%></label></legend>
					<table border="0" width="100%">
						<tr>
							<td width="33%" align="center"><input type="radio" name="radsource" id="radsourcenew" value="New"/> <label id="lblnew"><%
					String lblNew = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnew");
					label = Label.getLabelUsingLabelId("lblnew");
	 				out.print(lblNew != null ? lblNew : label.getLabelCaption());
	 			%></label></td>
							<td width="33%" align="center"><input type="radio" name="radsource" id="radsourcefromaninvestigator" value="From an Investigator"/> <label id="lblfromaninvestigator"><%
					String lblFromAnInvestigator = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfromaninvestigator");
					label = Label.getLabelUsingLabelId("lblfromaninvestigator");
	 				out.print(lblFromAnInvestigator != null ? lblFromAnInvestigator : label.getLabelCaption());
	 			%></label></td>
							<td width="33%" align="center"><input type="radio" name="radsource" id="radsourcefromappeal" value="From Appeal"/> <label id="lblfromappeal"><%
					String lblFromAppeal = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfromappeal");
					label = Label.getLabelUsingLabelId("lblfromappeal");
	 				out.print(lblFromAppeal != null ? lblFromAppeal : label.getLabelCaption());
	 			%></label></td>
						</tr>
					</table>
				</fieldset>
			</td>
		</tr>
		<tr style="background:#eee">
			<td colspan="2">
				<fieldset>
					<legend><font color="red">*</font><label id="lblfilterinvestigatorbylevel"><%
					String lblFilterInvestigatorByLevel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfilterinvestigatorbylevel");
					label = Label.getLabelUsingLabelId("lblfilterinvestigatorbylevel");
	 				out.print(lblFilterInvestigatorByLevel != null ? lblFilterInvestigatorByLevel : label.getLabelCaption());
	 			%></label></legend>
					<table border="0" width="100%">
						<tr>
							<td width="33%" align="center"><input type="radio" name="radfilterinvestigator" id="radsinorinvestigator" value="Senior Investigator" class="filter_investigator"/> <label id="lblseniorinvestigator"><%
					String lblSeniorInvestigator = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblseniorinvestigator");
					label = Label.getLabelUsingLabelId("lblseniorinvestigator");
	 				out.print(lblSeniorInvestigator != null ? lblSeniorInvestigator : label.getLabelCaption());
	 			%></label></td>
							<td width="33%" align="center"><input type="radio" name="radfilterinvestigator" id="radinvestigator" value="Investigator" class="filter_investigator"/> <label id="lblinvestigator"><%
					String lblInvestigator = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblinvestigator");
					label = Label.getLabelUsingLabelId("lblinvestigator");
	 				out.print(lblInvestigator != null ? lblInvestigator : label.getLabelCaption());
	 			%></label></td>
							<td width="33%" align="center"><input type="radio" name="radfilterinvestigator" id="radjuniorinvestigator" value="Junior Investigator" class="filter_investigator"/> <label id="lbljuniorinvestigator"><%
					String lblJuniorInvestigator = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbljuniorinvestigator");
					label = Label.getLabelUsingLabelId("lbljuniorinvestigator");
	 				out.print(lblJuniorInvestigator != null ? lblJuniorInvestigator : label.getLabelCaption());
	 			%></label></td>
						</tr>
						<tr>
							<td colspan="3">
								<div id="investigatorDiv">
									<select name="slctinvestigator" id="slctinvestigator" style="width:100%;height: 200px;" multiple="multiple">
										<option value="" selected="selected">--Select--</option>
										<%
											List<Investigator> investigatorList = Investigator.getAllInvestigatorForInvestigatorAssignment("all");
											Iterator<Investigator> investigatorItr = investigatorList.iterator();
											while(investigatorItr.hasNext()){
												Investigator investigator = investigatorItr.next();
												//now count the number of assignments to each investigators....with date of assignment.
												int investigatorLoad = InvestigatorAssignment.getInvestigatorAssignmentCount(investigator.getId());
												String stringValue = "";
												if(investigatorLoad != 0){
													Date lastDateAssigned = InvestigatorAssignment.getLastMaxDateAssignedForInvestigator(investigator.getId());
													stringValue = investigator.getFullName()+"            active cases ("+investigatorLoad+"):             Last date case assigned: ["+lastDateAssigned+"]";
												}else{
													stringValue = investigator.getFullName()+"            active cases ("+investigatorLoad+")";
												}
												%>
													<option value="<%=investigator.getId() %>"><%=stringValue %></option>
												<%
											}//end while loop
										%>
									</select>
								</div>
							</td>
						</tr>
					</table>
				</fieldset>
			</td>
		</tr>
		<tr style="background:#eee">
			<td><font color="red">*</font><label id="lbldateassigned"><%
					String lblDateAssigned = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldateassigned");
					label = Label.getLabelUsingLabelId("lbldateassigned");
	 				out.print(lblDateAssigned != null ? lblDateAssigned : label.getLabelCaption());
	 			%></label></td>
			<td>
				<input type="text" name="txtdateassigned" id="txtdateassigned"/>				
			</td>
		</tr>
		<tr style="background:#eee">
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
				<input type="button" value="<%=saveButtonCaption %>" id="btnsave" class="input-submit"/>
				<input type="reset" value="<%=resetButtonCaption %>" class="input-submit"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<p class="msg info"><label id="lblrequiredfieldsdescription"><%
						String lblRequiredFiledDescription = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrequiredfieldsdescription");
						label = Label.getLabelUsingLabelId("lblrequiredfieldsdescription");
		 				out.print(lblRequiredFiledDescription != null ? lblRequiredFiledDescription : label.getLabelCaption());
		 			%></label>
		 		</p>
			</td>
		</tr>
	</table>
</form>
<%
	}else{
%>
		<p class="msg warning">No record found with file number "<%=fileNumber %>" !</p>
<%
	}
%>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#txtdateassigned').Zebra_DatePicker();
		
		$('.filter_investigator').click(function(){
			var investigatorLevel = $(this).val();
			if(investigatorLevel != ""){
				$('#investigatorDiv').load('showonlyinvestigatorsoflevel.jsp?investigatorLevel='+encodeURIComponent(investigatorLevel));
			}
		});
		
		$('#btnsave').click(function(){
			var radioButtonName = "radsource";
			var formId = "frminvestigatorassignment";
			var caseSource = $('input[name=' + radioButtonName + ']:checked', '#' + formId).val();
			var investigatorId = $('#slctinvestigator').val();
			var dateAssigned = $('#txtdateassigned').val();
			var fileNumber = $('#txtfilenumber').val();
			
			if(caseSource != "" && investigatorId != "" && dateAssigned != "" && fileNumber != ""){
				var dataString = "fileNumber="+fileNumber+"&caseSource="+caseSource+"&investigatorId="+
				investigatorId+"&dateAssigned="+dateAssigned;
				$.ajax({					
				    url: 'saveinvestigatorassignment.jsp',		
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
			}else{
				$('#errorDiv').html("<p class='msg error'>Missing data value! Please enter all the required data fields!</p>");
			}
		});
	});//end document.ready function
</script>