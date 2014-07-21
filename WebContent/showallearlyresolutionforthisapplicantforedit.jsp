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
				<td><label id="lbledit"><%
					String lblEdit = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbledit");
					label = Label.getLabelUsingLabelId("lbledit");
	 				out.print(lblEdit != null ? lblEdit : label.getLabelCaption());
	 			%></label></label></td>
			</tr>
			<tr>				
				<td><%=earlyResolution.getOfficerEffort() %></td>
				<td><%=earlyResolution.getRespondentResponse() %></td>
				<td><%=earlyResolution.getApplicantReaction() %></td>
				<td><%=earlyResolution.getResolutionDate() %></td>
				<td><%=earlyResolution.getResult() %></td>
				<td>
					<a href="#.jsp" onclick="showEditFieldsOfThisEarlyResolution(<%=earlyResolution.getId() %>);">
						<label id="lbledit">
							<%
								label = Label.getLabelUsingLabelId("lbledit");
				 				out.print(lblEdit != null ? lblEdit : label.getLabelCaption());
							%>
						</label>
					</a>
					|
					<a href="#.jsp" onclick="hideDiv(<%=earlyResolution.getId() %>);"><label id="lblhide"><%
					String lblHide = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblhide");
					label = Label.getLabelUsingLabelId("lblhide");
	 				out.print(lblHide != null ? lblHide : label.getLabelCaption());
	 			%></label></a>
				</td>
			</tr>
			<%
				String divId = "earlyResolutionEditDiv"+earlyResolution.getId();						
			%>
			<tr>
				<td colspan="6">
					<div id="<%=divId%>"></div>
				</td>
			</tr>	
		</table>
		<%
	}else{
		%>
		<p class="msg warning"><label id="lblnoinformationfound">There is no early resolution information</label></p>
		<%
	}
%>
<script type="text/javascript">
	function showEditFieldsOfThisEarlyResolution(earlyResolutionId){
		var divId = "earlyResolutionEditDiv"+earlyResolutionId;
		$('#'+divId).load('showeditfieldsofthisearlyresolution.jsp?earlyResolutionId='+earlyResolutionId);		
	}
	
	function hideDiv(id){
		var divId = "earlyResolutionEditDiv" + id;
		$('#'+divId).html('');
	}
</script>