<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	long investigatorAssignmentId = Long.parseLong(request.getParameter("investigatorAssignmentId"));
	InvestigatorAssignment investigatorAssignment = InvestigatorAssignment.getInvestigatorAssignment(investigatorAssignmentId);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	//now define the control names in here...
	String fileSourceRadioButtonName = "radsource" + investigatorAssignmentId;
	String investigatorControlName = "slctinvestigator" + investigatorAssignmentId;
	String dateAssignedControlName = "txtdateassigned" + investigatorAssignmentId;
	String formId = "frminvestigatorassignment" + investigatorAssignmentId;
%>
<form id="<%=formId%>">
	<table border="0" width="100%" style="background:#fff">
		<tr>
			<td colspan="2">
				<div id="errorDiv"></div>
			</td>
		</tr>
		<tr>
			<td><label id="lblfilenumber"><%
					String lblFileNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfilenumber");
					label = Label.getLabelUsingLabelId("lblfilenumber");
	 				out.print(lblFileNumber != null ? lblFileNumber : label.getLabelCaption());
	 			%></label></td>
			<td>
				<%=investigatorAssignment.getFileNumber() %>
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
							<td width="33%" align="center">
								<%
									if(investigatorAssignment.getFileSource().equalsIgnoreCase("new")){
								%>		
										<input type="radio" name="<%=fileSourceRadioButtonName %>" id="radsourcenew" value="New" checked="checked"/> <label id="lblnew"><%
					String lblNew = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnew");
					label = Label.getLabelUsingLabelId("lblnew");
	 				out.print(lblNew != null ? lblNew : label.getLabelCaption());
	 			%></label>
								<%
									}else{
								%>
										<input type="radio" name="<%=fileSourceRadioButtonName %>" id="radsourcenew" value="New"/> <label id="lblnew"><%
					String lblNew = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnew");
					label = Label.getLabelUsingLabelId("lblnew");
	 				out.print(lblNew != null ? lblNew : label.getLabelCaption());
	 			%></label>			
								<%
									}
								%>
							</td>							
							<td width="33%" align="center">
								<%
									if(investigatorAssignment.getFileSource().equalsIgnoreCase("from an investigator")){
								%>
										<input type="radio" name="<%=fileSourceRadioButtonName %>" id="radsourcefromaninvestigator" value="From an Investigator" checked="checked"/> <label id="lblfromaninvestigator"><%
					String lblFromAnInvestigator = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfromaninvestigator");
					label = Label.getLabelUsingLabelId("lblfromaninvestigator");
	 				out.print(lblFromAnInvestigator != null ? lblFromAnInvestigator : label.getLabelCaption());
	 			%></label>
								<%
									}else{
								%>
										<input type="radio" name="<%=fileSourceRadioButtonName %>" id="radsourcefromaninvestigator" value="From an Investigator"/> <label id="lblfromaninvestigator"><%
					String lblFromAnInvestigator = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfromaninvestigator");
					label = Label.getLabelUsingLabelId("lblfromaninvestigator");
	 				out.print(lblFromAnInvestigator != null ? lblFromAnInvestigator : label.getLabelCaption());
	 			%></label>
								<%
									}
								%>
							</td>
							<td width="33%" align="center">
								<%
									if(investigatorAssignment.getFileSource().equalsIgnoreCase("from appeal")){
								%>
										<input type="radio" name="<%=fileSourceRadioButtonName %>" id="radsourcefromappeal" value="From Appeal" checked="checked"/> <label id="lblfromappeal"><%
					String lblFromAppeal = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfromappeal");
					label = Label.getLabelUsingLabelId("lblfromappeal");
	 				out.print(lblFromAppeal != null ? lblFromAppeal : label.getLabelCaption());
	 			%></label>
								<%
									}else{
								%>
										<input type="radio" name="<%=fileSourceRadioButtonName %>" id="radsourcefromappeal" value="From Appeal"/> <label id="lblfromappeal"><%
					String lblFromAppeal = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfromappeal");
					label = Label.getLabelUsingLabelId("lblfromappeal");
	 				out.print(lblFromAppeal != null ? lblFromAppeal : label.getLabelCaption());
	 			%></label>
								<%
									}
								%>
							</td>
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
									<select name="<%=investigatorControlName %>" id="<%=investigatorControlName %>" style="width:100%;height: 200px;" multiple="multiple">
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
												
												if(investigatorAssignment.getInvestigatorId() == investigator.getId()){
												%>
													<option value="<%=investigator.getId() %>" selected="selected"><%=stringValue %></option>
												<%
												}else{
												%>
													<option value="<%=investigator.getId() %>"><%=stringValue %></option>
												<%
												}
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
					String lblApplicantName = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldateassigned");
					label = Label.getLabelUsingLabelId("lbldateassigned");
	 				out.print(lblApplicantName != null ? lblApplicantName : label.getLabelCaption());
	 			%></label></td>
			<td>
				<input type="text" name="<%=dateAssignedControlName %>" id="<%=dateAssignedControlName %>" value="<%=investigatorAssignment.getDateAssigned() %>"/>
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('<%=dateAssignedControlName %>');" />
			</td>
		</tr>
		<tr style="background:#eee">
			<td colspan="2" align="right">
				<%
					String buttonId = "btnupdate" + investigatorAssignmentId;
					String lblUpdateButtonLabel = "lblupdatebutton";
					String updateButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblupdateallbutton");
					label = Label.getLabelUsingLabelId("lblupdatebutton");
					String updateButtonCaption = updateButtonLabel != null ? updateButtonLabel : label.getLabelCaption();
					
					String lblUndoButtonLabel = "lblundobutton";
					String undoButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblundobutton");
					label = Label.getLabelUsingLabelId("lblupdatebutton");
					String undoButtonCaption = undoButtonLabel != null ? undoButtonLabel : label.getLabelCaption();
				%>
				<input type="button" value="<%=updateButtonCaption %>" id="<%=buttonId %>" class="input-submit"/>
				<input type="reset" value="<%=undoButtonCaption %>" class="input-submit"/>
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
<script type="text/javascript">
	$(document).ready(function(){
		var investigatorAssignmentId = "<%=investigatorAssignmentId%>";
		var buttonId = "btnupdate" + investigatorAssignmentId;
			
		$('.filter_investigator').click(function(){
			var investigatorLevel = $(this).val();
			if(investigatorLevel != ""){
				$('#investigatorDiv').load('showonlyinvestigatorsoflevelforedit.jsp?investigatorLevel='+encodeURIComponent(investigatorLevel)+'&investigatorAssignmentId='+investigatorAssignmentId);
			}
		});
		
		$('#'+buttonId).click(function(){
			//now define the control names in here...
			var fileSourceRadioButtonName = "radsource" + investigatorAssignmentId;
			var investigatorControlName = "slctinvestigator" + investigatorAssignmentId;
			var dateAssignedControlName = "txtdateassigned" + investigatorAssignmentId;
			var formId = "frminvestigatorassignment" + investigatorAssignmentId;
			///now get the values using the control names you have define just above....
			var radioButtonName = fileSourceRadioButtonName;			
			var caseSource = $('input[name=' + radioButtonName + ']:checked', '#' + formId).val();
			var investigatorId = $('#'+investigatorControlName).val();
			var dateAssigned = $('#'+dateAssignedControlName).val();			
			
			if(caseSource != "" && investigatorId != "" && dateAssigned != "" && investigatorAssignmentId != ""){
				var dataString = "investigatorAssignmentId="+investigatorAssignmentId+"&caseSource="+caseSource+"&investigatorId="+
				investigatorId+"&dateAssigned="+dateAssigned;
				
				var divId = "investigatorAssignmentEditDiv" + investigatorAssignmentId;
				$.ajax({					
				    url: 'updateinvestigatorassignment.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){			    		
				    		$('#errorDiv').html('');
				    		$('#'+divId).html(response);				    		
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