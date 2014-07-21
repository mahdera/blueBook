<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<div>	
	<!-- Tabs -->
			
			<h3 class="tit">Case Review Management Tab/ጉዳይ ሪቪው ማስተዳደሪያ ሠሌዳ			
			
			</h3> 
 
			<div class="tabs box"> 
				<ul> 
					<li><a href="#.jsp" id="newCaseReviewLink"><span>New Case Review<br/>አዲስ ጉዳይ ሪቪው</span></a></li>					 
					<li><a href="#.jsp" id="showListOfCaseReviewsLink"><span>View Case Reviews<br/>ጉዳይ ሪቪው ዘርዝር</span></a></li>					 
					<li><a href="#.jsp" id="showListOfCaseReviewsForEditLink"><span>Edit Case Review<br/>ጉዳይ ሪቪው  አስተካክል</span></a></li>
					<li><a href="#.jsp" id="showListOfCaseReviewsForDeleteLink"><span>Delete Case Review<br/>ጉዳይ ሪቪው አስወግድ</span></a></li>
				</ul>				
			</div> <!-- /tabs --> 
			 
			<div id="tabDetailDiv"> 			
				<p class="msg info">Click on the case review management tabs for manipulating fields/
				ጉዳይ ሪቪው መረጃ ለማንቀሳቀስ ክላይ የተዘረዘሩትን ቁልፎች ይጠቀሙ።
				</p>			
			</div>			
			<div id="subTabDetailDiv"></div>
			<div class="fix"></div> 
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#newCaseReviewLink').click(function(){
			$('#subTabDetailDiv').load('shownewcasereviewentryform.jsp');
		});
		
		$('#showListOfCaseReviewsLink').click(function(){
			$('#subTabDetailDiv').load('showlistofcasereviewsapplicantselectorbar.jsp');
		});
		
		$('#showListOfCaseReviewsForEditLink').click(function(){
			$('#subTabDetailDiv').load('showlistofcasereviewsforeditapplicantselectorbar.jsp');
		});
		
		$('#showListOfCaseReviewsForDeleteLink').click(function(){
			$('#subTabDetailDiv').load('showlistofcasereviewsfordeleteapplicantselectorbar.jsp');
		});
	});
</script>