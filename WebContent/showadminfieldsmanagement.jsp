<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<div>	
	<!-- Tabs --> 
			<%
				int langId = Integer.parseInt(session.getAttribute("langId").toString());
				Label label = null;
				Account account = (Account) session.getAttribute("account");
				String functionalityName = "adminFieldsManagement";
				Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
				Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
				User userAdmin = User.getUser(account.getUserId());
				if (role.isWritable() && role.isUpdateable() && role.isDeletable() && role.isReadable() && userAdmin.getUserType().equalsIgnoreCase("Administrator")){
			%>
			<h3 class="tit"><label id="lblAdministratorFieldsTab">
				<%
					String lblAdministratorFieldsTab = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblAdministratorFieldsTab");
					label = Label.getLabelUsingLabelId("lblAdministratorFieldsTab");
					out.print(lblAdministratorFieldsTab != null ? lblAdministratorFieldsTab : label.getLabelCaption());
				%>
			</label></h3> 			
			<div class="tabs box"> 
				<ul> 
					<li title=""><a href="#.jsp" id="showAddOptionToFieldsLink"><span><label id="lbladdoptionstofields">
						<%
	 						String lblAddOptionsToFields = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbladdoptionstofields");
							label = Label.getLabelUsingLabelId("lbladdoptionstofields");
	 						out.print(lblAddOptionsToFields != null ? lblAddOptionsToFields : label.getLabelCaption());
	 					%>
					</label></span></a></li>
					<li title=""><a href="#.jsp" id="showListOfOptionsOfFieldsLink"><span><label id="lbllistoptionsoffields">
						<%
	 						String lblListOptionsOfFields = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbllistoptionsoffields");
							label = Label.getLabelUsingLabelId("lbllistoptionsoffields");
	 						out.print(lblListOptionsOfFields != null ? lblListOptionsOfFields : label.getLabelCaption());
	 					%>
					</label></span></a></li>
					<li title=""><a href="#.jsp" id="showListOfOptionsOfFieldsForEditLink"><span><label id="lbleditoptionsoffields">
						<%
	 						String lblListOptionsOfFieldsForEdit = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbleditoptionsoffields");
							label = Label.getLabelUsingLabelId("lbleditoptionsoffields");
	 						out.print(lblListOptionsOfFieldsForEdit != null ? lblListOptionsOfFieldsForEdit : label.getLabelCaption());
	 					%>
					</label></span></a></li>
					<li title=""><a href="#.jsp" id="showListOfOptionsOfFieldsForDeleteLink"><span><label id="lbldeleteoptionsoffields">
						<%
	 						String lblListOfOptionsOfFieldsForDelete = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldeleteoptionsoffields");
							label = Label.getLabelUsingLabelId("lbldeleteoptionsoffields");
	 						out.print(lblListOfOptionsOfFieldsForDelete != null ? lblListOfOptionsOfFieldsForDelete : label.getLabelCaption());
	 					%>
					</label></span></a></li>
					<li title=""><a href="#.jsp" id="languageManagementLink"><span><label id="lbllanguage">
						<%
	 						String lblLanguage = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbllanguage");
							label = Label.getLabelUsingLabelId("lbllanguage");
	 						out.print(lblLanguage != null ? lblLanguage : label.getLabelCaption());
	 					%>
					</label></span></a></li>
					<li title=""><a href="#.jsp" id="menuTranslationManagementLink"><span><label id="lblmenutranslation">
						<%
	 						String lblMenuTranslation = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblmenutranslation");
							label = Label.getLabelUsingLabelId("lblmenutranslation");
	 						out.print(lblMenuTranslation != null ? lblMenuTranslation : label.getLabelCaption());
	 					%>
					</label></span></a></li>
					<li title=""><a href="#.jsp" id="showRoleManagementLink"><span><label id="lblrole">
						<%
	 						String lblRole = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrole");
							label = Label.getLabelUsingLabelId("lblrole");
	 						out.print(lblRole != null ? lblRole : label.getLabelCaption());
	 					%>
					</label></span></a></li>
					<li title=""><a href="#.jsp" id="showTranslationManagementLink"><span><label id="lbltranslation">
						<%
	 						String lblTranslation = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbltranslation");
							label = Label.getLabelUsingLabelId("lbltranslation");
	 						out.print(lblTranslation != null ? lblTranslation : label.getLabelCaption());
	 					%>
					</label></span></a></li>
					<li title=""><a href="#.jsp" id="showUserManagementLink"><span><label id="lbluser">
						<%
	 						String lblUser = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbluser");
							label = Label.getLabelUsingLabelId("lbluser");
	 						out.print(lblUser != null ? lblUser : label.getLabelCaption());
	 					%>
					</label></span></a></li>										
				</ul> 
			</div> <!-- /tabs --> 
			 
			<div id="tabDetailDiv"> 			
				<p class="msg info">
					<label id="lblclickonthemanagementtabs">
						<%
	 						String lblClickOnTheManagementTabs = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblclickonthemanagementtabs");
							label = Label.getLabelUsingLabelId("lblclickonthemanagementtabs");
	 						out.print(lblClickOnTheManagementTabs != null ? lblClickOnTheManagementTabs : label.getLabelCaption());
	 					%>
					</label>
				</p>			
			</div>			
			<div id="subTabDetailDiv"></div>
			<div class="fix"></div>
		<%
				}else{
					%>
					<p class="msg error">You do not have sufficient privileged to
			perform this operation!</p>
					<%
				}
		%> 
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#showAddOptionToFieldsLink').click(function(){
			$('#subTabDetailDiv').load('showaddoptionstofieldsform.jsp');
		});
		
		$('#showListOfOptionsOfFieldsLink').click(function(){
			$('#subTabDetailDiv').load('showlistofoptionsoffieldsselector.jsp');
		});
		
		$('#showListOfOptionsOfFieldsForEditLink').click(function(){
			$('#subTabDetailDiv').load('showlistofoptionsoffieldsforeditselector.jsp');
		});
		
		$('#showListOfOptionsOfFieldsForDeleteLink').click(function(){
			$('#subTabDetailDiv').load('showlistofoptionsoffieldsfordeleteselector.jsp');			
		});
		
		$('#showRoleManagementLink').click(function(){
			$('#subTabDetailDiv').load('showrolemanagementuserselectorbar.jsp');
		});
		
		$('#showUserManagementLink').click(function(){
			$('#subTabDetailDiv').load('showusermanagement.jsp');
		});
		
		$('#languageManagementLink').click(function(){
			$('#subTabDetailDiv').load('showlanguagemenubar.jsp');
		});
		
		$('#showTranslationManagementLink').click(function(){
			$('#subTabDetailDiv').load('showtranslationmenubar.jsp');
		});
		
		$('#menuTranslationManagementLink').click(function(){
			$('#subTabDetailDiv').load('showmenutranslationmenubar.jsp');
		});
	});//end document.ready function
</script>
