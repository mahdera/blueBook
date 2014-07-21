<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<div>	
	<!-- Tabs -->
		<h3 class="tit"><label id="lbldecisionmanagementtab"><%
					String lblDecisionManagementTab = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldecisionmanagementtab");
					label = Label.getLabelUsingLabelId("lbldecisionmanagementtab");
	 				out.print(lblDecisionManagementTab != null ? lblDecisionManagementTab : label.getLabelCaption());
	 			%></label></h3> 

		<div class="tabs box"> 
			<ul> 
				<li><a href="#.jsp" id="newDecisionEntryLink"><span><label id="lblnewdecision"><%
					String lblNewDecision = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnewdecision");
					label = Label.getLabelUsingLabelId("lblnewdecision");
	 				out.print(lblNewDecision != null ? lblNewDecision : label.getLabelCaption());
	 			%></label></span></a></li>					 
				<li><a href="#.jsp" id="showListOfDecisionsLink"><span><label id="lblviewdecisions"><%
					String lblViewDecisions = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblviewdecisions");
					label = Label.getLabelUsingLabelId("lblviewdecisions");
	 				out.print(lblViewDecisions != null ? lblViewDecisions : label.getLabelCaption());
	 			%></label></span></a></li>					 
				<li><a href="#.jsp" id="showListOfDecisionsForEditLink"><span><label id="lbleditdecision"><%
					String lblEditDecision = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbleditdecision");
					label = Label.getLabelUsingLabelId("lbleditdecision");
	 				out.print(lblEditDecision != null ? lblEditDecision : label.getLabelCaption());
	 			%></label></span></a></li>
				<li><a href="#.jsp" id="showListOfDecisionsForDeleteLink"><span><label id="lbldeletedecision"><%
					String lblDeleteDecision = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldeletedecision");
					label = Label.getLabelUsingLabelId("lbldeletedecision");
	 				out.print(lblDeleteDecision != null ? lblDeleteDecision : label.getLabelCaption());
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
		$('#newDecisionEntryLink').click(function(){
			$('#subTabDetailDiv').load('shownewdecisionentryform.jsp');
		});
		
		$('#showListOfDecisionsLink').click(function(){
			$('#subTabDetailDiv').load('showlistofdecisionsapplicantselectorbar.jsp');
		});
		
		$('#showListOfDecisionsForEditLink').click(function(){
			$('#subTabDetailDiv').load('showlistofdecisionsapplicantforeditselectorbar.jsp');
		});
		
		$('#showListOfDecisionsForDeleteLink').click(function(){
			$('#subTabDetailDiv').load('showlistofdecisionsapplicantfordeleteselectorbar.jsp');
		});
	});//end document.ready function
</script>