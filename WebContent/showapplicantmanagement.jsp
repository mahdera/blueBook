<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<div style="min-height:600px">
	<%
		int langId = Integer.parseInt(session.getAttribute("langId").toString());
	%>	
	<!-- Tabs -->
			
			<h3 class="tit"><label id="lblapplicantbasicinformation">				
				<%
					String lblApplicantBasicInformation = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblapplicantbasicinformation");					
	 				out.print(lblApplicantBasicInformation != null ? lblApplicantBasicInformation : "Applicant Basic Information");
	 			%>
			</label></h3> 
 
			<div class="tabs box"> 
				<ul> 
					<li><a href="#.jsp" id="newApplicantRegistrationLink"><span>
						<label id="lblnewapplicant">
							<%
								String lblNewApplicant = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnewapplicant");								
				 				out.print(lblNewApplicant != null ? lblNewApplicant : "New Applicant");
				 			%>
						</label></span></a></li>					 
					<li><a href="#.jsp" id="showListOfApplicantsLink"><span>
						<label id="lblviewapplicants">
							<%
								String lblViewApplicant = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblviewapplicants");								
				 				out.print(lblViewApplicant != null ? lblViewApplicant : "View Applicants");
				 			%>
						</label></span></a></li>					 
					<li><a href="#.jsp" id="showListOfApplicantsForEditLink"><span>
						<label id="lbleditapplicant">
							<%
								String lblEditApplicant = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbleditapplicant");								
				 				out.print(lblEditApplicant != null ? lblEditApplicant : "Edit Applicant");
				 			%>
						</label></span></a></li>
					<li><a href="#.jsp" id="showListOfApplicantsForDeleteLink"><span>
						<label id="lbldeleteapplicant">
							<%
								String lblDeleteApplicant = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldeleteapplicant");								
				 				out.print(lblDeleteApplicant != null ? lblDeleteApplicant : "Delete Applicant");
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
		$('#newApplicantRegistrationLink').click(function(){
			$('#tabDetailDiv').load('shownewapplicantentryform.jsp');
		});
		
		$('#showListOfApplicantsLink').click(function(){
			$('#tabDetailDiv').load('showlistofapplicantsfilterbar.jsp');
		});
		
		$('#showListOfApplicantsForEditLink').click(function(){
			$('#tabDetailDiv').load('showlistofapplicantsfilterbarforedit.jsp');
		});
		
		$('#showListOfApplicantsForDeleteLink').click(function(){
			$('#tabDetailDiv').load('showlistofapplicantsfilterbarfordelete.jsp');
		});
	});//end document.ready function
</script>