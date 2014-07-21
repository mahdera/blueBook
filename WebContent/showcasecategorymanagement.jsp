<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<div>	
	<!-- Tabs -->
			
			<h3 class="tit"><label id="lblcasecategorymanagementtab"><%
						String lblCaseCategoryManagementTab = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblcasecategorymanagementtab");
						label = Label.getLabelUsingLabelId("lblcasecategorymanagementtab");
		 				out.print(lblCaseCategoryManagementTab != null ? lblCaseCategoryManagementTab : label.getLabelCaption());
		 			%></label>			
			</h3> 
 
			<div class="tabs box"> 
				<ul> 
					<li><a href="#.jsp" id="newCaseCategoryLink"><span><label id="lblnewcasecategory"><%
						String lblNewCaseCategory = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblnewcasecategory");
						label = Label.getLabelUsingLabelId("lblnewcasecategory");
		 				out.print(lblNewCaseCategory != null ? lblNewCaseCategory : label.getLabelCaption());
		 			%></label></span></a></li>					 
					<li><a href="#.jsp" id="showListOfCaseCategoriesLink"><span><label id="lblviewcasecategories"><%
						String lblViewCaseCategories = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblviewcasecategories");
						label = Label.getLabelUsingLabelId("lblviewcasecategories");
		 				out.print(lblViewCaseCategories != null ? lblViewCaseCategories : label.getLabelCaption());
		 			%></label></span></a></li>					 
					<li><a href="#.jsp" id="showListOfCaseCategoriesForEditLink"><span><label id="lbleditcasecategory"><%
						String lblEditCaseCategory = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbleditcasecategory");
						label = Label.getLabelUsingLabelId("lbleditcasecategory");
		 				out.print(lblEditCaseCategory != null ? lblEditCaseCategory : label.getLabelCaption());
		 			%></label></span></a></li>
					<li><a href="#.jsp" id="showListOfCaseCategoriesForDeleteLink"><span><label id="lbldeletecasecategory"><%
						String lblDeleteCaseCategory = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldeletecasecategory");
						label = Label.getLabelUsingLabelId("lbldeletecasecategory");
		 				out.print(lblDeleteCaseCategory != null ? lblDeleteCaseCategory : label.getLabelCaption());
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
		$('#newCaseCategoryLink').click(function(){
			$('#subTabDetailDiv').load('shownewcasecategoryform.jsp');
		});
		
		$('#showListOfCaseCategoriesLink').click(function(){
			$('#subTabDetailDiv').load('showlistofcasecategories.jsp');
		});
		
		$('#showListOfCaseCategoriesForEditLink').click(function(){
			$('#subTabDetailDiv').load('showlistofcasecategoriesforedit.jsp');
		});
		
		$('#showListOfCaseCategoriesForDeleteLink').click(function(){
			$('#subTabDetailDiv').load('showlistofcasecategoriesfordelete.jsp');
		});
	});
</script>
 