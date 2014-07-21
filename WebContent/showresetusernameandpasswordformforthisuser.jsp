<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
	int userId = Integer.parseInt(request.getParameter("userId"));
	User u = User.getUser(userId);
	Account acct = Account.getAccount(u.getId());
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<form>
	<table border="0" width="100%" style="background:lightyellow">
		<tr>
			<td>
				<label id="lblenterusername">
					<%
						String lblEnterUsername = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblenterusername");
						label = Label.getLabelUsingLabelId("lblenterusername");
		 				out.print(lblEnterUsername != null ? lblEnterUsername : label.getLabelCaption());
		 			%>
				</label>				
			</td>
			<td>
				<input type="txtusername" id="txtusername"/>				
			</td>
		</tr>
		<tr>
			<td>
				<label id="lblenterpassword">
					<%
						String lblEnterPassword = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblenterpassword");
						label = Label.getLabelUsingLabelId("lblenterpassword");
		 				out.print(lblEnterPassword != null ? lblEnterPassword : label.getLabelCaption());
		 			%>
				</label>				
			</td>
			<td>
				<input type="password" name="txtpassword" id="txtpassword"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
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
				<input type="button" value="<%=changeButtonCaption %>" onclick="resetThisUserAccount(<%=userId %>,<%=acct.getAccountId() %>,
				document.getElementById('txtusername').value,document.getElementById('txtpassword').value);"/>
				<input type="reset" value="<%=resetButtonCaption %>"/>
			</td>			
		</tr>
	</table>
</form>