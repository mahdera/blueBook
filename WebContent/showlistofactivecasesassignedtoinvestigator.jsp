<%@page import="java.sql.Date"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	Account account = (Account) session.getAttribute("account");
	int userId = account.getUserId();
	//now get the investigatorId using the InvestigatorUserMap table from the database...
	InvestigatorUserMap investigatorUserMap = InvestigatorUserMap.getInvestigatorUserMapForUser(userId);
	//now get all newly assigned cases for this investigator....
	List<InvestigatorAssignment> investigatorAssignmentList = InvestigatorAssignment.getAllInvestigatorAssignmentsForThisInvestigatorWithCaseStatus(investigatorUserMap.getInvestigatorId(),"Active");
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;		
	
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
								<td>
									<%										
										///now convert the greg date to ethiopic date and show the values in the 
										//drop down controls...
										StringTokenizer tokenD = new StringTokenizer(String.valueOf(investigatorAssignment.getDateAssigned()),"-");
										String gregStrYear = tokenD.nextToken();
										String gregStrMonth = tokenD.nextToken();
										String gregStrDate = tokenD.nextToken();
										//now convert this to Ethiopic date...
										Day day = DateConverter.toEthiopian(Integer.parseInt(gregStrDate), Integer.parseInt(gregStrMonth),Integer.parseInt(gregStrYear));
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
									%>
								</td>
								<td>
									<a href="#.jsp" onclick="previewThisAssignmentActiveCases(<%=investigatorAssignment.getId() %>);">
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
	function previewThisAssignmentActiveCases(investigatorAssignmentId){
		var divId = "previewAssignmentDiv" + investigatorAssignmentId;
		$('#'+divId).load('previewthisassignmentactivecases.jsp?investigatorAssignmentId='+investigatorAssignmentId);
	}
	
	function hide(id){
		var divId = "previewAssignmentDiv" + id;
		$('#'+divId).html('');
	}
</script>