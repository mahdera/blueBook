<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<table border="0" width="100%">
	<tr style="background:#ccc;font-weight:bolder;font-size:10pt;text-align:center">
		<td><a href="#.jsp" id="addMenuTranslationLink"><label id="lbladdmenutranslation"><%
					String lblAddMenuTranslation = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbladdmenutranslation");
					label = Label.getLabelUsingLabelId("lbladdmenutranslation");
					out.print(lblAddMenuTranslation != null ? lblAddMenuTranslation : label.getLabelCaption());
				%></label></a></td>
		<td><a href="#.jsp" id="viewMenuTranslationLink"><label id="lblviewmenutranslation"><%
					String lblViewMenuTranslation = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblviewmenutranslation");
					label = Label.getLabelUsingLabelId("lblviewmenutranslation");
					out.print(lblViewMenuTranslation != null ? lblViewMenuTranslation : label.getLabelCaption());
				%></label></a></td>
		<td><a href="#.jsp" id="editMenuTranslationLink"><label id="lbleditmenutranslation"><%
					String lblEditMenuTranslation = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbleditmenutranslation");
					label = Label.getLabelUsingLabelId("lbleditmenutranslation");
					out.print(lblEditMenuTranslation != null ? lblEditMenuTranslation : label.getLabelCaption());
				%></label></a></td>
		<td><a href="#.jsp" id="deleteMenuTranslationLink"><label id="lbldeletemenutranslation"><%
					String lblDeleteMenuTranslation = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldeletemenutranslation");
					label = Label.getLabelUsingLabelId("lbldeletemenutranslation");
					out.print(lblDeleteMenuTranslation != null ? lblDeleteMenuTranslation : label.getLabelCaption());
				%></label></a></td>
	</tr>
</table>
<div id="menuTranslationDiv"></div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#addMenuTranslationLink').click(function(){
			$('#menuTranslationDiv').load('showaddmenutranslationform.jsp');
		});
		
		$('#viewMenuTranslationLink').click(function(){
			$('#menuTranslationDiv').load('showlistofmenutranslations.jsp');
		});
		
		$('#editMenuTranslationLink').click(function(){
			$('#menuTranslationDiv').load('showlistofmenutranslationsforedit.jsp');
		});
		
		$('#deleteMenuTranslationLink').click(function(){
			$('#menuTranslationDiv').load('showlistofmenutranslationsfordelete.jsp');
		});
	});//end document.ready function
</script>