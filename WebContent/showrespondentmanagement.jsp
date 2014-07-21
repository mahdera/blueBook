<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<div>	
	<!-- Tabs -->
			
			<h3 class="tit"><label id="lblrespondentmanagementtab"><%
					String lblRespondentManagementTab = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrespondentmanagementtab");
					label = Label.getLabelUsingLabelId("lblrespondentmanagementtab");
	 				out.print(lblRespondentManagementTab != null ? lblRespondentManagementTab : label.getLabelCaption());
	 			%></label></h3> 
 
			<div class="tabs box"> 
				<ul> 
					<li><a href="#.jsp" id="newRespondentLink"><span><label id="lblnewrespondent"><%
					String lblNewRespondent = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnewrespondent");
					label = Label.getLabelUsingLabelId("lblnewrespondent");
	 				out.print(lblNewRespondent != null ? lblNewRespondent : label.getLabelCaption());
	 			%></label></span></a></li>					 
					<li><a href="#.jsp" id="showListOfRespondentsLink"><span><label id="lblviewrespondents"><%
					String lblViewRespondents = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblviewrespondents");
					label = Label.getLabelUsingLabelId("lblviewrespondents");
	 				out.print(lblViewRespondents != null ? lblViewRespondents : label.getLabelCaption());
	 			%></label></span></a></li>					 
					<li><a href="#.jsp" id="showListOfRespondentsForEditLink"><span><label id="lbleditrespondent"><%
					String lblEditRespondent = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbleditrespondent");
					label = Label.getLabelUsingLabelId("lbleditrespondent");
	 				out.print(lblEditRespondent != null ? lblEditRespondent : label.getLabelCaption());
	 			%></label></span></a></li>
					<li><a href="#.jsp" id="showListOfRespondentsForDeleteLink"><span><label id="lbldeleterespondent"><%
					String lblDeleteRespondent = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldeleterespondent");
					label = Label.getLabelUsingLabelId("lbldeleterespondent");
	 				out.print(lblDeleteRespondent != null ? lblDeleteRespondent : label.getLabelCaption());
	 			%></label></span></a></li>
				</ul> 
				<span id="ajaxLoaderSpanTab" style="visibility:hidden">
 					<img src="design/loading.gif" border="0"/>
 				</span>
			</div> <!-- /tabs --> 
			 
			<div id="tabDetailDiv"> 			
				<p class="msg info"><label id="lblclickonthemanagementtabs"><%
						String lblClickOnTheManagementTabs = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblclickonthemanagementtabs");
						label = Label.getLabelUsingLabelId("lblclickonthemanagementtabs");
		 				out.print(lblClickOnTheManagementTabs != null ? lblClickOnTheManagementTabs : label.getLabelCaption());
		 			%>
				</p>			
			</div>			
			<div id="subTabDetailDiv"></div>
			<div class="fix"></div> 
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#newRespondentLink').click(function(){
			$('#subTabDetailDiv').load('shownewrespondentform.jsp');
		});
		
		$('#showListOfRespondentsLink').click(function(){
			$('#subTabDetailDiv').load('showlistofrespondents.jsp');
		});
		
		$('#showListOfRespondentsForEditLink').click(function(){
			$('#subTabDetailDiv').load('showlistofrespondentsforedit.jsp');
		});
		
		$('#showListOfRespondentsForDeleteLink').click(function(){
			$('#subTabDetailDiv').load('showlistofrespondentsfordelete.jsp');
		});
	});//end document.ready function
</script>