<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	Account account = (Account) session.getAttribute("account");
	int userId = account.getUserId();
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	//now get the investigatorId using the InvestigatorUserMap table from the database...
	InvestigatorUserMap investigatorUserMap = InvestigatorUserMap.getInvestigatorUserMapForUser(userId);
	//now get all newly assigned cases for this investigator....
	List<InvestigatorAssignment> investigatorAssignmentList = InvestigatorAssignment.getAllInvestigatorAssignmentsForThisInvestigatorWithCaseStatus(investigatorUserMap.getInvestigatorId(),"New");
	
	if(!investigatorAssignmentList.isEmpty()){
		Iterator<InvestigatorAssignment> investigatorAssignmentItr = investigatorAssignmentList.iterator();
		%>
			<table border="0" width="100%">
				<tr style="background:#eee;font-weight:bolder;">
					<td><label id="lblserialnumber"><%
					String lblSerialNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblserialnumber");
					label = Label.getLabelUsingLabelId("lblserialnumber");
	 				out.print(lblSerialNumber != null ? lblSerialNumber : label.getLabelCaption());
	 			%></label></td>
					<td><label id="lblfilenumber"><%
					String lblFileNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfilenumber");
					label = Label.getLabelUsingLabelId("lblfilenumber");
	 				out.print(lblFileNumber != null ? lblFileNumber : label.getLabelCaption());
	 			%></label></td>
					<td><label id="lblfilesource"><%
					String lblFileSource = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfilesource");
					label = Label.getLabelUsingLabelId("lblfilesource");
	 				out.print(lblFileSource != null ? lblFileSource : label.getLabelCaption());
	 			%></label></td>
					<td><label id="lblcasestatus"><%
					String lblCaseStatus = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasestatus");
					label = Label.getLabelUsingLabelId("lblcasestatus");
	 				out.print(lblCaseStatus != null ? lblCaseStatus : label.getLabelCaption());
	 			%></label></td>
					<td><label id="lbldateassigned"><%
					String lblDateAssigned = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldateassigned");
					label = Label.getLabelUsingLabelId("lbldateassigned");
	 				out.print(lblDateAssigned != null ? lblDateAssigned : label.getLabelCaption());
	 			%></label></td>
					<td><label id="lblpreview"><%
					String lblPreview = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblpreview");
					label = Label.getLabelUsingLabelId("lblpreview");
	 				out.print(lblPreview != null ? lblPreview : label.getLabelCaption());
	 			%></label></td>
				</tr>
				<%
					int ctr=1;
					while(investigatorAssignmentItr.hasNext()){
						InvestigatorAssignment investigatorAssignment = investigatorAssignmentItr.next();
						%>
							<tr>
								<td><%=ctr++ %></td>
								<td><%=investigatorAssignment.getFileNumber() %></td>
								<td><%=investigatorAssignment.getFileSource() %></td>
								<td><%=investigatorAssignment.getCaseStatus() %></td>
								<td><%=investigatorAssignment.getDateAssigned() %></td>
								<td>
									<a href="#.jsp" onclick="previewThisAssignment(<%=investigatorAssignment.getId() %>);">
										<label id="lblpreviewthisassignment">
											<%
												String lblPreviewThisAssignment = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblpreviewthisassignment");
												label = Label.getLabelUsingLabelId("lblpreviewthisassignment");
								 				out.print(lblPreviewThisAssignment != null ? lblPreviewThisAssignment : label.getLabelCaption());
											%>
										</label>										
									</a>
									|
									<a href="#.jsp" onclick="hide(<%=investigatorAssignment.getId() %>);">
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
								String divId = "previewAssignmentDiv" + investigatorAssignment.getId();
							%>
							<tr>
								<td colspan="6">
									<div id="<%=divId%>"></div>
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
	function previewThisAssignment(investigatorAssignmentId){
		var divId = "previewAssignmentDiv" + investigatorAssignmentId;
		$('#'+divId).load('previewthisassignment.jsp?investigatorAssignmentId='+investigatorAssignmentId);
	}
	
	function hide(id){
		var divId = "previewAssignmentDiv" + id;
		$('#'+divId).html('');
	}
</script>