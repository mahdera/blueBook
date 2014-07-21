<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<form>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "accountManagement";
	Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	if(true)
	{		
		int langId = Integer.parseInt(session.getAttribute("langId").toString());
		Label label = null;
%>
<table border="0" width="100%" style="background:#eee">
	<tr>
		<td colspan="2">
			<div id="passwordErrorDiv"></div>
		</td>
	</tr>
	<tr>
		<td align="right" width="50%">
			<label name="lblentercurrentusername" id="lblentercurrentusername">
				<%
					String lblEnterCurrentUsername = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblentercurrentusername");
					label = Label.getLabelUsingLabelId("lblentercurrentusername");
	 				out.print(lblEnterCurrentUsername != null ? lblEnterCurrentUsername : label.getLabelCaption());
	 			%>
			</label>
		</td>
		<td><input type="text" name="txtcurrentusername" id="txtcurrentusername"/></td>
	</tr>
	<tr>
		<td align="right">
			<label name="lblenterpassword" id="lblenterpassword">				
				<%
					String lblEnterCurrentPassword = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblenterpassword");
					label = Label.getLabelUsingLabelId("lblenterpassword");
	 				out.print(lblEnterCurrentPassword != null ? lblEnterCurrentPassword : label.getLabelCaption());
	 			%>
			</label>
		</td>
		<td><input type="password" name="txtcurrentpassword" id="txtcurrentpassword"/></td>
	</tr>
	<tr>
		<td align="right">
			<label name="lblenternewpassword" id="lblenternewpassword">				
				<%
					String lblEnterNewPassword = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblenternewpassword");
					label = Label.getLabelUsingLabelId("lblenternewpassword");
	 				out.print(lblEnterNewPassword != null ? lblEnterNewPassword : label.getLabelCaption());
	 			%>
			</label>
		</td>
		<td><input type="password" name="txtnewpassword" id="txtnewpassword"/></td>
	</tr>
	<tr>
		<td align="right">
			<label name="lblenterconfirmationpassword" id="lblenterconfirmationpassword">				
				<%
					String lblEnterConfirmationPassword = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblenterconfirmationpassword");
					label = Label.getLabelUsingLabelId("lblenterconfirmationpassword");
	 				out.print(lblEnterConfirmationPassword != null ? lblEnterConfirmationPassword : label.getLabelCaption());
	 			%>	
			</label>
		</td>
		<td><input type="password" name="txtconfirmpassword" id="txtconfirmpassword"/></td>
	</tr>
	<tr>
		<td align="right" colspan="2">
			<%
				String lblChangeButtonLabel = "lblchangebutton";
				String changeButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblchangebutton");
				label = Label.getLabelUsingLabelId("lblchangebutton");
				String changeButtonCaption = changeButtonLabel != null ? changeButtonLabel : label.getLabelCaption();
				//////
				String lblResetButtonLabel = "lblresetbutton";
				String resetButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId, "lblresetbutton");
				label = Label.getLabelUsingLabelId("lblresetbutton");
				String resetButtonCaption = resetButtonLabel != null ? resetButtonLabel : label.getLabelCaption();
			%>
			<input type="button" value = "<%=changeButtonCaption %>" class="input-submit" id="btnchange"/>
			<input type="reset" value="<%=resetButtonCaption %>" class="input-submit"/>
		</td>		
	</tr>
</table>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}	
%>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btnchange').click(function(){
			var currentUsername = $('#txtcurrentusername').val();
			var currentPassword = $('#txtcurrentpassword').val();
			var newPassword = $('#txtnewpassword').val();
			var confirmPassword = $('#txtconfirmpassword').val();
			
			if(currentUsername != "" && currentPassword != "" && newPassword != "" && confirmPassword != ""){
				if(newPassword != confirmPassword){
					alert("New password and Confirmation Password are not identical!! Please try again!");
				}else{
					var dataString = "currentUsername="+currentUsername+"&currentPassword="+currentPassword+"&newPassword="+newPassword+"&confirmPassword="+confirmPassword;
					
					$.ajax({					
					    url: 'changepassword.jsp',		
					    data: dataString,
					    type:'POST',
					    success:function(response){			    		
					    		$('#subTabDetailDiv').html(response);			    		
					    },
					    error:function(error){
							alert(error);
					    }
					});
				}
			}
		});
	});//end document.ready function
</script>