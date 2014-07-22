<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<form>
	<table border="0" width="100%" style="background:#eee">
		<tr>
			<td>				
				<label id="lblselectreporttype">
					<%
						String lblSelectReportType = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblselectreporttype");
						label = Label.getLabelUsingLabelId("lblselectreporttype");
		 				out.print(lblSelectReportType != null ? lblSelectReportType : label.getLabelCaption());
		 			%>
				</label>
			</td>
			<td>
				<select name="slctreporttype" id="slctreporttype" style="width:100%">
					<option value="" selected="selected">
							<label id="lblselected">
								<%
									String lblSelected = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblselected");
									label = Label.getLabelUsingLabelId("lblselected");
					 				out.print(lblSelected != null ? lblSelected : label.getLabelCaption());
					 			%>
							</label>
					</option>
					<option value="acceptedandnotacceptedappealsummaryreport.jsp">
						<label id="lblacceptedandnotacceptedappealsummaryreport">
							<%
								String lblAcceptedAndNotAcceptedAppealSummaryReport = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblacceptedandnotacceptedappealsummaryreport");
								label = Label.getLabelUsingLabelId("lblacceptedandnotacceptedappealsummaryreport");
				 				out.print(lblAcceptedAndNotAcceptedAppealSummaryReport != null ? lblAcceptedAndNotAcceptedAppealSummaryReport : label.getLabelCaption());
				 			%>
						</label>
					</option>
					<option value="appealtypesummaryreport.jsp">
						<label id="lblappealtypesummaryreport">
							<%
								String lblAppealTypeSummaryReport = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblappealtypesummaryreport");
								label = Label.getLabelUsingLabelId("lblappealtypesummaryreport");
				 				out.print(lblAppealTypeSummaryReport != null ? lblAppealTypeSummaryReport : label.getLabelCaption());
				 			%>
						</label>
					</option>
					<option value="performedactivitiessummaryreport.jsp">
						<label id="lblperformedactivitiessummaryreport">
							<%
								String lblPerformedActivitiesSummaryReport = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblperformedactivitiessummaryreport");
								label = Label.getLabelUsingLabelId("lblperformedactivitiessummaryreport");
				 				out.print(lblPerformedActivitiesSummaryReport != null ? lblPerformedActivitiesSummaryReport : label.getLabelCaption());
				 			%>
						</label>
					</option>
					<option value="casesassignedtoinvestigationsummaryreport.jsp">
						<label id="lblcasesassignedtoinvestigationsummaryreport">
							<%
								String lblCasesAssignedToInvestigationSummaryReport = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasesassignedtoinvestigationsummaryreport");
								label = Label.getLabelUsingLabelId("lblcasesassignedtoinvestigationsummaryreport");
				 				out.print(lblCasesAssignedToInvestigationSummaryReport != null ? lblCasesAssignedToInvestigationSummaryReport : label.getLabelCaption());
				 			%>
						</label>
					</option>
					<option value="casessolvedbyagreementsummaryreport.jsp">
						<label id="lblcasessolvedbyagreementsummaryreport">
							<%
								String lblCasesSolvedByAgreementSummaryReport = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasessolvedbyagreementsummaryreport");
								label = Label.getLabelUsingLabelId("lblcasessolvedbyagreementsummaryreport");
				 				out.print(lblCasesSolvedByAgreementSummaryReport != null ? lblCasesSolvedByAgreementSummaryReport : label.getLabelCaption());
				 			%>
						</label>
					</option>
					<option value="followupsummaryreport.jsp">
						<label id="lblfollowupsummaryreport">
							<%
								String lblFollowupSummaryReport = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfollowupsummaryreport");
								label = Label.getLabelUsingLabelId("lblfollowupsummaryreport");
				 				out.print(lblFollowupSummaryReport != null ? lblFollowupSummaryReport : label.getLabelCaption());
				 			%>
						</label>
					</option>
					<option value="intakeprocesssummaryreport.jsp">
						<label id="lblintakeprocesssummaryreport">
							<%
								String lblIntakeProcessSummaryReport = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblintakeprocesssummaryreport");
								label = Label.getLabelUsingLabelId("lblintakeprocesssummaryreport");
				 				out.print(lblIntakeProcessSummaryReport != null ? lblIntakeProcessSummaryReport : label.getLabelCaption());
				 			%>
						</label>
					</option>
					<option value="pendingcasestransferedtonextmonthsummaryreport.jsp">
						<label id="lblpendingcasestransferedtonextmonthssummaryreport">
							<%
								String lblPendingCasesTransferredToNextMonthSummaryReport = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblpendingcasestransferedtonextmonthssummaryreport");
								label = Label.getLabelUsingLabelId("lblpendingcasestransferedtonextmonthssummaryreport");
				 				out.print(lblPendingCasesTransferredToNextMonthSummaryReport != null ? lblPendingCasesTransferredToNextMonthSummaryReport : label.getLabelCaption());
				 			%>
						</label>
					</option>					
					<option value="rejectedduetonoadministrationalabusesummaryreport.jsp">
						<label id="lblrejectedduetonoadministrationalabusesummaryreport">
							<%
								String lblRejectedDueToNoAdministrationalAbuseSummaryReport = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrejectedduetonoadministrationalabusesummaryreport");
								label = Label.getLabelUsingLabelId("lblrejectedduetonoadministrationalabusesummaryreport");
				 				out.print(lblRejectedDueToNoAdministrationalAbuseSummaryReport != null ? lblRejectedDueToNoAdministrationalAbuseSummaryReport : label.getLabelCaption());
				 			%>
						</label>
					</option>
					<option value="soughtresolutionsummaryreport.jsp">
						<label id="lblsoughtresolutionsummaryreport">
							<%
								String lblSoughtResolutionSummaryReport = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblsoughtresolutionsummaryreport");
								label = Label.getLabelUsingLabelId("lblsoughtresolutionsummaryreport");
				 				out.print(lblSoughtResolutionSummaryReport != null ? lblSoughtResolutionSummaryReport : label.getLabelCaption());
				 			%>
						</label>
					</option>									
				</select>
			</td>
			<td>
				<%
					//String lblShowButtonLabel = "lblshowbutton";
					String showButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblshowbutton");
					label = Label.getLabelUsingLabelId("lblshowbutton");
					String showButtonCaption = showButtonLabel != null ? showButtonLabel : label.getLabelCaption();
					//////
					String lblResetButtonLabel = "lblresetbutton";
					String resetButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId, "lblresetbutton");
					label = Label.getLabelUsingLabelId("lblresetbutton");
					String resetButtonCaption = resetButtonLabel != null ? resetButtonLabel : label.getLabelCaption();
				%>
				<input type="button" value="<%=showButtonCaption%>"  class="input-submit" id="showReportButton"/>
				<input type="reset" value="<%=resetButtonCaption%>" class="input-submit"/>
			</td>
		</tr>
	</table>
</form>
<div id="reportDetailDiv"></div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#showReportButton').click(function(){
			var reportUrl = $('#slctreporttype').val();
			if(reportUrl != ""){
				$('#reportDetailDiv').load(reportUrl);
			}
		});//end button.click function
	});//end document.ready function
</script>