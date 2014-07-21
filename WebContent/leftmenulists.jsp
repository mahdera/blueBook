<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	Account attmahder = (Account)session.getAttribute("account");
	if(attmahder != null){
	Account accnt = (Account) session.getAttribute("account");
	int usrId = accnt.getUserId();
	User usr = User.getUser(usrId);
	String usrType = usr.getUserType();
	int langId1 = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<div id="leftMenuDiv">
<ul class="box">	
	<%
		if(usrType.equalsIgnoreCase("intake officer")){
	%>
		<li><a href="#" onclick="performThisFunction('accountManagement');"><img src="images/account.png" border="0"/> <strong><label id="lblaccount"><%
					String lblAccount = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId1,"lblaccount");
					label = Label.getLabelUsingLabelId("lblaccount");
	 				out.print(lblAccount != null ? lblAccount : label.getLabelCaption());
	 			%></label></strong></a></li>
		<li><a href="#" onclick="performThisFunction('applicantManagement');"><img src="images/applicant.png" border="0"/> <strong><label id="lblapplicantmanagement"><%
					String lblApplicantManagement = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId1,"lblapplicantmanagement");
					label = Label.getLabelUsingLabelId("lblapplicantmanagement");
	 				out.print(lblApplicantManagement != null ? lblApplicantManagement : label.getLabelCaption());
	 			%></label></strong></a></li>
		
	<%
		}
	%>	
	<li><a href="#" onclick="performThisFunction('adminFieldsManagement');"><img src="images/fields.gif" border="0"/> <strong><label id="lbladminfields"><%
					String lblAdminFields = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId1,"lbladminfields");
					label = Label.getLabelUsingLabelId("lbladminfields");
	 				out.print(lblAdminFields != null ? lblAdminFields : label.getLabelCaption());
	 			%></label></strong></a></li>
	<li><a href="#" onclick="performThisFunction('earlyResolutionManagement');"><img src="images/earlyresolution.gif" border="0"/> <strong><label id="lblearlyresolution"><%
					String lblEarlyResolution = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId1,"lblearlyresolution");
					label = Label.getLabelUsingLabelId("lblearlyresolution");
	 				out.print(lblEarlyResolution != null ? lblEarlyResolution : label.getLabelCaption());
	 			%></label></strong></a></li>
	<li><a href="#" onclick="performThisFunction('investigatorAssignmentManagement');"><img src="images/investigator.png" border="0"/> <strong><label id="lblinvestigatorassignment"><%
					String lblInvestigatorAssignment = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId1,"lblinvestigatorassignment");
					label = Label.getLabelUsingLabelId("lblinvestigatorassignment");
	 				out.print(lblInvestigatorAssignment != null ? lblInvestigatorAssignment : label.getLabelCaption());
	 			%></label></strong></a></li>
	<li><a href="#" onclick="performThisFunction('investigationManagement');"><img src="images/casereview.gif" border="0"/> <strong><label id="lblinvestigationmanagement"><%
					String lblInvestigationManagement = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId1,"lblinvestigationmanagement");
					label = Label.getLabelUsingLabelId("lblinvestigationmanagement");
	 				out.print(lblInvestigationManagement != null ? lblInvestigationManagement : label.getLabelCaption());
	 			%></label></strong></a></li>
	<li><a href="#" onclick="performThisFunction('reportManagement');"><img src="images/report.png" border="0"/> <strong><label id="lblreport"><%
					String lblReport = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId1,"lblreport");
					label = Label.getLabelUsingLabelId("lblreport");
	 				out.print(lblReport != null ? lblReport : label.getLabelCaption());
	 			%></label></strong></a></li>
	<li><strong><a href="cms_user_mannual.pdf"><img src="images/usermanual.gif" border="0"/> <label id="lblusermanual"><%
					String lblUserManual = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId1,"lblusermanual");
					label = Label.getLabelUsingLabelId("lblusermanual");
	 				out.print(lblUserManual != null ? lblUserManual : label.getLabelCaption());
	 			%></label></a></strong></li>
</ul>
</div>
<%
	}else{
		%>
		 	<script type="text/javascript">
	        		document.location.href = "userhome.jsp";
	        </script>
	 	<%
	}
%>
