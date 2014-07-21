<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<label id="lblenteryourreasonforrejection">
	<%
		String lblFileNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblenteryourreasonforrejection");
		label = Label.getLabelUsingLabelId("lblenteryourreasonforrejection");
		out.print(lblFileNumber != null ? lblFileNumber : label.getLabelCaption());
	%>
	:<br/>
</label>
<textarea name="textarearejectionreason" id="textarearejectionreason" rows="4" style="width:100%"></textarea>
<script type="text/javascript">
	$(document).ready(function(){
		$('#textarearejectionreason').focus();
	});//end document.ready function
</script>