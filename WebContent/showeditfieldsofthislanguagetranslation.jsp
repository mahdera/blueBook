<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	LanguageTranslation languageTranslation = LanguageTranslation.getLanguageTranslation(id);
	//now define the control names in here...
	String labelControlName = "slctlabel"+id;
	String languageControlName = "slctlanguage"+id;
	String translatedValueControlName = "txttranslatedvalue"+id;
	String buttonId = "btnupdate"+id;
%>
<form>
	<table border="0" width="100%">
		<tr>
			<td>Language:</td>
			<td>
				<select name="<%=languageControlName %>" id="<%=languageControlName %>" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<Language> languageList = Language.getAllLanguages();
						Iterator<Language> languageItr = languageList.iterator();
						while(languageItr.hasNext()){
							Language language = languageItr.next();
							if(languageTranslation.getLangaugeId() == language.getId()){
							%>
								<option value="<%=language.getId() %>" selected="selected"><%=language.getLanguage() %></option>
							<%
							}else{
							%>
								<option value="<%=language.getId() %>"><%=language.getLanguage() %></option>
							<%	
							}
						}//end while loop
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>Label:</td>
			<td>
				<select name="<%=labelControlName %>" id="<%=labelControlName %>" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<Label> labelList = Label.getAllLabels();
						Iterator<Label> labelItr = labelList.iterator();
						while(labelItr.hasNext()){
							Label label = labelItr.next();
							if(label.getId() == languageTranslation.getLabelId()){
							%>
								<option value="<%=label.getId() %>" selected="selected"><%=label.getLabelCaption() %></option>
							<%
							}else{
							%>
								<option value="<%=label.getId() %>"><%=label.getLabelCaption() %></option>
							<%
							}
						}//end while loop
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>Translated Value:</td>
			<td>
				<input type="text" name="<%=translatedValueControlName %>" id="<%=translatedValueControlName %>" size="50" value="<%=languageTranslation.getTranslatedValue() %>"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="Update" id="<%=buttonId %>" class="input-submit"/>
				<input type="reset" value="Clear" class="input-submit"/>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var id = "<%=id%>";
		var buttonId = "btnupdate"+id;
		
		$('#'+buttonId).click(function(){
			var labelControlName = "slctlabel"+id;
			var languageControlName = "slctlanguage"+id;
			var translatedValueControlName = "txttranslatedvalue"+id;
			//get the values...
			var labelId = $('#'+labelControlName).val();
			var languageId = $('#'+languageControlName).val();
			var translatedValue = $('#'+translatedValueControlName).val();
			
			if(labelId != "" && languageId != "" && translatedValue != ""){
				var dataString = "languageId="+languageId+"&translatedValue="+translatedValue+"&labelId="+labelId+
				"&id="+id;
				
				var divId = "languageTranstionEditDiv" + id;
				$.ajax({					
				    url: 'updatetranslation.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){			    		
				    		$('#'+divId).html(response);				    		
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.redy function
</script>