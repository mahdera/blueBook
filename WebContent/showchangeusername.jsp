<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<form name="frmchangeusername" id="frmchangeusername">
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
<div id="errorMsgDiv"></div>
<table border="0" width="100%" style="background:#eee">
	<tr>
		<td colspan="2">
			<div id="usernameErrorDiv"></div>
		</td>
	</tr>
	<tr>
		<td align="right" width="50%">
			<label id="lblentercurrentusername">
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
			<label id="lblenternewusername">
				<%
					String lblEnterNewUsername = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblenternewusername");
					label = Label.getLabelUsingLabelId("lblenternewusername");
	 				out.print(lblEnterNewUsername != null ? lblEnterNewUsername : label.getLabelCaption());
	 			%>
			</label>
		</td>
		<td><input type="text" name="txtnewusername" id="txtnewusername"/></td>
	</tr>
	<tr>
		<td align="right">
			<label name = "lblenterpassword" id="lblenterpassword">
				<%
					String lblEnterPassword = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblenterpassword");
					label = Label.getLabelUsingLabelId("lblenterpassword");
	 				out.print(lblEnterPassword != null ? lblEnterPassword : label.getLabelCaption());
	 			%>
			</label>
		</td>
		<td><input type="password" name="txtpassword" id="txtpassword"/></td>
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
			var newUsername = $('#txtnewusername').val();
			var currentPassword = $('#txtpassword').val();
			
			if(currentUsername != "" && newUsername != "" && currentPassword != ""){
				var dataString = "currentUsername="+currentUsername+"&newUsername="+newUsername+"&currentPassword="+currentPassword;
				
				$.ajax({					
				    url: 'changeusername.jsp',		
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
		});
	});//end document.ready function
</script>