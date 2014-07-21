<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "caseReviewManagement";
	Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	if(true){
%>
<form>
	<table border="0" width="100%">
		<tr>
			<td>Select The Applicant/አመልካቹን ምረጥ:</td>
			<td>
				<select name="slctapplicant" id="slctapplicant" style="width:100%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<Applicant> applicantList = Applicant.getAllApplicants();
					if(!applicantList.isEmpty()){
						Iterator<Applicant> applicantItr = applicantList.iterator();
						while(applicantItr.hasNext()){
							Applicant applicant = applicantItr.next();
							String applicantStr = applicant.getFullName()+" : "+applicant.getApplicantIdNumber();
							%>
							<option value="<%=applicant.getId() %>"><%=applicantStr %></option>
							<%
						}//end while loop
					}
				%>
			</select>
			</td>
			<td>
				<input type="button" value="Show/አሳይ" class="input-submit" id="btnshow"/>
				<input type="reset" value="Clear/አፅዳ" class="input-submit"/>
			</td>
		</tr>
	</table>
</form>
<div id="caseReviewListDiv"></div>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
%>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btnshow').click(function(){
			var applicantId = $('#slctapplicant').val();
			if(applicantId != ""){
				$('#caseReviewListDiv').load('showallcasereviewsforthisapplicant.jsp?applicantId='+applicantId);
			}
		});
	});//end document.ready function
</script>