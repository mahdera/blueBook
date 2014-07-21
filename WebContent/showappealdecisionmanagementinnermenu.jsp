<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<div>	
	<!-- Tabs -->
		<h3 class="tit"><label id="lblappealdecisionmanagementtab"><%
					String lblAppealDecisionManagementTab = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblappealdecisionmanagementtab");
					label = Label.getLabelUsingLabelId("lblappealdecisionmanagementtab");
	 				out.print(lblAppealDecisionManagementTab != null ? lblAppealDecisionManagementTab : label.getLabelCaption());
	 			%></label></h3> 

		<div class="tabs box"> 
			<ul> 
				<li><a href="#.jsp" id="newAppealDecisionEntryLink"><span><label id="lblnewappealdecision"><%
					String lblNewAppealDecision = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnewappealdecision");
					label = Label.getLabelUsingLabelId("lblnewappealdecision");
	 				out.print(lblNewAppealDecision != null ? lblNewAppealDecision : label.getLabelCaption());
	 			%></label></span></a></li>					 
				<li><a href="#.jsp" id="showListOfAppealDecisionsLink"><span><label id="lblviewappealdecisions"><%
					String lblViewAppealDecisions = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblviewappealdecisions");
					label = Label.getLabelUsingLabelId("lblviewappealdecisions");
	 				out.print(lblViewAppealDecisions != null ? lblViewAppealDecisions : label.getLabelCaption());
	 			%></label></span></a></li>					 
				<li><a href="#.jsp" id="showListOfAppealDecisionsForEditLink"><span><label id="lbleditappealdecision"><%
					String lblEditAppealDecision = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbleditappealdecision");
					label = Label.getLabelUsingLabelId("lbleditappealdecision");
	 				out.print(lblEditAppealDecision != null ? lblEditAppealDecision : label.getLabelCaption());
	 			%></label></span></a></li>
				<li><a href="#.jsp" id="showListOfAppealDecisionsForDeleteLink"><span><label id="lbldeleteappealdecision"><%
					String lblDeleteAppealDecision = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldeleteappealdecision");
					label = Label.getLabelUsingLabelId("lbldeleteappealdecision");
	 				out.print(lblDeleteAppealDecision != null ? lblDeleteAppealDecision : label.getLabelCaption());
	 			%></label></span></a></li>
			</ul> 
			<span id="ajaxLoaderSpanTab" style="visibility:hidden">
					<img src="design/loading.gif" border="0"/>
				</span>
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
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#newAppealDecisionEntryLink').click(function(){
			$('#subTabDetailDiv').load('shownewappealdecisionentryform.jsp');
		});
		
		$('#showListOfAppealDecisionsLink').click(function(){
			$('#subTabDetailDiv').load('showlistofappealdecisionsapplicantselectorbar.jsp');
		});
		
		$('#showListOfAppealDecisionsForEditLink').click(function(){
			$('#subTabDetailDiv').load('showlistofappealdecisionsapplicantforeditselectorbar.jsp');
		});
		
		$('#showListOfAppealDecisionsForDeleteLink').click(function(){
			$('#subTabDetailDiv').load('showlistofappealdecisionsapplicantfordeleteselectorbar.jsp');
		});
	});//end document.ready function
</script>