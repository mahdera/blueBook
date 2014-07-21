<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<div>	
	<!-- Tabs -->
			<h3 class="tit"><label id="lblnewcasemanagementlisttab"><%
					String lblNewCasesManagementListTab = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnewcasemanagementlisttab");
					label = Label.getLabelUsingLabelId("lblnewcasemanagementlisttab");
	 				out.print(lblNewCasesManagementListTab != null ? lblNewCasesManagementListTab : label.getLabelCaption());
	 			%></label></h3> 
			<div class="tabs box"> 
				<ul> 
					<li><a href="#.jsp" id="showListOfNewCasesLink"><span><label id="lblshowlistofnewcases"><%
					String lblCaseManagementTab = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblshowlistofnewcases");
					label = Label.getLabelUsingLabelId("lblshowlistofnewcases");
	 				out.print(lblCaseManagementTab != null ? lblCaseManagementTab : label.getLabelCaption());
	 			%></label></span></a></li>					
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
		$('#showListOfNewCasesLink').click(function(){
			$('#subTabDetailDiv').load('showlistofnewcasesassignedtoinvestigator.jsp');
		});
	});//end document.ready function
</script>