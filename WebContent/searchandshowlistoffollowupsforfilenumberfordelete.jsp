<%@page import="java.sql.Date"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	String fileNumber = request.getParameter("fileNumber");
	List<Followup> followupList = Followup.getAllFollowupsForFileNumber(fileNumber.trim());
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	
	if(!followupList.isEmpty()){
		Iterator<Followup> followupItr = followupList.iterator();
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
					<td><label id="lblwhattorecord"><%				
				String lblWhatToRecord = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblwhattorecord");
				label = Label.getLabelUsingLabelId("lblwhattorecord");
				out.print(lblWhatToRecord != null ? lblWhatToRecord : label.getLabelCaption());				
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
					<td><label id="lbldelete"><%				
				String lblDelete = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldelete");
				label = Label.getLabelUsingLabelId("lbldelete");
				out.print(lblDelete != null ? lblDelete : label.getLabelCaption());				
			%></label></td>
				</tr>
				<%
					int ctr=1;
					while(followupItr.hasNext()){
						Followup followup = followupItr.next();
						User modifiedByUser = User.getUser(followup.getModifiedBy());						
						%>
						<tr>
							<td><%=ctr++ %></td>
							<td><%=followup.getFileNumber() %></td>
							<td><%=followup.getWhatToRecord() %></td>
							<td>
								<%
									AdminField adminField = AdminField.getAdminField(followup.getFileStatusId());
									AdminFieldTranslation adminFieldTranslation = AdminFieldTranslation.getAdminFieldTranslationForThisLanguageAndAdminField(langId, adminField.getId());
									if(adminFieldTranslation != null){
										out.print(adminFieldTranslation.getTranslatedValue());
									}else{
										out.print(adminField.getOptionValue());
									}
								%>
							</td>
							<td><%=modifiedByUser.getFullName() %></td>
							<td>
								<%
									if(langId == 1){
										StringTokenizer tokenD = new StringTokenizer(String.valueOf(followup.getModificationDate()),"-");
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
										out.print(followup.getModificationDate());
									}									 
								%>
							</td>
							<td>
								<a href="#.jsp" onclick="deleteThisFollowup(<%=followup.getId() %>);">
									<label id="lbldelete">
										<%											
											label = Label.getLabelUsingLabelId("lbldelete");
											out.print(lblDelete != null ? lblDelete : label.getLabelCaption());				
										%>
									</label>
								</a>								
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
	function deleteThisFollowup(id){
		var langId = "<%=langId %>";
		var displayMsg = "Are you sure you want to delete this followup record?";
		if(langId == 1){
			displayMsg = "ይህን የክትትል መረጃ ለማስወገድ ፈልገዋል። እንግጠኛ ነዎት?";
		}
		if(window.confirm(displayMsg)){
			var fileNumber = "<%=fileNumber%>";
			var dataString = "id="+id;
			$.ajax({
			    url: 'deletefollowup.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){		    		
			    		$('#followupDiv').load('searchandshowlistoffollowupsforfilenumberfordelete.jsp?fileNumber='+fileNumber);					
			    },
			    error:function(error){
					alert(error);
			    }
			 });
		}
	}
	
	function hideDiv(id){
		var divId = "followupDiv" + id;
		$('#'+divId).html('');
	}
</script>
