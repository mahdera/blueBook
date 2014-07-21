<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
%>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "agreementManagement";
	Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	if(true){
%>
<table border="0" width="100%">
	<tr>
		<td><label id="lblenterafilenumber"><%
					String lblEnterAFileNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblenterafilenumber");
					label = Label.getLabelUsingLabelId("lblenterafilenumber");
	 				out.print(lblEnterAFileNumber != null ? lblEnterAFileNumber : label.getLabelCaption());
	 			%></label></td>
		<td>
			<%				
				String searchButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblsearch");
				label = Label.getLabelUsingLabelId("lblsearch");
				String searchButtonCaption = searchButtonLabel != null ? searchButtonLabel : label.getLabelCaption();				
			%>
			<select name="txtfilenumber" id="txtfilenumber" style="width:20%">
				<option value="" selected="selected">--Select--</option>
				<%
					List<String> fileNumberList = Utility.filterFileNumberFoundInForUser("tbl_investigator_assignment", "tbl_agreement", "investigator_id", account.getUserId());
					if(!fileNumberList.isEmpty()){
						Iterator<String> fileNumberItr = fileNumberList.iterator();
						while(fileNumberItr.hasNext()){
							String fileNumber = fileNumberItr.next();
							%>
								<option value="<%=fileNumber %>"><%=fileNumber %></option>
							<%
						}//end while loop
					}
				%>
			</select>			
			<input type="button" id="btnsearch" value="<%=searchButtonCaption%>"/>
		</td>
	</tr>
</table>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
%>
<div id="newAgreementDiv"></div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#txtfilenumber').focus();
		
		$('#btnsearch').click(function(){
			var fileNumber = $('#txtfilenumber').val().trim();
			if(fileNumber != ""){
				$('#newAgreementDiv').load('searchandshownewagreementformforfilenumber.jsp?fileNumber='+fileNumber);
			}
		});
	});//end document.ready function
</script>