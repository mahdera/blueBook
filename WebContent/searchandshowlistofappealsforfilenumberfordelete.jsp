<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	String fileNumber = request.getParameter("fileNumber");
	List<Appeal> appealList = Appeal.getAllAppealsForFileNumber(fileNumber);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	
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
				<td>
					<label id="lbldelete">
						<%
						String lblDelete = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldelete");
						label = Label.getLabelUsingLabelId("lbldelete");
						out.print(lblDelete != null ? lblDelete : label.getLabelCaption());
					%>	
					</label>
				</td>
			</tr>
			<%
				int ctr=1;
				while(appealItr.hasNext()){
					Appeal appeal = appealItr.next();
					%>
						<tr>
							<td><%=ctr++ %></td>
							<td><%=appeal.getAppealReason() %></td>
							<td><%=appeal.getRegistrationDate() %></td>
							<td><%=appeal.getModifiedBy() %></td>
							<td><%=appeal.getModificationDate() %></td>	
							<td>
								<a href="#.jsp" onclick="deleteThisAppeal(<%=appeal.getId() %>);">
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
	function deleteThisAppeal(appealId){
		var langId = "<%=langId %>";
		var displayMsg = "Are you sure you want to delete this appeal record?";
		if(langId == 1){
			displayMsg = "ይህን የአቤቱታ መረጃ ለማስወገድ ፈልገዋል። እንግጠኛ ነዎት?";
		}
		
		if(window.confirm(displayMsg)){
			var dataString = "appealId="+appealId;
			$.ajax({
			    url: 'deleteappeal.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){		    		
			    		$('#subTabDetailDiv').html(response);					
			    },
			    error:function(error){
					alert(error);
			    }
			 });
		}
	}
</script>