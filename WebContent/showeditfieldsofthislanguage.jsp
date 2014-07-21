<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.Language"%>
<%
	int languageId = Integer.parseInt(request.getParameter("languageId"));
	Language language = Language.getLanguage(languageId);
	//now build the control names in here
	String languageControlName = "txtlanguage" + languageId;
	String buttonId = "btnupdate" + languageId;
%>
<form>
	<table border="0" width="100%">
		<tr>
			<td>Language:</td>
			<td>
				<input type="text" name="<%=languageControlName %>" id="<%=languageControlName %>" value="<%=language.getLanguage() %>"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="Update" id="<%=buttonId %>" class="input-submit"/>
				<input type="reset" value="Undo" class="input-submit"/>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var languageId = "<%=languageId%>";		
		var buttonId = "btnupdate" + languageId;
		
		$('#'+buttonId).click(function(){
			var languageControlName = "txtlanguage" + languageId;
			var languageName = $('#'+languageControlName).val();
			
			if(languageName != ""){
				var dataString = "languageName="+languageName+"&languageId="+languageId;
				var divId = "languageManagementDiv";
				$.ajax({					
				    url: 'updatelanguage.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){				    		
				    		$('#'+divId).load("showlistoflanguagesforedit.jsp");				    		
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>