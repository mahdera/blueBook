<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
	String currentUsername = request.getParameter("currentUsername").trim();
	String newUsername = request.getParameter("newUsername").trim();
	String password = request.getParameter("currentPassword").trim();
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	
	if(Account.isThereAnAccountWithThisUsernameAndPassword(currentUsername, password)){
		Account.changeUsername(currentUsername, newUsername, password);
		%>
		<p class="msg done">
			<label id="lblusernamechangedsuccessfully">
				<%
					String lblUsernameChangedSuccessfully = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblusernamechangedsuccessfully");
					label = Label.getLabelUsingLabelId("lblusernamechangedsuccessfully");
	 				out.print(lblUsernameChangedSuccessfully != null ? lblUsernameChangedSuccessfully : label.getLabelCaption());
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