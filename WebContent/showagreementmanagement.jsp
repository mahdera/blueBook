<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<div>	
	<!-- Tabs -->	
		<h3 class="tit"><label id="lblagreementmanagementtab"><%
					String lblAgreementManagementTab = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblagreementmanagementtab");
					label = Label.getLabelUsingLabelId("lblagreementmanagementtab");
	 				out.print(lblAgreementManagementTab != null ? lblAgreementManagementTab : label.getLabelCaption());
	 			%></label></h3> 

		<div class="tabs box"> 
			<ul> 
				<li><a href="#.jsp" id="newAgreementLink"><span><label id="lblnewagreement"><%
					String lblNewAgreement = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnewagreement");
					label = Label.getLabelUsingLabelId("lblnewagreement");
	 				out.print(lblNewAgreement != null ? lblNewAgreement : label.getLabelCaption());
	 			%></label></span></a></li>					 
				<li><a href="#.jsp" id="showListOfAgreementsLink"><span><label id="lblviewagreement"><%
					String lblViewAgreement = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblviewagreement");
					label = Label.getLabelUsingLabelId("lblviewagreement");
	 				out.print(lblViewAgreement != null ? lblViewAgreement : label.getLabelCaption());
	 			%></label></span></a></li>					 
				<li><a href="#.jsp" id="showListOfAgreementsForEditLink"><span><label id="lbleditagreement"><%
					String lblEditAgreement = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbleditagreement");
					label = Label.getLabelUsingLabelId("lbleditagreement");
	 				out.print(lblEditAgreement != null ? lblEditAgreement : label.getLabelCaption());
	 			%></label></span></a></li>
				<li><a href="#.jsp" id="showListOfAgreementsForDeleteLink"><span><label id="lbldeleteagreement"><%
					String lblDeleteagreement = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldeleteagreement");
					label = Label.getLabelUsingLabelId("lbldeleteagreement");
	 				out.print(lblDeleteagreement != null ? lblDeleteagreement : label.getLabelCaption());
	 			%></label></span></a></li>
			</ul>				
		</div> <!-- /tabs --> 
		 
		<div id="tabDetailDiv"> 			
			<p class="msg info">
				<label id="lblclickonthemanagementtabs">					
					<%
						String lblClickOnTheManagementTabs = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblclickonthemanagementtabs");
		 				out.print(lblClickOnTheManagementTabs != null ? lblClickOnTheManagementTabs : "Click on the management tabs for manipulating fields");
		 			%>
				</label>
			</p>			
		</div>			
		<div id="subTabDetailDiv"></div>
		<div class="fix"></div> 
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#newAgreementLink').click(function(){
			$('#subTabDetailDiv').load('shownewagreementform.jsp');
		});
		
		$('#showListOfAgreementsLink').click(function(){
			$('#subTabDetailDiv').load('showlistofagreements.jsp');
		});
		
		$('#showListOfAgreementsForEditLink').click(function(){
			$('#subTabDetailDiv').load('showlistofagreementsforedit.jsp');
		});
		
		$('#showListOfAgreementsForDeleteLink').click(function(){
			$('#subTabDetailDiv').load('showlistofagreementsfordelete.jsp');
		});
	});//end document.ready funciton
</script>