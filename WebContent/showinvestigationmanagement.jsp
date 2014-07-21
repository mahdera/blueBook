<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<div>	
	<!-- Tabs -->
			
			<h3 class="tit">
				<label id="lblinvestigationmanagement">
					<%
						String lblInvestigationManagement = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblinvestigationmanagement");
						label = Label.getLabelUsingLabelId("lblinvestigationmanagement");
		 				out.print(lblInvestigationManagement != null ? lblInvestigationManagement : label.getLabelCaption());
		 			%>
				</label>
			</h3> 
			<div class="tabs box"> 
				<ul> 
					<li><a href="#.jsp" id="showNewInvestigationFormLink"><span><label id="lblnewinvestigation"><%
						String lblNewInvestigation = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnewinvestigation");
						label = Label.getLabelUsingLabelId("lblnewinvestigation");
		 				out.print(lblNewInvestigation != null ? lblNewInvestigation : label.getLabelCaption());
		 			%></label></span></a></li>					 
					<li><a href="#.jsp" id="showListOfInvestigationsLink"><span><label id="lblviewinvestigations"><%
						String lblViewInvestigations = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblviewinvestigations");
						label = Label.getLabelUsingLabelId("lblviewinvestigations");
		 				out.print(lblViewInvestigations != null ? lblViewInvestigations : label.getLabelCaption());
		 			%></label></span></a></li>					 
					<li><a href="#.jsp" id="showListOfInvestigationsForEditLink"><span><label id="lbleditinvestigations"><%
						String lblEditInvestigations = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbleditinvestigations");
						label = Label.getLabelUsingLabelId("lbleditinvestigations");
		 				out.print(lblEditInvestigations != null ? lblEditInvestigations : label.getLabelCaption());
		 			%></label></span></a></li>
					<li><a href="#.jsp" id="showListOfInvestigationsForDeleteLink"><span><label id="lbldeleteinvestigation"><%
						String lblDeleteInvestigation = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldeleteinvestigation");
						label = Label.getLabelUsingLabelId("lbldeleteinvestigation");
		 				out.print(lblDeleteInvestigation != null ? lblDeleteInvestigation : label.getLabelCaption());
		 			%></label></span></a></li>
				</ul> 
				<span id="ajaxLoaderSpanTab" style="visibility:hidden">
 					<img src="design/loading.gif" border="0"/>
 				</span>
			</div> <!-- /tabs --> 
			 
			<div id="tabDetailDiv"> 			
				<label id="lblclickonthemanagementtabs">
						<%
							String lblClickOnTheManagementTabs = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblclickonthemanagementtabs");
							label = Label.getLabelUsingLabelId("lblclickonthemanagementtabs");
			 				out.print(lblClickOnTheManagementTabs != null ? lblClickOnTheManagementTabs : label.getLabelCaption());
			 			%>
					</label>		
			</div>			
			<div id="subTabDetailDiv"></div>
			<div class="fix"></div> 
</div>
 <script type="text/javascript">
 	$(document).ready(function(){
 		$('#showNewInvestigationFormLink').click(function(){
 			$('#subTabDetailDiv').load('shownewinvestigationform.jsp');
 		});
 		
		$('#showListOfInvestigationsLink').click(function(){
			$('#subTabDetailDiv').load('showlistofinvestigationsapplicantselectorbar.jsp');
 		});
		
		$('#showListOfInvestigationsForEditLink').click(function(){
			$('#subTabDetailDiv').load('showlistofinvestigationsapplicantforeditselectorbar.jsp');
 		});
 		
		$('#showListOfInvestigationsForDeleteLink').click(function(){
			$('#subTabDetailDiv').load('showlistofinvestigationsapplicantfordeleteselectorbar.jsp');
		});
 		
 	});//end document.ready function
 </script>