<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.Date" %>
<%
	long applicantId = Long.parseLong(request.getParameter("applicantId"));
	List<Decision> decisionList = Decision.getAllDecisionsForThisApplicant(applicantId);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	if(!decisionList.isEmpty()){
		Iterator<Decision> decisionItr = decisionList.iterator();
		%>
		<table border="0" width="100%">
			<tr style="background:#eee;font-size:11pt;font-weight:bolder">
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
				<td><label id="lblcase"><%
					String lblCase = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcase");
					label = Label.getLabelUsingLabelId("lblcase");
	 				out.print(lblCase != null ? lblCase : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblrespondent"><%
					String lblRespondent = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrespondent");
					label = Label.getLabelUsingLabelId("lblrespondent");
	 				out.print(lblRespondent != null ? lblRespondent : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lbldecisiongiven"><%
					String lblDecisionGiven = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldecisiongiven");
					label = Label.getLabelUsingLabelId("lbldecisiongiven");
	 				out.print(lblDecisionGiven != null ? lblDecisionGiven : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblnotes"><%
					String lblNotes = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnotes");
					label = Label.getLabelUsingLabelId("lblnotes");
	 				out.print(lblNotes != null ? lblNotes : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblfocus"><%
					String lblFocus = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfocus");
					label = Label.getLabelUsingLabelId("lblfocus");
	 				out.print(lblFocus != null ? lblFocus : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblcasetype"><%
					String lblCaseType = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasetype");
					label = Label.getLabelUsingLabelId("lblcasetype");
	 				out.print(lblCaseType != null ? lblCaseType : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblregistrationdate"><%
					String lblRegistrationDate = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblregistrationdate");
					label = Label.getLabelUsingLabelId("lblregistrationdate");
	 				out.print(lblRegistrationDate != null ? lblRegistrationDate : label.getLabelCaption());
	 			%></label></td>				
				<td><label id="lbledit"><%
					String lblEdit = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbledit");
					label = Label.getLabelUsingLabelId("lbledit");
	 				out.print(lblEdit != null ? lblEdit : label.getLabelCaption());
	 			%></label></td>	
			</tr>
			<%
				int ctr=1;
				while(decisionItr.hasNext()){
					Decision d = decisionItr.next();
					%>
					<tr>
						<td><%=ctr++ %></td>
						<td><%=d.getFileNumber() %></td>
						<td><%=Case.getCase(d.getCaseId()).getCaseIdNumber() %></td>
						<td><%=Respondent.getRespondent(d.getRespondentId()).getName() %></td>
						<td><%=d.getDecisionGiven() %></td>
						<td><%=d.getNotes() %></td>
						<td><%=d.getFocus() %></td>
						<td>
							<%								
								AdminField caseType = AdminField.getAdminField(d.getCaseTypeId());
								if(caseType != null){
									AdminFieldTranslation caseTypeTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, caseType.getId());
									out.print(caseTypeTranslation != null ? caseTypeTranslation.getTranslatedValue() : caseType.getOptionValue());
								}else{
									out.print("---");
								}
							%>
						</td>
						<td>
							<%
								if(langId == 1){
									StringTokenizer token = new StringTokenizer(String.valueOf(d.getRegistrationDate()),"-");
									String gregStrYear = token.nextToken();
									String gregStrMonth = token.nextToken();
									String gregStrDate = token.nextToken();
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
										out.print(ethDate);
									}
								}else{
									out.print(d.getRegistrationDate());
								}
							%>
						</td>
						<td>
							<a href="#.jsp" onclick="showEditFieldsOfThisDecision(<%=d.getId() %>);">
								<label id="lbledit">
									<%
										label = Label.getLabelUsingLabelId("lbledit");
						 				out.print(lblEdit != null ? lblEdit : label.getLabelCaption());
									%>
								</label>								
							</a>
							|
							<a href="#.jsp" onclick="hideDiv(<%=d.getId() %>);">
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
						String divId = "decisionEditDiv"+d.getId();
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
		<p class="msg warning"><label id="lblnoinformationfound">There is not information found</label></p>
		<%
	}
%>
<script type="text/javascript">
	function showEditFieldsOfThisDecision(decisionId){
		var divId = "decisionEditDiv"+decisionId;
		$('#'+divId).load('showeditfieldsofthisdecision.jsp?decisionId='+decisionId);
	}
	
	function hideDiv(id){
		var divId = "decisionEditDiv" + id;
		$('#'+divId).html('');
	}
</script>