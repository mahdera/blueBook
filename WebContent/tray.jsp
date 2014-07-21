<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	int langIdT = Integer.parseInt(session.getAttribute("langId").toString());
	Label labelT = null;	
%>
<div id="tray" class="box">
	<p class="f-left box">
		<!-- Switcher -->
		<span class="f-left" id="switcher"> <a href="#" rel="1col"
			class="styleswitch ico-col1" title="Display one column"><img
				src="design/switcher-1col.gif" alt="1 Column" />
		</a> <a href="#" rel="2col" class="styleswitch ico-col2"
			title="Display two columns"><img src="design/switcher-2col.gif"
				alt="2 Columns" />
		</a> </span> <label id="lblapplication"><%
					String lblApplication = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langIdT,"lblapplication");
					labelT = Label.getLabelUsingLabelId("lblapplication");
	 				out.print(lblApplication != null ? lblApplication : labelT.getLabelCaption());
	 			%></label>: <strong>
	 				<label id="lblcasemanagementsystem">	 					
	 					<%
							String lblCaseManagementSystem = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langIdT,"lblcasemanagementsystem");
							labelT = Label.getLabelUsingLabelId("lblcasemanagementsystem");
			 				out.print(lblCaseManagementSystem != null ? lblCaseManagementSystem : labelT.getLabelCaption());
			 			%>
	 				</label>
	 			</strong>
		
	</p>

	<p class="f-right">
		<%			
			Account at = (Account)session.getAttribute("account");
			User userObject = null;
			if(at != null){
			 	userObject = User.getUser(at.getUserId());
			}else{
				 response.sendRedirect("index.jsp");
			}
		%>
		<label id="lbluser"><%
							String lblUser = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langIdT,"lbluser");
							labelT = Label.getLabelUsingLabelId("lbluser");
			 				out.print(lblUser != null ? lblUser : labelT.getLabelCaption());
			 			%></label>: <strong><a href="#"><%=(userObject != null ? userObject.getUserType() : "")%>: <%=(userObject != null ? userObject.getFullName() : "") %></a>
		</strong>
		|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>
		<a href="logout.jsp" id="logout">
			<label id="lbllogout"><%
							String lblLogout = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langIdT,"lbllogout");
							labelT = Label.getLabelUsingLabelId("lbllogout");
			 				out.print(lblLogout != null ? lblLogout : labelT.getLabelCaption());
			 			%></label>
		</a>
		</strong>		
	</p>

</div>
<!--  /tray -->