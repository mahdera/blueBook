<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*"%>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "respondentManagement";
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	if(true){		
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
				<td><label id="lbldelete"><%
					String lblDelete = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldelete");
					label = Label.getLabelUsingLabelId("lbldelete");
	 				out.print(lblDelete != null ? lblDelete : label.getLabelCaption());
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
						</td>		
						<td>
							<a href="#.jsp" onclick="deleteThisRespondent(<%=respondent.getId() %>);"><label id="lbldelete"><%
					String lblDelete1 = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lbldelete");
					label = Label.getLabelUsingLabelId("lbldelete");
	 				out.print(lblDelete1 != null ? lblDelete1 : label.getLabelCaption());
	 			%></label></a>
						</td>				
					</tr>
					<%
						String divId = "respondentEditDiv"+respondent.getId();
					%>
					<tr>
						<td colspan="7">
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
		<p class="msg warning">There is no information found/ምንም የተገኝ መረጃ የለም</p>
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
	
	function deleteThisRespondent(respondentId){
		var langId = "<%=langId %>";
		var displayMsg = "Are you sure you want to delete this respondent?";
		if(langId == 1){
			displayMsg = "ይህን የመልስ ሰጭ ክፍል መረጃ ለማስወገድ ፈልገዋል። እንግጠኛ ነዎት?";
		}
		if(window.confirm(displayMsg)){
			var dataString = "respondentId="+respondentId;
			$.ajax({					
			    url: 'deletethisrespondent.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){   		
			    		$('#subTabDetailDiv').load('showlistofrespondentsfordelete.jsp');			    		
			    },
			    error:function(error){
					alert(error);
			    }
			});		
		}
	}
</script>