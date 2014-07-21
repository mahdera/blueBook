<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "respondentManagement";
	//Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	//Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	if(true){
		int langId = Integer.parseInt(session.getAttribute("langId").toString());
		Label label = null;
%>
<%
	List<Respondent> respondentList = Respondent.getAllRespondents();
	if(!respondentList.isEmpty()){
		Iterator<Respondent> respondentItr = respondentList.iterator();
		%>
		<table border="0" width="100%">
			<tr style="background:#eee;font-size:11pt;font-weight:bolder">
				<td><label id="lblserialnumber"><%
					String lblSerialNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblserialnumber");
					label = Label.getLabelUsingLabelId("lblserialnumber");
	 				out.print(lblSerialNumber != null ? lblSerialNumber : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblrespondentidnumber"><%
					String lblRespondentIdNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblrespondentidnumber");
					label = Label.getLabelUsingLabelId("lblrespondentidnumber");
	 				out.print(lblRespondentIdNumber != null ? lblRespondentIdNumber : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblname"><%
					String lblName = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblname");
					label = Label.getLabelUsingLabelId("lblname");
	 				out.print(lblName != null ? lblName : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblstructure"><%
					String lblStructure = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblstructure");
					label = Label.getLabelUsingLabelId("lblstructure");
	 				out.print(lblStructure != null ? lblStructure : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lblsector"><%
					String lblSector = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblsector");
					label = Label.getLabelUsingLabelId("lblsector");
	 				out.print(lblSector != null ? lblSector : label.getLabelCaption());
	 			%></label></td>
				<td><label id="lbladdressinformation"><%
					String lblAddressInformation = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbladdressinformation");
					label = Label.getLabelUsingLabelId("lbladdressinformation");
	 				out.print(lblAddressInformation != null ? lblAddressInformation : label.getLabelCaption());
	 			%></label></td>
			</tr>
			<%
				int ctr=1;
				while(respondentItr.hasNext()){
					Respondent respondent = respondentItr.next();
					%>
					<tr>
						<td><%=ctr++ %></td>
						<td><%=respondent.getRespondentIdNumber() %></td>
						<td><%=respondent.getName() %></td>
						<td><%=respondent.getStructure() %></td>
						<td><%=respondent.getSector() %></td>
						<td>
							<a href="#.jsp" onclick="showAddressInformationForThisRespondent(<%=respondent.getId() %>);"><label id="lblviewaddress"><%
					String lblViewAddress = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblviewaddress");
					label = Label.getLabelUsingLabelId("lblviewaddress");
	 				out.print(lblViewAddress != null ? lblViewAddress : label.getLabelCaption());
	 			%></label></a>
							|
							<a href="#.jsp" onclick="hideAddressInformationForThisRespondent(<%=respondent.getId() %>);"><label id="lblhide"><%
					String lblHide = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblhide");
					label = Label.getLabelUsingLabelId("lblhide");
	 				out.print(lblHide != null ? lblHide : label.getLabelCaption());
	 			%></label></a>
						</td>						
					</tr>
					<%
						String divId = "respondentEditDiv"+respondent.getId();
					%>
					<tr>
						<td colspan="6">
							<div id="<%=divId %>"></div>
						</td>
					</tr>
					<%
				}//end while loop
			%>
		</table>
		<%
	}else{
		%>
		<p class="msg warning" class="lblnoinformationfound">There is no information found</p>
		<%
	}
%>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
%>
<script type="text/javascript">
	function showAddressInformationForThisRespondent(respondentId){
		var divId = "respondentEditDiv"+respondentId;
		$('#'+divId).load('showaddressinformationforthisrespondent.jsp?respondentId='+respondentId);		
	}
	
	function hideAddressInformationForThisRespondent(respondentId){
		var divId = "respondentEditDiv"+respondentId;
		$('#'+divId).html('');
	}
</script>