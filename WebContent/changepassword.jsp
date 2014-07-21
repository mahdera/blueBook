<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
	String currentUsername = request.getParameter("currentUsername");
	String currentPassword = request.getParameter("currentPassword");
	String newPassword = request.getParameter("newPassword");
	String confirmPassword = request.getParameter("confirmPassword");
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	
	if(Account.isThereAnAccountWithThisUsernameAndPassword(currentUsername, currentPassword)){
		Account.changePassword(currentUsername, currentPassword, newPassword);
		%>
		<p class="msg done">
			<label id="lblpasswordchangedsuccessfully">
				<%
					String lblEnterConfirmationPassword = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblpasswordchangedsuccessfully");
					label = Label.getLabelUsingLabelId("lblpasswordchangedsuccessfully");
	 				out.print(lblEnterConfirmationPassword != null ? lblEnterConfirmationPassword : label.getLabelCaption());
	 			%>
			</label>
		</p>
		<%
	}else{
		%>
			<p class="msg error">
				<label id="lblnouserwiththegivenusernamepassword">
					<%
						String lblNoUserWithTheGivenUsernamePassowrd = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnouserwiththegivenusernamepassword");
						label = Label.getLabelUsingLabelId("lblnouserwiththegivenusernamepassword");
						out.print(lblNoUserWithTheGivenUsernamePassowrd != null ? lblNoUserWithTheGivenUsernamePassowrd : label.getLabelCaption());
					%>
				</label>
			</p>
		<%
	}
%>