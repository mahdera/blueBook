<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	MenuTranslation menuTranslation = MenuTranslation.getMenuTranslation(id);
	
	List<Functionality> functionalityList = Functionality.getAllFunctionalities();
	Iterator<Functionality> functionalityItr = functionalityList.iterator();
	//now define the control names in here...
	String languageControlName = "slctlanguage" + id;
	String menuControlName = "slctmenu" + id;
	String translatedValueControlName = "txttranslatedvalue" + id;
	String translatedDescriptionControlName = "textareatranslateddescription" + id;
	String buttonId = "btnupdate" + id;
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
							if(menuTranslation.getLanguageId() == language.getId()){
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
			<td>Menu:</td>
			<td>
				<select name="<%=menuControlName %>" id="<%=menuControlName %>" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<%
						while(functionalityItr.hasNext()){
							Functionality functionality = functionalityItr.next();
							if(menuTranslation.getMenuId() == functionality.getId()){
							%>
							<option value="<%=functionality.getId() %>" selected="selected"><%=functionality.getMenuName() %></option>
							<%
							}else{
							%>
							<option value="<%=functionality.getId() %>"><%=functionality.getMenuName() %></option>
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
				<input type="text" name="<%=translatedValueControlName %>" id="<%=translatedValueControlName %>" size="30" value="<%=menuTranslation.getTranslatedValue() %>"/>
			</td>
		</tr>
		<tr>
			<td>Translated Description:</td>
			<td>
				<textarea name="<%=translatedDescriptionControlName %>" id="<%=translatedDescriptionControlName %>" rows="3" style="width:100%"><%=menuTranslation.getTranslatedDescription() %></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="Update" class="input-submit" id="<%=buttonId %>"/>
				<input type="reset" value="Clear" class="input-submit"/>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var id = "<%=id%>";
		var buttonId = "btnupdate" + id;
		
		$('#'+buttonId).click(function(){
			//define the control names in here...
			var languageControlName = "slctlanguage" + id;
			var menuControlName = "slctmenu" + id;
			var translatedValueControlName = "txttranslatedvalue" + id;
			var translatedDescriptionControlName = "textareatranslateddescription" + id;
			/////now get the values using the control names...
			var languageId = $('#'+languageControlName).val();
			var menuId = $('#'+menuControlName).val();
			var translatedValue = $('#'+translatedValueControlName).val();
			var translatedDescription = $('#'+translatedDescriptionControlName).val();			
			
			if(languageId != "" && menuId != "" && translatedValue != ""){
				var dataString = "languageId="+languageId+"&menuId="+menuId+"&translatedValue="+translatedValue+
				"&id="+id+"&translatedDescription="+translatedDescription;
				
				$.ajax({					
				    url: 'updatemenutranslation.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){			    		
				    		$('#menuTranslationDiv').load("showlistofmenutranslationsforedit.jsp");				    		
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>