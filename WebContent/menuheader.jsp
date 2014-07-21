<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%@page import="java.util.*" %>
<!-- Menu --> 
	<div id="menu" class="box">		
		<%	
			int langId = Integer.parseInt(session.getAttribute("langId").toString());
			Account att = (Account)session.getAttribute("account");
			User userObject1 = null;
			if(att != null){
			 	userObject1 = User.getUser(att.getUserId());
			
			Account acct = (Account)session.getAttribute("account");	
			User user1 = User.getUser(acct.getUserId());
			String userType = user1.getUserType();
			List<Functionality> functionalityList = Functionality.getAllFunctionalitiesForUser(userType,"All");
			Iterator<Functionality> functionalityItr = functionalityList.iterator();
		%> 
		<ul class="box"> 
			<%
			String lblMenuName = null;
			while(functionalityItr.hasNext()){
				Functionality functionality = functionalityItr.next();
				MenuTranslation menuTranslation = MenuTranslation.getMenuTranslationForThisLanguageAndMenu(langId,functionality.getId());
				%>
					<li><strong><a href="#" title="<%
							out.print(menuTranslation != null ? menuTranslation.getTranslatedDescription() : functionality.getDescription()); 
						%>" onclick="performThisFunction('<%=functionality.getFunctionalityName() %>')">
						<span>
							<%								
								out.print(menuTranslation != null ? menuTranslation.getTranslatedValue() : functionality.getMenuName());
							%>
						</span></a></strong></li>
				<%				
			}//end while loop
			%>			 
		</ul> 
</div> <!-- /header -->
<%
			}else{
				 %>
				 	<script type="text/javascript">
	                		document.location.href = "userhome.jsp";
	                </script>
				 <%
			}
%>
<script type="text/javascript">
function performThisFunction(menuName) {
	if (menuName == "accountManagement") {
		$('#content').load('showaccountmanagement.jsp');
	} else if (menuName == "applicantManagement") {
		$('#content').load('showapplicantmanagement.jsp');
	} else if (menuName == "adminFieldsManagement") {
		$('#content').load('showadminfieldsmanagement.jsp');		
	} else if (menuName == "caseReviewManagement") {
		$('#content').load('showcasereviewmanagement.jsp');		
	} else if (menuName == "earlyResolutionManagement") {//intake officer
		$('#content').load('showearlyresolutionmanagement.jsp');		
	} else if (menuName == "investigatorAssignmentManagement") {
		$('#content').load('showinvestigatorassignmentmanagement.jsp');
	} else if (menuName == "investigationTaskManagement") {
		$('#content').load('showinvestigationmanagement.jsp');		
	}else if(menuName == "caseManagement"){
		$('#content').load('showcasemanagement.jsp');
	}else if(menuName == "followupManagement"){
		$('#content').load('showfollowupmanagement.jsp');		
	}else if(menuName == "agreementManagement"){
		$('#content').load('showagreementmanagement.jsp');		
	}else if(menuName == "caseCategoryManagement"){
		$('#content').load('showcasecategorymanagement.jsp');		
	}else if(menuName == "respondentManagement"){
		$('#content').load('showrespondentmanagement.jsp');
	}else if(menuName == "decisionManagement"){
		$('#content').load('showdecisionmanagement.jsp');
	}else if(menuName == "reportManagement"){
		$('#content').load('showreportmanagement.jsp');		
	}else if(menuName == "intakeProcessManagement"){
		$('#content').load('showintakeprocessmanagementform.jsp');		
	}else if(menuName == "applicantRegistrationManagement"){//intake officer
		$('#content').load('showapplicantmanagement.jsp');
	}else if(menuName == "caseRegistrationManagement"){//intake officer
		$('#content').load('showcasemanagement.jsp');
	}else if(menuName == "respondentRegistrationManagement"){//intake officer
		$('#content').load('showrespondentmanagement.jsp');
	}else if(menuName == "investigatorAssignementManagement"){//intake officer
		$('#content').load('showinvestigatorassignmentmanagement.jsp');
	}else if(menuName == "investigatorManagement"){
		$('#content').load('showinvestigatormanagement.jsp');
	}else if(menuName == "caseListManagement"){
		$('#content').load('shownewcasesmanagement.jsp');
	}else if(menuName == "activeCasesManagement"){
		$('#content').load('showactivecasesmanagement.jsp');
	}else if(menuName == "appealManagement"){
		$('#content').load('showappealmanagementinnermenu.jsp');
	}else if(menuName == "appealDecision"){
		$('#content').load('showappealdecisionmanagementinnermenu.jsp');
	}
}//end function...
</script> 