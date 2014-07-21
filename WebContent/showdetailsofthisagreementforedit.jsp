<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	long agreementId = Long.parseLong(request.getParameter("agreementId"));
	Agreement agreement = Agreement.getAgreement(agreementId);
	Decision decision = Decision.fetchDecisionUsingFileNumber(agreement.getFileNumber());
	Applicant applicant = Applicant.getApplicant(decision.getApplicantId());
	ApplicantAddress applicantAddress = ApplicantAddress.getAddressOfThisApplicant(applicant.getId());
	Respondent respondent = Respondent.getRespondent(decision.getRespondentId());
	RespondentAddress respondentAddress = RespondentAddress.getRespondentAddressForThisRespondent(respondent.getId());
	Case theCase = Case.getCase(decision.getCaseId());
	//now define the control names in here..
	String investigatorSuggestionControlName = "textareainvestigatorsuggestion" + agreementId;
	String applicantPositionControlName = "textaraeapplicantposition" + agreementId;
	String respondentPositionControlName = "textarearespondentposition" + agreementId;
	String agreementTextControlName = "textareaagreement" + agreementId;
	String agreementDateControlName = "txtagreementdate" + agreementId;
	String ethiopicAgreementDateControlName = "txtagreementdateethiopic" + agreementId;
	String agreementDateSelectControlName = "slctagreementdate" + agreementId;
	String agreementMonthSelectControlName = "slctagreementmonth" + agreementId;
	String agreementYearSelectControlName = "slctagreementyear" + agreementId;
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<form>
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
										int regionId = applicantAddress.getRegion();
										AdminField region = AdminField.getAdminField(regionId);
										AdminFieldTranslation regionTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, region.getId());
										out.print(regionTranslation != null ? regionTranslation.getTranslatedValue() : region.getOptionValue());
									%>
								</td>
								<td>
									<strong><label id="lblzone"><%
						String lblZone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblzone");
						label = Label.getLabelUsingLabelId("lblzone");
		 				out.print(lblZone != null ? lblZone : label.getLabelCaption());
		 			%></label></strong><br/>
									<%
										int zoneId = applicantAddress.getApplicantZone();
										AdminField zone = AdminField.getAdminField(zoneId);
										AdminFieldTranslation zoneTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, zone.getId());
										out.print(zoneTranslation != null ? zoneTranslation.getTranslatedValue() : zone.getOptionValue());
									%>
								</td>
								<td>
									<strong><label id="lblworeda"><%
						String lblWoreda = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblworeda");
						label = Label.getLabelUsingLabelId("lblworeda");
		 				out.print(lblWoreda != null ? lblWoreda : label.getLabelCaption());
		 			%></label></strong><br/>
									<%
										int woredaId = applicantAddress.getWoreda();
										AdminField woreda = AdminField.getAdminField(woredaId);
										AdminFieldTranslation woredaTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, woreda.getId());
										out.print(woredaTranslation != null ? woredaTranslation.getTranslatedValue() : woreda.getOptionValue());
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
										regionId = respondentAddress.getRegionId();
										region = AdminField.getAdminField(regionId);
										regionTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, region.getId());
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
										woredaId = respondentAddress.getWoredaId();
										woreda = AdminField.getAdminField(woredaId);
										woredaTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, woreda.getId());
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
						lblMobile = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblmobile");
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
		 			%></strong></td>
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
										AdminField evidence = AdminField.getAdminField(evidenceTypeId);
										AdminFieldTranslation evidenceTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, evidence.getId());
										out.print(evidenceTranslation != null ? evidenceTranslation.getTranslatedValue() : evidence.getOptionValue());
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
										out.print(meansOfApplicationTranslation != null ? meansOfApplicationTranslation.getTranslatedValue(): meansOfApplication.getOptionValue());
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
				<tr style="background:#eee">
					<td><font color="red">*</font> <strong><label id="lblinvestigatorsuggestion"><%
						String lblInvestigatorSuggestion = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblinvestigatorsuggestion");
						label = Label.getLabelUsingLabelId("lblinvestigatorsuggestion");
		 				out.print(lblInvestigatorSuggestion != null ? lblInvestigatorSuggestion : label.getLabelCaption());
		 			%></label></strong></td>
					<td>
						<textarea class="jqte-test" id="<%=investigatorSuggestionControlName %>" name="<%=investigatorSuggestionControlName %>" style="width:100%"><%=agreement.getInvestigatorSuggestion() %></textarea>
					</td>
				</tr>
				<tr style="background:#eee">
					<td><font color="red">*</font> <strong><label id="lblapplicantposition"><%
						String lblApplicantPosition = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblapplicantposition");
						label = Label.getLabelUsingLabelId("lblapplicantposition");
		 				out.print(lblApplicantPosition != null ? lblApplicantPosition : label.getLabelCaption());
		 			%></label></strong></td>
					<td>
						<textarea class="jqte-test" id="<%=applicantPositionControlName %>" name="<%=applicantPositionControlName %>" style="width:100%"><%=agreement.getApplicantPosition() %></textarea>
					</td>
				</tr>
				<tr style="background:#eee">
					<td><font color="red">*</font> <strong><label id="lblrespondentposition"><%
						String lblRespondentPosition = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrespondentposition");
						label = Label.getLabelUsingLabelId("lblrespondentposition");
		 				out.print(lblRespondentPosition != null ? lblRespondentPosition : label.getLabelCaption());
		 			%></label></strong></td>
					<td>
						<textarea class="jqte-test" id="<%=respondentPositionControlName %>" name="<%=respondentPositionControlName %>" style="width:100%"><%=agreement.getRespondentPosition() %></textarea>
					</td>
				</tr>
				<tr style="background:#eee">
					<td><font color="red">*</font> <strong><label id="lblagreement"><%
						String lblAgreement = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblagreement");
						label = Label.getLabelUsingLabelId("lblagreement");
		 				out.print(lblAgreement != null ? lblAgreement : label.getLabelCaption());
		 			%></label></strong></td>
					<td>
						<textarea class="jqte-test" id="<%=agreementTextControlName %>" name="<%=agreementTextControlName %>" style="width:100%"><%=agreement.getAgreementText() %></textarea>
					</td>
				</tr>
				<tr style="background:#eee">
					<td><font color="red">*</font> <strong><label id="lbldate"><%
						String lblDate = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldate");
						label = Label.getLabelUsingLabelId("lbldate");
		 				out.print(lblDate != null ? lblDate : label.getLabelCaption());
		 			%></label></strong></td>
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
								StringTokenizer tokenD = new StringTokenizer(String.valueOf(agreement.getAgreementDate()),"-");
								String gregStrYear = tokenD.nextToken();
								String gregStrMonth = tokenD.nextToken();
								String gregStrDate = tokenD.nextToken();
								//now convert this to Ethiopic date...
								Day day = DateConverter.toEthiopian(Integer.parseInt(gregStrDate), Integer.parseInt(gregStrMonth), 
										Integer.parseInt(gregStrYear));
								%>
									<table border="0" width="100%">
			        						<tr style="background:#ccc">
			        							<td>ቀን</td>
			        							<td>ወር</td>
			        							<td>ዓመት</td>
			        						</tr>
			        						<tr>
			        							<td>
			        								<select name="<%=agreementDateSelectControlName %>" id="<%=agreementDateSelectControlName %>" style="width:100%">
			        									<option value="" selected="selected">--Select--</option>
			        									<%
			        										for(int i=1;i<=30;i++){
			        											if(i == day.getDate()){
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
			        								<select name="<%=agreementMonthSelectControlName %>" id="<%=agreementMonthSelectControlName %>" style="width:100%">
			        									<option value="" selected="selected">--Select--</option>
			        									<%
			        										List<EthiopicMonth> ethiopicMonthList = EthiopicMonth.getAllEthiopicMonths();
			        										Iterator<EthiopicMonth> ethiopicMonthItr = ethiopicMonthList.iterator();
			        										while(ethiopicMonthItr.hasNext()){
			        											EthiopicMonth ethiopicMonth = ethiopicMonthItr.next();
			        											if(ethiopicMonth.getMonthIndex() == day.getMonth()){
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
			        								<select name="<%=agreementYearSelectControlName %>" id="<%=agreementYearSelectControlName %>" style="width:100%">
			        									<option value="" selected="selected">--Select--</option>
			        									<%
			         									int startYear = year - 5;
			         									for(int i=year;i>=startYear;i--){
			         										Day ethiopicDay = DateConverter.toEthiopian(1, 1, i);
			         										int ethYear = ethiopicDay.getYear();
			         										if(ethYear == day.getYear()){
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
			        								<input type="hidden" name="<%=ethiopicAgreementDateControlName %>" id="<%=ethiopicAgreementDateControlName %>"
			        								value="<%=agreement.getAgreementDate() %>"/>
			        							</td>
			        						</tr>
			        					</table>
								<%
							}else{
						%>
								<input type="text" name="<%=agreementDateControlName %>" id="<%=agreementDateControlName %>"/>
								<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('<%=agreementDateControlName %>');"/>
						<%
							}
						%>						
					</td>
				</tr>
				<tr style="background:#eee">
					<td colspan="2" align="right">
						<%
							String buttonId = "btnupdate" + agreementId;
							
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
		$('.jqte-test').jqte();			
		// settings of status
		var jqteStatus = true;
		$(".status").click(function()
		{
			jqteStatus = jqteStatus ? false : true;
			$('.jqte-test').jqte({"status" : jqteStatus})
		});
		
		var agreementId = "<%=agreementId%>";
		var buttonId = "btnupdate" + agreementId;
		var langId = "<%=langId %>";
		
		//now define the control names...
		var ethiopicAgreementDateControlName = "txtagreementdateethiopic" + agreementId;
		var agreementDateSelectControlName = "slctagreementdate" + agreementId;
		var agreementMonthSelectControlName = "slctagreementmonth" + agreementId;
		var agreementYearSelectControlName = "slctagreementyear" + agreementId;
		
		$('#'+agreementYearSelectControlName).change(function(){
			//ethiopic start date
			var ethiopicRegistrationDate = $('#'+agreementDateSelectControlName).val();
			var ethiopicRegistrationMonth = $('#'+agreementMonthSelectControlName).val();
			var ethiopicRegistrationYear = $('#'+agreementYearSelectControlName).val();
			
			//now do the convertion in here...	
			if(ethiopicRegistrationDate != "" && ethiopicRegistrationMonth != "" && ethiopicRegistrationYear != ""){
				var registrationDateDataString = "dateDataString="+ethiopicRegistrationDate+":"+ethiopicRegistrationMonth+":"+ethiopicRegistrationYear;
								
				$.ajax({
					type:'POST',
					data:registrationDateDataString,
					url: 'convertthisethiopicdatetogregorian.jsp',
					success:function(data){
						$('#'+ethiopicAgreementDateControlName).val(data).trim();
					}
				});				
			}//end if condition...
		});
		
		$('#'+agreementMonthSelectControlName).change(function(){
			//ethiopic start date
			var ethiopicRegistrationDate = $('#'+agreementDateSelectControlName).val();
			var ethiopicRegistrationMonth = $('#'+agreementMonthSelectControlName).val();
			var ethiopicRegistrationYear = $('#'+agreementYearSelectControlName).val();
			
			//now do the convertion in here...	
			if(ethiopicRegistrationDate != "" && ethiopicRegistrationMonth != "" && ethiopicRegistrationYear != ""){
				var registrationDateDataString = "dateDataString="+ethiopicRegistrationDate+":"+ethiopicRegistrationMonth+":"+ethiopicRegistrationYear;
								
				$.ajax({
					type:'POST',
					data:registrationDateDataString,
					url: 'convertthisethiopicdatetogregorian.jsp',
					success:function(data){
						$('#'+ethiopicAgreementDateControlName).val(data).trim();
					}
				});				
			}//end if condition...
		});
		
		$('#'+agreementDateSelectControlName).change(function(){
			//ethiopic start date
			var ethiopicRegistrationDate = $('#'+agreementDateSelectControlName).val();
			var ethiopicRegistrationMonth = $('#'+agreementMonthSelectControlName).val();
			var ethiopicRegistrationYear = $('#'+agreementYearSelectControlName).val();
			
			//now do the convertion in here...	
			if(ethiopicRegistrationDate != "" && ethiopicRegistrationMonth != "" && ethiopicRegistrationYear != ""){
				var registrationDateDataString = "dateDataString="+ethiopicRegistrationDate+":"+ethiopicRegistrationMonth+":"+ethiopicRegistrationYear;
								
				$.ajax({
					type:'POST',
					data:registrationDateDataString,
					url: 'convertthisethiopicdatetogregorian.jsp',
					success:function(data){
						$('#'+ethiopicAgreementDateControlName).val(data).trim();
					}
				});				
			}//end if condition...
		});
		
		$('#'+buttonId).click(function(){
			//now define the control names in here...
			var investigatorSuggestionControlName = "textareainvestigatorsuggestion" + agreementId;
			var applicantPositionControlName = "textaraeapplicantposition" + agreementId;
			var respondentPositionControlName = "textarearespondentposition" + agreementId;
			var agreementTextControlName = "textareaagreement" + agreementId;
			var agreementDateControlName = "txtagreementdate" + agreementId;
			//now get the values using the control names define in just above...			
			var investigatorSuggestion = $('#'+investigatorSuggestionControlName).val();
			var applicantPosition = $('#'+applicantPositionControlName).val();
			var respondentPosition = $('#'+respondentPositionControlName).val();
			var agreementText = $('#'+agreementTextControlName).val();
			var agreementDate = null;
			if(langId == 1){
				agreementDate = $('#'+ethiopicAgreementDateControlName).val().trim();
			}else{
				agreementDate = $('#'+agreementDateControlName).val();
			}			
			
			if(agreementId != "" && investigatorSuggestion != "" && applicantPosition != "" &&
					respondentPosition != "" && agreementText != "" && agreementDate != ""){
				var dataString = "agreementId="+agreementId+"&investigatorSuggestion="+investigatorSuggestion+
				"&applicantPosition="+applicantPosition+"&respondentPosition="+respondentPosition+
				"&agreementText="+agreementText+"&agreementDate="+agreementDate;
				var divId = "agreementDetailDiv" + agreementId;
				//now save this information to the database...
				$.ajax({
				    url: 'updateagreement.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){		    		
				    		$('#'+divId).html(response);					
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