<%@page import="java.sql.Date"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	String fileNumber = request.getParameter("fileNumber");
	List<AppealDecision> appealDecisionList = AppealDecision.getAllAppealDecisionsForFileNumber(fileNumber);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	
	if(!appealDecisionList.isEmpty()){
		Iterator<AppealDecision> appealDecisionItr = appealDecisionList.iterator();
		%>
		<table border="0" width="100%">
			<tr style="background:#eee;font-weight:bolder;">
				<td><label id="lblserialnumber">
					<%
						String lblSerialNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblserialnumber");
						label = Label.getLabelUsingLabelId("lblserialnumber");
						out.print(lblSerialNumber != null ? lblSerialNumber : label.getLabelCaption());
					%>
				</label></td>				
				<td><label id="lblappealdecision"><%
						String lblAppealDecision = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblappealdecision");
						label = Label.getLabelUsingLabelId("lblappealdecision");
						out.print(lblAppealDecision != null ? lblAppealDecision : label.getLabelCaption());
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
			</tr>
			<%
				int ctr=1;
				while(appealDecisionItr.hasNext()){
					AppealDecision appealDecision = appealDecisionItr.next();
					%>
						<tr>
							<td><%=ctr++ %></td>
							<td>
								<%
									int appealDecisionId = appealDecision.getAppealDecisionId();
									AdminField adminField = AdminField.getAdminField(appealDecisionId);
									out.print(adminField.getOptionValue());
								%>
							</td>
							<td>
								<%
									User modifiedByUser = User.getUser(appealDecision.getModifiedBy());
									out.print(modifiedByUser.getFullName());
								%>
							</td>							
							<td>
								<%
									if(langId == 1){
											///now convert the greg date to ethiopic date and show the values in the 
											//drop down controls...
											StringTokenizer tokenD = new StringTokenizer(String.valueOf(appealDecision.getModificationDate()),"-");
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
											out.print(appealDecision.getModificationDate());
										}
									%>
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