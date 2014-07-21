<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "caseCategoryManagement";
	Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	if(true){
		int langId = Integer.parseInt(session.getAttribute("langId").toString());
		Label label = null;
%>
<form>
<table border="0" width="100%" style="background:#eee">
	<tr>
		<td><label id="lblcasecategoryname"><%
						String lblCaseCategoryName = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasecategoryname");
						label = Label.getLabelUsingLabelId("lblcasecategoryname");
		 				out.print(lblCaseCategoryName != null ? lblCaseCategoryName : label.getLabelCaption());
		 			%></label></td>
		<td>
			<input type="text" name="txtcasecategoryname" id="txtcasecategoryname" size="90"/>
		</td>
	</tr>
	<tr>
		<td style="vertical-align:middle"><label id="lbldescription"><%
						String lblDescription = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldescription");
						label = Label.getLabelUsingLabelId("lbldescription");
		 				out.print(lblDescription != null ? lblDescription : label.getLabelCaption());
		 			%></label></td>
		<td>
			<textarea class="jqte-test" name="textareadescription" id="textareadescription" cols="70" rows="4"></textarea>
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
			<input type="button" value = "<%=saveButtonCaption %>" class="input-submit" id="btnsave"/>
			<input type="reset" value="<%=resetButtonCaption %>" class="input-submit"/>
		</td>
	</tr>
</table>
</form>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
%>
<script type="text/javascript">
	$(document).ready(function(){
		$('.jqte-test').jqte();			
		// settings of status
		var jqteStatus = true;
		$(".status").click(function()
		{
			jqteStatus = jqteStatus ? false : true;
			$('.jqte-test').jqte({"status" : jqteStatus})
		});
		$('#txtcasecategoryname').focus();
		
		$('#btnsave').click(function(){
			categoryName = $('#txtcasecategoryname').val();
			description = $('#textareadescription').val();
			var dataString = "categoryName="+categoryName+"&description="+description;
			$.ajax({
			    url: 'savecasecategory.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){		    		
			    		$('#subTabDetailDiv').html(response);				
			    },
			    error:function(error){
					alert(error);
			    }
			 });	
		});
	});//end document.ready function
</script>