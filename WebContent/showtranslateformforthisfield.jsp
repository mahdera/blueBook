<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	AdminField adminField = AdminField.getAdminField(id);
	//now define the control names in here...
	String adminFieldValueControlName = "txtadminfieldvalue" + id;
	String languageControlName = "slctlanguage" + id;
	String translatedValueControlName = "txttranslatedvalue" + id;
	String buttonId = "btnupdate" + id;
%>
<form>
	<table border="0" width="100%">
		<tr>
			<td>Admin Field Value</td>
			<td>
				<input type="text" name="<%=adminFieldValueControlName %>" id="<%=adminFieldValueControlName %>" value="<%=adminField.getOptionValue() %>"/>
			</td>
		</tr>
		<tr>
			<td>Language</td>
			<td>
				<select name="<%=languageControlName %>" id="<%=languageControlName %>" style="width:100%">
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
			<td>Translated Value</td>
			<td>
				<input type="text" name="<%=translatedValueControlName %>" id="<%=translatedValueControlName %>" size="50"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="Update" class="input-submit" id="<%=buttonId%>"/>
				<input type="reset" value="Undo" class="input-submit"/>
			</td>			
		</tr>
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var id = "<%=id%>";
		var buttonId = "btnupdate" + id;
		var adminFieldValueControlName = "txtadminfieldvalue" + id;
		var languageControlName = "slctlanguage" + id;
		var translatedValueControlName = "txttranslatedvalue" + id;
		
		$('#'+languageControlName).change(function(){			
			var adminFieldId = "<%=adminField.getId() %>";
			var languageId = $('#'+languageControlName).val();
			if(adminFieldId != "" && languageId != ""){
				var dataString = "adminFieldId="+adminFieldId+"&languageId="+languageId;
				$.ajax({
				    url: 'getadminfieldtranslationvalueforthisfieldandlanguage.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){		    		
				    		if(response.trim() != ""){
				    			$('#'+translatedValueControlName).val(response.trim());
				    		}else{
				    			$('#'+translatedValueControlName).val('');
				    		}					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
		
		$('#'+buttonId).click(function(){			
			var languageControlName = "slctlanguage" + id;
			var translatedValueControlName = "txttranslatedvalue" + id;
			///get the values in here...
			var adminFieldId = id;
			var languageId = $('#'+languageControlName).val();
			var translatedValue = $('#'+translatedValueControlName).val();
			if(adminFieldId != "" && languageId != "" && translatedValue != ""){
				var dataString = "adminFieldId="+adminFieldId+"&languageId="+languageId+
				"&translatedValue="+translatedValue;
				var divId = "adminFieldOptionEditDiv" + id;
				$.ajax({
				    url: 'translatethisfield.jsp',		
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
	});//end document.ready function
</script>
