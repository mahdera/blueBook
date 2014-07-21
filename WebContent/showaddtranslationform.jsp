<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%@page import="java.util.*" %>
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
				<select name="slctlanguage" id="slctlanguage" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<Language> languageList = Language.getAllLanguages();
						Iterator<Language> languageItr = languageList.iterator();
						while(languageItr.hasNext()){
							Language language = languageItr.next();
							%>
							<option value="<%=language.getId() %>"><%=language.getLanguage() %></option>
							<%
						}//end while loop
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td><label id="lbllabel"><%
					String lblLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbllabel");
					label = Label.getLabelUsingLabelId("lbllabel");
					out.print(lblLabel != null ? lblLabel : label.getLabelCaption());
				%></label></td>
			<td>
				<select name="slctlabel" id="slctlabel" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<Label> labelList = Label.getAllLabels();
						Iterator<Label> labelItr = labelList.iterator();
						while(labelItr.hasNext()){
							label = labelItr.next();
							%>
							<option value="<%=label.getId() %>"><%=label.getLabelCaption() %></option>
							<%
						}//end while loop
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td><label id="lbltranslatedvalue"><%
					String lblTranslatedValue = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbltranslatedvalue");
					label = Label.getLabelUsingLabelId("lbltranslatedvalue");
					out.print(lblTranslatedValue != null ? lblTranslatedValue : label.getLabelCaption());
				%></label></td>
			<td>
				<input type="text" name="txttranslatedvalue" id="txttranslatedvalue" size="70"/>
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
		
		$('#slctlanguage').change(function(){
			$('#txttranslatedvalue').val('');
		});
		
		$('#slctlabel').change(function(){
			var languageId = $('#slctlanguage').val();
			var labelId = $('#slctlabel').val();
			if(languageId != "" && labelId != ""){
				//now search the translation table and show if this field is already translated...very important...
				var dataString = "languageId="+languageId+"&labelId="+labelId;
				$.ajax({					
				    url: 'gettranslationvalueofthislabelinthislanguage.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){			    	
				    		if(response.trim() != "Not"){
				    			$('#txttranslatedvalue').val(response);
				    		}
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
		
		
		$('#btnsave').click(function(){
			var labelId = $('#slctlabel').val();
			var languageId = $('#slctlanguage').val();
			var translatedValue = $('#txttranslatedvalue').val();
			
			if(labelId != "" && languageId != "" && translatedValue != ""){
				var dataString = "languageId="+languageId+"&translatedValue="+translatedValue+"&labelId="+labelId;
				$.ajax({					
				    url: 'savetranslation.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){			    		
				    		$('#translationDiv').load("showaddtranslationform.jsp");				    		
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.redy function
</script>