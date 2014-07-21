<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "caseManagement";
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	if(true){		
%>
<table border="0" width="100%" style="background:#eee">
	<tr>
		<td colspan="2">
			<div id="errorDiv"></div>
		</td>
	</tr>
	<tr>
		<td>
			<label id="lblcaseidnumber">
				<%
					String lblCaseIdNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcaseidnumber");
					label = Label.getLabelUsingLabelId("lblcaseidnumber");
	 				out.print(lblCaseIdNumber != null ? lblCaseIdNumber : label.getLabelCaption());
	 			%>
			</label></td>
		<td>
			<input type="text" name="txtcaseidnumber" id="txtcaseidnumber" style="width:35%" readonly="readonly"/>			
		</td>
	</tr>
	<tr>
		<td style="vertical-align:middle"><font color="red">*</font>
			<label id="lbltheme">
				<%
					String lblTheme = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbltheme");
					label = Label.getLabelUsingLabelId("lbltheme");
	 				out.print(lblTheme != null ? lblTheme : label.getLabelCaption());
	 			%>
			</label></td>
		<td>
			<textarea class="jqte-test" id="textareatheme" name="textareatheme" style="width:100%"></textarea>					
		</td>
	</tr>
	<tr>
		<td style="vertical-align:middle"><font color="red">*</font><label id="lblreliefsought">
			<%
				String lblReliefSought = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblreliefsought");
				label = Label.getLabelUsingLabelId("lblreliefsought");
 				out.print(lblReliefSought != null ? lblReliefSought : label.getLabelCaption());
 			%>
		</label></td>
		<td>
			<textarea class="jqte-test" id="textareareliefsought" name="textareareliefsought" style="width:100%"></textarea>			
		</td>
	</tr>
	<tr>
		<td><font color="red">*</font><label id="lblapplicant">
			<%
				String lblApplicant = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblapplicant");
				label = Label.getLabelUsingLabelId("lblapplicant");
 				out.print(lblApplicant != null ? lblApplicant : label.getLabelCaption());
 			%>
		</label></td>
		<td>
			<select name="slctapplicant" id="slctapplicant" style="width:100%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<Applicant> applicantList = Applicant.getAllApplicants();
					if(!applicantList.isEmpty()){
						Iterator<Applicant> applicantItr = applicantList.iterator();
						while(applicantItr.hasNext()){
							Applicant applicant = applicantItr.next();
							%>
							<option value="<%=applicant.getId() %>"><%=applicant.getApplicantIdNumber() %>| <%=applicant.getFullName() %></option>
							<%
						}//end while loop
					}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<td><font color="red">*</font><label id="lblcasecategory">
			<%
				String lblCaseCategory = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasecategory");
				label = Label.getLabelUsingLabelId("lblapplicant");
 				out.print(lblCaseCategory != null ? lblCaseCategory : "Case Category");
 			%>
		</label></td>
		<td>
			<select name="slctcasecategory" id="slctcasecategory" style="width:100%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<AdminField> caseCategoryList = AdminField.getAllOptionValuesForThisFieldName("Case Category");
					if(!caseCategoryList.isEmpty()){
						Iterator<AdminField> caseCategoryItr = caseCategoryList.iterator();						
						while(caseCategoryItr.hasNext()){
							AdminField caseCategory = caseCategoryItr.next();
							AdminFieldTranslation caseCategoryTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, caseCategory.getId());
							if(caseCategoryTranslation != null){
							%>
								<option value="<%=caseCategoryTranslation.getAdminFieldId() %>"><%=caseCategoryTranslation.getTranslatedValue() %></option>
							<%	
							}else{
							%>
								<option value="<%=caseCategory.getId() %>"><%=caseCategory.getOptionValue() %></option>
							<%
							}
						}//end while loop
					}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<td><font color="red">*</font><label id="lbllinkage">
			<%
				String lblLinkage = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbllinkage");
				label = Label.getLabelUsingLabelId("lbllinkage");
 				out.print(lblLinkage != null ? lblLinkage : label.getLabelCaption());
 			%>
		</label></td>
		<td>
			<select name="slctlinkage" id="slctlinkage" style="width:100%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<AdminField> linkageList = AdminField.getAllOptionValuesForThisFieldName("Linkage");
					if(!linkageList.isEmpty()){
						Iterator<AdminField> linkageItr = linkageList.iterator();
						while(linkageItr.hasNext()){
							AdminField adminField = linkageItr.next();
							AdminFieldTranslation linkageField = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, adminField.getId());
							if(linkageField != null){
							%>
								<option value="<%=linkageField.getAdminFieldId() %>"><%=linkageField.getTranslatedValue() %></option>
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
	<tr>
		<td><font color="red">*</font><label id="lblevidencetype">
			<%
				String lblEvidenceType = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblevidencetype");
				label = Label.getLabelUsingLabelId("lblevidencetype");
 				out.print(lblEvidenceType != null ? lblEvidenceType : label.getLabelCaption());
 			%>
		</label></td>
		<td>
			<select name="slctevidencetype" id="slctevidencetype" style="width:100%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<AdminField> evidenceTypeList = AdminField.getAllOptionValuesForThisFieldName("Evidence Type");
					if(!evidenceTypeList.isEmpty()){
						Iterator<AdminField> evidenceTypeItr = evidenceTypeList.iterator();
						while(evidenceTypeItr.hasNext()){
							AdminField adminField = evidenceTypeItr.next();
							AdminFieldTranslation adminFieldTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, adminField.getId());
							if(adminFieldTranslation != null){
							%>
								<option value="<%=adminFieldTranslation.getAdminFieldId() %>"><%=adminFieldTranslation.getTranslatedValue() %></option>
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
	<tr>
		<td><label id="lblnumberofpages">
			<%
				String lblNumberOfPages = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnumberofpages");
				label = Label.getLabelUsingLabelId("lblnumberofpages");
 				out.print(lblNumberOfPages != null ? lblNumberOfPages : label.getLabelCaption());
 			%>
		</label></td>
		<td>
			<input type="text" name="txtnumberofpages" id="txtnumberofpages"/>
		</td>
	</tr>
	<tr>
		<td><font color="red">*</font><label id="lblmeansofapplication">
			<%
				String lblMeansOfApplication = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblmeansofapplication");
				label = Label.getLabelUsingLabelId("lblmeansofapplication");
 				out.print(lblMeansOfApplication != null ? lblMeansOfApplication : label.getLabelCaption());
 			%>
		</label></td>
		<td>
			<select name="slctmeansofapplication" id="slctmeansofapplication" style="width:100%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<AdminField> meansOfApplicationList = AdminField.getAllOptionValuesForThisFieldName("Means of Application");
					if(!meansOfApplicationList.isEmpty()){
						Iterator<AdminField> meansOfApplicationItr = meansOfApplicationList.iterator();
						while(meansOfApplicationItr.hasNext()){
							AdminField adminField = meansOfApplicationItr.next();
							AdminFieldTranslation adminFieldTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, adminField.getId());
							if(adminFieldTranslation != null){
							%>
								<option value="<%=adminFieldTranslation.getAdminFieldId() %>"><%=adminFieldTranslation.getTranslatedValue() %></option>
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
	<tr>
		<td><font color="red">*</font><label id="lblappliedby">
			<%
				String lblAppliedBy = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblappliedby");
				label = Label.getLabelUsingLabelId("lblappliedby");
 				out.print(lblAppliedBy != null ? lblAppliedBy : label.getLabelCaption());
 			%>
		</label></td>
		<td>
			<select name="slctappliedby" id="slctappliedby" style="width:100%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<AdminField> appliedByList = AdminField.getAllOptionValuesForThisFieldName("Applied By");
					if(!appliedByList.isEmpty()){
						Iterator<AdminField> appliedByItr = appliedByList.iterator();
						while(appliedByItr.hasNext()){
							AdminField adminField = appliedByItr.next();
							AdminFieldTranslation adminFieldTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, adminField.getId());
							if(adminFieldTranslation != null){
							%>
								<option value="<%=adminFieldTranslation.getAdminFieldId() %>"><%=adminFieldTranslation.getTranslatedValue() %></option>
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
			<input type="button" id="btnsave" value = "<%=saveButtonCaption %>" class="input-submit"/>
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
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
%>
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
		
		 ///now genearate the auto-id part in here...
		 var fieldName = "txtcaseidnumber";
		 $.ajax({
		    url: 'generatenewcaseidnumber.jsp',		
		    data: null,
		    type:'POST',
		    success:function(response){		    		
		    		$('#'+fieldName).val(response);					
		    },
		    error:function(error){
				alert(error);
		    }
		 });		 
		 
		 
		 $('#btnsave').click(function(){
			 var caseIdNumber = $('#txtcaseidnumber').val();
			 var caseTheme = $('#textareatheme').val();
			 var reliefSought = $('#textareareliefsought').val();
			 var applicantId = $('#slctapplicant').val();
			 var caseCategoryId = $('#slctcasecategory').val();
			 var linkage = $('#slctlinkage').val();
			 var evidenceType = $('#slctevidencetype').val();
			 var numberOfPages = $('#txtnumberofpages').val();
			 var meansOfApplication = $('#slctmeansofapplication').val();
			 var appliedBy = $('#slctappliedby').val();
			 
			 		 			 
			 if(caseTheme != "" && reliefSought != "" && applicantId != "" && caseCategoryId != "" &&
					 linkage != "" && evidenceType != "" && meansOfApplication != "" && appliedBy != ""){				 
				 var dataString = "caseIdNumber="+caseIdNumber+"&caseTheme="+caseTheme+"&reliefSought="+
				 reliefSought+"&applicantId="+applicantId+"&caseCategoryId="+caseCategoryId+"&linkage="+
				 linkage+"&evidenceType="+evidenceType+"&numberOfPages="+numberOfPages+"&meansOfApplication="+
				 meansOfApplication+"&appliedBy="+appliedBy;
				 
				 $.ajax({					
				    url: 'savecase.jsp',		
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
				 $('#errorDiv').html("<p class='msg error'>Missing data values! Please enter all the required data fields.</p>");
			 }
		 });//end save.button click
	});//end document.ready function
</script>