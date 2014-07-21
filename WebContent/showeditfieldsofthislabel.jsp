<%@page import="com.signetitsolutions.bluebook.server.classes.Label"%>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	Label label = Label.getLabel(id);
	//now define the control names in here...
	String labelIdControlName = "txtlabelid" + id;
	String labelCaptionControlName = "txtlabelcaption" + id;
	String buttonId = "btnupdate" + id;
%>
<form>
	<table border="0" width="100%">
		<tr>
			<td>Label Id:</td>
			<td>
				<input type="text" name="<%=labelIdControlName %>" id="<%=labelIdControlName %>" size="30" value="<%=label.getLabelId() %>"/>
			</td>
		</tr>
		<tr>
			<td>Label Caption:</td>
			<td>
				<input type="text" name="<%=labelCaptionControlName %>" id="<%=labelCaptionControlName %>" size="30" value="<%=label.getLabelCaption() %>"/>
			</td>
		</tr>
		<tr>			
			<td colspan="2" align="right">
				<input type="button" value="Save" class="input-submit" id="<%=buttonId %>"/>
				<input type="reset" value="Undo" class="input-submit"/>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var id = "<%=id %>";
		var buttonId = "btnupdate"+id;
		
		$('#'+buttonId).click(function(){
			var labelIdControlName = "txtlabelid" + id;
			var labelCaptionControlName = "txtlabelcaption" + id;
			//now get the values in here...
			var labelId = $('#'+labelIdControlName).val();
			var labelCaption = $('#'+labelCaptionControlName).val();
			
			if(labelId != "" && labelCaption != ""){
				var dataString = "id="+id+"&labelId="+labelId+"&labelCaption="+labelCaption;
				
				$.ajax({					
				    url: 'updatelabel.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){			    		
				    		$('#translationDiv').load("showlistoflabelsforedit.jsp");				    		
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>