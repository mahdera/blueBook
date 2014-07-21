<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<div>	
	<!-- Tabs -->
			
			<h3 class="tit">
				<label id="lblinvestigatormanagementtab">
					<%
						String lblInvestigatorManagementTab = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblinvestigatormanagementtab");
						label = Label.getLabelUsingLabelId("lblinvestigatormanagementtab");
		 				out.print(lblInvestigatorManagementTab != null ? lblInvestigatorManagementTab : label.getLabelCaption());
		 			%>
				</label>	
			</h3> 
 
			<div class="tabs box"> 
				<ul> 
					<li><a href="#.jsp" id="newInvestigatorLink"><span><label id="lblnewinvestigator"><%
						String lblNewInvestigator = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnewinvestigator");
						label = Label.getLabelUsingLabelId("lblnewinvestigator");
		 				out.print(lblNewInvestigator != null ? lblNewInvestigator : label.getLabelCaption());
		 			%></label></span></a></li>					 
					<li><a href="#.jsp" id="showListOfInvestigatorsLink"><span><label id="lblviewinvestigators"><%
						String lblViewInvestigators = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblviewinvestigators");
						label = Label.getLabelUsingLabelId("lblviewinvestigators");
		 				out.print(lblViewInvestigators != null ? lblViewInvestigators : label.getLabelCaption());
		 			%></label></span></a></li>					 
					<li><a href="#.jsp" id="showListOfInvestigatorsForEditLink"><span><label id="lbleditinvestigator"><%
						String lblEditInvestigator = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbleditinvestigator");
						label = Label.getLabelUsingLabelId("lbleditinvestigator");
		 				out.print(lblEditInvestigator != null ? lblEditInvestigator : label.getLabelCaption());
		 			%></label></span></a></li>
					<li><a href="#.jsp" id="showListOfInvestigatorsForDeleteLink"><span><label id="lbldeleteinvestigator"><%
						String lblDeleteInvestigator = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldeleteinvestigator");
						label = Label.getLabelUsingLabelId("lbldeleteinvestigator");
		 				out.print(lblDeleteInvestigator != null ? lblDeleteInvestigator : label.getLabelCaption());
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
		$('#newInvestigatorLink').click(function(){
			$('#subTabDetailDiv').load('shownewinvestigatorform.jsp');
		});
		
		$('#showListOfInvestigatorsLink').click(function(){
			$('#subTabDetailDiv').load('showlistofinvestigators.jsp');
		});
		
		$('#showListOfInvestigatorsForEditLink').click(function(){
			$('#subTabDetailDiv').load('showlistofinvestigatorsforedit.jsp');
		});
		
		$('#showListOfInvestigatorsForDeleteLink').click(function(){
			$('#subTabDetailDiv').load('showlistofinvestigatorsfordelete.jsp');
		});
	});//end document.ready function
</script>