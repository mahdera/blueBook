<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%@page import="java.util.*" %>
<div>
	<%
	Account account = (Account) session.getAttribute("account");
	//String functionalityName = "roleManagement";
	//Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	//Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	if(true)
	{		 
	%>	
		<table border="0" width="100%">
		<tr>
			<th class="full" colspan="2">
				<label id="lblrolecreationform"><%
							String lblRoleCreationForm = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrolecreationform");
							label = Label.getLabelUsingLabelId("lblrolecreationform");
							out.print(lblRoleCreationForm != null ? lblRoleCreationForm : label.getLabelCaption());
						%></label>			 
			</th>
		</tr>
		<tr>			
			<td colspan="1">
				<label id="lblpleaseselectauser"><%
							String lblPleaseSelectAUser = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblpleaseselectauser");
							label = Label.getLabelUsingLabelId("lblpleaseselectauser");
							out.print(lblPleaseSelectAUser != null ? lblPleaseSelectAUser : label.getLabelCaption());
						%></label>				
				<%
					List<User> userList = null;
					Iterator<User> userItr = null;
					userList = User.getAllUsers();
					userItr = userList.iterator();
					out.print("<select name='slctuser' id='slctuser' style='width:50%'>");
					out.print("<option value='' selected='selected'>--Select--</option>");
					while (userItr.hasNext()) {
						User user = userItr.next();						
						int userId = user.getId();
						Account acct = Account.getAccountForUser(userId);						
						%>
						 	<option value="<%=userId%>"><%=User.getUser(userId).getFullName() %></option> 
						<%
 					}//end while loop
 					out.print("</select>");
					
					%>
					<div id="userSelectionDiv"></div> 
				<hr />
				<div id="roleDetailForEmployee"></div>
			</td>
		</tr>
	</table>
	<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
	%>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#slctuser').change(function(){
			var userId = $(this).val();
			if(userId != ""){
				$('#roleDetailForEmployee').load('showroleforuser.jsp?userId='+userId);
			}
		});
	});//end document.ready function
</script>