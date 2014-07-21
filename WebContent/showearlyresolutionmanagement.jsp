<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<div>	
	<!-- Tabs -->
			
			<h3 class="tit"><label id="lblearlyresolutionmanagementtab"><%
					String lblEarlyResolutionManagementTab = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblearlyresolutionmanagementtab");
					label = Label.getLabelUsingLabelId("lblearlyresolutionmanagementtab");
	 				out.print(lblEarlyResolutionManagementTab != null ? lblEarlyResolutionManagementTab : label.getLabelCaption());
	 			%></label></h3> 
 
			<div class="tabs box"> 
				<ul> 
					<li><a href="#.jsp" id="newEarlyResolutionLink"><span><label id="lblnewearlyresolution"><%
					String lblNewEarlyResolution = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnewearlyresolution");
					label = Label.getLabelUsingLabelId("lblnewearlyresolution");
	 				out.print(lblNewEarlyResolution != null ? lblNewEarlyResolution : label.getLabelCaption());
	 			%></label></span></a></li>					 
					<li><a href="#.jsp" id="showListOfEarlyResolutionsLink"><span><label id="lblviewearlyresolution"><%
					String lblViewEarlyResolution = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblviewearlyresolution");
					label = Label.getLabelUsingLabelId("lblviewearlyresolution");
	 				out.print(lblViewEarlyResolution != null ? lblViewEarlyResolution : label.getLabelCaption());
	 			%></label></span></a></li>					 
					<li><a href="#.jsp" id="showListOfEarlyResolutionsForEditLink"><span><label id="lbleditearlyresolution"><%
					String lblEditEarlyResolution = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbleditearlyresolution");
					label = Label.getLabelUsingLabelId("lbleditearlyresolution");
	 				out.print(lblEditEarlyResolution != null ? lblEditEarlyResolution : label.getLabelCaption());
	 			%></label></span></a></li>
					<li><a href="#.jsp" id="showListOfEarlyResolutionsForDeleteLink"><span><label id="lbldeleteearlyresolution"><%
					String lblDeleteEarlyResolution = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldeleteearlyresolution");
					label = Label.getLabelUsingLabelId("lbldeleteearlyresolution");
	 				out.print(lblDeleteEarlyResolution != null ? lblDeleteEarlyResolution : label.getLabelCaption());
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
		$('#newEarlyResolutionLink').click(function(){
			$('#subTabDetailDiv').load('shownewearlyresolutionentryform.jsp');
		});
		
		$('#showListOfEarlyResolutionsLink').click(function(){
			$('#subTabDetailDiv').load('showlistofearlyresolutionapplicantselectorbar.jsp');
		});
		
		$('#showListOfEarlyResolutionsForEditLink').click(function(){
			$('#subTabDetailDiv').load('showlistofearlyresolutionforeditapplicantselectorbar.jsp');
		});
		
		$('#showListOfEarlyResolutionsForDeleteLink').click(function(){
			$('#subTabDetailDiv').load('showlistofearlyresolutionfordeleteapplicantselectorbar.jsp');
		});
	});//end document.ready function
</script>