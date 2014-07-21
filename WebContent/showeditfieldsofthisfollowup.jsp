<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	long id = Long.parseLong(request.getParameter("id"));
	Followup followup = Followup.getFollowup(id);
	String fileNumber = followup.getFileNumber();
	Decision decision = Decision.fetchDecisionUsingFileNumber(fileNumber);
	Applicant applicant = Applicant.getApplicant(decision.getApplicantId());
	ApplicantAddress applicantAddress = ApplicantAddress.getAddressOfThisApplicant(applicant.getId());
	Respondent respondent = Respondent.getRespondent(decision.getRespondentId());
	RespondentAddress respondentAddress = RespondentAddress.getRespondentAddressForThisRespondent(respondent.getId());
	Case theCase = Case.getCase(decision.getCaseId());
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	////now define the control names in here...
	String decisionMainPointControlName = "textareadecisionmainpoint" + id;	
	String deadLineControlName = "txtdeadline" + id;	
	String whatToRecordContentControlName = "textareawhattorecordcontent" + id;
	String fileStatusControlName = "slctfilestatus" + id;
	String nextActionControlName = "textareanextaction" + id;
	String radButtonNameControlName = "radwhattorecord" + id;
	String radFollowupTaskControlName = "radfollowuptask" + id;
	String radFeedbackControlName = "radfeedback" + id;
	String radRemarkControlName = "radremark" + id;
	String buttonId = "btnupdate" + id;
	String formId = "frmfollowup" + id;
	String followupDeadlineYearSelectControlName = "slctfollowupyear" + id;
	String followupDeadlineMonthSelectControlName = "slctfollowupmonth" + id;
	String followupDeadlineDateSelectControlName = "slctfollowupdate" + id;
	String followupDeadlineControlNameEthiopic = "txtdeadlineethiopic" + id;
%>
<form name="<%=formId %>" id="<%=formId %>">
			<div id="errorDiv"></div>
			<table border="0" width="100%">
				<tr>
					<td><strong><label id="lblapplicant"><%
					String lblApplicant = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblapplicant");
					label = Label.getLabelUsingLabelId("lblapplicant");
	 				out.print(lblApplicant != null ? lblApplicant : label.getLabelCaption());
	 			%></label></strong></td>
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
									<%
										int applicantRegionId = applicantAddress.getRegion();
										AdminField applicantRegion = AdminField.getAdminField(applicantRegionId);
										AdminFieldTranslation applicantRegionTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, applicantRegion.getId());
										out.print(applicantRegionTranslation != null ? applicantRegionTranslation.getTranslatedValue() : applicantRegion.getOptionValue());
									%>
								</td>
								<td>
									<strong><label id="lblzone"><%
					String lblZone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblzone");
					label = Label.getLabelUsingLabelId("lblzone");
	 				out.print(lblZone != null ? lblZone : label.getLabelCaption());
	 			%></label></strong><br/>
									<%
										int applicantZoneId = applicantAddress.getApplicantZone();
										AdminField applicantZone = AdminField.getAdminField(applicantZoneId);
										AdminFieldTranslation applicantZoneTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, applicantZone.getId());
										out.print(applicantZoneTranslation != null ? applicantZoneTranslation.getTranslatedValue() : applicantZone.getOptionValue());
									%>
								</td>
								<td>
									<strong><label id="lblworeda"><%
					String lblWoreda = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblworeda");
					label = Label.getLabelUsingLabelId("lblworeda");
	 				out.print(lblWoreda != null ? lblWoreda : label.getLabelCaption());
	 			%></label></strong><br/>
									<%
										int applicantWoredaId = applicantAddress.getWoreda();
										AdminField applicantWoreda = AdminField.getAdminField(applicantWoredaId);
										AdminFieldTranslation applicantWoredaTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, applicantWoreda.getId());
										out.print(applicantWoredaTranslation != null ? applicantWoredaTranslation.getTranslatedValue() : applicantWoreda.getOptionValue());
									%>
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
									<strong><label id="lblmobiletelephone"><%
					String lblMobileTelephone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblmobiletelephone");
					label = Label.getLabelUsingLabelId("lblmobiletelephone");
	 				out.print(lblMobileTelephone != null ? lblMobileTelephone : label.getLabelCaption());
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
					lblRegion = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblregion");
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
					lblWoreda = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblworeda");
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
					lblKebele = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblkebele");
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
					String lblMobile = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblmobile");
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
					lblEmail = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblemail");
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
								<td colspan="2" style="background:#fff">
									<strong><label id="lbltheme"><%
					String lblTheme = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbltheme");
					label = Label.getLabelUsingLabelId("lbltheme");
	 				out.print(lblTheme != null ? lblTheme : label.getLabelCaption());
	 			%></label></strong><br/>
									<%=theCase.getTheme() %>
								</td>
								<td colspan="2" style="background:#fff">
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
									<%
										if(langId == 1){
											///now convert the greg date to ethiopic date and show the values in the 
											//drop down controls...
											StringTokenizer tokenD = new StringTokenizer(String.valueOf(theCase.getDateRegistered()),"-");
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
												EthiopicMonth ethiopicMonth = EthiopicMonth.getEthiopicMonthByMonthIndex(day.getMonth());
												out.print(ethiopicMonth.getMonthName()+" "+ethDblDate+", "+day.getYear());
											}
										}else{
											out.print(theCase.getDateRegistered());
										}
									%>
								</td>
								<td>
									<strong><label id="lblnumberofpages"><%
					lblNumberOfPages = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnumberofpages");
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
					<td style="vertical-align:middle">
						<label id="lbldecisionmainpoint">
						<strong>
							<%
								String lblDecisionMainPoint = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldecisionmainpoint");
								label = Label.getLabelUsingLabelId("lbldecisionmainpoint");
				 				out.print(lblDecisionMainPoint != null ? lblDecisionMainPoint : label.getLabelCaption());
				 			%>
						</label>
						</strong>
					</td>
					<td>
						<textarea name="<%=decisionMainPointControlName %>" id="<%=decisionMainPointControlName %>" style="width:100%" class="jqte-test"><%=followup.getDecisionMainPoint() %></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<label id="lbldeadline">
						<strong>
							<%
								String lblDeadline = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldeadline");
								label = Label.getLabelUsingLabelId("lbldeadline");
				 				out.print(lblDeadline != null ? lblDeadline : label.getLabelCaption());
				 			%>
						</label>
						</strong>
					</td>
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
								StringTokenizer tokenD = new StringTokenizer(String.valueOf(followup.getDeadline()),"-");
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
			        								<select name="<%=followupDeadlineDateSelectControlName %>" id="<%=followupDeadlineDateSelectControlName %>" style="width:100%">
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
			        								<select name="<%=followupDeadlineMonthSelectControlName %>" id="<%=followupDeadlineMonthSelectControlName %>" style="width:100%">
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
			        								<select name="<%=followupDeadlineYearSelectControlName %>" id="<%=followupDeadlineYearSelectControlName %>" style="width:100%">
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
			        								<input type="hidden" name="<%=followupDeadlineControlNameEthiopic %>" id="<%=followupDeadlineControlNameEthiopic %>" value="<%=followup.getDeadline() %>"/>      								
			        							</td>
			        						</tr>
			        					</table>
								<%
							}else{
						%>
								<input id="<%=deadLineControlName %>" type="text" name="<%=deadLineControlName %>" value="<%=followup.getDeadline() %>">
								<img onclick="javascript:NewCssCal('<%=deadLineControlName %>');" src="sample/images/cal.gif">
						<%
							}
						%>						
					</td>
				</tr>
				<tr style="background:#eee">
					<td style="vertical-align:middle"><font color="red">*</font><strong><label id="lblwhattorecord"><%
					String lblWhatToRecord = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblwhattorecord");
					label = Label.getLabelUsingLabelId("lblwhattorecord");
	 				out.print(lblWhatToRecord != null ? lblWhatToRecord : label.getLabelCaption());
	 			%></label></strong></td>
					<td>
						<table border="0" width="100%">
							<tr>
								<td>
									<%
									String lblFollowupTask = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfollowuptask");
										if(followup.getWhatToRecord().equalsIgnoreCase(lblFollowupTask)){
									%>
									<input type="radio" name="<%=radButtonNameControlName %>" id="radfollowuptask" class="<%=radButtonNameControlName %>" value="<%										
										label = Label.getLabelUsingLabelId("lblfollowuptask");
						 				out.print(lblFollowupTask != null ? lblFollowupTask : label.getLabelCaption());%>" checked="checked"/>
					 				<%
										}else{
									%>
										<input type="radio" name="<%=radButtonNameControlName %>" id="radfollowuptask" class="<%=radButtonNameControlName %>" value="<%										
										label = Label.getLabelUsingLabelId("lblfollowuptask");
						 				out.print(lblFollowupTask != null ? lblFollowupTask : label.getLabelCaption());%>"/>
									<%
										}
					 				%> 
						 			<label id="lblfollowuptask"><%
										lblFollowupTask = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfollowuptask");
										label = Label.getLabelUsingLabelId("lblfollowuptask");
						 				out.print(lblFollowupTask != null ? lblFollowupTask : label.getLabelCaption());
						 			%></label>
					 			</td>
								<td>
									<%
										String lblFeedback = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfeedback");
										if(followup.getWhatToRecord().equalsIgnoreCase(lblFeedback)){
									%>
										<input type="radio" name="<%=radButtonNameControlName %>" id="radfeedback" class="<%=radButtonNameControlName %>" value="<%									
										label = Label.getLabelUsingLabelId("lblfeedback");
						 				out.print(lblFeedback != null ? lblFeedback : label.getLabelCaption());%>" checked="checked"/>
					 				<%
										}else{
									%>
										<input type="radio" name="<%=radButtonNameControlName %>" id="radfeedback" class="<%=radButtonNameControlName %>" value="<%									
										label = Label.getLabelUsingLabelId("lblfeedback");
						 				out.print(lblFeedback != null ? lblFeedback : label.getLabelCaption());%>"/>
									<%
										}
					 				%> 
					 			<label id="lblfeedback"><%
					 				lblFeedback = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfeedback");
									label = Label.getLabelUsingLabelId("lblfeedback");
					 				out.print(lblFeedback != null ? lblFeedback : label.getLabelCaption());
					 			%></label>
					 			</td>
								<td>
									<%
										String lblRemark = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblremark");
										if(followup.getWhatToRecord().equalsIgnoreCase(lblRemark)){
									%>
											<input type="radio" name="<%=radButtonNameControlName %>" id="radremark" class="<%=radButtonNameControlName %>" value="<%										
											label = Label.getLabelUsingLabelId("lblremark");
							 				out.print(lblRemark != null ? lblRemark : label.getLabelCaption());%>" checked="checked"/>
						 				<%
										}else{
										%>
											<input type="radio" name="<%=radButtonNameControlName %>" id="radremark" class="<%=radButtonNameControlName %>" value="<%										
											label = Label.getLabelUsingLabelId("lblremark");
							 				out.print(lblRemark != null ? lblRemark : label.getLabelCaption());%>"/>
										<%
										}
						 				%> 
						 			<label id="lblremark"><%
						 				lblRemark = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblremark");
										label = Label.getLabelUsingLabelId("lblRemark");
						 				out.print(lblRemark != null ? lblRemark : label.getLabelCaption());
						 			%>
						 			</label>
					 			</td>								
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td></td>
					<td colspan="1">
						<table border="0" width="100%">
							<tr style="background:#eee;font-weight:bolder">
								<td>
									<label id="lblrecordedcontent">
										<%
							 				String lblRecordedContent = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrecordedcontent");
											label = Label.getLabelUsingLabelId("lblrecordedcontent");
							 				out.print(lblRecordedContent != null ? lblRecordedContent : label.getLabelCaption());
							 			%>
									</label>
								</td>
							</tr>
							<%
								WhatToRecordContent whatToRecordContentObj = WhatToRecordContent.getWhatToRecordContentForFollowup(followup.getId());
								if(whatToRecordContentObj != null){
									%>
									<tr>
										<td>
											<textarea name="<%=whatToRecordContentControlName %>" id="<%=whatToRecordContentControlName %>" class="jqte-test"><%=whatToRecordContentObj.getRecordedContent() %></textarea>
										</td>
									</tr>
									<%
								}
							%>
						</table>
					</td>
				</tr>
				<tr style="background:#eee">
					<td style="vertical-align:middle"><font color="red">*</font> <strong><label id="lblfilestatus"><%
					String lblFileStatus = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfilestatus");
					label = Label.getLabelUsingLabelId("lblfilestatus");
	 				out.print(lblFileStatus != null ? lblFileStatus : label.getLabelCaption());
	 			%></label></strong></td>
					<td>
						<select name="<%=fileStatusControlName %>" id="<%=fileStatusControlName %>" style="width:100%">
							<option value="" selected="selected">--Select--</option>
							<%
								List<AdminField> adminFieldList = AdminField.getAllOptionValuesForThisFieldName("Case Status");
								Iterator<AdminField> adminFieldItr = adminFieldList.iterator();
								while(adminFieldItr.hasNext()){
									AdminField adminField = adminFieldItr.next();
									AdminFieldTranslation fileStatusField = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, adminField.getId());
									if(fileStatusField != null){
										if(fileStatusField.getAdminFieldId() == followup.getFileStatusId()){
									%>
										<option value="<%=fileStatusField.getAdminFieldId() %>" selected="selected"><%=fileStatusField.getTranslatedValue() %></option>
									<%
										}else{
									%>
										<option value="<%=fileStatusField.getAdminFieldId() %>"><%=fileStatusField.getTranslatedValue() %></option>
									<%
										}
									}else{
										if(adminField.getId() == followup.getFileStatusId()){
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
							%>
						</select>
					</td>
				</tr>
				<tr style="background:#eee">
					<td style="vertical-align:middle"><font color="red">*</font> <strong><label id="lblnextaction"><%
					String lblNextAction = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnextaction");
					label = Label.getLabelUsingLabelId("lblnextaction");
	 				out.print(lblNextAction != null ? lblNextAction : label.getLabelCaption());
	 			%></label></strong></td>
					<td>
						<textarea class="jqte-test" id="<%=nextActionControlName %>" name="<%=nextActionControlName %>" style="width:100%"><%=followup.getNextAction() %></textarea>
					</td>
				</tr>				
				<tr style="background:#eee">
					<td colspan="2" align="right">
						<%
							String lblUpdateButtonLabel = "lblupdatebutton";
							String updateButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblupdatebutton");
							label = Label.getLabelUsingLabelId("lblupdatebutton");
							String updateButtonCaption = updateButtonLabel != null ? updateButtonLabel : label.getLabelCaption();
							//////
							String lblResetButtonLabel = "lblresetbutton";
							String resetButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId, "lblresetbutton");
							label = Label.getLabelUsingLabelId("lblresetbutton");
							String resetButtonCaption = resetButtonLabel != null ? resetButtonLabel : label.getLabelCaption();
						%>
						<input type="button" value="<%=updateButtonCaption %>" id="<%=buttonId %>" class="input-submit"/>
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
		
		var id = "<%=id%>";
		var buttonId = "btnupdate" + id;
		var langId = "<%=langId%>";
		
		//now define the control names in here....
		var followupDeadlineYearSelectControlName = "slctfollowupyear" + id;
		var followupDeadlineMonthSelectControlName = "slctfollowupmonth" + id;
		var followupDeadlineDateSelectControlName = "slctfollowupdate" + id;
		var followupDeadlineControlNameEthiopic = "txtdeadlineethiopic" + id;
		
		$('#'+followupDeadlineDateSelectControlName).change(function(){
			//ethiopic start date
			var ethiopicResolutionDate = $('#'+followupDeadlineDateSelectControlName).val();
			var ethiopicResolutionMonth = $('#'+followupDeadlineMonthSelectControlName).val();
			var ethiopicResolutionYear = $('#'+followupDeadlineYearSelectControlName).val();
			
			//now do the convertion in here...	
			if(ethiopicResolutionDate != "" && ethiopicResolutionMonth != "" && ethiopicResolutionYear != ""){
				var resolutionDateDataString = "dateDataString="+ethiopicResolutionDate+":"+ethiopicResolutionMonth+":"+ethiopicResolutionYear;
							
				$.ajax({
					type:'POST',
					data : resolutionDateDataString,
					url: 'convertthisethiopicdatetogregorian.jsp',
					success:function(data){
						$('#'+followupDeadlineControlNameEthiopic).val(data);
					}
				});				
			}//end if condition...
		});
		
		$('#'+followupDeadlineMonthSelectControlName).change(function(){
			//ethiopic start date
			var ethiopicResolutionDate = $('#'+followupDeadlineDateSelectControlName).val();
			var ethiopicResolutionMonth = $('#'+followupDeadlineMonthSelectControlName).val();
			var ethiopicResolutionYear = $('#'+followupDeadlineYearSelectControlName).val();
			
			//now do the convertion in here...	
			if(ethiopicResolutionDate != "" && ethiopicResolutionMonth != "" && ethiopicResolutionYear != ""){
				var resolutionDateDataString = "dateDataString="+ethiopicResolutionDate+":"+ethiopicResolutionMonth+":"+ethiopicResolutionYear;
							
				$.ajax({
					type:'POST',
					data : resolutionDateDataString,
					url: 'convertthisethiopicdatetogregorian.jsp',
					success:function(data){
						$('#'+followupDeadlineControlNameEthiopic).val(data);
					}
				});				
			}//end if condition...
		});
		
		$('#'+followupDeadlineYearSelectControlName).change(function(){
			//ethiopic start date
			var ethiopicResolutionDate = $('#'+followupDeadlineDateSelectControlName).val();
			var ethiopicResolutionMonth = $('#'+followupDeadlineMonthSelectControlName).val();
			var ethiopicResolutionYear = $('#'+followupDeadlineYearSelectControlName).val();
			
			//now do the convertion in here...	
			if(ethiopicResolutionDate != "" && ethiopicResolutionMonth != "" && ethiopicResolutionYear != ""){
				var resolutionDateDataString = "dateDataString="+ethiopicResolutionDate+":"+ethiopicResolutionMonth+":"+ethiopicResolutionYear;
							
				$.ajax({
					type:'POST',
					data : resolutionDateDataString,
					url: 'convertthisethiopicdatetogregorian.jsp',
					success:function(data){
						$('#'+followupDeadlineControlNameEthiopic).val(data);
					}
				});				
			}//end if condition...
		});
		
		
		$('#'+buttonId).click(function(){
			////now define the control names in here...
			var decisionMainPointControlName = "textareadecisionmainpoint" + id;	
			var deadLineControlName = "txtdeadline" + id;	
			var whatToRecordContentControlName = "textareawhattorecordcontent" + id;
			var fileStatusControlName = "slctfilestatus" + id;
			var nextActionControlName = "textareanextaction" + id;
			var radButtonNameControlName = "radwhattorecord" + id;			
			var formId = "frmfollowup" + id;
			var fileNumber = "<%=fileNumber%>";
			//now get the values using the filed names define above...			
			var whatToRecord = $('input[name=' + radButtonNameControlName + ']:checked', '#' + formId).val();
			var whatToRecordContent = $('#'+whatToRecordContentControlName).val();			
			var fileStatusId = $('#'+fileStatusControlName).val();
			var nextAction = $('#'+nextActionControlName).val();
			var decisionMainPoint = $('#'+decisionMainPointControlName).val();
			var deadline = null;
			if(langId == 1){
				deadline = $('#'+followupDeadlineControlNameEthiopic).val().trim();
			}else{
				deadline = $('#'+deadLineControlName).val().trim();
			}				
						
			if(fileNumber != "" && whatToRecord != "" && whatToRecordContent != "" &&
					fileStatusId != "" && nextAction != "" && decisionMainPoint != "" && deadline != ""){
				var dataString = "fileNumber="+fileNumber+"&whatToRecord="+whatToRecord+
				"&whatToRecordContent="+whatToRecordContent+"&fileStatusId="+fileStatusId+
				"&nextAction="+nextAction+"&decisionMainPoint="+decisionMainPoint+"&deadline="+deadline+
				"&id="+id;				
				
				//now save this information to the database...
				$.ajax({
				    url: 'updatefollowup.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){		    		
				    		$('#followupDiv').load('searchandshowlistoffollowupsforfilenumberforedit.jsp?fileNumber='+fileNumber);					
				    },
				    error:function(error){
						alert(error);
				    }
				 });	
			}else{
				$('#errorDiv').html("<p class='msg error'>Missing Data! Please enter all the required data fileds!</p>");
			}
		});
	});//end document.ready function
</script>



		