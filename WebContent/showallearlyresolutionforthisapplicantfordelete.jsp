<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	String fileNumber = request.getParameter("fileNumber");
	EarlyResolution earlyResolution = EarlyResolution.getAllEarlyResolutionsUsingFileNumber(fileNumber);
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	if(earlyResolution != null){		
		%>
		<table border="0" width="100%">
			<tr style="background:#eee;font-size:12pt;font-weight:bolder">				
				<td><label id="lblofficereffort"><%
					String lblOfficerEffort = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblofficereffort");
					label = Label.getLabelUsingLabelId("lblofficereffort");
	 				out.print(lblOfficerEffort != null ? lblOfficerEffort : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblrespondentresponse"><%
					String lblRespondentResponse = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrespondentresponse");
					label = Label.getLabelUsingLabelId("lblrespondentresponse");
	 				out.print(lblRespondentResponse != null ? lblRespondentResponse : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblapplicantreaction"><%
					String lblApplicantReaction = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblapplicantreaction");
					label = Label.getLabelUsingLabelId("lblapplicantreaction");
	 				out.print(lblApplicantReaction != null ? lblApplicantReaction : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblresolutiondate"><%
					String lblResolutionDate = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblresolutiondate");
					label = Label.getLabelUsingLabelId("lblresolutiondate");
	 				out.print(lblResolutionDate != null ? lblResolutionDate : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblresult"><%
					String lblResult = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblresult");
					label = Label.getLabelUsingLabelId("lblresult");
	 				out.print(lblResult != null ? lblResult : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lbldelete"><%
					String lblDelete = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldelete");
					label = Label.getLabelUsingLabelId("lbldelete");
	 				out.print(lblDelete != null ? lblDelete : label.getLabelCaption());
	 			%></label></td>
			</tr>			
			<tr>				
				<td><%=earlyResolution.getOfficerEffort() %></td>
				<td><%=earlyResolution.getRespondentResponse() %></td>
				<td><%=earlyResolution.getApplicantReaction() %></td>
				<td><%=earlyResolution.getResolutionDate() %></td>
				<td><%=earlyResolution.getResult() %></td>
				<td>
					<a href="#.jsp" onclick="deleteThisEarlyResolution(<%=earlyResolution.getId() %>);"><label id="lbldelete"><%
							label = Label.getLabelUsingLabelId("lbldelete");
	 						out.print(lblDelete != null ? lblDelete : label.getLabelCaption());
					%></label></a>
				</td>
			</tr>					
		</table>
		<%
	}else{
		%>
		<p class="msg warning">There is no early resolution information/የቅድመ ምርመራ መረጃ ለማግኝት አልተቻለም</p>
		<%
	}
%>
<script type="text/javascript">
	function deleteThisEarlyResolution(earlyResolutionId){
		var langId = "<%=langId %>";
		var displayMsg = "Are you sure you want to delete this early resolution record?";
		if(langId == 1){
			displayMsg = "ይህን የአፋጣኝ መፍትሔ መረጃ ለማስወገድ ፈልገዋል። እንግጠኛ ነዎት?";
		}
		if(window.confirm(displayMsg)){
			var dataString = "earlyResolutionId="+earlyResolutionId;
			$.ajax({
			    url: 'deletethisearlyresolution.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){
			    		var divId = "earlyResolutionEditDiv"+earlyResolutionId;
			    		$('#'+divId).html(response);				
			    },
			    error:function(error){
					alert(error);
			    }
			 });
		}
	}
</script>