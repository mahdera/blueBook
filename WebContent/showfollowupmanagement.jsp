<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<div>	
	<!-- Tabs -->
		<h3 class="tit"><label id="lblfollowupmanagementtab"><%
						String lblFollowupManagementTab = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblfollowupmanagementtab");
						label = Label.getLabelUsingLabelId("lblfollowupmanagementtab");
		 				out.print(lblFollowupManagementTab != null ? lblFollowupManagementTab : label.getLabelCaption());
		 			%></label>			
		</h3> 
		<div class="tabs box"> 
			<ul> 
				<li><a href="#.jsp" id="newFollowupLink"><span><label id="lblnewfollowup"><%
						String lblNewFollowup = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnewfollowup");
						label = Label.getLabelUsingLabelId("lblnewfollowup");
		 				out.print(lblNewFollowup != null ? lblNewFollowup : label.getLabelCaption());
		 			%></label></span></a></li>					 
				<li><a href="#.jsp" id="showListOfFollowupsLink"><span><label id="lblviewfollowup"><%
						String lblViewFollowup = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblviewfollowup");
						label = Label.getLabelUsingLabelId("lblviewfollowup");
		 				out.print(lblViewFollowup != null ? lblViewFollowup : label.getLabelCaption());
		 			%></label></span></a></li>					 
				<li><a href="#.jsp" id="showListOfFollowupsForEditLink"><span><label id="lbleditfollowup"><%
						String lblEditFollowup = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbleditfollowup");
						label = Label.getLabelUsingLabelId("lbleditfollowup");
		 				out.print(lblEditFollowup != null ? lblEditFollowup : label.getLabelCaption());
		 			%></label></span></a></li>
				<li><a href="#.jsp" id="showListOfFollowupsForDeleteLink"><span><label id="lbldeletefollowup"><%
						String lblDeleteFollowup = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldeletefollowup");
						label = Label.getLabelUsingLabelId("lbldeletefollowup");
		 				out.print(lblDeleteFollowup != null ? lblDeleteFollowup : label.getLabelCaption());
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
		$('#newFollowupLink').click(function(){
			$('#subTabDetailDiv').load('shownewfollowupform.jsp');
		});
		
		$('#showListOfFollowupsLink').click(function(){
			$('#subTabDetailDiv').load('showlistoffollowupsapplicantselectorbar.jsp');
		});
		
		$('#showListOfFollowupsForEditLink').click(function(){
			$('#subTabDetailDiv').load('showlistoffollowupsapplicantforeditselectorbar.jsp');
		});
		
		$('#showListOfFollowupsForDeleteLink').click(function(){
			$('#subTabDetailDiv').load('showlistoffollowupsapplicantfordeleteselectorbar.jsp');
		});
	});//end document.ready function
</script>