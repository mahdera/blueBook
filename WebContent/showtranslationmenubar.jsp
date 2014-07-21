<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<table border="0" width="100%">
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
	<tr style="background:#ccc;font-weight:bolder">
		<td><a href="#.jsp" id="addLabelLinkId" style="text-decoration:none"><label id="lbladdlabel"><%
					String lblAddLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbladdlabel");
					label = Label.getLabelUsingLabelId("lbladdlabel");
					out.print(lblAddLabel != null ? lblAddLabel : label.getLabelCaption());
				%></label></a></td>
		<td><a href="#.jsp" id="viewLabelsLinkId" style="text-decoration:none"><label id="lblviewlabels"><%
					String lblViewLabels = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblviewlabels");
					label = Label.getLabelUsingLabelId("lblviewlabels");
					out.print(lblViewLabels != null ? lblViewLabels : label.getLabelCaption());
				%></label></a></td>
		<td><a href="#.jsp" id="editLabelLinkId" style="text-decoration:none"><label id="lbleditlabel"><%
					String lblEditLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbleditlabel");
					label = Label.getLabelUsingLabelId("lbleditlabel");
					out.print(lblEditLabel != null ? lblEditLabel : label.getLabelCaption());
				%></label></a></td>
		<td><a href="#.jsp" id="deleteLabelLinkId" style="text-decoration:none"><label id="lbldeletelabel"><%
					String lblDeleteLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldeletelabel");
					label = Label.getLabelUsingLabelId("lbldeletelabel");
					out.print(lblDeleteLabel != null ? lblDeleteLabel : label.getLabelCaption());
				%></label></a></td>
		<td><a href="#.jsp" id="addTranslationLinkId" style="text-decoration:none"><label id="lbladdtranslation"><%
					String lblAddTranslation = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbladdtranslation");
					label = Label.getLabelUsingLabelId("lbladdtranslation");
					out.print(lblAddTranslation != null ? lblAddTranslation : label.getLabelCaption());
				%></label></a></td>
		<td><a href="#.jsp" id="viewTranslationsLinkId" style="text-decoration:none"><label id="lblviewtranslation"><%
					String lblViewTranslation = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblviewtranslation");
					label = Label.getLabelUsingLabelId("lblviewtranslation");
					out.print(lblViewTranslation != null ? lblViewTranslation : label.getLabelCaption());
				%></label></a></td>
		<td><a href="#.jsp" id="editTranslationLinkId" style="text-decoration:none"><label id="lbledittranslation"><%
					String lblEditTranslation = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbledittranslation");
					label = Label.getLabelUsingLabelId("lbledittranslation");
					out.print(lblEditTranslation != null ? lblEditTranslation : label.getLabelCaption());
				%></label></a></td>
		<td><a href="#.jsp" id="deleteTranslationLinkId" style="text-decoration:none"><label id="lbldeletetranslation"><%
					String lblDeleteTranslation = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldeletetranslation");
					label = Label.getLabelUsingLabelId("lbldeletetranslation");
					out.print(lblDeleteTranslation != null ? lblDeleteTranslation : label.getLabelCaption());
				%></label></a></td>
	</tr>
</table>
<div id="translationDiv"></div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#addLabelLinkId').click(function(){
			$('#translationDiv').load("showaddlabelform.jsp");
		});
		
		$('#viewLabelsLinkId').click(function(){
			$('#translationDiv').load("showlistoflabels.jsp");
		});
		
		$('#editLabelLinkId').click(function(){
			$('#translationDiv').load("showlistoflabelsforedit.jsp");
		});
		
		$('#deleteLabelLinkId').click(function(){
			$('#translationDiv').load("showlistoflabelsfordelete.jsp");
		});
		
		$('#viewTranslationsLinkId').click(function(){
			$('#translationDiv').load("showlistoftranslations.jsp");
		});
		
		$('#editTranslationLinkId').click(function(){
			$('#translationDiv').load("showlistoftranslationsforedit.jsp");
		});
		
		$('#deleteTranslationLinkId').click(function(){
			$('#translationDiv').load("showlistoftranslationsfordelete.jsp");
		});
		
		$('#addTranslationLinkId').click(function(){
			$('#translationDiv').load("showaddtranslationform.jsp");
		});
	});//end document.ready function
</script>