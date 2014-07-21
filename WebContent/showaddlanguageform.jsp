<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<form>
	<table border="0" width="100%">
		<tr>
			<td><label id="lbllanguage"><%
					String lblLanguage = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbllanguage");
					label = Label.getLabelUsingLabelId("lbllanguage");
					out.print(lblLanguage != null ? lblLanguage : label.getLabelCaption());
				%></label></td>
			<td>
				<input type="text" name="txtlanguage" id="txtlanguage"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<%
					String lblSaveButtonLabel = "lblsavebutton";
					String saveButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblsavebutton");
					label = Label.getLabelUsingLabelId("lblsavebutton");
					String saveButtonCaption = saveButtonLabel != null ? saveButtonLabel : label.getLabelCaption();
					//////
					String lblResetButtonLabel = "lblresetbutton";
					String resetButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId, "lblresetbutton");
					label = Label.getLabelUsingLabelId("lblresetbutton");
					String resetButtonCaption = resetButtonLabel != null ? resetButtonLabel : label.getLabelCaption();
				%>
				<input type="button" value="<%=saveButtonCaption %>" id="btnsave" class="input-submit"/>
				<input type="reset" value="<%=resetButtonCaption %>" class="input-submit"/>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		$('#txtlanguage').focus();
		
		$('#btnsave').click(function(){
			var languageName = $('#txtlanguage').val();
			
			if(languageName != ""){
				var dataString = "languageName="+languageName;			
				$.ajax({					
				    url: 'savelanguage.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){			    		
				    		$('#languageManagementDiv').html(response);				    		
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>
