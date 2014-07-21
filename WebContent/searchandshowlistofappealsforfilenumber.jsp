<%@page import="java.sql.Date"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	String fileNumber = request.getParameter("fileNumber");
	List<Appeal> appealList = Appeal.getAllAppealsForFileNumber(fileNumber);
	if(!appealList.isEmpty()){
		Iterator<Appeal> appealItr = appealList.iterator();
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
				<td><label id="lblappealreason"><%
						String lblAppealReason = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblappealreason");
						label = Label.getLabelUsingLabelId("lblappealreason");
						out.print(lblAppealReason != null ? lblAppealReason : label.getLabelCaption());
					%></label></td>
				<td><label id="lblregistrationdate"><%
						String lblRegistrationDate = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblregistrationdate");
						label = Label.getLabelUsingLabelId("lblregistrationdate");
						out.print(lblRegistrationDate != null ? lblRegistrationDate : label.getLabelCaption());
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
				while(appealItr.hasNext()){
					Appeal appeal = appealItr.next();
					%>
						<tr>
							<td><%=ctr++ %></td>
							<td><%=appeal.getAppealReason() %></td>
							<td>
								<%
									if(langId == 1){
											///now convert the greg date to ethiopic date and show the values in the 
											//drop down controls...
											StringTokenizer tokenD = new StringTokenizer(String.valueOf(appeal.getRegistrationDate()),"-");
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
											out.print(appeal.getRegistrationDate());
										}
									%>
							</td>
							<td>
								<%
									User modifiedByUser = User.getUser(appeal.getModifiedBy());
									out.print(modifiedByUser.getFullName());
								%>
							</td>
							<td>
								<%
									if(langId == 1){
											///now convert the greg date to ethiopic date and show the values in the 
											//drop down controls...
											StringTokenizer tokenD = new StringTokenizer(String.valueOf(appeal.getModificationDate()),"-");
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
											out.print(appeal.getModificationDate());
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