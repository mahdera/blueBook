<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%
	int investigatorId = Integer.parseInt(request.getParameter("investigatorId"));
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;

	List<InvestigatorAssignment> investigatorAssignmentList = InvestigatorAssignment.getAllInvestigatorAssignmentsForThisInvestigator(investigatorId);
	
	if(!investigatorAssignmentList.isEmpty()){
		Iterator<InvestigatorAssignment> investigatorAssignmentItr = investigatorAssignmentList.iterator();		
		%>
		<table border="0" width="100%">
			<tr style="font-weight:bolder;font-size:11pt;background:#eee">
				<td><label id="lblserialnumber"><%
					String lblSerialNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblserialnumber");
					label = Label.getLabelUsingLabelId("lblserialnumber");
	 				out.print(lblSerialNumber != null ? lblSerialNumber : label.getLabelCaption());
	 			%></label></label></td>
				<td><label id="lblfilenumber"><%
					String lblFileNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfilenumber");
					label = Label.getLabelUsingLabelId("lblfilenumber");
	 				out.print(lblFileNumber != null ? lblFileNumber : label.getLabelCaption());
	 			%></label></label></td>
				<td><label id="lblapplicant"><%
					String lblApplicant = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblapplicant");
					label = Label.getLabelUsingLabelId("lblapplicant");
	 				out.print(lblApplicant != null ? lblApplicant : label.getLabelCaption());
	 			%></label></label></td>
				<td><label id="lblcase"><%
					String lblCase = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcase");
					label = Label.getLabelUsingLabelId("lblcase");
	 				out.print(lblCase != null ? lblCase : label.getLabelCaption());
	 			%></label></label></td>
				<td><label id="lblrespondent"><%
					String lblRespondent = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrespondent");
					label = Label.getLabelUsingLabelId("lblrespondent");
	 				out.print(lblRespondent != null ? lblRespondent : label.getLabelCaption());
	 			%></label></label></td>
				<td><label id="lblinvestigatorlevel"><%
					String lblInvestigatorLevel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblinvestigatorlevel");
					label = Label.getLabelUsingLabelId("lblinvestigatorlevel");
	 				out.print(lblInvestigatorLevel != null ? lblInvestigatorLevel : label.getLabelCaption());
	 			%></label></label></td>
				<td><label id="lblcasestatus"><%
					String lblCaseStatus = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasestatus");
					label = Label.getLabelUsingLabelId("lblcasestatus");
	 				out.print(lblCaseStatus != null ? lblCaseStatus : label.getLabelCaption());
	 			%></label></label></td>
				<td><label id="lbldateassigned"><%
					String lblDateAssigned = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldateassigned");
					label = Label.getLabelUsingLabelId("lbldateassigned");
	 				out.print(lblDateAssigned != null ? lblDateAssigned : label.getLabelCaption());
	 			%></label></label></td>
				<td><label id="lbldateopened"><%
					String lblDateOpened = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldateopened");
					label = Label.getLabelUsingLabelId("lbldateopened");
	 				out.print(lblDateOpened != null ? lblDateOpened : label.getLabelCaption());
	 			%></label></label></td>
				<td><%
					String lblEdit = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbledit");
					label = Label.getLabelUsingLabelId("lbledit");
	 				out.print(lblEdit != null ? lblEdit : label.getLabelCaption());
	 			%></td>
			</tr>
				<%
					int ctr=1;
					while(investigatorAssignmentItr.hasNext()){
						InvestigatorAssignment ass = investigatorAssignmentItr.next();
						Investigator investigator = Investigator.getInvestigator(ass.getInvestigatorId());
						Decision decision = Decision.fetchDecisionUsingFileNumber(ass.getFileNumber());
						Applicant applicant = Applicant.getApplicant(decision.getApplicantId());
						Case c = Case.getCase(decision.getCaseId());
						Respondent r = Respondent.getRespondent(decision.getRespondentId());
						%>
						<tr>
							<td><%=ctr++ %></td>
							<td><%=ass.getFileNumber() %></td>
							<td><%=applicant.getFullName()+" : "+applicant.getApplicantIdNumber() %></td>
							<td><%=c.getCaseIdNumber() %></td>
							<td><%=r.getName() %></td>
							<td><%=investigator.getLevel() %></td>
							<td><%=ass.getCaseStatus() %></td>
							<td><%=ass.getDateAssigned() %></td>
							<td><%=(ass.getOpenDate() != null ? ass.getOpenDate() : "Not Opened Yet") %></td>
							<td>
								<a href="#.jsp" onclick="showEditFieldsOfThisInvestigatorAssignment(<%=ass.getId() %>);">
									<label id="lbledit">
										<%
											label = Label.getLabelUsingLabelId("lbledit");
							 				out.print(lblEdit != null ? lblEdit : label.getLabelCaption());
										%>
									</label>
								</a>
								|
								<a href="#.jsp" onclick="hideDiv(<%=ass.getId() %>);">
									<label id="lblhide">
										<%
											String lblHide = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblhide");
											label = Label.getLabelUsingLabelId("lblhide");
							 				out.print(lblHide != null ? lblHide : label.getLabelCaption());
										%>
									</label>
								</a>
							</td>
						</tr>
						<%
							String divId = "investigatorAssignmentEditDiv" + ass.getId();
						%>
						<tr>
							<td colspan="10">
								<div id="<%=divId %>"></div>
							</td>
						</tr>
						<%
					}//end while loop
				%>
		</table>
		<%
	}else{
		%>
			<p class="msg warning">
				<label id="lblnoinformationfound">
					<%
						String lblNoInformationFound = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnoinformationfound");
						label = Label.getLabelUsingLabelId("lblnoinformationfound");
		 				out.print(lblNoInformationFound != null ? lblNoInformationFound : label.getLabelCaption());
					%>
				</label>
			</p>
		<%
	}
%>
<script type="text/javascript">
	function showEditFieldsOfThisInvestigatorAssignment(investigatorAssignmentId){
		var divId = "investigatorAssignmentEditDiv" + investigatorAssignmentId;
		$('#'+divId).load('showeditfieldsofthisinvestigatorassignment.jsp?investigatorAssignmentId='+investigatorAssignmentId);
	}
	
	function hideDiv(id){
		var divId = "investigatorAssignmentEditDiv" + id;
		$('#'+divId).html('');
	}
</script>