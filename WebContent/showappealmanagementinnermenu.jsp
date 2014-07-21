<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<div>	
	<!-- Tabs -->
		<h3 class="tit"><label id="lblappealmanagementtab"><%
					String lblAppealManagementTab = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblappealmanagementtab");
					label = Label.getLabelUsingLabelId("lblappealmanagementtab");
	 				out.print(lblAppealManagementTab != null ? lblAppealManagementTab : label.getLabelCaption());
	 			%></label></h3> 

		<div class="tabs box"> 
			<ul> 
				<li><a href="#.jsp" id="newAppealEntryLink"><span><label id="lblnewappeal"><%
					String lblNewAppeal = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnewappeal");
					label = Label.getLabelUsingLabelId("lblnewappeal");
	 				out.print(lblNewAppeal != null ? lblNewAppeal : label.getLabelCaption());
	 			%></label></span></a></li>					 
				<li><a href="#.jsp" id="showListOfAppealsLink"><span><label id="lblviewappeals"><%
					String lblViewAppeals = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblviewappeals");
					label = Label.getLabelUsingLabelId("lblviewappeals");
	 				out.print(lblViewAppeals != null ? lblViewAppeals : label.getLabelCaption());
	 			%></label></span></a></li>					 
				<li><a href="#.jsp" id="showListOfAppealsForEditLink"><span><label id="lbleditappeal"><%
					String lblEditAppeal = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbleditappeal");
					label = Label.getLabelUsingLabelId("lbleditappeal");
	 				out.print(lblEditAppeal != null ? lblEditAppeal : label.getLabelCaption());
	 			%></label></span></a></li>
				<li><a href="#.jsp" id="showListOfAppealsForDeleteLink"><span><label id="lbldeleteappeal"><%
					String lblDeleteAppeal = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldeleteappeal");
					label = Label.getLabelUsingLabelId("lbldeleteappeal");
	 				out.print(lblDeleteAppeal != null ? lblDeleteAppeal : label.getLabelCaption());
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
		$('#newAppealEntryLink').click(function(){
			$('#subTabDetailDiv').load('shownewappealentryform.jsp');
		});
		
		$('#showListOfAppealsLink').click(function(){
			$('#subTabDetailDiv').load('showlistofappealsapplicantselectorbar.jsp');
		});
		
		$('#showListOfAppealsForEditLink').click(function(){
			$('#subTabDetailDiv').load('showlistofappealsapplicantforeditselectorbar.jsp');
		});
		
		$('#showListOfAppealsForDeleteLink').click(function(){
			$('#subTabDetailDiv').load('showlistofappealsapplicantfordeleteselectorbar.jsp');
		});
	});//end document.ready function
</script>