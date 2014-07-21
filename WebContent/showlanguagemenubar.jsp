<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<table border="0" width="100%">
	<tr style="text-align:center;font-weight:bolder;background:#ccc">
		<td><a href="#.jsp" id="addLanguageLink" style="text-decoration:none"><label id="lbladdlanguage"><%
					String lblAddLanguage = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbladdlanguage");
					label = Label.getLabelUsingLabelId("lbladdlanguage");
					out.print(lblAddLanguage != null ? lblAddLanguage : label.getLabelCaption());
				%></label></a></td>
		<td><a href="#.jsp" id="viewLanguageLink" style="text-decoration:none"><label id="lblviewlanguages"><%
					String lblViewLanguages = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblviewlanguages");
					label = Label.getLabelUsingLabelId("lblviewlanguages");
					out.print(lblViewLanguages != null ? lblViewLanguages : label.getLabelCaption());
				%></label></a></td>
		<td><a href="#.jsp" id="editLanguageLink" style="text-decoration:none"><label id="lbleditlanguage"><%
					String lblEditLanguage = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbleditlanguage");
					label = Label.getLabelUsingLabelId("lbleditlanguage");
					out.print(lblEditLanguage != null ? lblEditLanguage : label.getLabelCaption());
				%></label></a></td>
		<td><a href="#.jsp" id="deleteLanguageLink" style="text-decoration:none"><label id="lbldeletelanguage"><%
					String lblDeleteLanguage = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldeletelanguage");
					label = Label.getLabelUsingLabelId("lbldeletelanguage");
					out.print(lblDeleteLanguage != null ? lblDeleteLanguage : label.getLabelCaption());
				%></label></a></td>
	</tr>
</table>
<div id="languageManagementDiv"></div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#addLanguageLink').click(function(){
			$('#languageManagementDiv').load('showaddlanguageform.jsp');
		});
		
		$('#viewLanguageLink').click(function(){
			$('#languageManagementDiv').load('showlistoflanguages.jsp');
		});
		
		$('#editLanguageLink').click(function(){
			$('#languageManagementDiv').load('showlistoflanguagesforedit.jsp');
		});
		
		$('#deleteLanguageLink').click(function(){
			$('#languageManagementDiv').load('showlistoflanguagesfordelete.jsp');
		});
	});//end document.ready function
</script>