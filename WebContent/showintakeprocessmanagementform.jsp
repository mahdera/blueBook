<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*" %>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "intakeProcessManagement";
	Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	if(/*role != null && role.isWritable()*/true){
%>
<div>	
	<!-- Tabs -->
			
			<h3 class="tit">Intake Process Management Tab/የቅበላ ማስተዳደሪያ ሠሌዳ</h3> 
 
			<div class="tabs box"> 
				<ul> 
					<li><a href="#.jsp" onclick="showApplicantsManagementInInnerDiv();"><span>Applicants Management/የአመልካች መረጃ</span></a></li>					 
					<li><a href="#.jsp" onclick="showCaseManagementInInnerDiv();"><span>Case Management/ጉዳይ ማስተዳደሪያ ሠሌዳ </span></a></li>					 
					<li><a href="#.jsp" onclick="showDecisionManagementInInnerDiv();"><span>Decision Management/ውሣኔ ማስተዳደሪያ ሠሌዳ</span></a></li>
					<li><a href="#.jsp" onclick="showRespondentManagementInInnerDiv();"><span>Respondent Management/የመልስ ሰጪ ማስተዳደሪያ ሠሌዳ </span></a></li>
					<li><a href="#.jsp" onclick="showAssignmentManagementInInnerDiv();"><span>Assignment Management/የመርማሪ ምደባ መቆጣጠሪያ ሠሌዳ </span></a></li>
				</ul> 
				<span id="ajaxLoaderSpanTab" style="visibility:hidden">
 					<img src="design/loading.gif" border="0"/>
 				</span>
			</div> <!-- /tabs --> 
			 
						
			<div id="intakeProcessDetailDiv"></div>
			<div class="fix"></div> 
</div>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
%>
