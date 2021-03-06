<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="com.signetitsolutions.bluebook.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "earlyResolutionManagement";
	Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
	Label label = null;
	if(true){
%>
<form>
	<table border="0" width="100%">
		<tr>
			<td><label id="lblenterafilenumber"><%
					String lblEnterFileNumber = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblenterafilenumber");
					label = Label.getLabelUsingLabelId("lblenterafilenumber");
	 				out.print(lblEnterFileNumber != null ? lblEnterFileNumber : label.getLabelCaption());
	 			%></label></td>
			<td>
				<select name="txtfilenumber" id="txtfilenumber" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<%
						//first I need to get the Investigator object using the account.getUserId() and then the name of the user
						User user = User.getUser(account.getUserId());
						Investigator investigator = Investigator.getInvestigatorByName(user.getFullName());
						List<String> fileNumberList = Utility.filterFileNumbersFoundInThisTableOnly("tbl_early_resolution");
						if(!fileNumberList.isEmpty()){
							Iterator<String> fileNumberItr = fileNumberList.iterator();
							while(fileNumberItr.hasNext()){
								String fileNumber = fileNumberItr.next();
								%>
									<option value="<%=fileNumber%>"><%=fileNumber %></option>
								<%
							}
						}//end while loop
					%>
				</select>
			</td>
			<td>
				<%
					String lblShowButtonLabel = "lblshowbutton";
					String showButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId,"lblshowbutton");
					label = Label.getLabelUsingLabelId("lblshowbutton");
					String showButtonCaption = showButtonLabel != null ? showButtonLabel : label.getLabelCaption();
					//////
					String lblResetButtonLabel = "lblresetbutton";
					String resetButtonLabel = LanguageTranslation.getLabelCaptionInTheSelectedLanguage(langId, "lblresetbutton");
					label = Label.getLabelUsingLabelId("lblresetbutton");
					String resetButtonCaption = resetButtonLabel != null ? resetButtonLabel : label.getLabelCaption();
				%>
				<input type="button" value="<%=showButtonCaption %>" id="btnshow" class="input-submit"/>
				<input type="reset" value="<%=resetButtonCaption %>" class="input-submit"/>
			</td>
		</tr>
	</table>
</form>
<div id="earlyResolutionListDiv"></div>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}
%>
<script type="text/javascript">
	$(document).ready(function(){
		$('#txtfilenumber').focus();
		
		$('#btnshow').click(function(){			
			var fileNumber = $('#txtfilenumber').val();
			if(fileNumber != ""){				
				$('#earlyResolutionListDiv').load('showallearlyresolutionforthisapplicantfordelete.jsp?fileNumber='+fileNumber);				
			}
		});
	});//end document.ready function
</script>