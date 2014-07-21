<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%@page import="java.util.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	List<User> userList = User.getAllUsers();
	if(!userList.isEmpty()){
		Iterator<User> userItr = userList.iterator();
		%>
		<table border="0" width="100%">
			<tr style="background:#eee;font-size:11pt;font-weight:bolder">
				<td><label id="lblserialnumber">
					<%
 						String lblSerialNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblserialnumber");
 						out.print(lblSerialNumber != null ? lblSerialNumber : "Serial Number");
 					%>
				</label></td>
				<td><label id="lblfullname">
					<%
 						String lblFullName = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfullname");
 						out.print(lblFullName != null ? lblFullName : "Full Name");
 					%>
				</label></td>
				<td><label id="lblusertype">
					<%
 						String lblUserType = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblusertype");
 						out.print(lblUserType != null ? lblUserType : "User Type");
 					%>
				</label></td>
				<td><label id="lblreset">
					<%
 						String lblReset = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblreset");
 						out.print(lblReset != null ? lblReset : "Reset");
 					%>
				</label></td>				
			</tr>
			<%
				int ctr=1;
				while(userItr.hasNext()){
					User user = userItr.next();
					%>
					<tr>
						<td><%=ctr++ %></td>
						<td><%=user.getFullName() %></td>
						<td><%=user.getUserType() %></td>
						<td>
							<a href="#.jsp" onclick="showResetUsernameAndPasswordFormForThisUser(<%=user.getId() %>);">Reset</a>
						</td>
					</tr>
					<%
						String divId = "userEditDiv"+user.getId();
					%>
					<tr>
						<td colspan="4">
							<div id="<%=divId %>"></div>
						</td>
					</tr>
					<%
				}//end while loop
			%>
		</table>
		<%
	}else{
		%>
		<p class="msg warning">There is no information found/ምንም የተገኝ መረጃ የለም</p>
		<%
	}
%>
