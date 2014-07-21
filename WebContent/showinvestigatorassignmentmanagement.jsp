<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<div>	
	<!-- Tabs -->
		<h3 class="tit"><label id="lblinvestigatorassignmentmanagementtab"><%
					String lblInvestigatorAssignmentManagemntTab = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblinvestigatorassignmentmanagementtab");
					label = Label.getLabelUsingLabelId("lblinvestigatorassignmentmanagementtab");
	 				out.print(lblInvestigatorAssignmentManagemntTab != null ? lblInvestigatorAssignmentManagemntTab : label.getLabelCaption());
	 			%></label></h3> 

		<div class="tabs box"> 
			<ul> 
				<li><a href="#.jsp" id="newInvestigatorAssignmentLink"><span><label id="lblnewinvestigatorassignment"><%
					String lblNewInvestigatorAssignment = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnewinvestigatorassignment");
					label = Label.getLabelUsingLabelId("lblnewinvestigatorassignment");
	 				out.print(lblNewInvestigatorAssignment != null ? lblNewInvestigatorAssignment : label.getLabelCaption());
	 			%></label></span></a></li>					 
				<li><a href="#.jsp" id="showListOfInvestigatorAssignmentsLink"><span><label id="lblviewinvestigatorassignments"><%
					String lblViewInvestigatorAssignment = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblviewinvestigatorassignments");
					label = Label.getLabelUsingLabelId("lblviewinvestigatorassignments");
	 				out.print(lblViewInvestigatorAssignment != null ? lblViewInvestigatorAssignment : label.getLabelCaption());
	 			%></label></span></a></li>					 
				<li><a href="#.jsp" id="showListOfInvestigatorAssignmentsForEditLink"><span><label id="lbleditinvestigatorassignment"><%
					String lblEditInvestigatorAssignment = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbleditinvestigatorassignment");
					label = Label.getLabelUsingLabelId("lbleditinvestigatorassignment");
	 				out.print(lblEditInvestigatorAssignment != null ? lblEditInvestigatorAssignment : label.getLabelCaption());
	 			%></label></span></a></li>
				<li><a href="#.jsp" id="showListOfInvestigatorAssignmentsForDeleteLink"><span><label id="lbldeleteinvestigatorassignment"><%
					String lblDeleteInvestigatorAssignment = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldeleteinvestigatorassignment");
					label = Label.getLabelUsingLabelId("lbldeleteinvestigatorassignment");
	 				out.print(lblDeleteInvestigatorAssignment != null ? lblDeleteInvestigatorAssignment : label.getLabelCaption());
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
		$('#newInvestigatorAssignmentLink').click(function(){
			$('#subTabDetailDiv').load('shownewinvestigatorassignmentform.jsp');
		});
		
		$('#showListOfInvestigatorAssignmentsLink').click(function(){
			$('#subTabDetailDiv').load('showlistofinvestigatorassignmentsinvestigatorselectorbar.jsp');
		});
		
		$('#showListOfInvestigatorAssignmentsForEditLink').click(function(){
			$('#subTabDetailDiv').load('showlistofinvestigatorassignmentsinvestigatorforeditselectorbar.jsp');
		});
		
		$('#showListOfInvestigatorAssignmentsForDeleteLink').click(function(){
			$('#subTabDetailDiv').load('showlistofinvestigatorassignmentsinvestigatorfordeleteselectorbar.jsp');
		});
	});//end document.ready function
</script>