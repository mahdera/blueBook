<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<div>	
	<!-- Tabs -->
			
			<h3 class="tit"><label id="lblcasemanagementtab">
				<%
					String lblCaseManagementTab = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasemanagementtab");
					label = Label.getLabelUsingLabelId("lblcasemanagementtab");
	 				out.print(lblCaseManagementTab != null ? lblCaseManagementTab : label.getLabelCaption());
	 			%>
			</label></h3>  
			<div class="tabs box"> 
				<ul> 
					<li><a href="#.jsp" id="newCaseEntryLink"><span>
						<label id="lblnewcase">
							<%
								String lblNewCase = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnewcase");
								label = Label.getLabelUsingLabelId("lblnewcase");	
				 				out.print(lblNewCase != null ? lblNewCase : label.getLabelCaption());
				 			%>						
						</label></span></a></li>					 
					<li><a href="#.jsp" id="showListOfCasesLink"><span>
						<label id="lblviewcases">
							<%
								String lblViewCases = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblviewcases");
								label = Label.getLabelUsingLabelId("lblviewcases");
				 				out.print(lblViewCases != null ? lblViewCases : label.getLabelCaption());
				 			%>
						</label></span></a></li>					 
					<li><a href="#.jsp" id="showListOfCasesForEditLink"><span>
						<label id="lbleditcase">
							<%
								String lblEditCase = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbleditcase");
								label = Label.getLabelUsingLabelId("lbleditcase");
				 				out.print(lblEditCase != null ? lblEditCase : label.getLabelCaption());
				 			%>
						</label></span></a></li>
					<li><a href="#.jsp" id="showListOfCasesForDeleteLink"><span>
						<label id="lbldeletecase">
							<%
								String lblDeleteCase = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldeletecase");
								label = Label.getLabelUsingLabelId("lbldeletecase");
				 				out.print(lblDeleteCase != null ? lblDeleteCase : label.getLabelCaption());
				 			%>
						</label></span></a></li>
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
		$('#newCaseEntryLink').click(function(){
			$('#subTabDetailDiv').load('shownewcaseentryform.jsp');
		});
		
		$('#showListOfCasesLink').click(function(){
			$('#subTabDetailDiv').load('showlistofcases.jsp');
		});
		
		$('#showListOfCasesForEditLink').click(function(){
			$('#subTabDetailDiv').load('showlistofcasesforedit.jsp');
		});
		
		$('#showListOfCasesForDeleteLink').click(function(){
			$('#subTabDetailDiv').load('showlistofcasesfordelete.jsp');
		});
	});//end document.ready function
</script>