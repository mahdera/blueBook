<%@page import="java.sql.Date"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	String fileNumber = request.getParameter("fileNumber");
	List<Investigation> investigationList = Investigation.getAllInvestigationsForFileNumber(fileNumber);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	
	if(!investigationList.isEmpty()){
		Iterator<Investigation> investigationItr = investigationList.iterator();
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
					<td><label id="lblwhattoregister"><%				
				String lblWhatToRegister = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblwhattoregister");
				label = Label.getLabelUsingLabelId("lblwhattoregister");
				out.print(lblWhatToRegister != null ? lblWhatToRegister : label.getLabelCaption());				
			%></label></td>
					<td><label id="lblfilestatus"><%				
				String lblFileStatus = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfilestatus");
				label = Label.getLabelUsingLabelId("lblfilestatus");
				out.print(lblFileStatus != null ? lblFileStatus : label.getLabelCaption());				
			%></label></td>
					<td><label id="lblmodifiedby"><%				
				String lblModifiedBy = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblmodifiedby");
				label = Label.getLabelUsingLabelId("lblmodifiedby");
				out.print(lblModifiedBy != null ? lblModifiedBy : label.getLabelCaption());				
			%></label></td>
					<td><label id="lblmodificationdate"><%				
				String lblModificationDate = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblmodificationdate");
				label = Label.getLabelUsingLabelId("lblmodificationdate");
				out.print(lblModificationDate != null ? lblModificationDate : label.getLabelCaption());				
			%></label></td>
					<td><label id="lbledit"><%				
				String lblEdit = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbledit");
				label = Label.getLabelUsingLabelId("lbledit");
				out.print(lblEdit != null ? lblEdit : label.getLabelCaption());				
			%></label></td>
				</tr>
				<%
					int ctr=1;
					while(investigationItr.hasNext()){
						Investigation investigation = investigationItr.next();
						User modifiedByUser = User.getUser(investigation.getModifiedBy());						
						%>
						<tr>
							<td><%=ctr++ %></td>
							<td><%=investigation.getFileNumber() %></td>
							<td><%=investigation.getWhatToRegister() %></td>
							<td><%
									AdminField adminField = AdminField.getAdminField(investigation.getCaseStatusId());
									AdminFieldTranslation adminFieldTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, adminField.getId());
									if(adminFieldTranslation != null){
										out.print(adminFieldTranslation.getTranslatedValue());
									}else{
										out.print(adminField.getOptionValue());
									}
								%></td>
							<td><%=modifiedByUser.getFullName() %></td>
							<td>
								<%		
										if(langId == 1){
											///now convert the greg date to ethiopic date and show the values in the						
											StringTokenizer tokenD = new StringTokenizer(String.valueOf(investigation.getModificationDate()),"-");
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
											out.print(investigation.getModificationDate());
										}
									%>
							</td>
							<td>
								<a href="#.jsp" onclick="showEditFieldsOfThisInvestigation(<%=investigation.getId() %>);">
									<label id="lbledit">
										<%											
											label = Label.getLabelUsingLabelId("lbledit");
											out.print(lblEdit != null ? lblEdit : label.getLabelCaption());				
										%>
									</label>
								</a>
								|
								<a href="#.jsp" onclick="hideDiv(<%=investigation.getId() %>);">
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
							String divId = "investigationDiv" + investigation.getId();
						%>
						<tr>
							<td colspan="7">
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
	function showEditFieldsOfThisInvestigation(id){
		var divId = "investigationDiv" + id;
		$('#'+divId).load('showeditfieldsofthisinvestigation.jsp?id='+id);
	}
	
	function hideDiv(id){
		var divId = "investigationDiv" + id;
		$('#'+divId).html('');
	}
</script>
