<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<form>
	<table border="0" width="100%">
		<tr>
			<td><label id="lbllabelid"><%
					String lblLabelId = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbllabelid");
					label = Label.getLabelUsingLabelId("lbllabelid");
					out.print(lblLabelId != null ? lblLabelId : label.getLabelCaption());
				%></label></td>
			<td>
				<input type="text" name="txtlabelid" id="txtlabelid" size="30"/>
			</td>
		</tr>
		<tr>
			<td><label id="lbllabelcaption"><%
					String lblLabelCaption = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbllabelcaption");
					label = Label.getLabelUsingLabelId("lbllabelcaption");
					out.print(lblLabelCaption != null ? lblLabelCaption : label.getLabelCaption());
				%></label></td>
			<td>
				<input type="text" name="txtlabelcaption" id="txtlabelcaption" size="30"/>
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
		$('#btnsave').click(function(){
			var labelId = $('#txtlabelid').val();
			var labelCaption = $('#txtlabelcaption').val();
			
			if(labelId != "" && labelCaption != ""){
				var dataString = "labelId="+labelId+"&labelCaption="+labelCaption;
				$.ajax({					
				    url: 'savelabel.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){			    		
				    		$('#translationDiv').load("showaddlabelform.jsp");				    		
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.redy function
</script>