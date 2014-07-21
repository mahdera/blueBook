<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	
	int id = Integer.parseInt(request.getParameter("id"));
	AdminField adminField = AdminField.getAdminField(id);
	////now define the control names...
	String optionValueControlName = "txteditoptionvalue"+id;
	String descriptionControlName = "textareaeditdescription"+id;
	String buttonId = "btnupdate"+id;
%>
<form>
	<table border="0" width="100%" style="background:lightyellow">		
		<tr>
			<td><label id="lbloptionvalue"><%
					String lblOptionValue = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbloptionvalue");
					label = Label.getLabelUsingLabelId("lbloptionvalue");
					out.print(lblOptionValue != null ? lblOptionValue : label.getLabelCaption());
				%></label></td>
			<td>
				<input type="text" name="<%=optionValueControlName %>" id="<%=optionValueControlName %>" value="<%=adminField.getOptionValue() %>"/>
			</td>
		</tr>
		<tr>
			<td><label id="lbldescription"><%
					String lblDescription = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldescription");
					label = Label.getLabelUsingLabelId("lbldescription");
					out.print(lblDescription != null ? lblDescription : label.getLabelCaption());
				%></label></td>
			<td>
				<textarea name="<%=descriptionControlName %>" id="<%=descriptionControlName %>" cols="70" rows="4"><%=adminField.getDescription() %></textarea>
			</td>
		</tr>
		<tr>			
			<td colspan="2" align="right">
				<%	
					String lblUpdateButtonLabel = "lblupdatebutton";
					String updateButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblupdateallbutton");
					label = Label.getLabelUsingLabelId("lblupdatebutton");
					String updateButtonCaption = updateButtonLabel != null ? updateButtonLabel : label.getLabelCaption();
					
					String lblUndoButtonLabel = "lblundobutton";
					String undoButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblundobutton");
					label = Label.getLabelUsingLabelId("lblupdatebutton");
					String undoButtonCaption = undoButtonLabel != null ? undoButtonLabel : label.getLabelCaption();
				%>
				<input type="button" id="<%=buttonId %>" value="<%=updateButtonCaption %>" class="input-submit"/>
				<input type="reset" value="<%=undoButtonCaption %>" class="input-submit"/>
			</td>
		</tr>		
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var id = "<%=id%>";
		var buttonId = "btnupdate"+id;
		
		$('#'+buttonId).click(function(){			
		////now define the control names...
			var optionValueControlName = "txteditoptionvalue"+id;
			var descriptionControlName = "textareaeditdescription"+id;
			///now get the values in here...
			var optionValue = $('#'+optionValueControlName).val();
			var description = $('#'+descriptionControlName).val();
			var dataString = "id="+id+"&optionValue="+optionValue+"&description="+description;
			$.ajax({
			    url: 'updatethisadminfieldoption.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){	
			    		var divId = "adminFieldOptionEditDiv" + id;
			    		$('#'+divId).html(response);					
			    },
			    error:function(error){
					alert(error);
			    }
			 });		
		});//end click button
	});//end document.ready function
</script>