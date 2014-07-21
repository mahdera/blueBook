<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	List<Functionality> functionalityList = Functionality.getAllFunctionalities();
	Iterator<Functionality> functionalityItr = functionalityList.iterator();
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
			<td><label id="lblmenu"><%
					String lblMenu = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblmenu");
					label = Label.getLabelUsingLabelId("lblmenu");
					out.print(lblMenu != null ? lblMenu : label.getLabelCaption());
				%></label></td>
			<td>
				<select name="slctmenu" id="slctmenu" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<%
						while(functionalityItr.hasNext()){
							Functionality functionality = functionalityItr.next();
							%>
							<option value="<%=functionality.getId() %>"><%=functionality.getMenuName() %></option>
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
				<input type="text" name="txttranslatedvalue" id="txttranslatedvalue" size="30"/>
			</td>
		</tr>
		<tr>
			<td><label id="lbltranslateddescription"><%
					String lblTranslatedDescription = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbltranslateddescription");
					label = Label.getLabelUsingLabelId("lbltranslateddescription");
					out.print(lblTranslatedDescription != null ? lblTranslatedDescription : label.getLabelCaption());
				%></label></td>
			<td>
				<textarea name="textareatranslateddescription" id="textareatranslateddescription" rows="3" style="width:100%"></textarea>
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
				<input type="button" value="<%=saveButtonCaption %>" class="input-submit" id="btnsave"/>
				<input type="reset" value="<%=resetButtonCaption %>" class="input-submit"/>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btnsave').click(function(){
			var languageId = $('#slctlanguage').val();
			var menuId = $('#slctmenu').val();
			var translatedValue = $('#txttranslatedvalue').val();
			var translatedDescription = $('#textareatranslateddescription').val();
			
			if(languageId != "" && menuId != "" && translatedValue != ""){
				var dataString = "languageId="+languageId+"&menuId="+menuId+"&translatedValue="+translatedValue+
				"&translatedDescription="+translatedDescription;
				
				$.ajax({					
				    url: 'savemenutranslation.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){			    		
				    		$('#menuTranslationDiv').load("showaddmenutranslationform.jsp");				    		
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>