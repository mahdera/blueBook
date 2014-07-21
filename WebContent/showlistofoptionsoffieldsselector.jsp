<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<form>
	<table border="0" width="100%">
		<tr>
			<td><label id="lblselectfieldname">
				<%
					String lblSelectFieldName = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblselectfieldname");
					label = Label.getLabelUsingLabelId("lblselectfieldname");
					out.print(lblSelectFieldName != null ? lblSelectFieldName : label.getLabelCaption());
				%>
			</label></td>
			<td>
				<select name="slcteditfieldname" id="slcteditfieldname" style="width:100%">
					<option value=""><label id="lblselect">
						<%
							String lblSelect = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblselect");
							label = Label.getLabelUsingLabelId("lblselect");
							out.print(lblSelect != null ? lblSelect : label.getLabelCaption());
						%>
					</label></option>
					<option value="Appeal Decision"><label id="lblappealdecision">
						<%
							String lblAppealDecision = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblappealdecision");
							label = Label.getLabelUsingLabelId("lblappealdecision");
							out.print(lblAppealDecision != null ? lblAppealDecision : label.getLabelCaption());
						%>
						</label></option>
					<option value="Applied By"><label id="lblappliedby">
						<%
							String lblAppliedBy = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblappliedby");
							label = Label.getLabelUsingLabelId("lblappliedby");
							out.print(lblAppliedBy != null ? lblAppliedBy : label.getLabelCaption());
						%>
						</label></option>
					<option value="Case Status"><label id="lblcasestatus">
						<%
							String lblCaseStatus = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasestatus");
							label = Label.getLabelUsingLabelId("lblcasestatus");
							out.print(lblCaseStatus != null ? lblCaseStatus : label.getLabelCaption());
						%>
						</label></option>
					<option value="Case Type"><label id="lblcasetype">
						<%
							String lblCaseType = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasetype");
							label = Label.getLabelUsingLabelId("lblfieldname");
							out.print(lblCaseType != null ? lblCaseType : label.getLabelCaption());
						%>
						</label></option>
					<option value="Decision Given"><label id="lbldecisiongiven">
						<%
							String lblDecisionGiven = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldecisiongiven");
							label = Label.getLabelUsingLabelId("lbldecisiongiven");
							out.print(lblDecisionGiven != null ? lblDecisionGiven : label.getLabelCaption());
						%>
						</label></option>
					<option value="Evidence Type"><label id="lblevidencetype">
						<%
							String lblEvidenceType = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblevidencetype");
							label = Label.getLabelUsingLabelId("lblevidencetype");
							out.print(lblEvidenceType != null ? lblEvidenceType : label.getLabelCaption());
						%>
						</label></option>					
					<option value="Investigator Level"><label id="lblinvestigatorlevel">
						<%
							String lblInvestigatorLevel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblinvestigatorlevel");
							label = Label.getLabelUsingLabelId("lblinvestigatorlevel");
							out.print(lblInvestigatorLevel != null ? lblInvestigatorLevel : label.getLabelCaption());
						%>
						</label></option>
					<option value="Linkage"><label id="lbllinkage">
						<%
							String lblLinkage = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbllinkage");
							label = Label.getLabelUsingLabelId("lbllinkage");
							out.print(lblLinkage != null ? lblLinkage : label.getLabelCaption());
						%>
						</label></option>
					<option value="Means of Application"><label id="lblmeansofapplication">
						<%
							String lblMeansOfApplication = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblmeansofapplication");
							label = Label.getLabelUsingLabelId("lblmeansofapplication");
							out.print(lblMeansOfApplication != null ? lblMeansOfApplication : label.getLabelCaption());
						%>
						</label></option>
					<option value="Region"><label id="lblregion">
						<%
							String lblRegion = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblregion");
							label = Label.getLabelUsingLabelId("lblregion");
							out.print(lblRegion != null ? lblRegion : label.getLabelCaption());
						%>
						</label></option>
					<option value="Registration Theme"><label id="lblregistrationtheme">
						<%
							String lblRegistrationTheme = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblregistrationtheme");
							label = Label.getLabelUsingLabelId("lblregistrationtheme");
							out.print(lblRegistrationTheme != null ? lblRegistrationTheme : label.getLabelCaption());
						%>
						</label></option>
					<option value="Respondent"><label id="lblrespondent">
						<%
							String lblRespondent = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrespondent");
							label = Label.getLabelUsingLabelId("lblrespondent");
							out.print(lblRespondent != null ? lblRespondent : label.getLabelCaption());
						%>
						</label></option>
					<option value="Result"><label id="lblresult">
						<%
							String lblResult = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblresult");
							label = Label.getLabelUsingLabelId("lblresult");
							out.print(lblResult != null ? lblResult : label.getLabelCaption());
						%>
						</label></option>
					<option value="Rejection Reason"><label id="lblrejectionreason">
						<%
							String lblRejectionReason = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrejectionreason");
							label = Label.getLabelUsingLabelId("lblrejectionreason");
							out.print(lblRejectionReason != null ? lblRejectionReason : label.getLabelCaption());
						%>
						</label></option>
					<option value="Termination Reason"><label id="lblterminationreason">
						<%
							String lblTerminationReason = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblterminationreason");
							label = Label.getLabelUsingLabelId("lblterminationreason");
							out.print(lblTerminationReason != null ? lblTerminationReason : label.getLabelCaption());
						%>
						</label></option>
					<option value="User Type"><label id="lblusertype">
						<%
							String lblUserType = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblusertype");
							label = Label.getLabelUsingLabelId("lblusertype");
							out.print(lblUserType != null ? lblUserType : label.getLabelCaption());
						%>
						</label></option>
					<option value="Woreda"><label id="lblworeda">
						<%
							String lblWoreda = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblworeda");
							label = Label.getLabelUsingLabelId("lblworeda");
							out.print(lblWoreda != null ? lblWoreda : label.getLabelCaption());
						%>
						</label></option>
					<option value="Zone"><label id="lblzone">
						<%
							String lblZone = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblzone");
							label = Label.getLabelUsingLabelId("lblzone");
							out.print(lblZone != null ? lblZone : label.getLabelCaption());
						%>
						</label></option>
				</select>
			</td>
			<td>
				<%
					String lblShowButtonLabel = "lblshowbutton";
					String showButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblshowbutton");
					label = Label.getLabelUsingLabelId("lblshowbutton");
					String showButtonCaption = showButtonLabel != null ? showButtonLabel : label.getLabelCaption();
					//////
					String lblResetButtonLabel = "lblresetbutton";
					String resetButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId, "lblresetbutton");
					label = Label.getLabelUsingLabelId("lblresetbutton");
					String resetButtonCaption = resetButtonLabel != null ? resetButtonLabel : label.getLabelCaption();
				%>
				<input type="button" value="<%=showButtonCaption %>" class="input-submit" id="btnshow"/>
				<input type="reset" value="<%=resetButtonCaption %>" class="input-submit"/>
			</td>
		</tr>
	</table>
</form>
<div id="fieldDetailDiv"></div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btnshow').click(function(){
			var fieldName = $('#slcteditfieldname').val();
			fieldName = encodeURIComponent(fieldName);
			if(fieldName != ""){
				$('#fieldDetailDiv').load('showalltheoptionvaluesofthisfieldname.jsp?fieldName='+fieldName);
			}
		});
	});//end document.ready function
</script>