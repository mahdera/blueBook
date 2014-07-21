<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
int langId = Integer.parseInt(session.getAttribute("langId").toString());
Label label = null;
%>
<div>	
	<!-- Tabs -->
			<h3 class="tit"><label id="lblactivecasemanagementlisttab"><%
					String lblActiveCaseManagementListTab = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblactivecasemanagementlisttab");
					label = Label.getLabelUsingLabelId("lblactivecasemanagementlisttab");
	 				out.print(lblActiveCaseManagementListTab != null ? lblActiveCaseManagementListTab : label.getLabelCaption());
	 			%></label></h3> 
			<div class="tabs box"> 
				<ul> 
					<li><a href="#.jsp" id="showListOfActiveCasesLink"><span><label id="lblshowlistofactivecases"><%
					String lblShowListOfActiveCases = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblshowlistofactivecases");
					label = Label.getLabelUsingLabelId("lblshowlistofactivecases");
	 				out.print(lblShowListOfActiveCases != null ? lblShowListOfActiveCases : label.getLabelCaption());
	 			%></label></span></a></li>					
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
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#showListOfActiveCasesLink').click(function(){
			$('#subTabDetailDiv').load('showlistofactivecasesassignedtoinvestigator.jsp');
		});
	});//end document.ready function
</script>