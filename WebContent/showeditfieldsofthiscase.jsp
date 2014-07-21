<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	long caseId = Long.parseLong(request.getParameter("caseId"));
	Case editCase = Case.getCase(caseId);
	//now define the control names in here...
	String themeControlName = "textareatheme" + caseId;
	String reliefSoughtControlName = "textareareliefsought" + caseId;
	String caseCategoryControlName = "slctcasecategory" + caseId;
	String applicantControlName = "slctapplicant" + caseId;
	String linkageControlName = "slctlinkage" + caseId;
	String evidenceTypeControlName = "slctevidencetype" + caseId;
	String numberOfPagesControlName = "txtnumberofpages" + caseId;
	String meansOfApplicationControlName = "slctmeansofapplication" + caseId;
	String appliedByControlName = "slctappliedby" + caseId;
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<form>
<table border="0" width="100%" style="background:lightyellow">	
	<tr>
		<td><label id="lbltheme"><%
					String lblTheme = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbltheme");
					label = Label.getLabelUsingLabelId("lbltheme");
	 				out.print(lblTheme != null ? lblTheme : label.getLabelCaption());
	 			%></label></td>
		<td>
			<textarea class="jqte-test" name="<%=themeControlName %>" id="<%=themeControlName %>" cols="70" rows="4"><%=editCase.getTheme() %></textarea>
		</td>
	</tr>
	<tr>
		<td><label id="lblreliefsought"><%
					String lblReliefSought = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblreliefsought");
					label = Label.getLabelUsingLabelId("lblreliefsought");
	 				out.print(lblReliefSought != null ? lblReliefSought : label.getLabelCaption());
	 			%></label></td>
		<td>
			<textarea class="jqte-test" name="<%=reliefSoughtControlName %>" id="<%=reliefSoughtControlName %>" cols="70" rows="4"><%=editCase.getReliefSought() %></textarea>
		</td>
	</tr>
	<tr>
		<td><label id="lblcasecategory"><%
					String lblCaseCategory = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasecategory");
					label = Label.getLabelUsingLabelId("lblcasecategory");
	 				out.print(lblCaseCategory != null ? lblCaseCategory : label.getLabelCaption());
	 			%></label></td>
		<td>
			<select name="<%=caseCategoryControlName %>" id="<%=caseCategoryControlName %>" style="width:50%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<AdminField> caseCategoryList = AdminField.getAllOptionValuesForThisFieldName("Case Category");
					if(!caseCategoryList.isEmpty()){
						Iterator<AdminField> caseCategoryItr = caseCategoryList.iterator();
						while(caseCategoryItr.hasNext()){
							AdminField caseCategory = caseCategoryItr.next();
							AdminFieldTranslation caseCategoryTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, caseCategory.getId());
							if(caseCategoryTranslation != null){
								if(caseCategoryTranslation.getAdminFieldId() == editCase.getCaseCategoryId()){
								%>
									<option value="<%=caseCategoryTranslation.getAdminFieldId() %>" selected="selected"><%=caseCategoryTranslation.getTranslatedValue() %></option>	
								<%
								}else{
								%>
									<option value="<%=caseCategoryTranslation.getAdminFieldId() %>"><%=caseCategoryTranslation.getTranslatedValue() %></option>
								<%
								}
							}else{
								if(caseCategory.getId() == editCase.getCaseCategoryId()){
								%>
									<option value="<%=caseCategory.getId() %>" selected="selected"><%=caseCategory.getOptionValue() %></option>
								<%
								}else{
									%>
									<option value="<%=caseCategory.getId() %>"><%=caseCategory.getOptionValue() %></option>
									<%
								}
							}
						}//end while loop
					}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<td><label id="lblapplicant"><%
					String lblApplicant = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblapplicant");
					label = Label.getLabelUsingLabelId("lblapplicant");
	 				out.print(lblApplicant != null ? lblApplicant : label.getLabelCaption());
	 			%></label></td>
		<td>
			<select name="<%=applicantControlName %>" id="<%=applicantControlName %>" style="width:50%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<Applicant> applicantList = Applicant.getAllApplicants();
					if(!applicantList.isEmpty()){
						Iterator<Applicant> applicantItr = applicantList.iterator();
						while(applicantItr.hasNext()){
							Applicant applicant = applicantItr.next();
							if(applicant.getId() == editCase.getApplicantId()){
							%>
								<option value="<%=applicant.getId() %>" selected="selected"><%=applicant.getApplicantIdNumber() %>| <%=applicant.getFullName() %></option>
							<%
							}else{
							%>
								<option value="<%=applicant.getId() %>"><%=applicant.getApplicantIdNumber() %>| <%=applicant.getFullName() %></option>
							<%
							}
						}//end while loop
					}//end if condition...
				%>
			</select>
		</td>
	</tr>
	<tr>
		<td><label id="lbllinkage"><%
					String lblLinkage = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbllinkage");
					label = Label.getLabelUsingLabelId("lbllinkage");
	 				out.print(lblLinkage != null ? lblLinkage : label.getLabelCaption());
	 			%></label></td>
		<td>
			<select name="<%=linkageControlName %>" id="<%=linkageControlName %>" style="width:50%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<AdminField> linkageList = AdminField.getAllOptionValuesForThisFieldName("Linkage");
					if(!linkageList.isEmpty()){
						Iterator<AdminField> linkageItr = linkageList.iterator();
						while(linkageItr.hasNext()){
							AdminField adminField = linkageItr.next();
							AdminFieldTranslation adminFieldTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, adminField.getId());
							if(adminFieldTranslation != null){
								if(adminFieldTranslation.getAdminFieldId() == editCase.getLinkageId()){
									%>
										<option value="<%=adminFieldTranslation.getAdminFieldId() %>" selected="selected"><%=adminFieldTranslation.getTranslatedValue() %></option>
									<%
								}else{
									%>
										<option value="<%=adminFieldTranslation.getAdminFieldId() %>"><%=adminFieldTranslation.getTranslatedValue() %></option>
									<%
								}
							}else{
								if(adminField.getId() == editCase.getLinkageId()){
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
					}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<td><label id="lblevidencetype"><%
					String lblEvidenceType = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblevidencetype");
					label = Label.getLabelUsingLabelId("lblevidencetype");
	 				out.print(lblEvidenceType != null ? lblEvidenceType : label.getLabelCaption());
	 			%></label></td>
		<td>
			<select name="<%=evidenceTypeControlName %>" id="<%=evidenceTypeControlName %>" style="width:50%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<AdminField> evidenceTypeList = AdminField.getAllOptionValuesForThisFieldName("Evidence Type");
					if(!evidenceTypeList.isEmpty()){
						Iterator<AdminField> evidenceTypeItr = evidenceTypeList.iterator();
						while(evidenceTypeItr.hasNext()){
							AdminField adminField = evidenceTypeItr.next();
							AdminFieldTranslation adminFieldTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, adminField.getId());
							if(adminFieldTranslation != null){
								if(adminFieldTranslation.getAdminFieldId() == editCase.getEvidenceTypeId()){
									%>
										<option value="<%=adminFieldTranslation.getAdminFieldId() %>" selected="selected"><%=adminFieldTranslation.getTranslatedValue() %></option>
									<%
								}else{
									%>
										<option value="<%=adminFieldTranslation.getAdminFieldId() %>"><%=adminFieldTranslation.getTranslatedValue() %></option>
									<%
								}
							}else{
								if(adminField.getId() == editCase.getEvidenceTypeId()){
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
					}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<td><label id="lblnumberofpages"><%
					String lblNumberOfPages = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnumberofpages");
					label = Label.getLabelUsingLabelId("lblnumberofpages");
	 				out.print(lblNumberOfPages != null ? lblNumberOfPages : label.getLabelCaption());
	 			%></label></td>
		<td>
			<input type="text" name="<%=numberOfPagesControlName %>" id="<%=numberOfPagesControlName %>" value="<%=editCase.getNumberOfPages() %>"/>
		</td>
	</tr>
	<tr>
		<td><label id="lblmeansofapplication"><%
					String lblMeansOfApplication = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblmeansofapplication");
					label = Label.getLabelUsingLabelId("lblmeansofapplication");
	 				out.print(lblMeansOfApplication != null ? lblMeansOfApplication : label.getLabelCaption());
	 			%></label></td>
		<td>
			<select name="<%=meansOfApplicationControlName %>" id="<%=meansOfApplicationControlName %>" style="width:50%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<AdminField> meansOfApplicationList = AdminField.getAllOptionValuesForThisFieldName("Means of Application");
					if(!meansOfApplicationList.isEmpty()){
						Iterator<AdminField> meansOfApplicationItr = meansOfApplicationList.iterator();
						while(meansOfApplicationItr.hasNext()){
							AdminField adminField = meansOfApplicationItr.next();
							AdminFieldTranslation adminFieldTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, adminField.getId());
							if(adminFieldTranslation != null){
								if(adminFieldTranslation.getAdminFieldId() == editCase.getMeansOfApplicationId()){
									%>
										<option value="<%=adminFieldTranslation.getAdminFieldId() %>" selected="selected"><%=adminFieldTranslation.getTranslatedValue() %></option>
									<%
								}else{
									%>
										<option value="<%=adminFieldTranslation.getAdminFieldId() %>"><%=adminFieldTranslation.getTranslatedValue() %></option>
									<%
								}
							}else{
								if(adminField.getId() == editCase.getMeansOfApplicationId()){
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
					}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<td><label id="lblappliedby"><%
					String lblAppliedBy = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblappliedby");
					label = Label.getLabelUsingLabelId("lblappliedby");
	 				out.print(lblAppliedBy != null ? lblAppliedBy : label.getLabelCaption());
	 			%></label></td>
		<td>
			<select name="<%=appliedByControlName %>" id="<%=appliedByControlName %>" style="width:50%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<AdminField> appliedByList = AdminField.getAllOptionValuesForThisFieldName("Applied By");
					if(!appliedByList.isEmpty()){
						Iterator<AdminField> appliedByItr = appliedByList.iterator();
						while(appliedByItr.hasNext()){
							AdminField adminField = appliedByItr.next();
							AdminFieldTranslation adminFieldTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, adminField.getId());
							if(adminFieldTranslation != null){
								if(adminFieldTranslation.getAdminFieldId() == editCase.getAppliedById()){
									%>
										<option value="<%=adminFieldTranslation.getAdminFieldId() %>" selected="selected"><%=adminFieldTranslation.getTranslatedValue() %></option>
									<%
								}else{
									%>
										<option value="<%=adminFieldTranslation.getAdminFieldId() %>"><%=adminFieldTranslation.getTranslatedValue() %></option>
									<%
								}
							}else{
								if(adminField.getId() == editCase.getAppliedById()){
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
					}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<td></td>
		<td align="right">
			<%
				String buttonId = "btnupdate" + caseId;
					
				String lblUpdateButtonLabel = "lblupdatebutton";
				String updateButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblupdateallbutton");
				label = Label.getLabelUsingLabelId("lblupdatebutton");
				String updateButtonCaption = updateButtonLabel != null ? updateButtonLabel : label.getLabelCaption();
				
				String lblUndoButtonLabel = "lblundobutton";
				String undoButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblundobutton");
				label = Label.getLabelUsingLabelId("lblupdatebutton");
				String undoButtonCaption = undoButtonLabel != null ? undoButtonLabel : label.getLabelCaption();
			%>
			<input type="button" value = "<%=updateButtonCaption %>" class="input-submit" id="<%=buttonId %>"/>
			<input type="reset" value="<%=undoButtonCaption %>" class="input-submit"/>
		</td>
	</tr>
</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){		
		$('.jqte-test').jqte();			
		// settings of status
		var jqteStatus = true;
		$(".status").click(function()
		{
			jqteStatus = jqteStatus ? false : true;
			$('.jqte-test').jqte({"status" : jqteStatus})
		});
		
		var caseId = "<%=caseId%>";
		var buttonId = "btnupdate" + caseId;
		
		$('#'+buttonId).click(function(){
			//now define the control names in here...
			var themeControlName = "textareatheme" + caseId;
			var reliefSoughtControlName = "textareareliefsought" + caseId;
			var caseCategoryControlName = "slctcasecategory" + caseId;
			var applicantControlName = "slctapplicant" + caseId;
			var linkageControlName = "slctlinkage" + caseId;
			var evidenceTypeControlName = "slctevidencetype" + caseId;
			var numberOfPagesControlName = "txtnumberofpages" + caseId;
			var meansOfApplicationControlName = "slctmeansofapplication" + caseId;
			var appliedByControlName = "slctappliedby" + caseId;
			//now build your dataString object...
			var caseTheme = $('#'+themeControlName).val();
		 	var reliefSought = $('#'+reliefSoughtControlName).val();
		 	var applicantId = $('#'+applicantControlName).val();
		 	var caseCategoryId = $('#'+caseCategoryControlName).val();
		 	var linkage = $('#'+linkageControlName).val();
		 	var evidenceType = $('#'+evidenceTypeControlName).val();
		 	var numberOfPages = $('#'+numberOfPagesControlName).val();
		 	var meansOfApplication = $('#'+meansOfApplicationControlName).val();
		 	var appliedBy = $('#'+appliedByControlName).val(); 
		 	
		 	var dataString = "caseTheme="+caseTheme+"&reliefSought="+
			reliefSought+"&applicantId="+applicantId+"&caseCategoryId="+caseCategoryId+"&linkage="+
			linkage+"&evidenceType="+evidenceType+"&numberOfPages="+numberOfPages+"&meansOfApplication="+
			meansOfApplication+"&appliedBy="+appliedBy+"&caseId="+caseId;
		 	
		 	//now do the ajax part in here...
		 	$.ajax({					
			    url: 'updatecase.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){   		
			    		var divId = "caseEditDiv"+caseId; 
			    		$('#'+divId).html(response);				    		
			    },
			    error:function(error){
					alert(error);
			    }
			});	
		});//end update.button click
	});//end document.ready function
</script>