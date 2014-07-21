<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	long investigatorAssignmentId = Long.parseLong(request.getParameter("investigatorAssignmentId"));
	InvestigatorAssignment investigatorAssignment = InvestigatorAssignment.getInvestigatorAssignment(investigatorAssignmentId);
	Decision decision = Decision.fetchDecisionUsingFileNumber(investigatorAssignment.getFileNumber());
	Applicant applicant = Applicant.getApplicant(decision.getApplicantId());
	ApplicantAddress applicantAddress = ApplicantAddress.getAddressOfThisApplicant(applicant.getId());
	Case theCase = Case.getCase(decision.getCaseId());
	Respondent respondent = Respondent.getRespondent(decision.getRespondentId());
	RespondentAddress respondentAddress = RespondentAddress.getRespondentAddressForThisRespondent(respondent.getId());
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;	
%>
<form id="frmpreview">
<table border="0" width="100%">
	<tr>
		<td><strong><label id="lblfilenumber"><%
					String lblFileNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfilenumber");
					label = Label.getLabelUsingLabelId("lblfilenumber");
	 				out.print(lblFileNumber != null ? lblFileNumber : label.getLabelCaption());
	 			%></label></strong></td>
		<td>
			<%=investigatorAssignment.getFileNumber() %>
		</td>
	</tr>
	<tr>
		<td><strong><label id="lblfilesource"><%
					String lblFileSource = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfilesource");
					label = Label.getLabelUsingLabelId("lblfilesource");
	 				out.print(lblFileSource != null ? lblFileSource : label.getLabelCaption());
	 			%></label></strong></td>
		<td>
			<%=investigatorAssignment.getFileSource() %>
		</td>
	</tr>
	<tr>
		<td><strong><label id="lblcasestatus"><%
					String lblCaseStatus = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasestatus");
					label = Label.getLabelUsingLabelId("lblcasestatus");
	 				out.print(lblCaseStatus != null ? lblCaseStatus : label.getLabelCaption());
	 			%></label></strong></td>
		<td>
			<%=investigatorAssignment.getCaseStatus() %>
		</td>
	</tr>
	<tr>
		<td><strong><label id="lbldateassigned"><%
					String lblDateAssigned = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldateassigned");
					label = Label.getLabelUsingLabelId("lbldateassigned");
	 				out.print(lblDateAssigned != null ? lblDateAssigned : label.getLabelCaption());
	 			%></label></strong></td>
		<td>
			<%=investigatorAssignment.getDateAssigned() %>
		</td>
	</tr>
	<tr>
		<td><strong><label id="lblapplicant"><%
					String lblApplicant = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblapplicant");
					label = Label.getLabelUsingLabelId("lblapplicant");
	 				out.print(lblApplicant != null ? lblApplicant : label.getLabelCaption());
	 			%></label></label></strong></td>
		<td>
			<table border="0" width="100%">
				<tr>
					<td>
						<strong><label id="lblapplicantidnumber"><%
					String lblApplicantIdNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblapplicantidnumber");
					label = Label.getLabelUsingLabelId("lblapplicantidnumber");
	 				out.print(lblApplicantIdNumber != null ? lblApplicantIdNumber : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=applicant.getApplicantIdNumber() %>
					</td>
					<td>
						<strong><label id="lblfullname"><%
					String lblFullName = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfullname");
					label = Label.getLabelUsingLabelId("lblfullname");
	 				out.print(lblFullName != null ? lblFullName : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=applicant.getFullName() %>
					</td>
					<td>
						<strong><label id="lblsex"><%
					String lblSex = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblsex");
					label = Label.getLabelUsingLabelId("lblsex");
	 				out.print(lblSex != null ? lblSex : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=applicant.getSex() %>
					</td>
					<td>
						<strong><label id="lblagecategory"><%
					String lblAgeCategory = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblagecategory");
					label = Label.getLabelUsingLabelId("lblagecategory");
	 				out.print(lblAgeCategory != null ? lblAgeCategory : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=applicant.getAgeCategory() %>
					</td>
				</tr>				
				<tr>
					<td>
						<strong><label id="lblnumberofapplicantsmale"><%
					String lblNumberOfApplicantsMale = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnumberofapplicantsmale");
					label = Label.getLabelUsingLabelId("lblnumberofapplicantsmale");
	 				out.print(lblNumberOfApplicantsMale != null ? lblNumberOfApplicantsMale : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=applicant.getNumberOfApplicantsMale() %>
					</td>
					<td>
						<strong><label id="lblnumberofapplicantsfemale"><%
					String lblNumberOfApplicantsFemale = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnumberofapplicantsfemale");
					label = Label.getLabelUsingLabelId("lblnumberofapplicantsfemale");
	 				out.print(lblNumberOfApplicantsFemale != null ? lblNumberOfApplicantsFemale : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=applicant.getNumberOfApplicantsFemale() %>
					</td>
					<td>
						<strong><label id="lbloccupation"><%
					String lblOccupation = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbloccupation");
					label = Label.getLabelUsingLabelId("lbloccupation");
	 				out.print(lblOccupation != null ? lblOccupation : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=applicant.getOccupation() %>
					</td>
					<td>
						<strong><label id="lbldisability"><%
					String lblDisability = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldisability");
					label = Label.getLabelUsingLabelId("lbldisability");
	 				out.print(lblDisability != null ? lblDisability : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=applicant.getDisability() %>
					</td>
				</tr>
				<tr>
					<td>
						<strong><label id="lblregion"><%
					String lblRegion = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblregion");
					label = Label.getLabelUsingLabelId("lblregion");
	 				out.print(lblRegion != null ? lblRegion : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=applicantAddress.getRegion() %>
					</td>
					<td>
						<strong><label id="lblzone"><%
					String lblZone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblzone");
					label = Label.getLabelUsingLabelId("lblzone");
	 				out.print(lblZone != null ? lblZone : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=applicantAddress.getApplicantZone() %>
					</td>
					<td>
						<strong><label id="lblworeda"><%
					String lblWoreda = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblworeda");
					label = Label.getLabelUsingLabelId("lblworeda");
	 				out.print(lblWoreda != null ? lblWoreda : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=applicantAddress.getWoreda() %>
					</td>
					<td>
						<strong><label id="lblkebele"><%
					String lblKebele = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblkebele");
					label = Label.getLabelUsingLabelId("lblkebele");
	 				out.print(lblKebele != null ? lblKebele : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=applicantAddress.getKebele() %>
					</td>
				</tr>
				<tr>
					<td>
						<strong><label id="lblofficetelephone"><%
					String lblOfficeTelephone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblofficetelephone");
					label = Label.getLabelUsingLabelId("lblofficetelephone");
	 				out.print(lblOfficeTelephone != null ? lblOfficeTelephone : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=applicantAddress.getOfficeTelephone() %>
					</td>
					<td>
						<strong><label id="lblhometelephone"><%
					String lblHomeTelephone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblhometelephone");
					label = Label.getLabelUsingLabelId("lblhometelephone");
	 				out.print(lblHomeTelephone != null ? lblHomeTelephone : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=applicantAddress.getHomeTelephone() %>
					</td>
					<td>
						<strong><label id="lblmobile"><%
					String lblMobile = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblmobile");
					label = Label.getLabelUsingLabelId("lblmobile");
	 				out.print(lblMobile != null ? lblMobile : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=applicantAddress.getMobileTelephone() %>
					</td>
					<td>
						<strong><label id="lblemail"><%
					String lblEmail = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblemail");
					label = Label.getLabelUsingLabelId("lblemail");
	 				out.print(lblEmail != null ? lblEmail : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=applicantAddress.getEmail() %>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td><strong><label id="lblcase"><%
					String lblCase = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcase");
					label = Label.getLabelUsingLabelId("lblcase");
	 				out.print(lblCase != null ? lblCase : label.getLabelCaption());
	 			%></label></strong></td>
		<td>
			<table border="0" width="100%">
				<tr>
					<td>
						<strong><label id="lblcaseidnumber"><%
					String lblCaseIdNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcaseidnumber");
					label = Label.getLabelUsingLabelId("lblcaseidnumber");
	 				out.print(lblCaseIdNumber != null ? lblCaseIdNumber : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=theCase.getCaseIdNumber() %>
					</td>
					<td></td>
					<td></td>
					<td>
						<strong><label id="lblcasecategory"><%
					String lblCaseCategory = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasecategory");
					label = Label.getLabelUsingLabelId("lblcasecategory");
	 				out.print(lblCaseCategory != null ? lblCaseCategory : label.getLabelCaption());
	 			%></label></strong><br/>
						<%
							AdminField caseCategory = AdminField.getAdminField(theCase.getCaseCategoryId());
							AdminFieldTranslation caseCategoryTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, caseCategory.getId());
							out.print(caseCategoryTranslation != null ? caseCategoryTranslation.getTranslatedValue() : caseCategory.getOptionValue());
						%>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<strong><label id="lblcasetheme"><%
					String lblCaseTheme = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasetheme");
					label = Label.getLabelUsingLabelId("lblcasetheme");
	 				out.print(lblCaseTheme != null ? lblCaseTheme : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=theCase.getTheme() %>
					</td>
					<td colspan="2">
						<strong><label id="lblreliefsought"><%
					String lblReliefSought = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblreliefsought");
					label = Label.getLabelUsingLabelId("lblreliefsought");
	 				out.print(lblReliefSought != null ? lblReliefSought : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=theCase.getReliefSought() %>
					</td>
				</tr>
				<tr>
					<td>
						<strong><label id="lbllinkage"><%
					String lblLinkage = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbllinkage");
					label = Label.getLabelUsingLabelId("lbllinkage");
	 				out.print(lblLinkage != null ? lblLinkage : label.getLabelCaption());
	 			%></label></strong><br/>
						<%
							int linkageId = theCase.getLinkageId();
							AdminField linkage = AdminField.getAdminField(linkageId);
							AdminFieldTranslation linkageTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, linkage.getId());
							out.print(linkageTranslation != null ? linkageTranslation.getTranslatedValue() : linkage.getOptionValue());
						%>
					</td>
					<td>
						<strong><label id="lblevidencetype"><%
					String lblEvidenceType = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblevidencetype");
					label = Label.getLabelUsingLabelId("lblevidencetype");
	 				out.print(lblEvidenceType != null ? lblEvidenceType : label.getLabelCaption());
	 			%></label></strong><br/>
						<%
							int evidenceTypeId = theCase.getEvidenceTypeId();
							AdminField evidenceType = AdminField.getAdminField(evidenceTypeId);
							AdminFieldTranslation evidenceTypeTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, evidenceType.getId());
							out.print(evidenceTypeTranslation != null ? evidenceTypeTranslation.getTranslatedValue() : evidenceType.getOptionValue());
						%>
					</td>
					<td>
						<strong><label id="lblnumberofpages"><%
					String lblNumberOfPages = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnumberofpages");
					label = Label.getLabelUsingLabelId("lblnumberofpages");
	 				out.print(lblNumberOfPages != null ? lblNumberOfPages : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=theCase.getNumberOfPages() %>
					</td>
					<td>
						<strong><label id="lblmeansofapplication"><%
					String lblMeansOfApplication = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblmeansofapplication");
					label = Label.getLabelUsingLabelId("lblmeansofapplication");
	 				out.print(lblMeansOfApplication != null ? lblMeansOfApplication : label.getLabelCaption());
	 			%></label></strong><br/>
						<%
							int meansOfApplicationId = theCase.getMeansOfApplicationId();
							AdminField meansOfApplication = AdminField.getAdminField(meansOfApplicationId);
							AdminFieldTranslation meansOfApplicationTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, meansOfApplication.getId());
							out.print(meansOfApplicationTranslation != null ? meansOfApplicationTranslation.getTranslatedValue() : meansOfApplication.getOptionValue());
						%>
					</td>
				</tr>
				<tr>
					<td>
						<strong><label id="lblappliedby"><%
					String lblAppliedBy = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblappliedby");
					label = Label.getLabelUsingLabelId("lblappliedby");
	 				out.print(lblAppliedBy != null ? lblAppliedBy : label.getLabelCaption());
	 			%></label></strong><br/>
						<%
							int appliedById = theCase.getAppliedById();
							AdminField appliedBy = AdminField.getAdminField(appliedById);
							AdminFieldTranslation appliedByTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, appliedBy.getId());
							out.print(appliedByTranslation != null ? appliedByTranslation.getTranslatedValue() : appliedBy.getOptionValue());
						%>
					</td>
					<td>
						<strong><label id="lbldateregistered"><%
					String lblDateRegistered = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldateregistered");
					label = Label.getLabelUsingLabelId("lbldateregistered");
	 				out.print(lblDateRegistered != null ? lblDateRegistered : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=theCase.getDateRegistered() %>
					</td>
					<td>
						<strong><label id="lblnumberofpages"><%					
					label = Label.getLabelUsingLabelId("lblnumberofpages");
	 				out.print(lblNumberOfPages != null ? lblNumberOfPages : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=theCase.getNumberOfPages() %>
					</td>
					<td>
						
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td><strong><label id="lblrespondent"><%
					String lblRespondent = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrespondent");
					label = Label.getLabelUsingLabelId("lblrespondent");
	 				out.print(lblRespondent != null ? lblRespondent : label.getLabelCaption());
	 			%></label></strong></td>
		<td>
			<table border="0" width="100%">
				<tr>
					<td>
						<strong><label id="lblrespondentidnumber"><%
					String lblRespondentIdNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrespondentidnumber");
					label = Label.getLabelUsingLabelId("lblrespondentidnumber");
	 				out.print(lblRespondentIdNumber != null ? lblRespondentIdNumber : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=respondent.getRespondentIdNumber() %>
					</td>
					<td>
						<strong><label id="lblname"><%
					String lblName = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblname");
					label = Label.getLabelUsingLabelId("lblname");
	 				out.print(lblName != null ? lblName : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=respondent.getName() %>
					</td>
					<td>
						<strong><label id="lblstructure"><%
					String lblStructure = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblstructure");
					label = Label.getLabelUsingLabelId("lblstructure");
	 				out.print(lblStructure != null ? lblStructure : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=respondent.getStructure() %>
					</td>
					<td>
						<strong><label id="lblsector"><%
					String lblSector = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblsector");
					label = Label.getLabelUsingLabelId("lblsector");
	 				out.print(lblSector != null ? lblSector : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=respondent.getSector() %>
					</td>
				</tr>
				<tr>
					<td>
						<strong><label id="lblregion"><%					
					label = Label.getLabelUsingLabelId("lblregion");
	 				out.print(lblRegion != null ? lblRegion : label.getLabelCaption());
	 			%></label></strong><br/>
						<%
							int regionId = respondentAddress.getRegionId();
							AdminField region = AdminField.getAdminField(regionId);
							AdminFieldTranslation regionTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, region.getId());
							out.print(regionTranslation != null ? regionTranslation.getTranslatedValue() : region.getOptionValue());
						%>
					</td>
					<td>
						<strong><label id="lblworeda"><%					
					label = Label.getLabelUsingLabelId("lblworeda");
	 				out.print(lblWoreda != null ? lblWoreda : label.getLabelCaption());
	 			%></label></strong><br/>
						<%
							int woredaId = respondentAddress.getWoredaId();
							AdminField woreda = AdminField.getAdminField(woredaId);
							AdminFieldTranslation woredaTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, woreda.getId());
							out.print(woredaTranslation != null ? woredaTranslation.getTranslatedValue() : woreda.getOptionValue());
						%>
					</td>
					<td>
						<strong><label id="lblkebele"><%					
					label = Label.getLabelUsingLabelId("lblkebele");
	 				out.print(lblKebele != null ? lblKebele : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=respondentAddress.getKebele() %>
					</td>
					<td>
						<strong><label id="lbltelephone"><%
					String lblTelephone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbltelephone");
					label = Label.getLabelUsingLabelId("lbltelephone");
	 				out.print(lblTelephone != null ? lblTelephone : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=respondentAddress.getTelephone() %>
					</td>
				</tr>
				<tr>
					<td>
						<strong><label id="lblmobile"><%					
					label = Label.getLabelUsingLabelId("lblmobile");
	 				out.print(lblMobile != null ? lblMobile : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=respondentAddress.getMobile() %>
					</td>
					<td>
						<strong><label id="lblfax"><%
					String lblFax = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfax");
					label = Label.getLabelUsingLabelId("lblfax");
	 				out.print(lblFax != null ? lblFax : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=respondentAddress.getFax() %>
					</td>
					<td>
						<strong><label id="lblpobox"><%
					String lblPobox = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblpobox");
					label = Label.getLabelUsingLabelId("lblpobox");
	 				out.print(lblPobox != null ? lblPobox : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=respondentAddress.getPobox() %>
					</td>
					<td>
						<strong><label id="lblemail"><%					
					label = Label.getLabelUsingLabelId("lblemail");
	 				out.print(lblEmail != null ? lblEmail : label.getLabelCaption());
	 			%></label></strong><br/>
						<%=respondentAddress.getEmail() %>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<fieldset>
				<legend><label id="lbldecision"><%
					String lblDecision = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldecision");
					label = Label.getLabelUsingLabelId("lbldecision");
	 				out.print(lblDecision != null ? lblDecision : label.getLabelCaption());
	 			%></label></legend>
				<table border="0" width="100%">
					<tr>
						<td>
							<input type="radio" name="raddecision" value="Accept" id="radaccept"/> <label id="lblaccept"><%
					String lblAccept = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblaccept");
					label = Label.getLabelUsingLabelId("lblaccept");
	 				out.print(lblAccept != null ? lblAccept : label.getLabelCaption());
	 			%></label>
						</td>
						<td>
							<input type="radio" name="raddecision" value="Reject" id="radreject"/> <label id="lblreject"><%
					String lblReject = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblreject");
					label = Label.getLabelUsingLabelId("lblreject");
	 				out.print(lblReject != null ? lblReject : label.getLabelCaption());
	 			%></label>
						</td>
					</tr>
				</table>
			</fieldset>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<div id="rejectReasonDiv"></div>
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
			<input type="button" value="<%=saveButtonCaption %>" id="btnsave" class="input-submit"/>
			<input type="reset" value="<%=resetButtonCaption %>" class="input-submit"/>
		</td>
	</tr>
</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		$('#radreject').click(function(){
			$('#rejectReasonDiv').load('showrejectreasontextareaforcasepreview.jsp');
		});
		
		$('#radaccept').click(function(){
			$('#rejectReasonDiv').html('');
		});
		
		$('#btnsave').click(function(){
			var investigatorAssignmentId = "<%=investigatorAssignmentId%>";
			var formId = "frmpreview";
			var radioButtonName = "raddecision";			
			var selectedDecision = $('input[name=' + radioButtonName + ']:checked', '#' + formId).val();
			
			if(selectedDecision != ""){
				var dataString = "investigatorAssignmentId="+investigatorAssignmentId+
				"&selectedDecision="+selectedDecision;
				if(selectedDecision == "Reject"){
					var rejectionReason = $('#textarearejectionreason').val();
					dataString +="&rejectionReason="+rejectionReason;
				}
				$.ajax({					
				    url: 'updatepreviewthisassignment.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){			    		
				    		var divId = "previewAssignmentDiv" + investigatorAssignmentId;
				    		$('#'+divId).html(response);				    		
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>