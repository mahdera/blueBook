<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
	int caseCategoryId = Integer.parseInt(request.getParameter("caseCategoryId"));
	CaseCategory cat = CaseCategory.getCaseCategory(caseCategoryId);
	//now define the control names in here...
	String caseCategoryControlName = "txtcasecategoryname" + caseCategoryId;
	String descriptionControlName = "textareadescription" + caseCategoryId;
%>
<form>
<table border="0" width="100%" style="background:lightyellow">
	<tr>
		<td>Case Category Name/የጉዳይ ምድብ ሥም:</td>
		<td>
			<input type="text" name="<%=caseCategoryControlName %>" id="<%=caseCategoryControlName %>" value="<%=cat.getCaseCategoryName() %>"/>
		</td>
	</tr>
	<tr>
		<td>Description/ገለፃ:</td>
		<td>
			<textarea class="tinymce" name="<%=descriptionControlName %>" id="<%=descriptionControlName %>" cols="70" rows="4"><%=cat.getDescription() %></textarea>
		</td>
	</tr>	
	<tr>		
		<td colspan="2" align="right">
			<%
				String buttonId = "btnupdate" + caseCategoryId;
			%>
			<input type="button" value = "Update/አድስ" class="input-submit" id="<%=buttonId %>"/>
			<input type="reset" value="Undo/ወደ ቀድሞ ይዘት መልስ" class="input-submit"/>
		</td>
	</tr>
</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var caseCategoryId = "<%=caseCategoryId%>";
		setupTinyMCE();
		
		var buttonId = "btnupdate" + caseCategoryId;
		$('#'+buttonId).click(function(){
			//now define the control names in here...
			var caseCategoryControlName = "txtcasecategoryname" + caseCategoryId;
			var descriptionControlName = "textareadescription" + caseCategoryId;
			var caseCategoryName = $('#'+caseCategoryControlName).val();
			var description = $('#'+descriptionControlName).val();
			var dataString = "caseCategoryName="+caseCategoryName+"&description="+description+"&caseCategoryId="+
			caseCategoryId;
			$.ajax({
			    url: 'updatecasecategory.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){	
			    		var divId = "caseCategoryEditDiv"+caseCategoryId;
			    		$('#'+divId).html(response);				
			    },
			    error:function(error){
					alert(error);
			    }
			 });	
		});
	});//end document.ready function
</script>