<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
%>
<div>	
	<!-- Tabs -->
			
			<h3 class="tit">
				<label id="lblaccountmanagementtab">					
					<%
 						String lblAccountManagementTab = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblaccountmanagementtab");
 						out.print(lblAccountManagementTab != null ? lblAccountManagementTab : "Account Management Tab");
 					%>
				</label>
			</h3> 
 
			<div class="tabs box"> 
				<ul> 
					<li><a href="#.jsp" id="changeUsernameLink"><span><label id="lblchangeusername">
						<%
							String lblChangeUsername = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblchangeusername");
	 						out.print(lblChangeUsername != null ? lblChangeUsername : "Change Username");
						%>
					</label></span></a></li>					 
					<li><a href="#.jsp" id="changePasswordLink"><span><label id="lblchangepassword">
						<%
							String lblChangePassword = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblchangepassword");
	 						out.print(lblChangePassword != null ? lblChangePassword : "Change Password");
						%>
					</label></span></a></li>
					<%
					Account acct = (Account)session.getAttribute("account");
					User u = User.getUser(acct.getUserId());
					if(u.getUserType().equals("Administrator")){
					%> 
						<li><a href="#.jsp" id="resetUserAccountLink"><span><label id="lblresetuseraccount">
							<%
								String lblResetUserAccount = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblresetuseraccount");
		 						out.print(lblResetUserAccount != null ? lblResetUserAccount : "Reset User Account");
		 					%>
						</label></span></a></li>
					<%
					}
					%>
				</ul> 
			</div> <!-- /tabs --> 
			 
			<div id="tabDetailDiv"> 			
				<p class="msg info"><label id="lblclickonthemanagementtabs">					
					<%
						String lblClickOnTheManagementTabs = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblclickonthemanagementtabs");
		 				out.print(lblClickOnTheManagementTabs != null ? lblClickOnTheManagementTabs : "Click on the management tabs for manipulating fields");
		 			%>
				</label></p>			
			</div>			
			<div id="subTabDetailDiv"></div>
			<div class="fix"></div> 
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#changeUsernameLink').click(function(){
			$('#subTabDetailDiv').load('showchangeusername.jsp');
		});
		
		$('#changePasswordLink').click(function(){
			$('#subTabDetailDiv').load('showchangepassword.jsp');
		});
		
		$('#resetUserAccountLink').click(function(){
			$('#subTabDetailDiv').load('showresetuseraccount.jsp');
		});
	});//end document.ready function
</script>